import pytube

limit = 50
link = "https://www.youtube.com/playlist?list=UU_OTXxqZn1F0vtqiCLRDEmQ"
out = ""

playlist  = pytube.Playlist(link)

out+="""<?xml version="1.0" encoding="UTF-8"?>
<playlist xmlns="http://xspf.org/ns/0/" xmlns:vlc="http://www.videolan.org/vlc/playlist/ns/0/" version="1">
	<title>Playlist</title>
	<trackList>\n"""

n = 0
for video in playlist.videos:
	if n > limit:
		break
	else:
		out+=f"""	<track>
			<location>{video.watch_url}</location>
			<extension application="http://www.videolan.org/vlc/playlist/0">
				<vlc:id>{n}</vlc:id>
			</extension>
		</track>\n"""
		n+=1

out+="""	</trackList>
	<extension application="http://www.videolan.org/vlc/playlist/0">\n"""

for i in range(n):
	out+=f'		<vlc:item tid="{i}"/>\n'

out+="""	</extension>
</playlist>\n"""

with open("C:\\Users\\Manoj\\Desktop\\Nightcore_Galaxy.xspf", "w") as f:
    f.write(out)


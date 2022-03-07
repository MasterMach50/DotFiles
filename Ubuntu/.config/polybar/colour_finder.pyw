import os
import json

wal_schemes = os.path.expanduser('~') + "/.cache/wal/schemes/"
wal_saves = os.path.expanduser('~') + "/.cache/wal/color_saves/"

if not os.path.exists(wal_saves):
    os.mkdir(wal_saves)

color_schemes = os.listdir(wal_schemes)
with open(wal_schemes + color_schemes[0], "r") as file:
    _json = json.load(file)

for color in _json["colors"]:
    with open(wal_saves + f"{color}.txt", "w") as current:
        current.write(_json["colors"][color])


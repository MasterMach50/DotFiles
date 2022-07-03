; AutoHotKey Documentation - https://www.autohotkey.com/docs/AutoHotkey.htm

; {{{ System Wide Hotkeys }}}
; Win + Enter        =  Open Windows Terminal
; Win + Ctrl + Up    =  Increase Volume
; Win + Ctrl + Down  =  Decrease Volume
; Alt + `            =  Play/Pause Media
; Alt + Shift + n    =  Play Next
; Alt + Shift + p    =  Play Previous

; {{{ Application Specific Hotkeys }}}
; NumPad Plus        =  Add New Scan While Scanning (HP Smart)

; {{{ Secret Words }}} (AppsKey + <word>)
; ngvlc              =  Play Updated Nightcore Galaxy Playlist on VLC

; Made by Mathew Manoj


; Set coordinate mode for mouse to screen coordinates
CoordMode, Mouse, Screen
CoordMode, ToolTip, Screen
CoordMode, Pixel, Screen

; Open Windows Termianl
#Enter::
    Run, wt.exe
    Return

; Increase Volume
#^Up::
    SendInput, {Volume_Up}
    Return

; Decrease Volume
#^Down::
    SendInput, {Volume_Down}
    Return

; Play/Pause Media
!`::
    SendInput, {Media_Play_Pause}
    Return

; Play Next
!+n::
    SendInput, {Media_Next}
    Return

; Play Previous
!+p::
    SendInput, {Media_Prev}
    Return

; Add New Scan In HP Smart
#IfWinActive HP Smart
NumpadAdd::
    Click, left, 1850, 160
    Pxc1 = 0
    Loop, 100 {
        PixelGetColor, Pxc1, 1860, 965, RGB
        if (Pxc1 == 0x027AAE) {
            Click, left, 1860, 965
            Break
        }
        Sleep, 10
    }
    Return

; Play Updated Nightcore Galaxy Playlist on VLC
#if GetKeyState("AppsKey")
:*:ngvlc::
    RunWait, D:\Manoj\Documents\Code\Python\Scripts\linkloaderforng.py
    Run, vlc C:\\Users\\Manoj\\Desktop\\Nightcore_Galaxy.xspf
    Return
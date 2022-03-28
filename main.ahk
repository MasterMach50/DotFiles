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
; Middle Mouse       =  Go Home (Blue Stacks)
; Right Mouse        =  Go Back (Blue Stacks)

; {{{ Secret Words }}} (AppsKey + <word>)
; ng              =  Play Updated Nightcore Galaxy Playlist on VLC
; zoom            =  Open Zoom

; Made by Mathew Manoj


; Set coordinate mode for mouse to screen coordinates
CoordMode, Mouse, Screen
CoordMode, ToolTip, Screen
CoordMode, Pixel, Screen

; Announce something via tooltip
Announce(msg){
    ToolTip, %msg%
    Sleep, 1500
    ToolTip
}

; {{{ System Wide Hotkeys
; Open Windows Termianl
#Enter::
    RunWait, wt.exe
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
; }}}

; {{{ Application Specific Hotkeys
; Add New Scan In HP Smart
#IfWinActive HP Smart
NumpadAdd::
    WinMaximize
    WinGetPos, X, Y, W, H, HP Smart
    if (Y > -1) {
        SendInput, #+{Right}
    }
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

; Go Home In Bluestacks
#IfWinActive ahk_exe HD-Player.exe
MButton::
    SendInput, ^+1
    Return

; Go Back In Bluestacks
RButton::
    SendInput, ^+2
    Return

#If
; }}}

; {{{ Secret Words
; Play Updated Nightcore Galaxy Playlist on VLC
#if GetKeyState("AppsKey") ; applies till another if statement
:*:ng::
    RunWait, D:\Manoj\Documents\Code\Python\Scripts\linkloaderforng.py
    Run, vlc C:\\Users\\Manoj\\Desktop\\Nightcore_Galaxy.xspf
    Announce("Playing Nightcore Galaxy")
    Return

; Open Zoom
:*:zoom::
    Run, C:\Users\Manoj\AppData\Roaming\Zoom\bin\Zoom.exe
    Announce("Launched Zoom")
    Return
; }}}
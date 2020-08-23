#NoEnv ; For security
#SingleInstance force

;Created by Saketh Reddy


;Menu Stuff
Menu, Tray, NoStandard
Menu, Tray, Add, Enable/Disable, #c
Menu, Tray, Check, Enable/Disable
Menu, Tray, Add, About, AboutP
Menu, Tray, Add, Exit, Exit
;Menu, Tray,

;Initialize active
var:=1

Exit(){
    ExitApp
}

AboutP(){
    Gui, +OwnDialogs
    Gui, Add, Text,, If you see this, just close it  (sorry!)
    Gui, Show
    OnMessage(0x53, "WM_HELP")
    ;1+64+256+16384
    MsgBox,16705,About Accenter,
    (
Windows Accenter by Saketh Reddy
View the source code and tutorial at GitHub: `n(https://github.com/SpiritSeal/WindowsAccenter)

Press "OK" to view the GitHub, "Help" to view the Tutorial, and "Cancel" to close this
    )
    IfMsgBox Ok
        okSelected()
    else
        Gui, Destroy
}

;For Debugging
;#1::AboutP()

okSelected(){
    Run, https://github.com/SpiritSeal/WindowsAccenter
    Gui, Destroy
}

WM_HELP()
{
	Run, https://github.com/SpiritSeal/WindowsAccenter/blob/master/README.md
}

#c::
    Menu, Tray, ToggleCheck, Enable/Disable
    var ^= 1
    if (var){
        ;MsgBox The Accenter Script is now Enabled, press Win+C again to disable it.
        TrayTip , Accenter Enabled!, The Accenter Script is now Enabled`, press Win+C again to disable it`.
    }
    if (!var){
        ;MsgBox The Accenter Script is now Disabled, press Win+C again to re-enable it.
        TrayTip , Accenter Disabled!, The Accenter Script is now Disabled`, press Win+C again to re-enable it`.
    }
return
;Toggle


#Hotstring *?B
#If var
    ;Spanish Characters
    ::a/::á
    ::e/::é
    ::i/::í
    ::o/::ó
    ::u/::ú
    ::n~::ñ
    ::n/::ñ
    ::?/::¿
    ::!/::¡
    ::a``::á
    ::e``::é
    ::i``::í
    ::o``::ó
    ::u``::ú
    ::n``::ñ
    ::?``::¿
    ::!/::¡
    ::a\::á
    ::e\::é
    ::i\::í
    ::o\::ó
    ::u\::ú
    ::n\::ñ
    ::?\::¿
    ::!\::¡
    ::u:/::ü
    ::u:``::ü
    ::u:\::ü
#If
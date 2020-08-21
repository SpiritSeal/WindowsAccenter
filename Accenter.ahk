#NoEnv ; For security
#SingleInstance force

var:=1
#c::
var ^= 1
if (var){
    MsgBox The Accentor Script is now Enabled, press Win+C again to disable it
}
if (!var){
    MsgBox The Accentor Script is now Disabled, press Win+C again to enable it
}
return

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
#If
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
    ::a/::�
    ::e/::�
    ::i/::�
    ::o/::�
    ::u/::�
    ::n~::�
    ::n/::�
    ::?/::�
    ::!/::�
    ::a``::�
    ::e``::�
    ::i``::�
    ::o``::�
    ::u``::�
    ::n``::�
    ::?``::�
    ::!/::�
    ::a\::�
    ::e\::�
    ::i\::�
    ::o\::�
    ::u\::�
    ::n\::�
    ::?\::�
    ::!\::�
#If
#NoEnv ; For security
#SingleInstance force


;------------------------------------------------------------------------------
; Win+H to enter misspelling correction.  It will be added to this script.
;------------------------------------------------------------------------------
#h::
; Get the selected text. The clipboard is used instead of "ControlGet Selected"
; as it works in more editors and word processors, java apps, etc. Save the
; current clipboard contents to be restored later.
AutoTrim Off  ; Retain any leading and trailing whitespace on the clipboard.
ClipboardOld = %ClipboardAll%
Clipboard =  ; Must start off blank for detection to work.
Send ^c
ClipWait 1
if ErrorLevel  ; ClipWait timed out.
    return
; Replace CRLF and/or LF with `n for use in a "send-raw" hotstring:
; The same is done for any other characters that might otherwise
; be a problem in raw mode:
StringReplace, Hotstring, Clipboard, ``, ````, All  ; Do this replacement first to avoid interfering with the others below.
StringReplace, Hotstring, Hotstring, `r`n, ``r, All  ; Using `r works better than `n in MS Word, etc.
StringReplace, Hotstring, Hotstring, `n, ``r, All
StringReplace, Hotstring, Hotstring, %A_Tab%, ``t, All
StringReplace, Hotstring, Hotstring, `;, ```;, All
Clipboard = %ClipboardOld%  ; Restore previous contents of clipboard.
; This will move the InputBox's caret to a more friendly position:
SetTimer, MoveCaret, 10
; Show the InputBox, providing the default hotstring:
InputBox, Hotstring, New Hotstring, Provide the corrected word on the right side. You can also edit the left side if you wish.`n`nExample entry:`n::teh::the,,,,,,,, ::%Hotstring%::%Hotstring%

if ErrorLevel <> 0  ; The user pressed Cancel.
    return
; Otherwise, add the hotstring and reload the script:
FileAppend, `n%Hotstring%, %A_ScriptFullPath%  ; Put a `n at the beginning in case file lacks a blank line at its end.
Reload
Sleep 200 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, 4,, The hotstring just added appears to be improperly formatted.  Would you like to open the script for editing? Note that the bad hotstring is at the bottom of the script.
IfMsgBox, Yes, Edit
return

MoveCaret:
IfWinNotActive, New Hotstring
    return
; Otherwise, move the InputBox's insertion point to where the user will type the abbreviation.
Send {HOME}
Loop % StrLen(Hotstring) + 4
    SendInput {Right}
SetTimer, MoveCaret, Off
return

#Hotstring R  ; Set the default to be "raw mode" (might not actually be relied upon by anything yet).


;Spanish Characters
::(a/)::á
::(e/)::é
::(i/)::í
::(o/)::ó
::(u/)::ú
::(n~)::ñ
::(?/)::¿
::(!/)::¡

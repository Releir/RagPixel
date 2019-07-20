;v 1.2 
;Author: Eleir (Vauxhall)
;
;Added a check if its taking too long to kill the monster

Esc::ExitApp
#MaxThreadsPerHotkey 2

$F1::
Toggle := !Toggle
bilang = 0
nakatayoLang = 0
Start:
Loop
{
    if not Toggle {
        break
    }
    ;PixelSearch, Px, Py, 154, 225, 645, 425, 0x00FF00, 5, Fast
    PixelSearch, Px, Py, 108, 107, 657, 501, 0x00FF00, 5, Fast
    if ErrorLevel { 
    	bilang++ 
    	if (bilang > 2) {
		 	send, {alt down}
			sleep 50
			send, 1
			sleep 50
			send, {alt up}
			sleep 1000
			bilang = 0	
			nakatayoLang = 0
			Goto Start	
		}
    }
    else {
      	Send, {Control down}
      	Click %Px% %Py%		;A color was found at X%Px% Y%Py%.
      	;sleep 500
       	Send, {Control up}
       	nakatayoLang++
       	if(nakatayoLang > 30){
       		send, {alt down}
			sleep 50
			send, 1
			sleep 50
			send, {alt up}
			sleep 1000
			nakatayoLang = 0	
			Goto Start
       	}
    }		
}
return

^g::
	MouseGetPos, X, Y
	PixelGetColor, ColorId, %X%, %Y%
	MsgBox, %ColorId%
return

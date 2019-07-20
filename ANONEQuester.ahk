Esc::ExitApp
#MaxThreadsPerHotkey 2

$F1::
Toggle := !Toggle
bilang = 0
Start:
Loop
{
    if not Toggle {
        break
    }
    PixelSearch, Px, Py, 154, 225, 645, 425, 0x00FF00, 5, Fast
    if ErrorLevel { 
    	bilang++ 
    	if (bilang > 5) {
		 	send !1
			sleep 1000
			bilang = 0	
			Goto Start	
		}
    }
    else {
      	Send, {Control down}
      	Click %Px% %Py%		;A color was found at X%Px% Y%Py%.
      	;sleep 500
       	Send, {Control up}
    }		
}
return

^g::
	MouseGetPos, X, Y
	PixelGetColor, ColorId, %X%, %Y%
	MsgBox, %ColorId%
return

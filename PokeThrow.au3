#include <AutoItConstants.au3>
Const $weedleSpeed = 12
Const $weedleColor = 0xFFD98C
Const $pidgieSpeed = 16
Const $pidgieColor = 0xE6AB54
Const $rattataSpeed = 16
Const $rattataColor = 0x8C69A2
Const $POKEMONCAUGHTBUTTONCOLOR = 0x4AD1A3
Const $BATTLECANERABUTTONCOLOR = 0x228899
;HotKeySet("{F1}", "ThrowWeedle")
;check if i can run ... Run ... otherwise click green button then x to accept pokemon.

HotKeySet("{F2}", "SearchPidgie")
HotKeySet("{F3}", "SearchWeedle")
HotKeySet("{F4}", "SearchRattata")
HotKeySet("{F5}", "CatchPokemon")

HotKeySet("{F12}", "_Exit")
;click
;drag
;release
while(1)

WEnd

;17 steps 20y



Func ThrowBall($str)

   $y=780
   MouseMove(960,780)
   MouseDown($MOUSE_CLICK_LEFT)
   For $i= 0 to 10 Step +1
	  MouseMove(960,$y, 1)
 	  $y -= $str
   Next
   MouseUp($MOUSE_CLICK_LEFT)

EndFunc

Func Search($color,$speed)
   for $count = 1 to 10
	  $pixels = PixelSearch(675,590,1242,821,$color,0)

	  if NOT(@error) Then
		 MouseClick("left",$pixels[0],$pixels[1],1,1)
		 Sleep(8000)
		 ThrowBall($speed)
	  EndIf
   Next

EndFunc

Func CatchPokemon()
	  ;search for pokeball to know when battle starts
	  $notCaught = true;
	  while ($notCaught)
		 $battleNotStarted = True
		 While ($battleNotStarted)
			PixelSearch(1060,860,1160,870,$BATTLECANERABUTTONCOLOR,0)
			if NOT (@error) Then
			   MouseMove(960,780)
			   MouseDown($MOUSE_CLICK_LEFT)
			   ;MsgBox(0,"battle start", "battle start", 1)
			   $battleNotStarted = false
			EndIf
			Sleep(10)
		 WEnd

		 ; throw ball correct distance
		 ;wait for perfect Time
		 Sleep(1000)
		 MouseUp($MOUSE_CLICK_LEFT)
		 Sleep(150)
		 ;TEMPORARY HARDCODED VALUE FOR TEST NEEDS TO DETERMINE DISTANCE

		 ThrowBall(16)

		 ; check for success or failure
		 Sleep(1000)
		 While (True)
			;check for the pokeball that signals a pokemon got out
			PixelSearch(1060,860,1160,870,$BATTLECANERABUTTONCOLOR,0)
			if NOT (@error) Then
			   ; leads to loop repeating
			   MsgBox(0,"pokemon excaped", "catch failed", 1)
			   ExitLoop
			EndIf

			; check for the button on the caught pokemon screen
			PixelSearch(1060,700,1140,760,$POKEMONCAUGHTBUTTONCOLOR,1)
			if NOT (@error) Then
			   $notCaught = false
			   MsgBox(0,"pokemon caught", "we got him",1)
			   ExitLoop
			EndIf

			;wait and then repeat
			Sleep(100)
		 WEnd
	  WEnd
	  ;handle pokemon transfer or save
EndFunc


Func ThrowWeedle()
   Throwball(16)
EndFunc

Func SearchPidgie()
   Search($pidgieColor,$pidgieSpeed)
EndFunc
Func SearchWeedle()
   Search($weedleColor,$weedleSpeed)
EndFunc
Func SearchRattata()
   Search($rattataColor,$rattataSpeed)
EndFunc

Func _Exit()
    Exit 0
EndFunc




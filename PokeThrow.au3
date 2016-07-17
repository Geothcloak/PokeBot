#include <AutoItConstants.au3>
Const $weedleSpeed = 12
Const $weedleColor = 0xFFD98C
Const $pidgieSpeed = 16
Const $pidgieColor = 0xE6AB54
Const $rattataSpeed = 16
Const $rattataColor = 0x8C69A2
;HotKeySet("{F1}", "ThrowWeedle")
;check if i can run ... Run ... otherwise click green button then x to accept pokemon.

HotKeySet("{F2}", "SearchPidgie")
HotKeySet("{F3}", "SearchWeedle")
HotKeySet("{F4}", "SearchRattata")
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





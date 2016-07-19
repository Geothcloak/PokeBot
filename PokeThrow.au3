#include <AutoItConstants.au3>
Const $weedleSpeed = 12
Const $weedleColor = 0xFFD88D
Const $pidgieSpeed = 16
Const $pidgieColor = 0xE6AB54
Const $rattataSpeed = 16
Const $rattataColor = 0xA67EA9

$loopflag = 1
$searchflag = 1

;HotKeySet("{F1}", "ThrowWeedle")
;check if i can run ... Run ... otherwise click green button then x to accept pokemon.

;F1 to break out of script
HotKeySet("{F1}", "LoopFlagFalse")

HotKeySet("{F2}", "SearchPidgie")
HotKeySet("{F3}", "SearchWeedle")
HotKeySet("{F4}", "SearchRattata")

;wait when script firsts starts so i can focus on window
sleep(4000)
while(1)
   If $loopflag == 0 Then ExitLoop 5
   while($searchflag ==1)
	  If $loopflag == 0 Then
		 ExitLoop 5
		 $searchflag = 0
	  EndIf
	  SearchWeedle()
	  sleep(500)
	  SearchRattata()
	  sleep(500)
	  SearchPidgie()
	  sleep(500)
   WEnd


WEnd

Func LoopFlagFalse()
   $loopflag = 0
   MsgBox(0,"k","inside loop flag", 2)
EndFunc


Func SearchPidgie()
   Search($pidgieColor,$pidgieSpeed)
EndFunc
Func SearchWeedle()
  ; MsgBox(0,"k","inside weedle flag", 1)
   Search($weedleColor,$weedleSpeed)
EndFunc
Func SearchRattata()
   Search($rattataColor,$rattataSpeed)
EndFunc


Func Search($color,$speed)
   ;for $count = 1 to 10
	  $pixels = PixelSearch(675,590,1242,821,$color,1)

	  if NOT(@error) Then
		 $searchflag = 0
		 MouseClick("left",$pixels[0],$pixels[1],1,1)
		 Sleep(8000)
		 ThrowBall($speed)
	  EndIf
  ; Next

EndFunc

Func ThrowBall($str)
   $y=780
   MouseMove(960,780)
   MouseDown($MOUSE_CLICK_LEFT)
   For $i= 0 to 10 Step +1
	  MouseMove(960,$y, 1)
 	  $y -= $str
   Next
   MouseUp($MOUSE_CLICK_LEFT)
   RunOrKeep()
EndFunc

Func RunOrKeep()
   Sleep(14000)
   ;check if caught
   PixelSearch(710,100,751,140,0xD9E9DC,1)
   if NOT(@error) Then
		 ;click to runaway
		 MouseClick("left",739,135,1,1)
		 Sleep(2000)
		 $searchflag = 1
	  EndIf
   ;click green ok button after caught screen
   MouseClick("left",958,997,1,1)
   Sleep(3000)
   ;click on circle at bottom
   MouseClick("left",958,997,1,1)
   Sleep(2000)
   $searchflag = 1
EndFunc

Func CheckForPopup()
   $pixels = PixelSearch(1187, 277, 1234, 321, 0xFCCF52, 1)
   if NOT(@error) Then
	  MouseClick("left",$pixels[0],$pixels[1],1,1
   EndIf
EndFunc






#RequireAdmin
#include <libs\ImageSearch2015.au3>
#include <libs\zMouseMove.au3>
#include <Debug.au3>
#include <Array.au3>
#include <AutoItConstants.au3>


HotKeySet ( "{END}", "_Kill" )
HotKeySet ( "{PAUSE}", "_Pause" )
HotKeySet ( "{1}", "_switch1" )
HotKeySet ( "{2}", "_switch2" )
HotKeySet ( "{3}", "_switch3" )
HotKeySet ( "{4}", "_switch4" )
HotKeySet ( "{5}", "_switch5" )
HotKeySet ( "{6}", "_switch6" )
HotKeySet ( "{7}", "_switch7" )

Global $aPos,$combatx,$combaty,$musicx,$musicy
;~ Global "$primordial_boots", "$dragon_claws", "$bandos_tassets", "$bandos_chestplate", "$amulet_of_torture", "$dragon_defender", "$fire_cape", "$abyssal_tentacle", $armadyl_godsword, $imbued_zamorak_cape, $staff_of_the_dead, $arcane_spirit_shield, $ancestral_robe_bottom, $ancestral_robe_top, $occult_necklace, $armadyl_crossbow, $elysian_spirit_shield, $karils_leatherskirt, $guthix_dragonhide, $necklace_of_anguish, $avas_accumulator


;,"$primordial_boots"x,"$primordial_boots"y,$imbued_zamorak_capex,$imbued_zamorak_capey,"$dragon_claws"x,"$dragon_claws"y,"$bandos_tassets"x,"$bandos_tassets"y,"$bandos_chestplate"x,"$bandos_chestplate"y,$staff_of_the_deadx,$staff_of_the_deady,$protectitemx,$protectitemy,$auguryx,$auguryy,$barragex,$barragey,$spellx,$spelly
Global $img_dir = @ScriptDir & "\images\"

$combat = @ScriptDir & "\images\combat.PNG"
$redcombat = @ScriptDir & "\images\redcombat.PNG"
$music = @ScriptDir & "\images\music.PNG"

;~ *********************
;~ *****Melee Items*****
;~ *********************
;~ "$primordial_boots" = @ScriptDir & "\images\primordial_boots.PNG"
;~ "$dragon_claws" = @ScriptDir & "\images\dragon_claws.PNG"
;~ "$bandos_tassets" = @ScriptDir & "\images\bandos_tassets.PNG"
;~ "$bandos_chestplate" = @ScriptDir & "\images\bandos_chestplate.PNG"
;~ "$amulet_of_torture" = @ScriptDir & "\images\amulet_of_torture.PNG"
;~ "$dragon_defender" = @ScriptDir & "\images\dragon_defender.PNG"
;~ "$fire_cape" = @ScriptDir & "\images\fire_cape.PNG"
;~ "$abyssal_tentacle" = @ScriptDir & "\images\abyssal_tentacle.PNG"
;~ $armadyl_godsword = @ScriptDir & "\images\armadyl_godsword.PNG"



;~ *********************
;~ *****Magic Items*****
;~ *********************
;~ $imbued_zamorak_cape = @ScriptDir & "\images\imbued_zamorak_cape.PNG"
;~ $staff_of_the_dead = @ScriptDir & "\images\staff_of_the_dead.PNG"
;~ $arcane_spirit_shield = @ScriptDir & "\images\arcane_spirit_shield.PNG"
;~ $ancestral_robe_bottom = @ScriptDir & "\images\ancestral_robe_bottom.PNG"
;~ $ancestral_robe_top = @ScriptDir & "\images\ancestral_robe_top.PNG"
;~ $occult_necklace = @ScriptDir & "\images\occult_necklace.PNG"

;~ *********************
;~ *****Range Items*****
;~ *********************
;~ $armadyl_crossbow = @ScriptDir & "\images\armadyl_crossbow.PNG"
;~ $elysian_spirit_shield = @ScriptDir & "\images\elysian_spirit_shield.PNG"
;~ $karils_leatherskirt = @ScriptDir & "\images\karils_leatherskirt.PNG"
;~ $guthix_dragonhide = @ScriptDir & "\images\guthix_dragonhide.PNG"
;~ $necklace_of_anguish = @ScriptDir & "\images\necklace_of_anguish.PNG"
;~ $avas_accumulator = @ScriptDir & "\images\avas_accumulator.PNG"


;~ *********************
;~ *******Prayers*******
;~ *********************
;~ $augury = @ScriptDir & "\images\augury.PNG"
;~ $piety = @ScriptDir & "\images\piety.PNG"
;~ $rigour = @ScriptDir & "\images\rigour.PNG"
;~ $protectitem = @ScriptDir & "\images\protectitem.PNG"
;~ $steelskin = @ScriptDir & "\images\steelskin.PNG"


Global $speed = 1

;~ Global $itemArr[21] = ["primordial_boots", "dragon_claws", "bandos_tassets", "bandos_chestplate", "amulet_of_torture", "dragon_defender", "fire_cape", "abyssal_tentacle", "armadyl_godsword", "imbued_zamorak_cape", "staff_of_the_dead", "arcane_spirit_shield", "ancestral_robe_bottom", "ancestral_robe_top", "occult_necklace", "armadyl_crossbow", "elysian_spirit_shield", "karils_leatherskirt", "guthix_dragonhide", "necklace_of_anguish", "avas_accumulator"]

;~ Global $switch1Arr[6] = ["staff_of_the_dead", "arcane_spirit_shield", "ancestral_robe_bottom", "ancestral_robe_top", "occult_necklace", "imbued_zamorak_cape"]

;~ Global $switch2Arr[6] = ["armadyl_crossbow", "elysian_spirit_shield", "karils_leatherskirt", "guthix_dragonhide", "necklace_of_anguish", "avas_accumulator"]

;~ Global $switch3Arr[6] = ["abyssal_tentacle", "dragon_defender", "bandos_tassets", "bandos_chestplate", "amulet_of_torture", "fire_cape"]

;~ Global $switch4Arr[6] = ["armadyl_godsword", "bandos_tassets", "bandos_chestplate", "amulet_of_torture", "fire_cape", "primordial_boots"]

;~ Global $switch5Arr[6] = ["staff_of_the_dead", "arcane_spirit_shield", "ancestral_robe_bottom", "ancestral_robe_top", "occult_necklace", "imbued_zamorak_cape"]

;~ Global $switch6Arr[6] = ["staff_of_the_dead", "elysian_spirit_shield", "bandos_tassets", "guthix_dragonhide", "imbued_zamorak_cape", "primordial_boots"]

;~ Global $switch7Arr[6] = ["dragon_claws", "bandos_tassets", "bandos_chestplate", "amulet_of_torture", "fire_cape", "primordial_boots"]


Global $itemArr[17] = ["primordial_boots", "eternal_boots", "karils_leathertop", "veracs_plateskirt", "bandos_chestplate", "amulet_of_torture", "fire_cape", "armadyl_godsword", "imbued_zamorak_cape", "staff_of_the_dead", "arcane_spirit_shield", "ancestral_robe_bottom", "ancestral_robe_top", "occult_necklace", "armadyl_crossbow", "necklace_of_anguish", "avas_accumulator"]
global $switch1Arr[7] = ["staff_of_the_dead", "occult_necklace", "ancestral_robe_top", "imbued_zamorak_cape", "ancestral_robe_bottom", "eternal_boots", "arcane_spirit_shield"]
global $switch2Arr[6] = ["armadyl_crossbow", "necklace_of_anguish", "karils_leathertop", "avas_accumulator", "veracs_plateskirt", "arcane_spirit_shield"]
global $switch3Arr[6] = ["armadyl_godsword", "primordial_boots", "amulet_of_torture", "fire_cape", "veracs_plateskirt", "bandos_chestplate"]
global $switch4Arr[5] = ["armadyl_godsword", "primordial_boots", "amulet_of_torture", "fire_cape", "bandos_chestplate"]
global $switch5Arr[7] = ["staff_of_the_dead", "occult_necklace", "ancestral_robe_top", "imbued_zamorak_cape", "ancestral_robe_bottom", "eternal_boots", "arcane_spirit_shield"]
global $switch6Arr[6] = ["staff_of_the_dead", "arcane_spirit_shield", "karils_leathertop", "veracs_plateskirt", "imbued_zamorak_cape", "primordial_boots"]
global $switch7Arr[7] = ["staff_of_the_dead", "occult_necklace", "ancestral_robe_top", "imbued_zamorak_cape", "ancestral_robe_bottom", "eternal_boots", "arcane_spirit_shield"]

While 1

   _FindInventory()
   for $i = 0 To UBound($itemArr) -1
	  _findItem($itemArr[$i])
   Next

WEnd

Func _switch1()
   BlockInput($BI_DISABLE)
   $OGPos = MouseGetPos()
   Send("{F1}")
   sleep (50)


   for $switch1Clicks = 0 To UBound($switch1Arr) -1
	  _clickItem($switch1Arr[$switch1Clicks])
   Next

   Send("{F3}")
   sleep(50)

   _findItem("protectitem")
   _clickItem("protectitem")
   _findItem("augury")
   _clickItem("augury")

   Send("{F4}")
   sleep(50)

   MouseMove( $musicx + -164,$musicy + -88,0)
   Sleep(10)
   MouseClick($MOUSE_CLICK_LEFT)

   Send("{F1}")
   MouseMove ($OGPos[0],$OGPos[1], 1)
   sleep(10)
   MouseClick($MOUSE_CLICK_LEFT)
   BlockInput($BI_ENABLE)
EndFunc

Func _switch2()
   BlockInput($BI_DISABLE)
   $OGPos = MouseGetPos()
   Send("{F1}")
   sleep (50)

   for $switch2Clicks = 0 To UBound($switch2Arr) - 1
	  _clickItem($switch2Arr[$switch2Clicks])
   Next

   Send("{F3}")
   sleep(50)

   _findItem("protectitem")
   _findItem("rigour")
   _clickItem("protectitem")
   _clickItem("rigour")

   Send("{F1}")
   MouseMove ($OGPos[0],$OGPos[1], 1)
   BlockInput($BI_ENABLE)
EndFunc

Func _switch3()
   BlockInput($BI_DISABLE)
   $OGPos = MouseGetPos()
   Send("{F1}")
   sleep (50)

   for $switch3Clicks = 0 To UBound($switch3Arr) - 1
	  _clickItem($switch3Arr[$switch3Clicks])
   Next

   Send("{F3}")
   sleep(50)

   _findItem("protectitem")
   _findItem("piety")
   _clickItem("protectitem")
   _clickItem("piety")

   Send("{F1}")
   MouseMove ($OGPos[0],$OGPos[1], 1)
   BlockInput($BI_ENABLE)
EndFunc


Func _switch4()
   BlockInput($BI_DISABLE)
   $OGPos = MouseGetPos()
   Send("{F1}")
   sleep (50)

   for $switch4Clicks = 0 To UBound($switch4Arr) - 1
	  _clickItem($switch4Arr[$switch4Clicks])
   Next

   Send("{F3}")
   sleep(50)

   _findItem("protectitem")
   _findItem("piety")
   _clickItem("protectitem")
   _clickItem("piety")
   _doSpec()

   Send("{F1}")
   MouseMove ($OGPos[0],$OGPos[1], 1)
      sleep(10)
   MouseClick($MOUSE_CLICK_LEFT)
   BlockInput($BI_ENABLE)
EndFunc

Func _switch5()
   BlockInput($BI_DISABLE)
   $OGPos = MouseGetPos()
   Send("{F1}")
   sleep (50)

   for $switch5Clicks = 0 To UBound($switch5Arr) - 1
	  _clickItem($switch5Arr[$switch5Clicks])
   Next

   Send("{F3}")
   sleep(50)

   _findItem("protectitem")
   _findItem("augury")
   _clickItem("protectitem")
   _clickItem("augury")

   Send("{F4}")
   sleep(50)

   MouseMove( $musicx + -121,$musicy + -141,0)
   sleep(10)
   MouseClick($MOUSE_CLICK_LEFT)


   Send("{F1}")
   MouseMove ($OGPos[0],$OGPos[1], 1)
   sleep(10)
   MouseClick($MOUSE_CLICK_LEFT)
   BlockInput($BI_ENABLE)
EndFunc

Func _switch6()
   BlockInput($BI_DISABLE)
   $OGPos = MouseGetPos()
   Send("{F1}")
   sleep (50)

   for $switch6Clicks = 0 To UBound($switch6Arr) - 1
	  _clickItem($switch6Arr[$switch6Clicks])
   Next

   Send("{F3}")
   sleep(50)

   _findItem("protectitem")
   _findItem("augury")
   _clickItem("protectitem")
   _clickItem("augury")

   Send("{F1}")
   MouseMove ($OGPos[0],$OGPos[1], 1)
   sleep(10)
   MouseClick($MOUSE_CLICK_LEFT)
   BlockInput($BI_ENABLE)
EndFunc

Func _switch7()
   BlockInput($BI_DISABLE)
   $OGPos = MouseGetPos()
   Send("{F1}")
   sleep (50)

   for $switch7Clicks = 0 To UBound($switch7Arr) - 1
	  _clickItem($switch7Arr[$switch7Clicks])
   Next

   Send("{F3}")
   sleep(50)

   _findItem("protectitem")
   _findItem("piety")
   _clickItem("protectitem")
   _clickItem("piety")
   _doSpec()

   Send("{F1}")
   MouseMove ($OGPos[0],$OGPos[1], 1)
      sleep(10)
   MouseClick($MOUSE_CLICK_LEFT)
   BlockInput($BI_ENABLE)
EndFunc






Func _doSpec()
Send("{F5}")
$specTimer = 0
do
   $Spec = _findItem("spec")
   sleep (10)
   $specTimer += 1
   _L($specTimer)
Until $spec = 1 OR $specTimer = 200
if $spec = 1 Then
   _clickItem("spec")
   EndIf
EndFunc

;~ Func _clickItem($item)
;~    if $item & "1" = 1 Then
;~       MouseMove( $item & "x",$item & "y",0)
;~       MouseClick($MOUSE_CLICK_LEFT)
;~    EndIf
;~ EndFunc

;~ Func _findItem($findItem)

;~    $findItem & "1" = _ImageSearchArea($findItem,1,$combatx,$combaty,$musicx,$musicy,$findItem & "x",$findItem & "y",30,0)
;~    if $findItem & "1" = 1 Then
;~ 	  _L("Found " & $findItem)
;~    Else
;~ 	  _L("Couldn't find " & $findItem)
;~    EndIf

;~ EndFunc



Global $img_dir = @ScriptDir & "\images2\"
Func _ClickItem($key)

   If StringLen($key) > 1 Then
      If IsDeclared($key & "_x") And Eval($key & "_x") <> 0 Then
         If IsDeclared($key & "_y") Then
            MouseMove( Eval($key & "_x"),Eval($key & "_y"),1)
			sleep(10)
            MouseClick($MOUSE_CLICK_LEFT)
         EndIf
      EndIf
   Else
         _L("Key Cannot Be Blank")
      Return False
   EndIf
EndFunc

Func _FindItem($key)
   Local $findItemX,$findItemY
   If StringLen($key) > 1 Then
      Local $findImgSrc = $img_dir & $key & ".PNG"
      If FileExists($findImgSrc) Then
         If _ImageSearchArea($findImgSrc,1,$combatx,$combaty,$musicx,$musicy,$findItemX,$findItemY,30,0) = 1 Then
            _L("Found " & $key)
            Assign($key & "_x", $findItemX, 2)
            Assign($key & "_y", $findItemY, 2)
            Return True
         Else
			Assign($key & "_x", 0, 2)
            Assign($key & "_y", 0, 2)
            _L("Could Not Find: " & $key)
            Return False
         EndIf
      Else
         _L("Image Source Not Found: " & $findImgSrc)
         Return False
      EndIf
   Else
      _L("Key Cannot Be Blank")
      Return False
   EndIf
   _L("Could Not Find: " & $key)
   Return False
EndFunc

Func _L($msg)
   ConsoleWrite($msg & @LF)
EndFunc

Func _FindInventory()
   Global $rs_window = WinList("[REGEXPTITLE:^(.*?)(OS\-Scape|OSBuddy\sFree|OSBuddy\sGuest|OSBuddy\sPro\s-\siChuck|Old\sSchool\sRuneSimbued_zamorak_cape|RuneLoader|Konduit|SwiftKit|Exilent|Dawntained|Elkoy|SpawnPK|Soulplay|Alora)(.*?)$$]")
   Global $aPos = WinGetPos($rs_window[0][1])
	  $combat1 = _ImageSearchArea($combat,1,$aPos[0],$aPos[1],$aPos[0]+$aPos[2],$aPos[1]+$aPos[3],$combatx,$combaty,30,0)
	  if $combat1 = 1 Then
		 _L("Found Combat")
	  EndIf
	  $music1 = _ImageSearchArea($music,1,$aPos[0],$aPos[1],$aPos[0]+$aPos[2],$aPos[1]+$aPos[3],$musicx,$musicy,30,0)
	  if $music1 = 1 Then
		 _L("Found Music")
	  EndIf
EndFunc

Func _Kill()
	Exit
EndFunc

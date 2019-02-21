#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
; Ease in function
func __cy1($i, $sm)
    return $i ^ $sm;
endFunc

; Ease out function
func __cy2($i, $sm)
    return 1 - ((1 - $i) ^ $sm);
endFunc

; Ease in out function
func __cy($i, $sm)
    if ($i < 0.5) then
        return __cy1($i * 2, $sm) / 2;
    else
        return (__cy2(($i - 0.5) * 2, $sm) / 2) + 0.5;
    endIf
endFunc

; Ease backward function
func __cyof($i, $sm)
    if ($i < 0.5) then
        return __cy($i * 2, $sm);
    else
        return __cy((1 - $i) * 2, $sm);
    endIf
endfunc

; MAIN FUNCTION
func _CyMouse($x2, $y2, $speed)
    $pos = mouseGetPos()
    $xv = random(-50, 50);
    $yv = random(0, 50);
    $sm = random(1.5, 2.5);
    $m = random(10, 50);
    for $i = 0 to $m
        $ci = __cy($i / $m, $sm);
        $co = __cyof($i / $m, $sm);
        $cx = $pos[0] + (($x2 - $pos[0]) * $ci) + ($xv * $co);
        $cy = $pos[1] + (($y2 - $pos[1]) * $ci) + ($yv * $co);
        mouseMove ($cx, $cy, $speed);
	 next
endFunc
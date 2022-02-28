;homeall.g
;called to home all axes

;Quick home X&Y
G91                		; relative positioning
G1 H2 Z5 F6000          ; lift Z relative to current position
G1 H1 X-625 Y-605 F3600 ; move quickly to X or Y axis endstop and stop there (first pass)
G1 H1 X-625 F1800 		; move quickly to X axis endstop and stop there (first pass)
G1 H1 Y-605 F1800 		; move quickly to Y axis endstop and stop there (first pass)
G1 X5 Y5 F6000       	; go back a few mm
G1 H1 X-625 F360  		; move slowly to X axis endstop once more (second pass)
G1 H1 Y-605 F360		; move slowly to Y axis endstop once more (second pass)
G90						; absolute positioning

;Home others
M98 P"homez.g"				;home axis Z
M98 P"homec.g"				;Home axis C (Toolchanger)
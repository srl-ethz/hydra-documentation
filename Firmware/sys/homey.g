;Called to home Y axis

G91               	; relative positioning
G1 H1 Y-605 F3000 	; move quickly to Y axis endstop and stop there (first pass)
G1 Y5 F6000     	; go back a few mm
G1 H1 Y-605 F360  	; move slowly to Y axis endstop once more (second pass)
G90               	; absolute positioning

;Called to home z axis

G91               	; relative positioning
G1 H2 Z5 F4000    	; lift Z relative to current position
G90               	; absolute positioning

G1 X200 Y200 F15000 ; go to probe point

M558 F300 T15000 H2	; set probe parameters
G30               	; home Z by probing the bed

G91              ; relative positioning
G1 Z5 F4000       ; lift Z relative to current position
G90              ; absolute positioning


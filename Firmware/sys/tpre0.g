;Called before tool 0 is selected

G1 X15 Y320.5 F15000			;Move in front of Tool Location
G91							;Relative positioning
G1 Y20 F5000				;Quickly move into Tool
G1 Y20 F3000				;Slowly close the gap
G90							;Absolute positioning

M98 P"/macros/Coupler - Lock"	;Close Coupler

M566 X100.00 Y100.00 Z6.00 C2 E120.00:120.00:120.00:120.00 P1          			; set maximum instantaneous speed changes (mm/min)
M203 X18000.00 Y18000.00 Z1000.00 C15000 E3600.00:3600.00:3600.00:3600.00    	; set maximum speeds (mm/min)
M201 X3000.00 Y3000.00 Z100.00 C500 E3600.00:3600.00:3600.00:3600.00        	; set accelerations (mm/s^2)

G91					;Relative positioning
G1 Z10 F1000		;Move bed out of the way
G1 Y-40 F6000		;Move out
G90					;Absolute positioning


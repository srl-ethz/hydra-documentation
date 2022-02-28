;Called when tool 0 is freed


G91						;Relative positioning
G1 Z5 F1000 			;Lower bed
G90						;Absolute positioning

G10 P0 X0 Y0 Z-7.21		;Set offset back to 0

G1 X15 Y290.5 F30000		;Move in front of parking spot to avoid collision
G91						;Relative positioning
G1 Y30 F30000			;Move in quickly
G1 Y40 F5000			;Move in slower
G90						;Absolute positioning

M98 P"/macros/Coupler - Unlock" 	;Open Coupler
M106 P1 S0							;Turn off the fan

G91					;Relative positioning
G1 Y-20 F2000		;Move out slowly
G1 Y-20 F6000		;Move out quickly
G90					;Absolute positioning

M566 X400.00 Y400.00 Z6.00 C2 E120.00:120.00:120.00:120.00 P1          			; set maximum instantaneous speed changes (mm/min)
M203 X20800.00 Y20800.00 Z1000.00 C15000 E3600.00:3600.00:3600.00:3600.00    	; set maximum speeds (mm/min)
M201 X3000.00 Y3000.00 Z100.00 C500 E3600.00:3600.00:3600.00:3600.00        	; set accelerations (mm/s^2)

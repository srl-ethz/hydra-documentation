;Called after tool 0 was selected

G10 P0 X20.7 Y-5 Z-7.01		;Set tool offset
M116 P0							;Heat up tool
M106 R1							;Restore print fan speed
G91								;Relative positioning
G1 Y-20 F6000					;Move out
G90	
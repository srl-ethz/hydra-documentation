;homec.g
; called to home the C axis (coupler)

G91									;Relative positioning
M400								;Finish current moves

M913 C70							;Set lower motor current
G1 H2 C-500 F5000					;Move the coupler against the stop
G92 C-45							;Set motor position to -45
G90									;Absolute positioning
M913 C100							;Set normal motor current

M400								;Wait for moves to finish
G4 S7								;Wait 7 seconds (Needed due to gcode buffering)
M98 P"/macros/Coupler - Unlock"		;open coupler		
; this script is called via the G32 command
; it probes at tree locations near the leadscrews and compensates for any bed misalignment
; please level the bed by hand before calling this script, to avoid the bed leveling sensor crashing into the bed

T-1										;deselect any active tool
M561 									;clear any bed transform
M558 P8 C"io2.in" H5 F400 I0 T30000		;set probing height to 5mm
G30 P0 X30 Y3 Z-99999 					; probe near front left leadscrew
G30 P1 X195 Y330 Z-99999 				; probe near back center leadscrew
G30 P2 X360 Y3 Z-99999 S3 				; probe near front right leadscrew and calibrate 3 motors
M558 P8 C"io2.in" H3 F400 I0 T30000		;set probing height to 3mm

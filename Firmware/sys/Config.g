;General
;------------------------------------------------------------------------
G90                                     ; send absolute coordinates...
M83                                     ; ...but relative extruder moves
M550 P"HydraMk1"                        ; set printer name
M669 K1                                 ; define CoreXY
G29 S1                                  ; Set Units to Millimeters

; Network
;M552 S1                        ; enable network and acquire dynamic address via DHCP
M586 P0 S1                              ; enable HTTP
M586 P1 S0                              ; disable FTP
M586 P2 S0                              ; disable Telnet
;-----------------------------------------------------------------------
; Drives
;-----------------------------------------------------------------------
G4 S1									; Wait for Expansion boards to connect
M569 P0.0 S0 D3                         ; Zstepper 1 goes backwards
M569 P0.1 S0 D3                         ; Zstepper 2 goes backwards
M569 P0.2 S0 D3                         ; Zstepper 3 goes backwards
M569 P0.3 S1 D3                         ; Ystepper goes forwards
M569 P0.4 S1 D3                         ; Xstepper goes forwards

M569 P0.5 S1 D3							; Extruder 0 goes forwards
M569 P1.0 S1 D3							; Extruder 1 goes forwards
M569 P1.1 S1 D3                         ; Extruder 2 goes forwards
M569 P1.2 S1 D3						; Extruder 3 goes forwards

M569 P121.0 S0 D3							; Coupler goes Forward

M584 X0.4 Y0.3 Z0.0:0.1:0.2 C121.0 E0.5:1.0:1.1:1.2 ; set drive mapping
M350 X16 Y16 Z16 E16:16:16 I1                 		; configure microstepping with interpolation
M350 C16 I10										; configure coupler microstepping
M92 X80.00 Y80.00 Z800.00 C91.022               	; set steps per mm
M906 X1400 Y1400 Z800 I30							; set motor currents (mA) and motor idle factor in per cent
M92 E368:228:228:368          						; set extruder steps per mm, 0.9 angle/step (LDO Pancake)
M906 E1000:1680:1680:1000 C500 I10					; set extruder and toolchange motor current (mA) and idle factor in per cent
M84 S30                                 			; Set idle timeout

M566 X400.00 Y400.00 Z6.00 C2 E120.00:120.00:120.00:120.00 P1          			; set maximum instantaneous speed changes (mm/min)
M203 X20800.00 Y20800.00 Z1000.00 C15000 E3600.00:3600.00:3600.00:3600.00    	; set maximum speeds (mm/min)
M201 X3000.00 Y3000.00 Z100.00 C500 E3600.00:3600.00:3600.00:3600.00        	; set accelerations (mm/s^2)
;These values get reset after every toolchange

;--------------------------------------------------------------------
;Axis and Endstops
;--------------------------------------------------------------------
; Axis Limits
M208 X0 Y0 Z0 C-45 S1                               ; set axis minima
M208 X375 Y380 Z390 C360 S0                         ; set axis maxima

; Endstops
M574 X1 S1 P"io0.in"                           ; configure active high endstops at X low end
M574 Y1 S1 P"io1.in"                           ; configure active high endstops at Y low end
M574 C0 Z0									   ; configure no endstop for C axis (coupler)

M558 P8 C"io2.in" H3 F400 I0 T30000				;configure z endstop for probing with 3mm probing height, 400 feedrate for z axis and 30000 feedrate for X/Y axis
G31 P200 X0 Y0 Z0								;set z probe offset and trigger value
M671 X-4.5:200:404.5 Y-4.52:405:-4.52 S5        ; define positions of Z leadscrews or bed levelling screws
M557 X20:360 Y20:335 P5                         ; define 5x5 mesh grid

;---------------------------------------------------------------------
;Heaters
;---------------------------------------------------------------------
;Heated bed
M308 S0 P"temp0" Y"thermistor" T100000 B3950 A"Bed"    	; configure sensor 0 as thermistor on pin temp0
M950 H0 C"out1" T0                                     	; create bed heater output on out1 and map it to sensor 0
M307 H0 B0 S1.00                                       	; disable bang-bang mode for the bed heater (0) and set PWM limit
M140 H0                                                	; map heated bed to heater 0
M143 H0 S110                                           	; set temperature limit for heater 0 to 110C
M307 H0 B0 R0.322 C500.8 D11.62 S1.00 V24.0				; PID parameters for heated bed

;Hotend 0
M308 S1 P"temp1" Y"thermistor" T100000 B4725 C7.060000e-8 A"Hotend0"  ; configure sensor 1 as thermistor on pin temp1 of EXP
M950 H1 C"out2" T1         											; create nozzle heater 1 output on out0 of EXP and map it to sensor 1
M307 H1 B0 S1.00           												; disable bang-bang mode for heater 1 and set PWM limit
M143 H1 S250               												; set the maximum temperature in C for heater 1

M563 P0 S"HemeraL" D0 H1 F1     										; define tool 0
G10 P0 R0 S0               												; set initial tool 0 active and standby temperatures to 0C
M307 H1 B0 R1.181 C264.4:165.1 D7.45 S1.00 V24.3						; PID parameters for heater 1
	
;Hotend 1
M308 S2 P"1.temp0" Y"thermistor" T100000 B4725 C7.060000e-8 A"Hotend1"  	; configure sensor 2 as thermistor on pin temp1
M950 H2 C"out0" T2         												; create nozzle heater 2 output on out2 and map it to sensor 2
M307 H2 B0 S1.00          									 			; disable bang-bang mode for heater 2 and set PWM limit
M143 H2 S300               												; set the maximum temperature in C for heater 2

M563 P1 S"PelletheadL" D1 H2 F3     									; define tool 1 
G10 P1 R0 S0               												; set initial tool 1 active and standby temperatures to 0C
M307 H2 B0 R2.580 C130.0:127.4 D4.92 S1.00 V24.0 						; PID parameters for heater 2

;Hotend 2
M308 S3 P"1.temp1" Y"thermistor" T100000 B4725 C7.060000e-8 A"Hotend2"  	; configure sensor 2 as thermistor on pin temp1
M950 H3 C"1.out1" T3         												; create nozzle heater 2 output on out2 and map it to sensor 2
M307 H3 B0 S1.00          									 			; disable bang-bang mode for heater 2 and set PWM limit
M143 H3 S300               												; set the maximum temperature in C for heater 2

M563 P2 S"PelletheadR" D2 H3 F5     									; define tool 1 
G10 P2 R0 S0               												; set initial tool 1 active and standby temperatures to 0C
M307 H3 B0 R2.580 C143.9:130.8 D6.57 S1.00 V24.3 						; PID parameters for heater

;Hotend 3
M308 S4 P"1.temp2" Y"thermistor" T100000 B4725 C7.060000e-8 A"Hotend3"  ; configure sensor 3 as thermistor on pin temp0 of EXP
M950 H4 C"1.out2" T4         											; create nozzle heater output on out0 of EXP and map it to sensor 3
M307 H4 B0 S1.00           												; disable bang-bang mode for heater 3 and set PWM limit
M143 H4 S250               												; set the maximum temperature in C for heater 3

M563 P3 S"HemeraR" D3 H4 F7     										; define tool 2
G10 P3 R0 S0               												; set initial tool 2 active and standby temperatures to 0C
M307 H4 B0 R1.157 C242.7:148.6 D7.43 S1.00 V24.3						; PID parameters for heater 3


;----------------------------------------------------------------------------
; Fans
;----------------------------------------------------------------------------

;Hotend 0

M950 F0 C"out7" Q500                   ; create fan 0 on pin out7 of EXP and set its frequency
M106 P0 C"Hotend Fan 0" S0 H1 T45 L255   ; set fan 0 name and value. Thermostatic control turned on for Hotend
M950 F1 C"out4" Q500                   ; create fan 1 on pin out4 of EXP and set its frequency
M106 P1 C"Layer Fan 0" S0 H-1 L255       ; set fan 1 name and value. Thermostatic control is turned off

;Hotend 1
M950 F2 C"out6" Q500                   	; create fan 2 on pin out7 and set its frequency
M106 P2 C"Hotend Fan 1" S0 H2 T45 L255  ; set fan 2 name and value. Thermostatic control turned on for Hotend
M950 F3 C"out3" Q500                   	; create fan 3 on pin out4 and set its frequency
M106 P3 C"Layer Fan 1" S0 H-1 L255      ; set fan 3 name and value. Thermostatic control is turned off

;Hotend 2
M950 F4 C"1.out7" Q500                   ; create fan 4 on pin out8 of EXP and set its frequency
M106 P4 C"Hotend Fan 2" S0 H3 T45 L255   ; set fan 4 name and value. Thermostatic control turned on for Hotend
M950 F5 C"1.out4" Q500                   ; create fan 5 on pin out5 of EXP and set its frequency
M106 P5 C"Layer Fan 2" S0 H-1 L255       ; set fan 5 name and value. Thermostatic control is turned off

;Hotend 3
M950 F6 C"1.out8" Q500                   ; create fan 6 on pin out6 of EXP and set its frequency
M106 P6 C"Hotend Fan 3" S0 H4 T45 L255   ; set fan 6 name and value. Thermostatic control turned on for Hotend
M950 F7 C"1.out5" Q500                   ; create fan 7 on pin out3 of EXP and set its frequency
M106 P7 C"Layer Fan 3" S0 H-1 L255       ; set fan 7 name and value. Thermostatic control is turned off

;---------------------------------------------------------------
;Toolparameters
;---------------------------------------------------------------


M404 N1.75 D0.4             ; Filament width and nozzle diameter
T-1							; Deselect any current tool

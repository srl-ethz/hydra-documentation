################################
Firmware and Slicer
################################


Duet Pi
===========

Please follow the _`guide <https://duet3d.dozuki.com/Wiki/SBC_Setup_for_Duet_3#Section_Step_1_Flash_the_image_file>`_ on the Duet3D webpage, to set up your Raspberry Pi. You will not have to configure your system files with the online tool. Instead, you can follow the steps in the RepRap Firmware section.

RepRap Firmware
================

Please follow the _`guide <webpagehttps://duet3d.dozuki.com/Wiki/Getting_Started_With_Duet_3#Section_Duet_3_and_RepRapFirmware_Num_3>`_ on the Duet3D webpage on how to update the firmware on your board. With the newest RepRap version installed place the .g files found in the LINK folder into the sys folder of your virtual SD card.

.. Attention:: You will need to edit several parameters of the .g files, as shown below before using your printer.

Config.g
^^^^^^^^^^^^^^

The config is run on startup of the printer. In the first part general statements are setting absolute coordinates, relative extruder moves, the printers name, the motion system, the units in mm, and several network settings.

::

  ;General
  ;------------------------------------------------------------------------
  G90                                     ; send absolute coordinates...
  M83                                     ; ...but relative extruder moves
  M550 P"HydraMk1"                        ; set printer name
  M669 K1                                 ; define CoreXY
  G29 S1                                  ; Set Units to Millimeters
  
  ; Network
  M586 P0 S1                              ; enable HTTP
  M586 P1 S0                              ; disable FTP
  M586 P2 S0                              ; disable Telnet
  
.. admonition:: Changes

   You can change the name of your printer here.

In a second section after waiting for a second the stepper motors are configured via the `M569 <https://duet3d.dozuki.com/Wiki/M569>`_ command. The P parameter states the output, with the first number being the board (0 = Main board, 1= Expansion Board, 121 = Toolboard) and the second number describing the stepper output. The S parameter sets the direction with 0 being backwards and 1 forwards. The D parameter describes the mode in which the stepper works, with D3 being "stealth chop".
The steppers are assigned to the different axis using the `M584 <https://duet3d.dozuki.com/Wiki/M584>`_ command.

::

  ;-----------------------------------------------------------------------
  ; Drives
  ;-----------------------------------------------------------------------
  G4 S1                                               ; Wait for Expansion boards to connect
  M569 P0.0 S0 D3                                     ; Zstepper 1 goes backwards
  M569 P0.1 S0 D3                                     ; Zstepper 2 goes backwards
  M569 P0.2 S0 D3                                     ; Zstepper 3 goes backwards
  M569 P0.3 S1 D3                                     ; Ystepper goes forwards
  M569 P0.4 S1 D3                                     ; Xstepper goes forwards
  
  M569 P0.5 S1 D3                                     ; Extruder 0 goes forwards
  M569 P1.0 S1 D3                                     ; Extruder 1 goes forwards
  M569 P1.1 S1 D3                                     ; Extruder 2 goes forwards
  M569 P1.2 S1 D3                                     ; Extruder 3 goes forwards
  
  M569 P121.0 S1 D 3                                  ; Coupler goes Forward
  
  M584 X0.4 Y0.3 Z0.0:0.1:0.2 C1.1 E1.2:0.5:121.0:1.0 ; set drive mapping

.. admonition:: Changes

   If you did not follow the wiring scheme in this guide, you will have to adapt the stepper outputs (P parameter). In case you mixed up some wiring a stepper motor might spin the wrong direction. You can accounf for this by changing the S parameter.

The following statements set several motor parameters. `M350 <https://duet3d.dozuki.com/Wiki/M350>`_ sets the microstepping mode to 1/16 and enables interpolation. The `M92 <https://duet3d.dozuki.com/Wiki/M92>`_ command sets how many steps the stepper needs to move to translate into a mm of linear motion on the printer axis. The `M906 <https://duet3d.dozuki.com/Wiki/M906>`_ command sets the motor current in mA as well as the idle factor. The idle factor is expressed in per cent and represents the percentage of current that will hold the motors in a powered on but not used state. The idle timeout is set with the `M84 <https://duet3d.dozuki.com/Wiki/M84>`_ command. S30 means that after 30 seconds of no use the stepper switches to its idle current. With the `M566 <https://duet3d.dozuki.com/Wiki/M566>`_ , `M203 <https://duet3d.dozuki.com/Wiki/M203>`_, and the `M201 <https://duet3d.dozuki.com/Wiki/M201>`_ The maximum velocities, accelerations and speedchanges are set.

::

  M350 X16 Y16 Z16 E16:16:16 I1         ; microstepping with interpolation
  M350 C16 I10                          ; configure coupler microstepping
  M92 X80.00 Y80.00 Z800.00 C91.022     ; set steps per mm
  M906 X1400 Y1400 Z800 I30             ; set motor currents, idle factor
  M92 E368:228:228:368                  ; set extruder steps per mm
  M906 E1000:1680:1680:1000 C500 I10    ; set extruder and toolchange motor current and idle factor
  M84 S30                               ; Set idle timeout
  
  M566 X400.00 Y400.00 Z6.00 C2 E120.00:120.00:120.00:120.00 P1             ; set maximum instantaneous speed changes (mm/min)        		
  M203 X20800.00 Y20800.00 Z1000.00 C15000 E3600.00:3600.00:3600.00:3600.00 ; set maximum speeds (mm/min)  
  M201 X3000.00 Y3000.00 Z100.00 C500 E3600.00:3600.00:3600.00:3600.00      ; set accelerations (mm/s^2)
  ;These values get reset after every toolchange

.. admonition:: Changes

   Depending on the extruders you are using, you will have to tweak the extruder steps per mm, extruder current, and speeds/accelerations of the printhead/extruders. We recommend a setting of 368 steps/mm and 1A for the E3D Hemera, and 228 steps/mm and 1.68A for the V4 Pellet Extruder.

Using the `M208 <https://duet3d.dozuki.com/Wiki/M208>`_ command the axis minima (S=1) and maxima (S=0) can be set. For the X and Y axis the endstop type (S1 = Active High Endstop) and position (X1 = Low end of X axis) is defined via `M574 <https://duet3d.dozuki.com/Wiki/M574>`_ with P defining the input on the board, while the C axis (the coupler) is defined to have no endstop. The Z endstop is defined seperatly using the `M558 <https://duet3d.dozuki.com/Wiki/M558>`_ command. Here the P parameter defines the switch type (P8 selects an unfiltered switch (normally closed) for bed probing between the In and Gnd pins of the connector), C defines the input, H defines the dive height (H3 = the bed will move down 3mm before each probe), F defines the feedrate for the z axis, I0 does not invert the z probe reading, and T defines the X/Y feedrate. The `G31 <https://duet3d.dozuki.com/Wiki/G31>`_ sets the Z probe offset and the trigger value. The `M671 <https://duet3d.dozuki.com/Wiki/M671>`_ command defines the position of the Z leadscrews. The positions are used for the automatic med leveling. The `M557 <https://duet3d.dozuki.com/Wiki/M557>`_ sets the range in which the mesh bed leveling grid is measured, aswell as the number of points along one axis of the grid.

::

  ;--------------------------------------------------------------------
  ;Axis and Endstops
  ;--------------------------------------------------------------------
  ; Axis Limits
  M208 X0 Y0 Z0 C-45 S1           ; set axis minima
  M208 X375 Y380 Z390 C360 S0     ; set axis maxima

  ; Endstops
  M574 X1 S1 P"io0.in"        ; configure active high endstops at X low end
  M574 Y1 S1 P"io1.in"        ; configure active high endstops at Y low end
  M574 C0 Z0                  ; configure no endstop for C and Z axis

  M558 P8 C"io2.in" H3 F400 I0 T30000         ; configure z endstop for probing with 3mm probing height, 400 feedrate for z axis and 30000 feedrate for X/Y axis
  G31 P200 X0 Y0 Z0                           ; set z probe offset and trigger value
  M671 X-4.5:200:404.5 Y-4.52:405:-4.52 S5    ; define positions of Z leadscrews
  M557 X20:360 Y20:335 P5                     ; define 5x5 mesh grid

.. admonition:: Changes

   If you are using the 500mm RatRig configuration you will need to add 100mm to the axis maxima. You will also have chang the M671 command to M671 X-4.5:250:504.5 Y-4.52:505:-4.52 S5 and the M557 to M557 X20:460 Y20:435 P5. You can adapt the gridsize of the mesh bed leveling by chaning the P parameter of the M557 command.
   
In the next section the heaters are initialised and the tools are defined. The `M308 <https://duet3d.dozuki.com/Wiki/M308>`_ is used to configure the temperature sensors. The S parameter specifies the sensor number, the P parameter sets the input, the Y parameter specifies the sensor type, for T the thermistor resistance at 25°C is entered, and for B the beta value. The sensor is named using the A parameter.
Heaters are initialized using the `M950 <https://duet3d.dozuki.com/Wiki/M950>`_ command. H defines the heater number, C the output, and T the sensor number. using the `M307 <https://duet3d.dozuki.com/Wiki/M307>`_ command bang-bang control is disabled (in favour of FOPDT) and the PWM limit is set. The heater for the bed is set using the `M140 <https://duet3d.dozuki.com/Wiki/M140>`_ command. The `M143 <https://duet3d.dozuki.com/Wiki/M143>`_ command sets the maximum temperature in the S parameter for the heater H. The heating parameters can be set using the `M307 <https://duet3d.dozuki.com/Wiki/M307>`_ command. These values were found by running the automatic heater tuning with `M303 <https://duet3d.dozuki.com/Wiki/M303>`_ .
The other tools are defined using the `M563 <https://duet3d.dozuki.com/Wiki/M563>`_ command. P states the tool number, H the heater number, D the extruder number, and F the fan number of the layer fan. Via the S parameter the hotend can be named. The active and passive temperatures are set to 0 using the `G10 <https://duet3d.dozuki.com/Wiki/G10>`_ command.
Adapt the hotends as you need, swapping out thermistor types, heating outputs, temperature limits, and hotend names. 
 
::

  ;-----------------------------------------------------------------
  ;Heaters
  ;-----------------------------------------------------------------
  ;----------
  ;Heated bed
  ;----------
  M308 S0 P"temp0" Y"thermistor" T100000 B3950 A"Bed" ; configure sensor 0 as thermistor on pin temp0
  M950 H0 C"out1" T0                          ; bed heater on out1 using sensor 0
  M307 H0 B0 S1.00                            ; disable bang-bang and set PWM limit
  M140 H0                                     ; map heated bed to heater 0
  M143 H0 S110                                ; set temperature limit for heater 0 to 110C
  M307 H0 B0 R0.322 C500.8 D11.62 S1.00 V24.0 ; PID parameters for heated bed

  ;---------
  ;Hotend 0
  ;---------
  M308 S1 P"1.temp1" Y"thermistor" T100000 B4725 C7.060000e-8 A"Hotend0"  ; configure sensor 1 as thermistor on pin temp1 of EXP
  M950 H1 C"1.out1" T1        ; nozzle heater 1 on out0 of EXP using sensor 1
  M307 H1 B0 S1.00            ; disable bang-bang and set PWM limit
  M143 H1 S250                ; set the maximum temperature in C for heater 1

  M563 P0 S"HemeraL" D0 H1 F1                         ; define tool 0
  G10 P0 R0 S0                                        ; set initial temperatures to 0C
  M307 H1 B0 R1.181 C264.4:165.1 D7.45 S1.00 V24.3    ; PID parameters for heater 1

  ;---------
  ;Hotend 1
  ;---------
  M308 S2 P"temp1" Y"thermistor" T100000 B4725 C7.060000e-8 A"Hotend1"  ; configure sensor 2 as thermistor on pin temp1
  M950 H2 C"out2" T2          ; nozzle heater 2 on out2 using sensor 2
  M307 H2 B0 S1.00            ; disable bang-bang and set PWM limit
  M143 H2 S300                ; set the maximum temperature in C for heater 2

  M563 P1 S"PelletheadL" D1 H2 F3                     ; define tool 1 
  G10 P1 R0 S0                                        ; set initial temperatures to 0C
  M307 H2 B0 R2.580 C130.0:127.4 D4.92 S1.00 V24.0    ; PID parameters for heater 2

  ;---------
  ;Hotend 2
  ;---------
  M308 S3 P"1.temp2" Y"thermistor" T100000 B4725 C7.060000e-8 A"Hotend2"  ; configure sensor 2 as thermistor on pin temp1
  M950 H3 C"1.out2" T3        ; nozzle heater 3 output on out2 of EXP using sensor 3
  M307 H3 B0 S1.00            ; disable bang-bang and set PWM limit
  M143 H3 S300                ; set the maximum temperature in C for heater 3

  M563 P2 S"PelletheadR" D2 H3 F5                     ; define tool 2
  G10 P2 R0 S0                                        ; set initial temperatures to 0C
  M307 H3 B0 R2.580 C143.9:130.8 D6.57 S1.00 V24.3    ; PID parameters for heater 3


  ;---------
  ;Hotend 3
  ;---------
  M308 S4 P"1.temp0" Y"thermistor" T100000 B4725 C7.060000e-8 A"Hotend3"  ; configure sensor 3 as thermistor on pin temp0 of EXP
  M950 H4 C"1.out0" T4        ; nozzle heater on out0 of EXP using sensor 4
  M307 H4 B0 S1.00            ; disable bang-bang mode for heater 4 and set PWM limit
  M143 H4 S250                ; set the maximum temperature in C for heater 4

  563 P3 S"HemeraR" D3 H4 F7                          ; define tool 3
  G10 P3 R0 S0                                        ; set initial temperatures to 0C
  M307 H4 B0 R1.157 C242.7:148.6 D7.43 S1.00 V24.3    ; PID parameters for heater 4

.. admonition:: Changes

   If you are using a different wiring scheme you will have to change the inputs and outputs of the thermistor and heater respectively. You can also rename your hotends in this section. Please note that the PID parameters here are only an example. You will need to find out yours through a heater tuning step later.

.. DANGER:: The set PID parameters will not match for your hotend, please run PID tuning using the `M303 <https://duet3d.dozuki.com/Wiki/M303>`_ command!


The next section initializes a hotend and a print fan for each tool. The fans are initialized via the `M950 <https://duet3d.dozuki.com/Wiki/M950>`_ command, using the F parameter to set a fan number, C to set the output on the board, and Q to set the PMW frequency.  `M106 <https://duet3d.dozuki.com/Wiki/M106>`_ edits the details of the fan specified in the P parameter. Using the C parameter a name can be set, the S parameter defines the initial speed, H associates the fan with a heater, turning it on at the hotend temperature specified using the T parameter, or disables thermostatic control if set to -1. L defines the minimum speed.


::

  ;--------------------------------------------------------------------
  ; Fans
  ;--------------------------------------------------------------------

  ;Hotend 0
  M950 F0 C"1.out7" Q500                  ; fan 0 on pin out7 of EXP and set frequency
  M106 P0 C"Hotend Fan 0" S0 H1 T45 L255  ; fan 0 name, thermostatic control for Hotend 1
  M950 F1 C"1.out4" Q500                  ; fan 1 on pin out4 of EXP and set frequency
  M106 P1 C"Layer Fan 0" S0 H-1 L255      ; fan 1 name, thermostatic control is turned off

  ;Hotend 1
  M950 F2 C"out7" Q500                    ; fan 2 on pin out7 and set frequency
  M106 P2 C"Hotend Fan 1" S0 H2 T45 L255  ; fan 2 name, thermostatic control for Hotend 2
  M950 F3 C"out4" Q500                    ; fan 3 on pin out4 and set frequency
  M106 P3 C"Layer Fan 1" S0 H-1 L255      ; fan 3 name, thermostatic control is turned off

  ;Hotend 2
  M950 F4 C"1.out8" Q500                  ; fan 4 on pin out8 of EXP and set  frequency
  M106 P4 C"Hotend Fan 2" S0 H3 T45 L255  ; fan 4 name, thermostatic control for Hotend 3
  M950 F5 C"1.out5" Q500                  ; fan 5 on pin out5 of EXP and set  frequency
  M106 P5 C"Layer Fan 2" S0 H-1 L255      ; fan 5 name, thermostatic control is turned off

  ;Hotend 3
  M950 F6 C"1.out6" Q500                  ; fan 6 on pin out6 of EXP and set  frequency
  M106 P6 C"Hotend Fan 3" S0 H4 T45 L255  ; fan 6 name, thermostatic control for Hotend 4
  M950 F7 C"1.out3" Q500                  ; fan 7 on pin out3 of EXP and set  frequency
  M106 P7 C"Layer Fan 3" S0 H-1 L255      ; fan 7 name, thermostatic control is turned off

.. admonition:: Changes

   If you are using a different wiring scheme, you will have to adapt the outputs of the fans. Depending on the type of fan, you might have to use low frequency PMW to steer it, changing the Q parameter of that fan to a 7 or similar. You can rename the fans here.

In the last section the tool offsets are set using the `G10 <https://duet3d.dozuki.com/Wiki/G10>`_ command, where Pspecifies the tool. With the  `M404 <https://duet3d.dozuki.com/Wiki/M404>`_ command the filament width and nozzle diameter are set, and at the end any currently tool is deselected (This won't result in any movement or toolchange, but sets the initial tool to none selected).

::

  ;---------------------------------------------------------------
  ;Toolparameters
  ;---------------------------------------------------------------

  ;Define Tooloffsets
  G10 P0 X21.4 Y-7.9 Z-5.9    ;Set Tool 0 offsets
  G10 P1 X0 Y0 Z-52.95        ;Set Tool 1 offsets
  G10 P2 X0 Y0 Z-53.2         ;Set Tool 2 offsets
  G10 P3 X21.4 Y-7.9 Z-5.7    ;Set Tool 3 offsets

  M404 N1.75 D0.4     ; Filament width and nozzle diameter
  T-1                 ; Deselect any current tool

.. admonition:: Changes

   You will have to define the tool offsets that are correct for your machine. Please see "calibrating tool offsets" for instructions.
   
tfree.g
^^^^^^^^

The tfree.g file is called when a tool is deselcted. It will first lower the bed slightly in relative coordinates. Then it removes the X/Y offset of the printhead, so the parking spot can be approached in the normal coordinate system. It will then move to the parking spot, disengage the coupler and turn off the printfan. With the printhead securely parked it moves out from the parking spot for clearance and changes the acceleration and speed parameters, since the toolhead without a tool has less inertia and can move quicker.

::

  G91                 ;Relative positioning
  G1 Z5 F1000         ;Lower bed
  G90                 ;Absolute positioning

  G10 P0 X0 Y0 Z-5.9  ;Set offset back to 0

  G1 X13 Y293 F30000  ;Move in front of parking spot to avoid collision
  G1 X13 Y323 F30000  ;Move in quickly
  G1 X13 Y363 F5000   ;Move in slower

  M98 P"/macros/Coupler - Unlock"   ;Open Coupler
  M106 P1 S0                        ;Turn off the fan

  G1 X13 Y343 F2000   ;Move out slowly
  G1 X13 Y323 F6000   ;Move out quickly

  M566 X400.00 Y400.00 Z6.00 C2 E120.00:120.00:120.00:120.00 P1               ; set maximum instantaneous speed changes (mm/min)
  M203 X20800.00 Y20800.00 Z1000.00 C15000 E3600.00:3600.00:3600.00:3600.00   ; set maximum speeds (mm/min)
  M201 X3000.00 Y3000.00 Z100.00 C500 E3600.00:3600.00:3600.00:3600.00        ; set accelerations (mm/s^2)

.. admonition:: Changes

   You will have to define the parking spot for each tool seperately. This is specified in section "Calibrating Parking Spot". You can leave the speed and acceleration parameters as suggested. If you want to move the toolhead without tool faster, you will have to change the values for X and Y in all tfree.g files and the config.g file.

tpre.g
^^^^^^^^

The tpre.g gcode is called beofre a tool is selected. This means it happens before the tool is switched to active, and the tool offset is applied. It will move in front of the tool for clearance and then move into the tool. The couple locks it in place and the parameters are adjusted for the different inertia of the printhead. The bed is moved out of the way to roughly acommodate for the z offset of the printhead. The head is then moved out of the parking spot. This has to be done before the tooloffset, since the tool offset will be changing the position of the parking spot in the adapted coordinate system.

::

  G1 X13 Y323 F15000    ;Move in front of Tool Location
  G1 X13 Y361 F5000     ;Quickly move into Tool
  G1 X13 Y363 F3000     ;Slowly close the gap

  M98 P"/macros/Coupler - Lock"   ;Close Coupler

  M566 X100.00 Y100.00 Z6.00 C2 E120.00:120.00:120.00:120.00 P1             ; set maximum instantaneous speed changes (mm/min)
  M203 X18000.00 Y18000.00 Z1000.00 C15000 E3600.00:3600.00:3600.00:3600.00 ; set maximum speeds (mm/min)
  M201 X3000.00 Y3000.00 Z100.00 C500 E3600.00:3600.00:3600.00:3600.00      ; set accelerations (mm/s^2)

  G91             ;Relative positioning
  G1 Z10 F1000    ;Move bed out of the way
  G90             ;Absolute positioning

  G1 X13 Y323 F6000   ;Move out

.. admonition:: Changes

   You will have to adjust the Parking spot position, further detailed in section "Calibrating Parking Spots", the rough offset, further specified in "Calibrating Tool Offsets", and the speed/acceleration values. You can do this my starting with relatively low values and slowly increasing them with the printhead selected, to see what is still managable with the inertia of the printhead.

tpost.g
^^^^^^^^

The tpost.g file is run after the toolchange of the respective tool. I sets the tooloffset, heats up the tool and sets the print fan speed. It will then move out slightly for clearance.

::

  G10 P0 X21.4 Y-7.9 Z-5.9  ;Set tool offset
  M116 P0                   ;Heat up tool
  M106 R1                   ;Restore print fan speed
  G91                       ;Relative positioning
  G1 Y-20 F6000             ;Move out
  G90                       ;absolute positioning

.. admonition:: Changes

   You will have to set the tool offset, further detailed in section "Calibrating Tool Offsets", as well as the tool to heat up in the M116 command.

Prusa Slicer
=============

Please download the newest version of _`Prusa Slicer <https://www.prusa3d.com/de/page/prusaslicer_424/>`_ from their webpage. You will now have to add the config files for the printer, the printing process, and the filaments. Please download the .ini files from the folder "Prusa Slicer" on the github repository. You will have to place them in certain folders in the Prusa Slicer. You will fin the folder under:

**Windows:**  C:Users/username/AppData/Roaming/PrusaSlicer

**Mac:**      “HDD” ▸ ⁨Users⁩ ▸ ⁨username⁩ ▸ ⁨Library⁩ ▸ ⁨Application Support⁩ ▸ ⁨PrusaSlicer

**Linux:**    ~/.config/PrusaSlicer

.. Note:: On windows you will have to show hidden folders. You can do this in explorer under view -> options.

You can now put the .ini files into the corresponding folders in Prusa Slicer. (filament -> filament etc.).

You can define a physical printer in Prusa Slicer to directly upload printjobs to your printer. For this please open Prusa Slicer (After adding the .ini files) and navigate to the "Printer Settings page".

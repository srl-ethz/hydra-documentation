################################
Firmware and Slicer
################################


Duet Pi
===========

RepRap Firmware
================

Place the .g files found in the LINK folder into the sys folder of your virtual SD card.
Please make sure to adapt you config.g file before powering up the printer for the first time.


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


Prusa Slicer
=============

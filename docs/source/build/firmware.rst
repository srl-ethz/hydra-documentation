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
  
This first section defines some general features of the printer.

::

  ;-----------------------------------------------------------------------
  ; Drives
  ;-----------------------------------------------------------------------
  G4 S1									                              ; Wait for Expansion boards to connect
  M569 P0.0 S0 D3                                     ; Zstepper 1 goes backwards
  M569 P0.1 S0 D3                                     ; Zstepper 2 goes backwards
  M569 P0.2 S0 D3                                     ; Zstepper 3 goes backwards
  M569 P0.3 S1 D3                                     ; Ystepper goes forwards
  M569 P0.4 S1 D3                                     ; Xstepper goes forwards
  
  M569 P0.5 S1 D3							                        ; Extruder 0 goes forwards
  M569 P1.0 S1 D3							                        ; Extruder 1 goes forwards
  M569 P1.1 S1 D3                                     ; Extruder 2 goes forwards
  M569 P1.2 S1 D3						                          ; Extruder 3 goes forwards
  
  M569 P121.0 S1 D3							                      ; Coupler goes Forward
  
  M584 X0.4 Y0.3 Z0.0:0.1:0.2 C1.1 E1.2:0.5:121.0:1.0 ; set drive mapping

This section defines the different motors and some parameters. Using the `M569 <https://duet3d.dozuki.com/Wiki/M569>`_ command the motors are initialized and the positive direction and driver mode is defined. If you are using different connectors on your board, you will have to specify them in the P parameter. Using the `M584 <https://duet3d.dozuki.com/Wiki/M584>`_ command the motors are assigned to the different axis and extruders.




Prusa Slicer
=============

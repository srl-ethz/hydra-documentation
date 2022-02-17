################################
Calibrating Tool Offsets
################################

This guide assumes you have calibrated your parking spots already. We will calibrate the tool offsets in two sections. First the Z offset will be determined. After that the X and Y offset will be set. Always work on the respective .g file. If you are working on tool 0 the .g files are tfree0.g, tpre0.g and tpost0.g.

Z - Offset
================

Home all axis of the printer. Move the bed down by roughly 100mm. Make sure that the current Z offset values are 0 (Described below). Select the tool you are trying to calibrate.
Move it to the middle of the printbed (Roughly X200 Y200). Place a piece of paper on the bed and slowly move up the bed. As soon as the nozzle of the printhead catches the paper, stop and note down the current Z coordinate. Move the bed out of the way and park the tool.

tfree.g
^^^^^^^^

::

  G91				;Relative positioning
  G1 Z5 F1000 			;Lower bed
  G90				;Absolute positioning

  G10 P0 X0 Y0 Z-5.9		;Set offset back to 0

  G1 X13 Y293 F30000		;Move in front of parking spot to avoid collision
  G91				;Relative positioning
  G1 Y30 F30000			;Move in quickly
  G1 Y40 F5000			;Move in slower
  G90				;Absolute positioning

  M98 P"/macros/Coupler - Unlock" 	;Open Coupler
  M106 P1 S0				;Turn off the fan

  G91				;Relative positioning
  G1 Y-20 F2000		;Move out slowly
  G1 Y-20 F6000		;Move out quickly
  G90				;Absolute positioning

  M566 X400.00 Y400.00 Z6.00 C2 E120.00:120.00:120.00:120.00 P1          		; set maximum instantaneous speed changes (mm/min)
  M203 X20800.00 Y20800.00 Z1000.00 C15000 E3600.00:3600.00:3600.00:3600.00    	; set maximum speeds (mm/min)
  M201 X3000.00 Y3000.00 Z100.00 C500 E3600.00:3600.00:3600.00:3600.00        	; set accelerations (mm/s^2)

.. admonition:: Changes

   In the line "Set offset back to 0" enter the **negative** of the Z-coordinate you noted down. **If you enter the positive value of the Z-coordinate you noted down the printer will crash into the bed!**

tpre.g
^^^^^^^^

::

  G1 X13 Y323 F15000			;Move in front of Tool Location
  G91					;Relative positioning
  G1 Y20 F5000				;Quickly move into Tool
  G1 Y20 F3000				;Slowly close the gap
  G90					;Absolute positioning

  M98 P"/macros/Coupler - Lock"	;Close Coupler

  M566 X100.00 Y100.00 Z6.00 C2 E120.00:120.00:120.00:120.00 P1          		; set maximum instantaneous speed changes (mm/min)
  M203 X18000.00 Y18000.00 Z1000.00 C15000 E3600.00:3600.00:3600.00:3600.00    	; set maximum speeds (mm/min)
  M201 X3000.00 Y3000.00 Z100.00 C500 E3600.00:3600.00:3600.00:3600.00        	; set accelerations (mm/s^2)

  G91					;Relative positioning
  G1 Z10 F1000		;Move bed out of the way
  G90					;Absolute positioning

  G1 Y-40 F6000	;Move out

.. admonition:: Changes

   In the line "Move bed out of the way" enter the Z-coordinate you noted down plus 5.
 
tpost.g
^^^^^^^^

::

  G10 P0 X21.4 Y-7.9 Z-5.9		;Set tool offset
  M116 P0							;Heat up tool
  M106 R1							;Restore print fan speed
  G91								;Relative positioning
  G1 Y-20 F6000					;Move out
  G90								;Absolute positioning   

.. admonition:: Changes

   In the line "Set tool offset" enter the **negative** of the Z-coordinate you noted down. **If you enter the positive value of the Z-coordinate you noted down the printer will crash into the bed!**
   


X/Y - Offset
================

If you have set the Z offsets of your tools it is time to calibrate the X and Y offset. You can do this in three steps: Roughly by eye, roughly by lines and lastly, precise by calibration print. You will have to enter your new X and Y offset values in tpost.g:

::

  G10 P0 X21.4 Y-7.9 Z-5.9		;Set tool offset
  M116 P0							;Heat up tool
  M106 R1							;Restore print fan speed
  G91								;Relative positioning
  G1 Y-20 F6000					;Move out
  G90								;Absolute positioning   

.. admonition:: Changes

   In the line "Set tool offset" enter the X and Y offsets you are currently working on.

Roughly by eye
^^^^^^^^^^^^^^^^

You can either create X and Y offsets for every tool, or you can create them relative to a tool. This will lead to less work in the long run. You can estimate the offset in X and Y direction by measuring the distance from the nozzle of the tool to the tool changer, resp. one nozzle on the tool changer to another nozzle on the tool changer. This should give a rough staring point.

Enter these values in the tpost.g file and continue with the next step.

Roughly by line
^^^^^^^^^^^^^^^^

For this print the "Calibration_line" stl found in the "Calibration" folder in the github repository. The file consists of two sets lines that are seperated by 10mm in X and Y direction. Set one of the horizontal and one of the vertical lines to be printed with your "0 offset" extruder and the other two to be printed with the extruder you are calibrating. Print the file and meausre the distance between the lines. The difference in the measure distance to 10mm can directly be applied to the X and Y offset in the tpost.g file.

Precise by calibration print
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For this print the "Calibration_Grid" stl found in the "Calibration" folder in the github repository. The file consists of two sets of two combs that will tell you the exact remaining offset of your extruder. Follow the same procedure as in "Roughly by line". Have a close look at the two combs. Two of the struts should be perfectly aligned. This is the remaining offset of your tool. If the middle two struts are aligned, that direction of the tool is fully calibrated. for each strut away from the middle, add 0.1mm.

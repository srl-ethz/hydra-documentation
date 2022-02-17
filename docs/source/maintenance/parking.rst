################################
Calibrating Parking Spot Position
################################

To calibrate a parking spot, we first need to find out the coordinates of the parking spot. We can either do this for an already attached parking spot, by carefully homing in on its position, or we can define the parking spot position (in the X-direction) attaching it in the process.

For both procedures, first home all axis. Then take the corresponding tool for the parking spot and hold it up to the tool changer. Press the "Couple - Lock" macro. The tool should now be attached to the tool head.

Carefully move the tool to the parking spot location using the move buttons in the dashboard of the duet web interface. I you have not attached your parking spot to the frame yet, you can also slot the tool into the parking spot and slowly move up to the back of the printer. When apporoaching the Y-limit, move in smaller increments, until you are satisfied with the position. Note down the X and Y coordinates in the top left of the duet web interface dashboard.

Fasten the parking spot if it was loose and select the "coupler - unlock" macro. Move the tool head out in the **minus** Y direction. 

.. DANGER:: Do not move further to the back (positive Y) and do not move in X-direction!

We will now edit the corresponting tfree.g, and tpre.g files, found in the "system" tab in the duet web interface.

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

   In the line "Move in front of parking spot to avoid collision" enter the X-coordinate you noted dwon, and the Y-coordinate minus 70. **If you enter the Y-coordinate you noted down the printer will crash trying to park the tool!**

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

   In the line "Move in front of Tool Location" enter the X-coordinate you noted dwon, and the Y-coordinate minus 40. **If you enter the Y-coordinate you noted down the printer will crash trying to pick up the tool!**

Try the first tool change with your mouse hovering over the emergency stop.

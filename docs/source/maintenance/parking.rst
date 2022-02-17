################################
Calibrating Parking Spot Position
################################

To calibrate a parking spot, we first need to find out the coordinates of the parking spot. We can either do this for an already attached parking spot, by carefully homing in on its position, or we can define the parking spot position (in the X-direction) attaching it in the process.

For both procedures, first home all axis. Then take the corresponding tool for the parking spot and hold it up to the tool changer. Press the "Couple - Lock" macro. The tool should now be attached to the tool head.

Carefully move the tool to the parking spot location using the move buttons in the dashboard of the duet web interface. I you have not attached your parking spot to the frame yet, you can also slot the tool into the parking spot and slowly move up to the back of the printer. When apporoaching the Y-limit, move in smaller increments, until you are satisfied with the position. Note down the X and Y coordinates in the top left of the duet web interface dashboard.

Fasten the parking spot if it was loose and select the "coupler - unlock" macro. Move the tool head out in the -Y direction. 

.. DANGER:: Do not move further to the back (positive Y) and do not move in X-direction!

We will now edit the corresponting tfree.g, and tpre.g files, found in the "system" tab in the duet web interface.

tfree.g
^^^^^^^^

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

   Enter the coordinates you noted down in the line with the comment "Move in slower". Make the coordinates in "Move in quickly" and the "move out quickly" the X-coordinate you noted down, and the Y-coordinate you noted down minus 40. Make the "Move in front of parking spot to avoid collision" coordinates the X-coordinate you noted down, and the Y-coordinate you noted down minus 70. Make the "Move out slowly" coordinates the X-coordinate you noted down, and the Y-coordinate you noted down minus 20.

tpre.g
^^^^^^^^

The tpre.g gcode is called before a tool is selected. This means it happens before the tool is switched to active, and the tool offset is applied. It will move in front of the tool for clearance and then move into the tool. The couple locks it in place and the parameters are adjusted for the different inertia of the printhead. The bed is moved out of the way to roughly accommodate for the z offset of the printhead. The head is then moved out of the parking spot. This has to be done before the tooloffset, since the tool  offset will be changing the position of the parking spot in the adapted coordinate system.

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

   You will have to adjust the Parking spot position, further detailed in section "Calibrating Parking Spots", the rough offset, further specified in "Calibrating Tool Offsets", and the speed/acceleration values. You can do this by starting with relatively low values and slowly increasing them with the printhead selected, to see what is still manageable with the inertia of the printhead.

tpost.g
^^^^^^^^

The tpost.g file is run after the tool change of the respective tool. It sets the tool offset, heats up the tool and sets the print fan speed. It will then move out slightly for clearance.

::

  G10 P0 X21.4 Y-7.9 Z-5.9  ;Set tool offset
  M116 P0                   ;Heat up tool
  M106 R1                   ;Restore print fan speed
  G91                       ;Relative positioning
  G1 Y-20 F6000             ;Move out
  G90                       ;absolute positioning

.. admonition:: Changes

   You will have to set the tool offset, further detailed in section "Calibrating Tool Offsets", as well as the tool to heat up in the M116 command.

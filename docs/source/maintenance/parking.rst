################################
Calibrating Parking Spot Position
################################

To calibrate a parking spot, we first need to find out the coordinates of the parking spot. We can either do this for an already attached parking spot, by carefully homing in on its position, or we can define the parking spot position (in the X-direction) attaching it in the process.

For both procedures, first home all axis. Then take the corresponding tool for the parking spot and hold it up to the tool changer. Press the "Couple - Lock" macro. The tool should now be attached to the tool head.

Carefully move the tool to the parking spot location using the move buttons in the dashboard of the duet web interface. I you have not attached your parking spot to the frame yet, you can also slot the tool into the parking spot and slowly move up to the back of the printer. When apporoaching the Y-limit, move in smaller increments, until you are satisfied with the position. Note down the X and Y coordinates in the top left of the duet web interface dashboard.

Fasten the parking spot if it was loose and select the "coupler - unlock" macro. Move the tool head out in the -Y direction. 

.. DANGER:: Do not move further to the back (positive Y) and do not move in X-direction!

We will now edit the corresponting tfree.g, and tpre.g files, found in the "system" tab in the duet web interface.


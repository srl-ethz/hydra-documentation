################################
Homing
################################

To home the printer simply press the button "Home all" in the Duet web interface. Alternatively all axis can be homed using the G28 command. To home a single axis, press the respective home button in the Duet web interface.

To level the bed run the G32 command. This will probe three points and then adjust the bed, compensating for any tilt. It is recommended to run this process at least twice.\\
To run a mesh bed calibration use the command G29 S0. This will probe the bed in a 5x5 grid, store the data in the heightmap.csv file, and compensate for any skews in the printing platform.

.. figure:: img/Homing
    :align: center
    :figwidth: 300px

    The Home Buttons in the Duet Web Interface

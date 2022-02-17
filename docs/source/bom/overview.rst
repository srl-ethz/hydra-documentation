################################
Overview
################################

Motion System and Toolchanger
=============================

The frame of the Hydra uses a custom RatRig V-core 3. To simplify the ordering process, the mainboard, a Hemera extruder, and a power supply are ordered via RatRig. You can source these parts otherwise, just adapt the ordering selection from RatRig. You can customize the RatRig V-Core by going to the customizer and selecting the following options:

========================================================================  =====================================================================================================
Prompt                                                                    Selection
========================================================================  =====================================================================================================
Select printer volume size	                                              400mm x 400mm x 400mm 
Add Controller Board	                                                    Yes, I want to add a Duet 3 Mainboard 6HC 
Add Genuine Hot End	                                                      No
Add Genuine Extruder	                                                    No
Add printed parts service	                                                Yes I want to add the printed parts set - PETG black
Printed Parts - EVA 2.3.0 Extruder Mount (…)	                            E3D Hemera mount
Printed Parts: EVA 2.3.0 Hot-end mount (…)	                              E3D V6 mount
Add Nema 17 Motors (…)	                                                  Yes I want to add 5x 48mm Nema 17 Stepper motors (+64.95EUR)
Add Nema 17 Motor cables with connectors (…)	                            Yes I want to add 6 x Nema 17 cables
Add custom Keenovo silicone heater pad [...]	                            Yes please add 1 x 380mm x 380mm Heater Kit (1000W) - 220V
Add powder coated PEI mangetic three part […]	                            Yes please add 1x FlexPlate Set - PEI 410mm x 410mm
Add 1x Power Supply	                                                      Yes add 24V 250watt Fanless Weho PSU
Add Fans	                                                                Yes, add 24V 250Watt Fanless Weho PSU2x Fan - 1x40mm Axial Brushless 24V DC + 1x50mm Blower type […]
Add Bltouch v3.1 - Genuine Antclabs Leveling Sensor	                      No
Add Endstop Module - Horizontal Limit Switch with 1mt cable + connector	  Yes, add 2x Endstop module with cable
Add Rat Rig Spool Holder v2.0 Kit	                                        No
Add enclosure kit	                                                        -- Please Select --
Add enclosure kit printed parts	                                          -- Please Select --
Add Workbench	                                                            No
Add leveling feet for the workbench	                                      No
========================================================================  =====================================================================================================

The tool changer parts can be ordered directly from the E3D online store or locally sourced. Note: If you're using a different tool configuration, you do not need to order an E3D Hemera.

========================= ========= =================================================================================
Item                       Amount    Ordering Link
========================= ========= =================================================================================
E3D Toolchanger Carriage  1          https://e3d-online.com/products/toolchanger-toolhead?variant=31134333927483
E3D Toolplate		          4          https://e3d-online.com/products/blank-tool-plate-dock-kit?variant=32570067058747
Hemera Extruder (24V)		  2          https://e3d-online.com/products/e3d-hemera-direct-kit-1-75mm
Hemera Extrduer Fan       2          Link
========================= ========= =================================================================================

As cable brace (And in the assembly of the Pellet Extruder) a steel band is used. You will need approx. 4m. The dimensions are 0.3mm x 11mm. If you can't find these exact dimensions, you will have to adapt some of the 3D printed parts.

If you want to use the Pellet Extruder V4, you can order it `here <https://mahor.xyz/producto/v4-pellet-extruder/>`_ . Please select the 24V, 70W Version.

Electronics
===========

To mount the Electronics you will need either two or four sheets of PMMA, depending on the size you can process. The sizes noted below are the minimum size required for the parts. It is recommended to order a slightly larger sheet, to cut the geometry accurately.

+------------------------+---------------------+
| Two Sheets             | Four sheets         | 
+========================+=====================+
| 600mm x 580mm          | 300mm x 580mm       | 
+                        +---------------------+
|                        | 300mm x 580mm       | 
+------------------------+---------------------+
| 600mm x 610mm          | 300mm x 610mm       | 
+                        +---------------------+
|                        | 300mm x 610mm       | 
+------------------------+---------------------+

The Hydra MK1 uses three Duet3D boards (listed below) and a Raspberry Pi 3B. The Raspberry Pi additionally requires a 5V power source and optionally an ethernet cable to connect to your PC. The sourcing of these parts will depend on the availability in your country. The Mainboard was selected when ordering the RatRig. The Expansion board can also be ordered from the RatRig webshop. 

=========================== ========= 
Item                         Amount   
=========================== ========= 
Duet3 Mainboard 6HC         1
Duet3 Expansion 3EXP	      1	
Duet3 Toolboard	1LC         1 
Raspberry Pi 3B             1
Powrsupply (5V)             1
Ethernet Cable (optional)   1
=========================== ========= 

To connect the electronics you will need the following lengths of cables. The first table shows the lengths for different types of cables. The second tables shows the lengths for different color cables (Stepper cable = back, red, blue, green; Fan cable = black, red; Thermistor cable = white, white; Limit Switch cable = black, red, white; Heater cable = orange, orange; 24V cable = red(24V), black(24V)). The number in brackets represents the needed length in case the stepper cables were not purchased with the RatRig kit.


========================= ==================== 
Cable                     Approx. Length [mm]  
========================= ==================== 
Stepper Cable	            650
Axis Cable	              450
Fan	                      1000
Thermistor	              650
Limit Switches	          300
Heaters	                  500
24V Cables	              250
========================= ==================== 

=============== =====================
Cable            Approx. Length [cm]
=============== =====================
Black            1850
Red              1850
Blue             650
Green            650
White            1450
Orange (24V)     1000
Black (24V)      300
Red (24V)        300
=============== =====================

To secure the cables to the PMMA plate you will need several zip-ties. To secure the different boards, we recommend using 8mm M3 standoffs, as these can be used for the tool changer assembly. You will also need two 28mm M3 standoffs for the tool changer assembly.


========================= ========= 
Item                       Amount   
========================= ========= 
Cableties                  200
PCB standoffs M3 (8mm)	   20
PCB standoffs M3 (28mm)    2
========================= ========= 

To connect the Powersupply to your power grid, you will need some mains wiring. This should only be done by a certified electrician. You will need the following items:

============================= ========= 
Item                           Amount   
============================= ========= 
T12 to C13 Cable               2
C14 Socket            	       2
Connector Strip                1
Live, Neutral & Ground wire    ca 60cm
============================= ========= 

Misc

Schrauben
Nozzles

################################
Crimped Wires
################################

To connect all the electronics you will need to crimp your own wires or order precrimped wires. The connectros and crimps to connect to the duet boards are included with the boards. We recommend having a connector close to the printhead, for easier disassebmbly in case of a hotend clogg. A widely available connector would be a dupont style connector, however it could be advantageous to use a locking connector.

Please crimp the following lengths of wires. For reference on how to crimp the connectors for the duet board, please see the `duet 3D wiring diagrams <https://duet3d.dozuki.com/Wiki/Duet_3_Mainboard_6HC_Wiring_Diagram>`_ or the following pictures.


+----------------+-------------------+-------------------+
| Part           | Component         | Wire Length [cm]  |
+================+===================+===================+
| Extruder 0	 | Motor	     | 122		 |
+                +-------------------+-------------------+	
|	         | Heater	     | 121		 |
+                +-------------------+-------------------+
| 		 | Thermsitor	     | 120		 |
+                +-------------------+-------------------+
| 		 | Printfan	     | 121		 |
+----------------+-------------------+-------------------+
| 		 | Hotendfan         | 121		 |
+----------------+-------------------+-------------------+
| Extruder 1	 | Motor	     | 130		 |
+----------------+-------------------+-------------------+


	Heater	129
	Thermsitor	132
	Printfan	132
	Hotendfan	131
Extruder 2	Motor	120
	Heater	119
	Thermsitor	122
	Printfan	122
	Hotendfan	121
Extruder 3	Motor	112
	Heater	111
	Thermsitor	114
	Printfan	114
	Hotendfan	113
Toolchanger	Motor	136
	X/Y Switch	102
	Z Switch	102
Misc	X/Y Switch	42
Heatbed	To SSR	81
	To Socket	98
	Ground	106
	Thermistor	104
	6HC -> SSR	70
Axis	Left Z	95
	Back Z	66
	Right Z	144
	X/Y Left	86
	X/Y Right	40
Power 24V	6HC	37
	3HC	38
	1TC	42
CAN	6 -> 3	43
	3 -> 1	28
Mains	Powersupply	28
	SSR	32

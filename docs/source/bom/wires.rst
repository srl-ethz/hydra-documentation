################################
Crimped Wires
################################

To connect all the electronics you will need to crimp your own wires or order pre-crimped wires. The connectors and crimps to connect to the duet boards are included with the boards. We recommend having a connector close to the printhead, for easier disassembly in case of a hotend clogg. A widely available connector would be a DuPont style connector, however, it could be advantageous to use a locking connector.

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
+                +-------------------+-------------------+
| 		 | Hotendfan         | 121		 |
+----------------+-------------------+-------------------+
| Extruder 1	 | Motor	     | 130		 |
+                +-------------------+-------------------+	
|	         | Heater	     | 129		 |
+                +-------------------+-------------------+
| 		 | Thermsitor	     | 132		 |
+                +-------------------+-------------------+
| 		 | Printfan	     | 132		 |
+                +-------------------+-------------------+
| 		 | Hotendfan         | 131		 |
+----------------+-------------------+-------------------+
| Extruder 2	 | Motor	     | 120		 |
+                +-------------------+-------------------+	
|	         | Heater	     | 119		 |
+                +-------------------+-------------------+
| 		 | Thermsitor	     | 122		 |
+                +-------------------+-------------------+
| 		 | Printfan	     | 122		 |
+                +-------------------+-------------------+
| 		 | Hotendfan         | 121		 |
+----------------+-------------------+-------------------+
| Extruder 3	 | Motor	     | 112		 |
+                +-------------------+-------------------+	
|	         | Heater	     | 111		 |
+                +-------------------+-------------------+
| 		 | Thermsitor	     | 114		 |
+                +-------------------+-------------------+
| 		 | Printfan	     | 114		 |
+                +-------------------+-------------------+
| 		 | Hotendfan         | 113		 |
+----------------+-------------------+-------------------+
| Toolchanger	 | Motor	     | 136		 |
+                +-------------------+-------------------+	
|	         | X Switch	     | 102		 |
+                +-------------------+-------------------+
| 		 | Z Switch	     | 102		 |
+----------------+-------------------+-------------------+
| Misc		 | Y Switch	     | 92		 |
+----------------+-------------------+-------------------+
| Heatbed	 | To SSR (Mains)    | 81		 |
+                +-------------------+-------------------+	
|	         | To Socket (Mains) | 98		 |
+                +-------------------+-------------------+
| 		 | Ground (Mains)    | 106		 |
+                +-------------------+-------------------+
| 		 | Thermistor	     | 104		 |
+                +-------------------+-------------------+
| 		 | 6HC -> SSR        | 70		 |
+----------------+-------------------+-------------------+
| Axis    	 | Left Z	     | 95		 |
+                +-------------------+-------------------+	
|	         | Back Z 	     | 66		 |
+                +-------------------+-------------------+
| 		 | Right Z	     | 144		 |
+                +-------------------+-------------------+
| 		 | XY Left	     | 86		 |
+                +-------------------+-------------------+
| 		 | XY Right          | 40		 |
+----------------+-------------------+-------------------+
| 24V    	 | 6HC		     | 37		 |
+                +-------------------+-------------------+	
|	         | 3HC	 	     | 38		 |
+                +-------------------+-------------------+
| 		 | 1LC		     | 42		 |
+----------------+-------------------+-------------------+
| CAN		 | 6HC -> 3HC	     | 43		 |
+                +-------------------+-------------------+
| 		 | 3HC -> 1LC        | 28		 |
+----------------+-------------------+-------------------+
| Mains		 | Powersupply	     | 28		 |
+                +-------------------+-------------------+
| 		 | SSR		     | 32		 |
+----------------+-------------------+-------------------+

For easier maintenance of the printhead, it is recommended to add a connector close to the printhead. For example, a double row 5 pin DuPont connector could be used for signal and motor cables and a MOLEX connector for the heater cables.

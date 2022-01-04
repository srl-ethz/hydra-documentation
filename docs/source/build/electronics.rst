################################
Electronics and Wiring
################################


For the electronics you will need to crimp your own connectors. We recommend adding quick connectors for the printheads, to make removing the printheads for maintenance easy. In this example 5x2 dupont connectors were used for everything but the heater wires, which use a MOLEX connector. If you follow this guide you will need:
\begin{itemize}
    \item 8 Dupont connectors, including male and female crimps
    \item 4 MOLEX female and 4 MOLEX male connectors, including crimps
    \item The crimps and connectors provided by Duet3D
\end{itemize}

Here you can find a cutlist of all cables. Note that each motor cable requires four strands (optimally: black, red, blue, green), each switch cable requires three stands (optimally: black, red, white), and all others two stands (fans: black, red; thermistor: two white, heaters: two orange, power supply: black, red):

\begin{table}[H]
    \centering
    \begin{tabular}{|l|l|l|}
        \hline
        Extruder 0 & Motor & \SI{122}{cm} \\
        \hline
         & Heater & \SI{121}{cm} (\SI{24}{V})\\
        \hline
         & Thermistor & \SI{120}{cm} \\
        \hline
         & Print fan & \SI{121}{cm} \\
        \hline
         & Hotend fan & \SI{121}{cm} \\
        \hline
        Extruder 1 & Motor & \SI{130}{cm} \\
        \hline
         & Heater & \SI{129}{cm} (\SI{24}{V})\\
        \hline
         & Thermistor & \SI{132}{cm} \\
        \hline
         & Print fan & \SI{132}{cm} \\
        \hline
         & Hotend fan & \SI{131}{cm} \\
        \hline
        Extruder 2 & Motor & \SI{120}{cm} \\
        \hline
         & Heater & \SI{119}{cm} (\SI{24}{V})\\
        \hline
         & Thermistor & \SI{122}{cm} \\
        \hline
         & Print fan & \SI{122}{cm} \\
        \hline
         & Hotend fan & \SI{121}{cm} \\
        \hline
        Extruder 3 & Motor & \SI{112}{cm} \\
        \hline
         & Heater & \SI{111}{cm} (\SI{24}{V})\\
        \hline
         & Thermistor & \SI{114}{cm} \\
        \hline
         & Print fan & \SI{114}{cm} \\
        \hline
         & Hotend fan & \SI{113}{cm} \\
        \hline
        Toolchanger & Motor & \SI{136}{cm}\\
        \hline
        & X/Y Switch & \SI{102}{cm}\\
        \hline
        & Z Switch & \SI{102}{cm}\\
        \hline
        Misc & Z Switch & \SI{42}{cm} (RatRig included)\\
        \hline
        Heatbed & Thermistor & \SI{104}{cm} \\
        \hline
         & "Heater" & \SI{70}{cm} (\SI{24}{V})\\
        \hline
         Axis Motors & Left Z & \SI{95}{cm} \\
        \hline
         & Back Z & \SI{66}{cm} \\
        \hline
         & Right Z & \SI{144}{cm} \\
         \hline
         & X/Y Left & \SI{86}{cm} \\
        \hline
         & X/Y Right & \SI{40}{cm} \\
         \hline
         Power supply & 6HC & \SI{37}{cm} (\SI{24}{V})\\
         \hline
         & 3HC & \SI{38}{cm} (\SI{24}{V})\\
         \hline
         & 1TC & \SI{42}{cm} (\SI{24}{V})\\
         \hline
         CAN connections & 6HC $\rightarrow$  3HC & \SI{43}{cm}\\
         \hline
         & 3HC $\rightarrow$  1TC & \SI{28}{cm}\\
         \hline
\end{tabular}
    \caption{Caption}
    \label{tab:my_label}
\end{table}

Crimp the connectors as seen in the following image

Wiring the hydra also requires some mains wiring. This should only be done by a certified electrician. The plans can be found here:


To mount the electronics, first screw in 16 \SI{8}{mm} spacers, holding them in place with m3 locking nuts.

Mount the Duet3 boards as shown, using M3x6 screws. 

Plug in the ribbon cable on the Duet3 mainboard. Place the cable as shown and mount the raspberry Pi above it using four M3x6mm screws. Plug in the ribbon cable in the Raspberry Pi.

Insert zipties as shown.

For the following steps please refer to the wiring diagram.

Connect the power wires for the three boards. Note the inline fuse in the live wire for the 1TC. 

Connect the heater cable and thermistor for the heated bed.

Connect the CAN buses of the three boards.

Connect the extruders as shown in the wiring diagram.

Secure the wires using the zipties.

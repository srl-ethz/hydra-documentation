This section will give a more specific overview of the hardware components and their function.

\subsection{Motion System}
\label{ss:MotionSystem}

The motion system consists of the framework, the axis, including the motors, and the print bed.
The Rat Rig is build up from 3030 aluminium profiles (Exception: The X-Axis consists of a 2020 profile). They are connected with aluminium plates in the corners, as well as 90 degree brackets for the back linear rail mounting. The Z-axis runs on three linear rails that are directly screwed to the inside of the outer profiles. It is driven via three threaded rods connected to NEMA 17 stepper motors via thrust bearings and couplers. The print bed is an aluminium plate that has three steel balls screwed into the underside. These steel balls rest between two steel rods that are inserted in 3D printed parts, running on the linear rails and connected to the threaded rods via a plastic coupler. 
The Y-axis consists of a 2020 Extrustion that is mounted on two linear rails that are mounted to the underside of the top of the frame. A third linear rail is screwed to the top of the 2020 extrusion to serve as the X-axis. The X and Y axis are driven via two long belts in a core XY layout. The belts are driven by two NEMA 17 motors located in the back of the top frame.
To tension the belts a 3D printed tensioning system mounted on the X-carriage is used. 

\subsection{Tool Changer}
\label{ss:ToolChanger}

The tool changer is directly mounted to the X-carriage, and consists of the tool plate, that interfaces with the receivers, a shaft to lock in the receivers, and a stepper motor to drive the shaft. The receivers have a slanted middle section, so they are pulled towards the tool plate when the shaft turns. T always apply the same force pulling the receivers towards the tool plate, the shaft is spring loaded.

\subsection{Electronics}
\label{ss:Electronics}

The machine can be interfaced with via the webinterface, hosted by a Raspberry Pi 3B running DuetPi\footnote{\url{https://github.com/Duet3D/DuetPi}}. The main Reprap 3 firmware runs on the Duet 3 6HC. It offers connections for the X/Y stepper motors, the three Z stepper motors, the heated bed temperature sensor, the heated bed control output, and the microswitches, which are used to home the printer. It offers an additional stepper driver output, several connectors for 12-24V power outputs, and inputs for temperature sensors. To accommodate for the additional extruders and the stepper needed for the toolchanger, a Duet 3 Expansion Board 3HC and a Duet 3 Tool Board are used. These boards are connected to the mainboard using a CAN connection. All boards have to be supplied with 24V which is provided by a power supply that is included in the Rat Rig kit. To switch the 230V needed for the heated bed a solid state relay is used.
The wiring schematic can be seen in figure \ref{f:wiring}.

\begin{figure}
    \centering
    \includegraphics[width=\textwidth]{img/ElectronicsSchematic.png}
    \caption{Wiring schematic on the back of the printer.}
    \label{f:wiring}
\end{figure}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Firmware/Slicer          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\cleardoublepage
\section{Firmware and Slicer}
\label{FirmwareSlicer}



\subsection{Duet Pi}
\label{ss:DuetPi}


\subsection{Duet Firmware}
\label{ss:DuetFirmware}

The Hydra MK1 uses the most recent RepRap firmware\footnote{As of DATE, version VERSION.}. To configure the printer several .g-files are needed in the virtual SD card repository\footnote{The SD card is virtual since it is using storage on the Raspberry Pi and not a physical SD card.}. Th files are shown in appendix \ref{a:DuetGcode} including comments, explaining the gcode commands they contain. Here only a brief overview of the files is given.\\

\begin{description}
    \item[config.g:] The config.g file contains the initialisation process of the printer. Here all inputs and outputs are defined. Additionally the parameters for motors, heaters, and sensors are set, and the hotends are defined.
    \item[home.g:] Homes the respective axis. In case of homeall.g the X and Y-axis are homed simultaneously, with the Z-axis following and the C-axis (coupler) being homed last. homeall.g is also run via the gcode command G28.\\
    \item[bed.g:] This file is called via the gcode command G32. It probed the bed at three locations close to the Z-axis leadscrews and adjusts the three axis to accommodate for any tilt in the bed.\\
    \item[tfree.g:] This file is called when the respective tool is deselected. It drives back to the parking spot, disengages the coupler, and clears the print head.\\
    \item[tpre.g:] This file is called when a tool is selected. It drives to the parking spot, and couples the tool. It then moves the print bed a fixed amount to make sure the print head has enough clearance, after which it will move out.\\
    \item[tpost.g:] This file is called after tpre.g. It preheats, the print head, sets the correct offset, and moves out a bit further.\\
\end{description}


\subsection{Prusa Slicer}
\label{PrusaSlicer}

Slicing files for the Hydra MK1 can be done in any slicer that can accommodate for multiple printheads. For this system PrusaSlicer was used. In the slicer different extruders can be chosen for parts of the structure and for each

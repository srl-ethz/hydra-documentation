################################
Components
################################

The Hydra MK1 is built on the basis of several open source projects / products that are noted below:

Framework
============

The framework of the printer is built up on the **Rat Rig V-Core 3** by Rat Rig Lda., seen in figure NUMBER (From this point on referred to as Rat Rig). This is a `core XY <https://corexy.com/theory.html>`_system with three independent Z-axis motors. This makes it perfect for tool swapping, since the print head is able to move with two degrees of freedom, while not moving in z direction. Additionally, the independent Z-motors make leveling the print platform completely automatic. For the Hydra MK1 the 400mm x 400mm x 400mm build volume was chosen. While this could be substituted for the 500mm version, the 300mm version offers to little space in the back to park the tools.

.. figure:: img/RatRig.png
    :align: right
    :figwidth: 200px

    The default Rat Rig V-core 3 System (Source: www.ratrig.com)


Mounted on the tool head of the Rat Rig is the **E3D tool changer** system. It uses a three groove kinematic coupling, where three steel balls are located in V-slots or between two rods, to create a repeatable mechanical coupling. This mechanism is held in place by a rotating shaft, that can interlock with the receiving tool plates. The two sides of the system can be seen in figure NUMBER.
.. figure:: img/ToolChangerBoth.png
    :align: right
    :figwidth: 200px

    The E3D toolchanger (left) and the receiving plate (right). (Source: e3d-online.com)

The system runs on the **Duet 3 Mainboard 6HC** that is connected to a Raspberry Pi 3B running DuetPi. This makes the controls of the printer easily accessible through a web interface. To control additional printheads a Duet 3 Expansion 3HC and a Duet 3 Toolboard are used. The details of the configuration are explained int section NUMBER.

Printheads
=============

The standard configuration of the Hydra MK1 features two **E3D Hemeras** and two **Mahor XYZ V4 Pellet Extruders** (See figure NUMBER). The extruders can be collected via the tool changing system by E3D. While the E3D Hemera offers reliable 3D printing of various filaments, the Pellet Extruders make it possible to quickly prototype new materials and print materials that are not viable for filament production such as materials with shore hardness below 60A.

.. figure:: img/Extruders.png
    :align: right
    :figwidth: 200px
    
    The hemera extruder (left) and the V4 pellet extruder (right). (Source: e3d-online.com \& mahor.xyz)

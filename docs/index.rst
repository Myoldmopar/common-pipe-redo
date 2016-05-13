.. Common Pipe Redo documentation master file, created by
   sphinx-quickstart on Fri May 13 13:17:31 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to Common Pipe Redo's documentation!
============================================

Contents:

.. toctree::
   :maxdepth: 2

The base configuration is currently:

::

    default_configuration = {
        primary_pump_type: PumpTypes::ConstantSpeed,
        primary_pump_vol_flow: 0.0018,
        primary_pump_location: PumpPlacement::LoopPump,
        primary_pump_2_type: PumpTypes::ConstantSpeed,
        primary_pump_2_vol_flow: 0.0009,
        common_pipe_type:  CommonPipeTypes::NoCommonPipe,
        boiler_1_capacity: 3000,
        boiler_2_capacity: 3000,
        has_secondary_pump: false,
        secondary_pump_type: PumpTypes::ConstantSpeed,
        secondary_pump_vol_flow: 0.002,
        secondary_pump_location: PumpPlacement::LoopPump,
        secondary_pump_2_type: PumpTypes::ConstantSpeed,
        secondary_pump_2_vol_flow: 0.001,
        load_distribution: LoadDistribution::Uniform,
        loop_setpoint_temp: 82,
        load_profile_vol_flow: 0.001,
        load_profile_load: 2500,
        load_profile_2_vol_flow: 0.001,
        load_profile_2_load: 2500,
        #output_file_name: '/tmp/testplantloop.osm'
    }

The current list of configurations, with their accompanying overrides are:

+--------+-------------------------------+---------------------------------+-------------------+
| Case # | Primary Pumping Configuration | Secondary Pumping Configuration | Load Distribution |
+========+===============================+=================================+===================+
| 1      | Constant Loop Pump            | No Secondary Pumping            | Uniform           |
+--------+-------------------------------+---------------------------------+-------------------+
| 2      | Constant Loop Pump            | No Secondary Pumping            | Sequential        |
+--------+-------------------------------+---------------------------------+-------------------+



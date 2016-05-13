**********************
Generating Test Models
**********************

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

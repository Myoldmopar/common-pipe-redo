**********************
Generating Test Models
**********************

To create a plant loop model, a single hash is passed into the ``make_a_plant_loop_function``.  For convenience, a default hash was created that defines all the possible keys with default values, of which several aren't used in the default case.  

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

Each option is described here:

primary_pump_type
-----------------

This defines the pump(s) that will be placed on the primary (supply) side of the plant loop.  There are two possible values in the enum module:

* ``PumpTypes::ConstantSpeed``
* ``PumpTypes::VariableSpeed``

primary_pump_vol_flow
---------------------

This defines the rated volume flow rate for the pump.  The default value is 0.0018, which is near the total rated flow rate for the two boilers on the supply side.

primary_pump_location
---------------------

This defines the pump location on the primary side of the loop.  There are two possible values in the enum module:

* ``PumpPlacement::LoopPump``
* ``PumpPlacement::BranchPump``

If the placement is branch pump, the following two parameters for ``primary_pump_2_*`` are used, otherwise they are ignored.

primary_pump_2_type
-------------------

This defines the type of branch pump dedicated to the second boiler.  Only used if ``primary_pump_location == PumpPlacement::BranchPump``.

primary_pump_2_vol_flow
-----------------------

This defines the rated volume flow rate for the branch pump dedicated to the second boiler.  The default value is 0.0009, which is near the rated flow rate for an individual boiler.  Only used if ``primary_pump_location == PumpPlacement::BranchPump``.

common_pipe_type
----------------

This defines the type of common pipe simulation to be configured.  There are three possible values in the enum module:

* ``CommonPipeTypes::NoCommonPipe``
* ``CommonPipeTypes::CommonPipe``
* ``CommonPipeTypes::Controlled``

If there is no common pipe, the later parameter (``has_secondary_pump``) should be set to false, and secondary pump information will not be used.  If the common pipe is set to controlled (two-way), then a second setpoint will be applied to the model, at the supply inlet node.  TODO: Add controlled common pipe capability.

boiler_1_capacity, boiler_2_capacity
------------------------------------

The rated heating supply capacity of boilers 1 and 2.  The boilers are placed in parallel on the supply side regardless of pumping/common pipe configuration.  

has_secondary_pump
------------------

TODO: Deprecate this and just use the common_pipe_type key.

secondary_pump_type
-------------------

For cases with secondary pumping (common pipe cases), this defines the type of pump for the first pump on the secondary side.  For a loop pump on the secondary side, this is the only pump, but for branch pump secondary loops, this defines the first pump.  This uses the same enum module as ``primary_pump_type``.

secondary_pump_vol_flow
-----------------------

For cases with secondary pumping (common pipe cases), this defines the rated volume flow rate for the first pump on the secondary side.  The default value is 0.002, which is near the total rated flow rate demand for the two plant load profiles.  For secondary branch pumping configurations, you may adjust this value down to match the single load profile it is feeding, or not.

secondary_pump_location
-----------------------

For cases with secondary pumping (common pipe cases), this defines the pump location on the secondary side of the loop.  This uses the same enum module as ``primary_pump_location``

If the placement is branch pump, the following two parameters for ``secondary_pump_2_*`` are used, otherwise they are ignored.

secondary_pump_2_type
---------------------

This defines the type of branch pump dedicated to the second load profile.  Only used if ``secondary_pump_location == PumpPlacement::BranchPump``.

secondary_pump_2_vol_flow
-------------------------

This defines the rated volume flow rate for the branch pump dedicated to the second load profile.  The default value is 0.001, which is near the rated flow rate for an individual load profile.  Only used if ``secondary_pump_location == PumpPlacement::BranchPump``.

load_distribution
-----------------

This defines the load distribution logic to be employed when dispatching load to the supply equipment (boilers).  There are two possible options in the enum module:

* ``LoadDistribution::Uniform``  This will attempt to dispatch load to each boiler uniformly to meet the demand.
* ``LoadDistribution::Sequential``  This will attempt to dispatch load to each boiler sequentially until it has reached full capacity.

loop_setpoint_temp
------------------

This defines the supply side outlet setpoint temperature.  Currently the model is set up only for heating operation, so the setpoint is defaulted to 82 degrees Celsius.

load_profile_vol_flow, load_profile_2_vol_flow
----------------------------------------------

These define the rated (peak) volume flow rates for each load profile on the demand side of the loop.

load_profile_load, load_profile_2_load
--------------------------------------

These define the heating demand that each load profile applies on the demand side of the loop.  Assign these as desired to match (or not match) the supply equipment capacity.

output_file_name
----------------

This parameter does not have a default value, but must be included in each call to make a plant model.  This defines the path and filename to where the OpenStudio model file should be saved.









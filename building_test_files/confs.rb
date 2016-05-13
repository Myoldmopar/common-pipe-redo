require 'fileutils'
require_relative 'enums.rb'
require_relative 'build_single_model.rb'

# for kicks, let's delete the ../input_files directory, we might not keep that in here later
FileUtils.rm_rf(Dir.glob('../input_files'))

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
#	output_file_name: '/tmp/testplantloop.osm'
}

const_pri_loop_no_sec_uniform = default_configuration.merge(
	output_file_name: '../input_files/01-const_pri_loop_no_sec_uniform.osm'
)
make_a_plant_model(const_pri_loop_no_sec_uniform)

const_pri_loop_no_sec_sequent = default_configuration.merge(
	load_distribution: LoadDistribution::Sequential,
	output_file_name: '../input_files/02-const_pri_loop_no_sec_sequent.osm'
)
make_a_plant_model(const_pri_loop_no_sec_sequent)

varia_pri_loop_no_sec_uniform = default_configuration.merge(
	primary_pump_type: PumpTypes::VariableSpeed,
	output_file_name: '../input_files/03-varia_pri_loop_no_sec_uniform.osm'
)
make_a_plant_model(varia_pri_loop_no_sec_uniform)

varia_pri_loop_no_sec_sequent = default_configuration.merge(
	primary_pump_type: PumpTypes::VariableSpeed,
	load_distribution: LoadDistribution::Sequential,
	output_file_name: '../input_files/04-varia_pri_loop_no_sec_sequent.osm'
)
make_a_plant_model(varia_pri_loop_no_sec_sequent)

const_pri_bran_no_sec_uniform = default_configuration.merge(
	primary_pump_location: PumpPlacement::BranchPump,
	primary_pump_vol_flow: 0.0009,
	primary_pump_2_vol_flow: 0.0009,
	output_file_name: '../input_files/05-const_pri_bran_no_sec_uniform.osm'
)
make_a_plant_model(const_pri_bran_no_sec_uniform)

const_pri_bran_no_sec_sequent = default_configuration.merge(
	primary_pump_location: PumpPlacement::BranchPump,
	load_distribution: LoadDistribution::Sequential,
	primary_pump_vol_flow: 0.0009,
	primary_pump_2_vol_flow: 0.0009,
	output_file_name: '../input_files/06-const_pri_bran_no_sec_sequent.osm'
)
make_a_plant_model(const_pri_bran_no_sec_sequent)

varia_pri_bran_no_sec_uniform = default_configuration.merge(
	primary_pump_location: PumpPlacement::BranchPump,
	primary_pump_type: PumpTypes::VariableSpeed,
	primary_pump_2_type: PumpTypes::VariableSpeed,
	primary_pump_vol_flow: 0.0009,
	primary_pump_2_vol_flow: 0.0009,
	output_file_name: '../input_files/07-varia_pri_bran_no_sec_uniform.osm'
)
make_a_plant_model(varia_pri_bran_no_sec_uniform)

varia_pri_bran_no_sec_sequent = default_configuration.merge(
	primary_pump_location: PumpPlacement::BranchPump,
	primary_pump_type: PumpTypes::VariableSpeed,
	primary_pump_2_type: PumpTypes::VariableSpeed,
	load_distribution: LoadDistribution::Sequential,
	primary_pump_vol_flow: 0.0009,
	primary_pump_2_vol_flow: 0.0009,
	output_file_name: '../input_files/08-varia_pri_bran_no_sec_sequent.osm'
)
make_a_plant_model(varia_pri_bran_no_sec_sequent)

mixed_pri_bran_no_sec_uniform = default_configuration.merge(
	primary_pump_location: PumpPlacement::BranchPump,
	primary_pump_2_type: PumpTypes::VariableSpeed,
	primary_pump_vol_flow: 0.0009,
	primary_pump_2_vol_flow: 0.0009,
	output_file_name: '../input_files/09-mixed_pri_bran_no_sec_uniform.osm'
)
make_a_plant_model(mixed_pri_bran_no_sec_uniform)

mixed_pri_bran_no_sec_sequent = default_configuration.merge(
	primary_pump_location: PumpPlacement::BranchPump,
	primary_pump_2_type: PumpTypes::VariableSpeed,
	load_distribution: LoadDistribution::Sequential,
	primary_pump_vol_flow: 0.0009,
	primary_pump_2_vol_flow: 0.0009,
	output_file_name: '../input_files/10-mixed_pri_bran_no_sec_sequent.osm'
)
make_a_plant_model(mixed_pri_bran_no_sec_sequent)

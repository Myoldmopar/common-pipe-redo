require_relative 'enums.rb'
require_relative 'build_single_model.rb'

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

#base_heating_plant_no_pumps = {
#	boiler_1_capacity: 3000,
#	boiler_2_capacity: 3000,
#	loop_setpoint_temp: 82,
#	load_profile_vol_flow: 0.001,
#	load_profile_load: 2500,
#	load_profile_2_vol_flow: 0.001,
#	load_profile_2_load: 2500
#}
#
#loop_pump_base_conf = base_heating_plant_no_pumps.merge(
#	#primary_pump_type: PumpTypes::ConstantSpeed,
#	primary_pump_vol_flow: 0.0018,
#	primary_pump_location: PumpPlacement::LoopPump,
#	#common_pipe_type:  CommonPipeTypes::CommonPipe,
#	has_secondary_pump: false,
#	#secondary_pump_type: PumpTypes::VariableSpeed,
#	#secondary_pump_vol_flow: 0.001,
#	#secondary_pump_location: PumpPlacement::BranchPump,
#	#secondary_pump_2_type: PumpTypes::VariableSpeed,
#	#secondary_pump_2_vol_flow: 0.001,
#	#load_distribution: LoadDistribution::Uniform,
#	#output_file_name: '/tmp/testplantloop.osm'
#}
#
#branch_pump_base_conf = base_heating_plant_no_pumps.merge(
#	primary_pump_location: PumpPlacement::BranchPump,
#	primary_pump_vol_flow_rate: 0.0009,
#	primary_pump_2_vol_flow_rate: 0.0009,
#	has_secondary_pump: false
#)
#
#common_pipe_loop_pump_supply_loop_pump_demand_base_conf = loop_pump_base_conf.merge(
#	has_secondary_pump: true,
#	secondary_pump_location: PumpPlacement::LoopPump,
#	secondary_pump_vol_flow: 0.001
#)
#
#common_pipe_branch_pump_supply_branch_pump_demand_base_conf = branch_pump_base_conf.merge(
#	has_secondary_pump: true,
#	secondary_pump_location: PumpPlacement::BranchPump,
#	secondary_pump_2_vol_flow: 0.001
#)	
#
#const_pri_loop_pump_no_sec_pump_uniform = loop_pump_base_conf.merge(primary_pump_type: PumpTypes::ConstantSpeed, output_file_name: '/tmp/const_pri_loop_pump_no_sec_pump_uniform.osm', load_distribution: LoadDistribution::Uniform)
#varia_pri_loop_pump_no_sec_pump_uniform = loop_pump_base_conf.merge(primary_pump_type: PumpTypes::VariableSpeed, output_file_name: '/tmp/varia_pri_loop_pump_no_sec_pump_uniform.osm', load_distribution: LoadDistribution::Uniform)
#const_pri_loop_pump_no_sec_pump_sequent = loop_pump_base_conf.merge(primary_pump_type: PumpTypes::ConstantSpeed, output_file_name: '/tmp/const_pri_loop_pump_no_sec_pump_sequent.osm', load_distribution: LoadDistribution::Sequential)
#varia_pri_loop_pump_no_sec_pump_sequent = loop_pump_base_conf.merge(primary_pump_type: PumpTypes::VariableSpeed, output_file_name: '/tmp/const_pri_loop_pump_no_sec_pump_sequent.osm', load_distribution: LoadDistribution::Sequential)
#const_pri_bran_pump_no_sec_pump_uniform = branch_pump_base_conf.merge(primary_pump_type: PumpTypes::ConstantSpeed

const_pri_loop_no_sec_uniform = default_configuration.merge(
	output_file_name: '../input_files/const_pri_loop_no_sec_uniform'
)
make_a_plant_model(const_pri_loop_no_sec_uniform)

varia_pri_loop_no_sec_uniform = default_configuration.merge(
	primary_pump_type: PumpTypes::VariableSpeed,
	output_file_name: '../input_files/varia_pri_loop_no_sec_uniform'
)
make_a_plant_model(varia_pri_loop_no_sec_uniform)



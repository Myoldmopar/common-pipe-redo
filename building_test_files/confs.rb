require_relative 'enums.rb'
require_relative 'build_single_model.rb'

originalFullConf= {
	primary_pump_type: PumpTypes::ConstantSpeed,
	primary_pump_vol_flow: 0.0009,
	primary_pump_location: PumpPlacement::BranchPump,
	primary_pump_2_type: PumpTypes::ConstantSpeed,
	primary_pump_2_vol_flow: 0.0009,
	common_pipe_type:  CommonPipeTypes::CommonPipe,
	boiler_1_capacity: 3000,
	boiler_2_capacity: 3000,
	has_secondary_pump: true,
	secondary_pump_type: PumpTypes::VariableSpeed,
	secondary_pump_vol_flow: 0.001,
	secondary_pump_location: PumpPlacement::BranchPump,
	secondary_pump_2_type: PumpTypes::VariableSpeed,
	secondary_pump_2_vol_flow: 0.001,
	load_distribution: LoadDistribution::Uniform,
	loop_setpoint_temp: 82,
	load_profile_vol_flow: 0.001,
	load_profile_load: 2500,
	load_profile_2_vol_flow: 0.001,
	load_profile_2_load: 2500,
	output_file_name: '/tmp/testplantloop.osm'
}


loopPumpBaseConf= {
	#primary_pump_type: PumpTypes::ConstantSpeed,
	primary_pump_vol_flow: 0.0018,
	primary_pump_location: PumpPlacement::LoopPump,
	#primary_pump_2_type: PumpTypes::ConstantSpeed,
	#primary_pump_2_vol_flow: 0.0009,
	#common_pipe_type:  CommonPipeTypes::CommonPipe,
	boiler_1_capacity: 3000,
	boiler_2_capacity: 3000,
	has_secondary_pump: false,
	#secondary_pump_type: PumpTypes::VariableSpeed,
	#secondary_pump_vol_flow: 0.001,
	#secondary_pump_location: PumpPlacement::BranchPump,
	#secondary_pump_2_type: PumpTypes::VariableSpeed,
	#secondary_pump_2_vol_flow: 0.001,
	load_distribution: LoadDistribution::Uniform,
	loop_setpoint_temp: 82,
	load_profile_vol_flow: 0.001,
	load_profile_load: 2500,
	load_profile_2_vol_flow: 0.001,
	load_profile_2_load: 2500,
	#output_file_name: '/tmp/testplantloop.osm'
}

const_pri_loop_pump_no_sec_pump = loopPumpBaseConf.merge(primary_pump_type: PumpTypes::ConstantSpeed, output_file_name: '/tmp/const_pri_loop_pump_no_sec_pump.osm')

make_a_plant_model(conf)

require '/Applications/OpenStudio 1.11.0/Ruby/openstudio'

# set up the output file
output_file = '/tmp/testplantloop.osm'

# the overall model
m = OpenStudio::Model::Model.new

# build up plant loop itself
pl = OpenStudio::Model::PlantLoop.new(m)
sp_sched = OpenStudio::Model::ScheduleConstant.new(m)
sp_sched.setValue(82)
spm = OpenStudio::Model::SetpointManagerScheduled.new(m, "Temperature", sp_sched)
spm.addToNode(pl.supplyOutletNode())
#pl.setCommonPipeSimulation("CommonPipe")

# build up components
pump = OpenStudio::Model::PumpConstantSpeed.new(m)
pump.setRatedFlowRate(0.0018)

# build up supply equipment
boil1 = OpenStudio::Model::BoilerHotWater.new(m)
boil1.setNominalCapacity(3000)
boil2 = OpenStudio::Model::BoilerHotWater.new(m)
boil2.setNominalCapacity(3000)

# set up the load profile
load_sched = OpenStudio::Model::ScheduleConstant.new(m)
load_sched.setValue(5000)
flow_sched = OpenStudio::Model::ScheduleConstant.new(m)
flow_sched.setValue(1)
profile = OpenStudio::Model::LoadProfilePlant.new(m)
profile.setPeakFlowRate(0.002)
profile.setLoadSchedule(load_sched)
profile.setFlowRateFractionSchedule(flow_sched)

# build up demand side
pl.addDemandBranchForComponent(profile)

# build up supply side
pump.addToNode(pl.supplyInletNode())
pl.addSupplyBranchForComponent(boil1)
pl.addSupplyBranchForComponent(boil2)

# now we have a few things to fine tune to make the idf runnable
ddy_path = OpenStudio::Path.new("/Users/elee/EnergyPlus/repos/1eplus/weather/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.ddy")
ddy_idf = OpenStudio::IdfFile::load(ddy_path, "EnergyPlus".to_IddFileType).get
ddy_workspace = OpenStudio::Workspace.new(ddy_idf)
reverse_translator = OpenStudio::EnergyPlus::ReverseTranslator.new()
ddy_model = reverse_translator.translateWorkspace(ddy_workspace)
ddy_objects = ddy_model.getDesignDays().select { |d| d.name.get.include?('.4%') || d.name.get.include?('99.6%') }
m.addObjects(ddy_objects)
OpenStudio::Model::getSimulationControl(m).setRunSimulationforWeatherFileRunPeriods(false)

# and add some interesting output variables too
var_names = ["Pump Mass Flow Rate", "Pump Electric Power", "Plant Load Profile Mass Flow Rate", "Plant Load Profile Heat Transfer Rate", "Boiler Heating Rate", "Boiler Mass Flow Rate", "Plant Supply Side Outlet Temperature"]
var_names.each do |var|
  var_object = OpenStudio::Model::OutputVariable.new(var, m)
  var_object.setReportingFrequency("Timestep")
end

# save output file
m.save(output_file, true)

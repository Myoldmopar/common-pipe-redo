module PumpTypes
	ConstantSpeed = 0
	VariableSpeed = 1
end

module CommonPipeTypes
	NoCommonPipe = 0
	CommonPipe   = 1
	Controlled   = 2
end

module LoadDistribution
	Uniform    = 0
	Sequential = 1
end

module PumpPlacement
	LoopPump   = 0
	BranchPump = 1
end

module ScheduleType
	Constant      = 0
	OnDuringDay   = 1
	OnDuringNight = 2
end

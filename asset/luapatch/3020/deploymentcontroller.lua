local util = require 'xlua.util'
xlua.private_accessible(CS.DeploymentController)

local InitStartTurnAllLayerPlays = function(self,onlyCheckMove)
	if onlyCheckMove then
		if CS.GameData.missionAction.queuePerformanceHandler.Count == 0 then
			self.isPlayingPerformance = false;
		end
	end
	self:InitStartTurnAllLayerPlays(onlyCheckMove);
end

local CheckBattle = function()
	CS.DeploymentController.Instance:CheckBattle();
end
local AddCheckBattle = function()
	CS.DeploymentController.Instance:AddAndPlayPerformance(CheckBattle);
end
local BuildCastSkillOnDeathHandler = function(self,data)
	self:BuildCastSkillOnDeathHandler(data);
	self:InsertSomePlayPerformances(AddCheckBattle);
end
local RequestStartMissionHandle = function(self,json)
	self:RequestStartMissionHandle(json);
	CS.GameData.missionAction:LoadAvgData(json);
	--self:AddPlayMissionTriggerAvg();
end
util.hotfix_ex(CS.DeploymentController,'InitStartTurnAllLayerPlays',InitStartTurnAllLayerPlays)
util.hotfix_ex(CS.DeploymentController,'BuildCastSkillOnDeathHandler',BuildCastSkillOnDeathHandler)
--util.hotfix_ex(CS.DeploymentController,'AddAllCanPlayPerformanceLayer',AddAllCanPlayPerformanceLayer)
util.hotfix_ex(CS.DeploymentController,'RequestStartMissionHandle',RequestStartMissionHandle)


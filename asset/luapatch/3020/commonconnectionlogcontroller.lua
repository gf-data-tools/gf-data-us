local util = require 'xlua.util'
xlua.private_accessible(CS.CommonConnectionLogController)


local Start = function(self)
	self.canvas = self.transform:GetComponent(typeof(CS.UnityEngine.Canvas));
	self.canvas.renderMode = CS.UnityEngine.RenderMode.ScreenSpaceOverlay;
	self.canvas.worldCamera = CS.UnityEngine.Camera.main;
	self:Start();
end

local SetText = function(self,message)
	self.canvas = self.transform:GetComponent(typeof(CS.UnityEngine.Canvas));
	self.canvas.worldCamera = CS.UnityEngine.Camera.main;
	self:SetText(message);
end
util.hotfix_ex(CS.CommonConnectionLogController,'Start',Start)
util.hotfix_ex(CS.CommonConnectionLogController,'SetText',SetText)
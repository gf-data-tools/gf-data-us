local util = require 'xlua.util'
xlua.private_accessible(CS.OPSPanelController)

local ShowItemLimitUINew = function(self,itemids)
	self:ShowItemLimitUINew(itemids);
	if self.itemuiObjNew ~= nil and not self.itemuiObjNew:isNull() then
		local itemabout = self.item_use:GetDataById(itemids[0]);
		local num0 = itemabout.iteminfo.active_dailyLimit_num;
		local num1 = itemabout.ItemTodayCanGet;
		local bar = self.itemuiObjNew.transform:Find("Bar");
		if bar ~= nil then
			local image = bar:GetComponent(typeof(CS.ExImage));
			if num0 ~= 0 then
				image.fillAmount = num1*1.0/num0;
			else
				image.fillAmount = 0;
			end
		end
		local showTipObj =self.itemuiObjNew.transform:Find("TouchArea");
		if showTipObj ~= nil then
			local tip = showTipObj:GetComponent(typeof(CS.CommonShowTip));
			local language = CS.Data.GetLang(60826);
			local tipText = CS.System.String.Format(language, tostring(num1));
			tip.strIntroduction = tipText;
			tip.strTitle = itemabout.iteminfo.name;
		end
	end
end

local InitPanelSpot = function(self,spot)
	self.panelSpot = spot;
	self.mission = spot.mission;
	self.opsMission = spot.opsMission;
	self.missionInfo = spot.missionInfo;
	self.entranceId = spot.opsMission.entranceId;
	self:RefreshEntranceUI();
	self:RefresCommonUI();
	if self.opsMission ~= nil then
		self:ShowNewReward();
	else
		self:ShowOldReward();
	end
	self:CheckInfoPos();
end
util.hotfix_ex(CS.OPSPanelController,'ShowItemLimitUINew',ShowItemLimitUINew)
util.hotfix_ex(CS.SpecialMissionInfoController,'InitPanelSpot',InitPanelSpot)


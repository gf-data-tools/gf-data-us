local util = require 'xlua.util'
xlua.private_accessible(CS.DeploymentUIController)

local RefreshItemUI = function(self)
	if self.itemObj == nil or self.itemObj:isNull() then
		return;
	end
	local name = self.itemObj.name;
	local itemnum = 0;
	for i=0,self.config.showItemIds.Count-1 do
		local itemid = self.config.showItemIds[i];
		local num = CS.GameData.GetItem(itemid);
		itemnum = itemnum+num;
	end
	if name == "2023Se_Buff_Theater(Clone)" or name == "2023Se_Buff_Arms(Clone)" or name == "2023Se_Buff_PA(Clone)" or name == "2023Se_All(Clone)" then
		self.itemObj:SetActive(not CS.DeploymentController.isDeplyment);
		for i=0,self.itemObj.transform.childCount-1 do
			self.itemObj.transform:GetChild(i).gameObject:SetActive(false);
		end
		if itemnum >= 8 then
			self.itemObj.transform:GetChild(4).gameObject:SetActive(true);
		elseif itemnum>=6 then
			self.itemObj.transform:GetChild(3).gameObject:SetActive(true);
		elseif itemnum>=4 then
			self.itemObj.transform:GetChild(2).gameObject:SetActive(true);
		elseif itemnum>=2 then
			self.itemObj.transform:GetChild(1).gameObject:SetActive(true);
		else
			self.itemObj.transform:GetChild(0).gameObject:SetActive(true);
		end
	else
		self:RefreshItemUI();
	end
end

util.hotfix_ex(CS.DeploymentUIController,'RefreshItemUI',RefreshItemUI)



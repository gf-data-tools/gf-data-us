local util = require 'xlua.util'
xlua.private_accessible(CS.HomeController)
xlua.private_accessible(CS.ServerInfo)
xlua.private_accessible(CS.GameData)
local mySevenLoginCheck = function(self)
	CS.GameData.ClearPurchaseGoods();
	CS.ServerInfo.Instance:RequestProductList(
		function ()
			CS.ConnectionController.CloseConsole(); 
		end
	);
    self:SevenLoginCheck()
end

util.hotfix_ex(CS.HomeController,'SevenLoginCheck',mySevenLoginCheck)
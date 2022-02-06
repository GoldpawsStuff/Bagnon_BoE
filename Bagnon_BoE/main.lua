if (not Bagnon) then
	return
end
if (function(addon)
	for i = 1,GetNumAddOns() do
		local name, title, notes, loadable, reason, security, newVersion = GetAddOnInfo(i)
		if (name:lower() == addon:lower()) then
			local enabled = not(GetAddOnEnableState(UnitName("player"), i) == 0) 
			if (enabled and loadable) then
				return true
			end
		end
	end
end)("Bagnon_ItemInfo") then 
	print("|cffff1111"..(...).." was auto-disabled.")
	return 
end 

local MODULE =  ...
local ADDON, Addon = MODULE:match("[^_]+"), _G[MODULE:match("[^_]+")]
local Module = Bagnon:NewModule("BindOnEquip", Addon)

-- Tooltip used for scanning
local ScannerTipName = "BagnonItemInfoScannerTooltip"
local ScannerTip = _G[ScannerTipName] or CreateFrame("GameTooltip", ScannerTipName, WorldFrame, "GameTooltipTemplate")

-- Lua API
local _G = _G
local string_find = string.find
local string_gsub = string.gsub
local string_lower = string.lower
local string_match = string.match
local string_split = string.split
local string_upper = string.upper

-- WoW API
local GetContainerItemInfo = _G.GetContainerItemInfo
local GetItemQualityColor = _G.GetItemQualityColor
local GetItemInfo = _G.GetItemInfo

-- WoW Strings
local S_ITEM_BOUND1 = _G.ITEM_SOULBOUND
local S_ITEM_BOUND2 = _G.ITEM_ACCOUNTBOUND
local S_ITEM_BOUND3 = _G.ITEM_BNETACCOUNTBOUND

-- Localization. 
-- *Just enUS so far. 
local L = {
	["BoE"] = "BoE", -- Bind on Equip 
	["BoU"] = "BoU"  -- Bind on Use
}

-- FontString Caches
local Cache_ItemBind = {}


-----------------------------------------------------------
-- Slash Command & Options Handling
-----------------------------------------------------------
do
	-- Saved settings
	BagnonBoE_DB = {
		enableRarityColoring = true
	}

	local slashCommand = function(msg, editBox)
		local action, element

		-- Remove spaces at the start and end
		msg = string_gsub(msg, "^%s+", "")
		msg = string_gsub(msg, "%s+$", "")

		-- Replace all space characters with single spaces
		msg = string_gsub(msg, "%s+", " ") 

		-- Extract the arguments 
		if string_find(msg, "%s") then
			action, element = string_split(" ", msg) 
		else
			action = msg
		end

		if (action == "enable") then 
			if (element == "color") then 
				BagnonBoE_DB.enableRarityColoring = true
			end

		elseif (action == "disable") then 
			if (element == "color") then 
				BagnonBoE_DB.enableRarityColoring = false
			end
		end
	end

	-- Create a unique name for the command
	local commands = { "bagnonboe", "bboe", "boe" }
	for i = 1,#commands do 
		-- Register the chat command, keep hash upper case, value lowercase
		local command = commands[i]
		local name = "AZERITE_TEAM_PLUGIN_"..string_upper(command) 
		_G["SLASH_"..name.."1"] = "/"..string_lower(command)
		_G.SlashCmdList[name] = slashCommand
	end
end


-----------------------------------------------------------
-- Utility Functions
-----------------------------------------------------------
local GetPluginContainter = function(button)
	local name = button:GetName() .. "ExtraInfoFrame"
	local frame = _G[name]
	if (not frame) then 
		frame = CreateFrame("Frame", name, button)
		frame:SetAllPoints()
	end 
	return frame
end

local Cache_GetItemBind = function(button)
	if (not Cache_ItemBind[button]) then
		local ItemBind = GetPluginContainter(button):CreateFontString()
		ItemBind:SetDrawLayer("ARTWORK")
		ItemBind:SetPoint("BOTTOMLEFT", 2, 2)
		ItemBind:SetFontObject(_G.NumberFont_Outline_Med or _G.NumberFontNormal) 
		ItemBind:SetFont(ItemBind:GetFont(), 12, "OUTLINE")
		ItemBind:SetShadowOffset(1, -1)
		ItemBind:SetShadowColor(0, 0, 0, .5)
		local UpgradeIcon = button.UpgradeIcon
		if UpgradeIcon then
			UpgradeIcon:ClearAllPoints()
			UpgradeIcon:SetPoint("BOTTOMRIGHT", 2, 0)
		end
		Cache_ItemBind[button] = ItemBind
	end
	return Cache_ItemBind[button]
end

-----------------------------------------------------------
-- Main Update
-----------------------------------------------------------
local Update = function(self)
	local showStatus
	local itemLink = self:GetItem() 
	if (itemLink) then
		local itemName, _itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, iconFileDataID, itemSellPrice, itemClassID, itemSubClassID, bindType, expacID, itemSetID, isCraftingReagent = GetItemInfo(itemLink)
		if (itemRarity and (itemRarity > 1)) and ((bindType == 2) or (bindType == 3)) then
			local bag,slot = self:GetBag(), self:GetID()
			local _, _, _, _, _, _, _, _, _, _, isBound = GetContainerItemInfo(bag, slot)
			if (isBound) then
				showStatus = nil
			end
			--ScannerTip.owner = self
			--ScannerTip.bag = bag
			--ScannerTip.slot = slot
			--ScannerTip:SetOwner(self, "ANCHOR_NONE")
			--ScannerTip:SetBagItem(bag,slot)
			--showStatus = true
			--for i = 2,6 do 
			--	local line = _G[ScannerTipName.."TextLeft"..i]
			--	if (not line) then
			--		break
			--	end
			--	local msg = line:GetText()
			--	if (msg) then 
			--		if (string_find(msg, S_ITEM_BOUND1) or string_find(msg, S_ITEM_BOUND2) or string_find(msg, S_ITEM_BOUND3)) then 
			--			showStatus = nil
			--		end
			--	end
			--end
		end
		if (showStatus) then
			local ItemBind = Cache_ItemBind[self] or Cache_GetItemBind(self)
			local r, g, b = GetItemQualityColor(itemRarity)
			if (BagnonBoE_DB.enableRarityColoring) then
				ItemBind:SetTextColor(r * 2/3, g * 2/3, b * 2/3)
			else
				ItemLevel:SetTextColor(240/255, 240/255, 240/255)
			end
			ItemBind:SetText((bindType == 3) and L["BoU"] or L["BoE"])
		else
			if Cache_ItemBind[self] then 
				Cache_ItemBind[self]:SetText("")
			end	
		end
	end	
	if (not showStatus) and (Cache_ItemBind[self]) then 
		Cache_ItemBind[self]:SetText("")
	end	
end 

local item = Bagnon.ItemSlot or Bagnon.Item
if (item) and (item.Update) then
	hooksecurefunc(item, "Update", Update)
end
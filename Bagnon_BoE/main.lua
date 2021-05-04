if (not Bagnon) then
	return
end
if (function(addon)
	for i = 1,GetNumAddOns() do
		if (string.lower((GetAddOnInfo(i))) == string.lower(addon)) then
			if (GetAddOnEnableState(UnitName("player"), i) ~= 0) then
				return true
			end
		end
	end
end)("Bagnon_ItemInfo") then 
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
local string_match = string.match

-- WoW API
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

local Update = function(self)
	local showStatus
	local itemLink = self:GetItem() 
	if (itemLink) then
		local itemName, _itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, iconFileDataID, itemSellPrice, itemClassID, itemSubClassID, bindType, expacID, itemSetID, isCraftingReagent = GetItemInfo(itemLink)
		local itemID = tonumber(string_match(itemLink, "item:(%d+)"))
		if (itemRarity and (itemRarity > 1)) and ((bindType == 2) or (bindType == 3)) then
			local bag,slot = self:GetBag(), self:GetID()
			ScannerTip.owner = self
			ScannerTip.bag = bag
			ScannerTip.slot = slot
			ScannerTip:SetOwner(self, "ANCHOR_NONE")
			ScannerTip:SetBagItem(bag,slot)
			showStatus = true
			for i = 2,6 do 
				local line = _G[ScannerTipName.."TextLeft"..i]
				if (not line) then
					break
				end
				local msg = line:GetText()
				if (msg) then 
					if (string_find(msg, S_ITEM_BOUND1) or string_find(msg, S_ITEM_BOUND2) or string_find(msg, S_ITEM_BOUND3)) then 
						showStatus = nil
					end
				end
			end
		end
		if (showStatus) then
			local ItemBind = Cache_ItemBind[self] or Cache_GetItemBind(self)
			local r, g, b = GetItemQualityColor(itemRarity)
			ItemBind:SetTextColor(r * 2/3, g * 2/3, b * 2/3)
			ItemBind:SetText((bindType == 3) and L["BoU"] or L["BoE"])
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
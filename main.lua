
-- Using the Bagnon way to retrieve names, namespaces and stuff
local MODULE =  ...
local ADDON, Addon = MODULE:match("[^_]+"), _G[MODULE:match("[^_]+")]
local BoE = Bagnon:NewModule("BindOnEquip", Addon)

-- Lua API
local _G = _G
local string_match = string.match

-- WoW API
local GetItemQualityColor = _G.GetItemQualityColor
local GetItemInfo = _G.GetItemInfo

local cache = {} -- cache of fontstrings

-- Localization (currently just enUS)
local gameLocale = GetLocale()
local L = {
	["BoE"] = "BoE", -- Bind on Equip 
	["BoU"] = "BoU"  -- Bind on Use
}

BoE.OnEnable = function(self)
	hooksecurefunc (Bagnon.ItemSlot, "Update", function(self) 

		local itemLink = self:GetItem() -- GetContainerItemLink(self:GetBag(), self:GetID())
		if itemLink then

			local itemName, _, itemRarity, iLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, iconFileDataID, itemSellPrice, itemClassID, itemSubClassID, bindType, expacID, itemSetID, isCraftingReagent = GetItemInfo(itemLink)
			
			local itemID = tonumber(string_match(itemLink, "item:(%d+)"))

			-- Display the bind status of BoE(Bind on Equip) and BoU(Bind on Use) items.
			if (itemRarity and (itemRarity > 1)) and ((bindType == 2) or (bindType == 3)) then
				if (not cache[self]) then

					-- Adding an extra layer to get it above glow and border textures
					local holder = _G[self:GetName().."ExtraInfoFrame"] or CreateFrame("Frame", self:GetName().."ExtraInfoFrame", self)
					holder:SetAllPoints()

					-- Using standard blizzard fonts here
					local msg = holder:CreateFontString()
					msg:SetDrawLayer("ARTWORK")
					msg:SetPoint("BOTTOMLEFT", 2, 2)
					msg:SetFontObject(_G.NumberFont_Outline_Med or _G.NumberFontNormal) 
					msg:SetFont(msg:GetFont(), 11, "OUTLINE")
					msg:SetShadowOffset(1, -1)
					msg:SetShadowColor(0, 0, 0, .5)

					-- Move Pawn out of the way
					if self.UpgradeIcon then
						self.UpgradeIcon:ClearAllPoints()
						self.UpgradeIcon:SetPoint("BOTTOMRIGHT", 2, 0)
					end

					cache[self] = msg
				end
	
				local r, g, b = GetItemQualityColor(itemRarity)

				cache[self]:SetTextColor(r * 2/3, g * 2/3, b * 2/3)
				cache[self]:SetText((bindType == 3) and L["BoU"] or L["BoE"])
			else
				if cache[self] then
					cache[self]:SetText("")
				end
			end 

		end
	end)
end

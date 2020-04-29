-- ------------------------------------------------------------ --
-- Addon: GuildInTooltip                                        --
--                                                              --
-- Version: 1.0.0                                               --
-- WoW Game Version: 1.13.3                                     --
-- Author: Millán - C'Thun                                      --
--                                                              --
-- License: GNU GENERAL PUBLIC LICENSE, Version 3, 29 June 2007 --
-- ------------------------------------------------------------ --

local _G = _G
local _
local VERSION = "1.0.0"

if (not CLASSICADDGUILDTOOLTIP_HOOKED) then
	-- Hook to add guild in tooltip when mouseover a unit frame
	hooksecurefunc("UnitFrame_UpdateTooltip", function(self)
		if (self.unit ~= nil) and UnitIsPlayer(self.unit) then
			local guildName = GetGuildInfo(self.unit)
			if (guildName ~= nil and guildName ~= "") then
				if (GameTooltipTextLeft2 ~= nil and GameTooltipTextLeft2:GetText() ~= guildName) then
					local gtoollast = _G['GameTooltipTextLeft'..GameTooltip:NumLines()]
					if (gtoollast ~= nil) then
						local r, g, b = gtoollast:GetTextColor()
						GameTooltip:AddLine(gtoollast:GetText(), r, g, b, nil)
						for i = GameTooltip:NumLines()-1,3,-1 do
							local gtool = _G['GameTooltipTextLeft'..i]
							local gtoolpre = _G['GameTooltipTextLeft'..(i-1)]
							if (gtool ~= nil and gtoolpre ~= nil) then
								gtool:SetText(gtoolpre:GetText())
								gtool:SetTextColor(gtoolpre:GetTextColor())
							end
						end
						GameTooltipTextLeft2:SetText(guildName, 1, 1, 1, 1)
						GameTooltip:Show()
					end
				end
			end
		end
	end)

	-- Hook to add guild in tooltip when mouseover a real unit
	GameTooltip:HookScript("OnTooltipSetUnit", function(self)
		if (self:IsUnit("mouseover")) and UnitIsPlayer("mouseover") then
			local guildName = GetGuildInfo("mouseover")
			if (guildName ~= nil and guildName ~= "") then
				if (GameTooltipTextLeft2 ~= nil and GameTooltipTextLeft2:GetText() ~= guildName) then
					local gtoollast = _G['GameTooltipTextLeft'..GameTooltip:NumLines()]
					if (gtoollast ~= nil) then
						local r, g, b = gtoollast:GetTextColor()
						GameTooltip:AddLine(gtoollast:GetText(), r, g, b, nil)
						for i = GameTooltip:NumLines()-1,3,-1 do
							local gtool = _G['GameTooltipTextLeft'..i]
							local gtoolpre = _G['GameTooltipTextLeft'..(i-1)]
							if (gtool ~= nil and gtoolpre ~= nil) then
								gtool:SetText(gtoolpre:GetText())
								gtool:SetTextColor(gtoolpre:GetTextColor())
							end
						end
						GameTooltipTextLeft2:SetText(guildName, 1, 1, 1, 1)
						GameTooltip:Show()
					end
				end
			end
		end
	end)
	
	-- Hook to delete the tooltip changes when the tooltip hides
	GameTooltip:HookScript("OnHide", function(self)
		if (GameTooltipTextLeft2 ~= nil) then
			GameTooltipTextLeft2:SetText("")
		end
		if (GameTooltipTextLeft3 ~= nil) then
			GameTooltipTextLeft3:SetText("")
		end
		if (GameTooltipTextLeft4 ~= nil) then
			GameTooltipTextLeft4:SetText("")
		end
		if (GameTooltipTextLeft5 ~= nil) then
			GameTooltipTextLeft5:SetText("")
		end
		if (GameTooltipTextLeft6 ~= nil) then
			GameTooltipTextLeft6:SetText("")
		end
		if (GameTooltipTextLeft7 ~= nil) then
			GameTooltipTextLeft7:SetText("")
		end
		if (GameTooltipTextLeft8 ~= nil) then
			GameTooltipTextLeft8:SetText("")
		end
	end)
	
	CLASSICADDGUILDTOOLTIP_HOOKED = true
end

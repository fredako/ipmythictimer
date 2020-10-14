local AddonName, Addon = ...

local width = 500
local heigth = 600
-- Debug Frame
Addon.fDebug = CreateFrame("Frame", "IPMTDebug", UIParent, BackdropTemplateMixin and "BackdropTemplate")
Addon.fDebug:SetFrameStrata("HIGH")
Addon.fDebug:SetSize(width, heigth)
Addon.fDebug:SetPoint("CENTER", UIParent)
Addon.fDebug:SetBackdrop(Addon.backdrop)
Addon.fDebug:SetBackdropColor(0,0,0, 1)
Addon.fDebug:EnableMouse(false)
Addon.fDebug:SetMovable(false)
Addon.fDebug:RegisterForDrag("LeftButton", "RightButton")
Addon.fDebug:SetScript("OnDragStart", function(self, button)
    Addon:StartDragging(self, button)
end)
Addon.fDebug:SetScript("OnDragStop", function(self, button)
    Addon:StopDragging(self, button)
end)
Addon.fDebug:Hide()


Addon.fDebug.content = iPElemsCreateScrollBox(nil, Addon.fDebug, width - 20, heigth - 46)
Addon.fDebug.content:ClearAllPoints()
Addon.fDebug.content:SetPoint("TOPLEFT", Addon.fDebug, 10, -36)

-- Text area
Addon.fDebug.textarea = CreateFrame("EditBox", nil, Addon.fDebug.content)
Addon.fDebug.textarea:ClearAllPoints()
Addon.fDebug.textarea:SetMultiLine(true)
Addon.fDebug.textarea:SetAutoFocus(false)
Addon.fDebug.textarea:SetPoint("TOPLEFT", Addon.fDebug.content, "TOPLEFT", 8, -40)
Addon.fDebug.textarea:SetSize(width - 40, heigth - 4)
Addon.fDebug.textarea:SetFontObject("ChatFontNormal")
Addon.fDebug.textarea:SetScript("OnEscapePressed", function()
    Addon.fDebug:Hide()
end)
Addon.fDebug.content:SetScrollChild(Addon.fDebug.textarea)

-- X-Close button
Addon.fDebug.closeX = CreateFrame("Button", nil, Addon.fDebug, BackdropTemplateMixin and "BackdropTemplate")
Addon.fDebug.closeX:SetPoint("TOP", Addon.fDebug, "TOPRIGHT", -20, -5)
Addon.fDebug.closeX:SetSize(26, 26)
Addon.fDebug.closeX:SetBackdrop(Addon.backdrop)
Addon.fDebug.closeX:SetBackdropColor(0,0,0, 1)
Addon.fDebug.closeX:SetScript("OnClick", function(self)
    Addon.fDebug:Hide()
end)
Addon.fDebug.closeX:SetScript("OnEnter", function(self, event, ...)
    Addon.fDebug.closeX:SetBackdropColor(.1,.1,.1, 1)
end)
Addon.fDebug.closeX:SetScript("OnLeave", function(self, event, ...)
    Addon.fDebug.closeX:SetBackdropColor(0,0,0, 1)
end)
Addon.fDebug.closeX.icon = Addon.fDebug.closeX:CreateTexture()
Addon.fDebug.closeX.icon:SetSize(16, 16)
Addon.fDebug.closeX.icon:ClearAllPoints()
Addon.fDebug.closeX.icon:SetPoint("CENTER", Addon.fDebug.closeX, "CENTER", 0, 0)
Addon.fDebug.closeX.icon:SetTexture("Interface\\AddOns\\IPMythicTimer\\media\\x-close")
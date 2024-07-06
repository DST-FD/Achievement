local UIAnim = require "widgets/uianim"
local Text = require "widgets/text"
local Widget = require "widgets/widget"
local Image = require "widgets/image"
local ImageButton = require "widgets/imagebutton"
local AnimButton = require "widgets/animbutton"
local HoverText = require "widgets/hoverer"
if _G.HARD then 
	require "AllAchiv/allachivbalancehard"
else
	require "AllAchiv/allachivbalance"
end

-- Achievements Categories
local cat_food = 6
local cat_life = 8
local cat_work = 12
local cat_hire = 6
local cat_hurt = 8
local cat_hunt = 11
local cat_slay = 11
local cat_misc = 10
local cat_mile = 12

local cat_coinblue = 10
local cat_coinpurple = 20

local uiachievement = Class(Widget, function(self, owner)
	Widget._ctor(self, "uiachievement")
	self.owner = owner
	self.mainui = self:AddChild(Widget("mainui"))

	self.mainui.allachiv = self.mainui:AddChild(Widget("allachiv"))
	self.mainui.allachiv:SetPosition(0, 460, 0)
	self.mainui.allachiv:Hide()

	self.mainui.allcoin = self.mainui:AddChild(Widget("allcoin"))
	self.mainui.allcoin:SetPosition(0, 460, 0)
	self.mainui.allcoin:Hide()

	self.mainui.bigtitle = self.mainui:AddChild(Image("images/hud/bigtitle_en.xml", "bigtitle_en.tex"))
	self.mainui.bigtitle:SetPosition(0, 420, 0)
	self.mainui.bigtitle:SetTint(1,1,1,0.95)
	self.mainui.bigtitle:SetScale(.9,.9,1)
	self.mainui.bigtitle:MoveToFront()
	self.mainui.bigtitle:Hide()

	self.mainui.coinamount = self.mainui:AddChild(Text(NEWFONT_OUTLINE, 40, self.owner.currentcoinamount:value()))
	self.mainui.coinamount:SetPosition(85, 400, 0)
	self.mainui.coinamount:Hide()

	self.mainbutton = self:AddChild(Widget("mainbutton"))
	self.mainbutton:SetPosition(-850, 460, 0)
	self.mainbutton:SetScale(1,1,1)

	self.mainbutton.checkbuttonglow = self.mainbutton:AddChild(Image("images/button/checkbuttonglow.xml", "checkbuttonglow.tex"))
    self.mainbutton.checkbuttonglow:SetClickable(false)
    self.mainbutton.checkbuttonglow:Hide()

    self.mainbutton.checkbutton = self.mainbutton:AddChild(ImageButton("images/button/checkbutton.xml", "checkbutton.tex"))
    self.mainbutton.checkbutton:MoveToFront()
    self.mainbutton.checkbutton:SetHoverText(STRINGS.ALLACHIVCURRENCY[7])

	self.mainbutton.checkbutton:SetOnGainFocus(function() self.mainbutton.checkbuttonglow:Show() end)
	self.mainbutton.checkbutton:SetOnLoseFocus(function() self.mainbutton.checkbuttonglow:Hide() end)
	self.mainbutton.checkbutton:SetOnClick(function()
		if self.mainui.allachiv.shown then
			self.mainui.allachiv:Hide()
			self.mainui.bigtitle:Hide()
			self.mainui.coinamount:Hide()
			self.mainui.infobutton:Hide()
		else
			self.mainui.allachiv:Show()
			self.mainui.bigtitle:Show()
			self.mainui.coinamount:Show()
			self.mainui.infobutton:Show()
			self.mainui.allcoin:Hide()
		end
		self.maxnumpage = 9
		if self.numpage == 1 then
			self.mainui.infobutton.cat1:SetTextures("images/button/cat1_dact.xml", "cat1_dact.tex")
		else
			self.mainui.infobutton.cat1:SetTextures("images/button/cat1_act.xml", "cat1_act.tex")
		end
		if self.numpage == 2 then
			self.mainui.infobutton.cat2:SetTextures("images/button/cat2_dact.xml", "cat2_dact.tex")
		else
			self.mainui.infobutton.cat2:SetTextures("images/button/cat2_act.xml", "cat2_act.tex")
		end
		if self.numpage == 3 then
			self.mainui.infobutton.cat3:SetTextures("images/button/cat3_dact.xml", "cat3_dact.tex")
		else
			self.mainui.infobutton.cat3:SetTextures("images/button/cat3_act.xml", "cat3_act.tex")
		end
		if self.numpage == 4 then
			self.mainui.infobutton.cat4:SetTextures("images/button/cat4_dact.xml", "cat4_dact.tex")
		else
			self.mainui.infobutton.cat4:SetTextures("images/button/cat4_act.xml", "cat4_act.tex")
		end
		if self.numpage == 5 then
			self.mainui.infobutton.cat5:SetTextures("images/button/cat5_dact.xml", "cat5_dact.tex")
		else
			self.mainui.infobutton.cat5:SetTextures("images/button/cat5_act.xml", "cat5_act.tex")
		end
		if self.numpage == 6 then
			self.mainui.infobutton.cat6:SetTextures("images/button/cat6_dact.xml", "cat6_dact.tex")
		else
			self.mainui.infobutton.cat6:SetTextures("images/button/cat6_act.xml", "cat6_act.tex")
		end
		if self.numpage == 7 then
			self.mainui.infobutton.cat7:SetTextures("images/button/cat7_dact.xml", "cat7_dact.tex")
		else
			self.mainui.infobutton.cat7:SetTextures("images/button/cat7_act.xml", "cat7_act.tex")
		end
		if self.numpage == 8 then
			self.mainui.infobutton.cat8:SetTextures("images/button/cat8_dact.xml", "cat8_dact.tex")
		else
			self.mainui.infobutton.cat8:SetTextures("images/button/cat8_act.xml", "cat8_act.tex")
		end
		if self.numpage == 9 then
			self.mainui.infobutton.cat9:SetTextures("images/button/cat9_dact.xml", "cat9_dact.tex")
		else
			self.mainui.infobutton.cat9:SetTextures("images/button/cat9_act.xml", "cat9_act.tex")
		end
		self.mainui.infobutton.catcoin1:SetTextures("images/button/coin_dact.xml", "coin_dact.tex")
		self.mainui.infobutton.catcoin2:SetTextures("images/button/coin_end_dact.xml", "coin_end_dact.tex")
	end)

	self.mainbutton.coinbuttonglow = self.mainbutton:AddChild(Image("images/button/coinbuttonglow.xml", "coinbuttonglow.tex"))
    self.mainbutton.coinbuttonglow:SetClickable(false)
    self.mainbutton.coinbuttonglow:Hide()
    self.mainbutton.coinbuttonglow:SetPosition(55, -2, 0)
    self.mainbutton.coinbuttonglow:SetScale(1,1,1)

    self.mainbutton.coinbutton = self.mainbutton:AddChild(ImageButton("images/button/coinbutton.xml", "coinbutton.tex"))
    self.mainbutton.coinbutton:MoveToFront()
    self.mainbutton.coinbutton:SetPosition(55, -2, 0)
    self.mainbutton.coinbutton:SetScale(1,1,1)
    self.mainbutton.coinbutton:SetHoverText(STRINGS.ALLACHIVCURRENCY[8])

	self.mainbutton.coinbutton:SetOnGainFocus(function() self.mainbutton.coinbuttonglow:Show() end)
	self.mainbutton.coinbutton:SetOnLoseFocus(function() self.mainbutton.coinbuttonglow:Hide() end)
	self.mainbutton.coinbutton:SetOnClick(function()
		if self.mainui.allcoin.shown then
			self.mainui.allcoin:Hide()
			self.mainui.bigtitle:Hide()
			self.mainui.coinamount:Hide()
			self.mainui.infobutton:Hide()
		else
			self.mainui.allcoin:Show()
			self.mainui.bigtitle:Show()
			self.mainui.coinamount:Show()
			self.mainui.infobutton:Show()
			self.mainui.allachiv:Hide()
		end
		self.maxnumpage_coin = 2
		if self.numpage_coin == 1 then
			self.mainui.infobutton.catcoin1:SetTextures("images/button/coin_dact.xml", "coin_dact.tex")
		else
			self.mainui.infobutton.catcoin1:SetTextures("images/button/coin_act.xml", "coin_act.tex")
		end
		if self.numpage_coin == 2 then
			self.mainui.infobutton.catcoin2:SetTextures("images/button/coin_end_dact.xml", "coin_end_dact.tex")
		else
			self.mainui.infobutton.catcoin2:SetTextures("images/button/coin_end_act.xml", "coin_end_act.tex")
		end
		self.mainui.infobutton.cat1:SetTextures("images/button/cat1_dact.xml", "cat1_dact.tex")
		self.mainui.infobutton.cat2:SetTextures("images/button/cat2_dact.xml", "cat2_dact.tex")
		self.mainui.infobutton.cat3:SetTextures("images/button/cat3_dact.xml", "cat3_dact.tex")
		self.mainui.infobutton.cat4:SetTextures("images/button/cat4_dact.xml", "cat4_dact.tex")
		self.mainui.infobutton.cat5:SetTextures("images/button/cat5_dact.xml", "cat5_dact.tex")
		self.mainui.infobutton.cat6:SetTextures("images/button/cat6_dact.xml", "cat6_dact.tex")
		self.mainui.infobutton.cat7:SetTextures("images/button/cat7_dact.xml", "cat7_dact.tex")
		self.mainui.infobutton.cat8:SetTextures("images/button/cat8_dact.xml", "cat8_dact.tex")
		self.mainui.infobutton.cat9:SetTextures("images/button/cat9_dact.xml", "cat9_dact.tex")
	end)

	self.mainbutton.configbg = self.mainbutton:AddChild(Image("images/button/config_bg.xml", "config_bg.tex"))
	self.mainbutton.configbg:SetPosition(193, -5, 0)
	self.mainbutton.configbg:SetClickable(false)
	self.mainbutton.configbg:Hide()

	self.mainbutton.configact = self.mainbutton:AddChild(ImageButton("images/button/config_dact.xml", "config_dact.tex"))
	self.mainbutton.configact:SetPosition(115, -5, 0)
	self.mainbutton.configact:SetNormalScale(1,1,1)
	self.mainbutton.configact:SetFocusScale(1.1,1.1,1)
	self.mainbutton.configact:SetHoverText(STRINGS.ALLACHIVCURRENCY[15])
	self.mainbutton.configact:SetOnClick(function()
		if self.mainbutton.configbg.shown then
			self.mainbutton.configact:SetTextures("images/button/config_dact.xml", "config_dact.tex")
			self.mainbutton.configbg:Hide()
			self.mainbutton.configbigger:Hide()
			self.mainbutton.configsmaller:Hide()
			self.mainbutton.configremove:Hide()
		else
			self.mainbutton.configact:SetTextures("images/button/config_act.xml", "config_act.tex")
			self.mainbutton.configbg:Show()
			self.mainbutton.configbigger:Show()
			self.mainbutton.configsmaller:Show()
			self.mainbutton.configremove:Show()
		end
		self.mainbutton.removeinfo:Hide()
		self.mainbutton.removeyes:Hide()
		self.mainbutton.removeno:Hide()
	end)

	self.size = 1
	self.mainbutton.configbigger = self.mainbutton:AddChild(ImageButton("images/button/config_bigger.xml", "config_bigger.tex"))
	self.mainbutton.configbigger:SetPosition(167, -5, 0)
	self.mainbutton.configbigger:Hide()
	self.mainbutton.configbigger:SetNormalScale(1,1,1)
	self.mainbutton.configbigger:SetFocusScale(1.1,1.1,1)
	self.mainbutton.configbigger:SetHoverText(STRINGS.ALLACHIVCURRENCY[16])
	self.mainbutton.configbigger:SetOnClick(function()
		if not self.mainui.allachiv.shown and not self.mainui.allcoin.shown then
			self.mainui.allachiv:Show()
			self.mainui.bigtitle:Show()
			self.mainui.coinamount:Show()
			self.mainui.infobutton:Show()
		end
		self.size = self.size + .02
		self.mainui:SetScale(self.size, self.size, 1)
	end)

	self.mainbutton.configsmaller = self.mainbutton:AddChild(ImageButton("images/button/config_smaller.xml", "config_smaller.tex"))
	self.mainbutton.configsmaller:SetPosition(219, -5, 0)
	self.mainbutton.configsmaller:Hide()
	self.mainbutton.configsmaller:SetNormalScale(1,1,1)
	self.mainbutton.configsmaller:SetFocusScale(1.1,1.1,1)
	self.mainbutton.configsmaller:SetHoverText(STRINGS.ALLACHIVCURRENCY[17])
	self.mainbutton.configsmaller:SetOnClick(function()
		if not self.mainui.allachiv.shown and not self.mainui.allcoin.shown then
			self.mainui.allachiv:Show()
			self.mainui.bigtitle:Show()
			self.mainui.coinamount:Show()
			self.mainui.infobutton:Show()
		end
		if self.size > .02 then
			self.size = self.size - .02
		end
		self.mainui:SetScale(self.size, self.size, 1)
	end)

	self.mainbutton.configremove = self.mainbutton:AddChild(ImageButton("images/button/config_remove.xml", "config_remove.tex"))
	self.mainbutton.configremove:SetPosition(271, -5, 0)
	self.mainbutton.configremove:Hide()
	self.mainbutton.configremove:SetNormalScale(1,1,1)
	self.mainbutton.configremove:SetFocusScale(1.1,1.1,1)
	self.mainbutton.configremove:SetHoverText(STRINGS.ALLACHIVCURRENCY[18])
	self.mainbutton.configremove:SetOnClick(function()
		self.mainbutton.removeinfo:Show()
		self.mainbutton.removeyes:Show()
		self.mainbutton.removeno:Show()
	end)

	self.mainbutton.removeinfo = self.mainbutton:AddChild(Image("images/button/remove_info_en.xml", "remove_info_en.tex"))
	self.mainbutton.removeinfo:SetPosition(137, -105, 0)
	self.mainbutton.removeinfo:SetScale(.95,.95,1)
	self.mainbutton.removeinfo:Hide()

	self.mainbutton.removeyes = self.mainbutton:AddChild(ImageButton("images/button/remove_yes.xml", "remove_yes.tex"))
	self.mainbutton.removeyes:SetPosition(17, -77, 0)
	self.mainbutton.removeyes:Hide()
	self.mainbutton.removeyes:SetNormalScale(1,1,1)
	self.mainbutton.removeyes:SetFocusScale(1.1,1.1,1)
	self.mainbutton.removeyes:SetOnClick(function()
		SendModRPCToServer(MOD_RPC["DSTAchievement"]["removecoin"])
		self.owner:DoTaskInTime(.35, function()
			self:loadcoinlist()
			self:coinbuild()
		end)
		self.mainbutton.removeinfo:Hide()
		self.mainbutton.removeyes:Hide()
		self.mainbutton.removeno:Hide()
		self.mainui.allcoin:Hide()
		self.mainui.bigtitle:Hide()
		self.mainui.coinamount:Hide()
		self.mainui.infobutton:Hide()
		self.mainui.allachiv:Hide()
	end)

	self.mainbutton.removeno = self.mainbutton:AddChild(ImageButton("images/button/remove_no.xml", "remove_no.tex"))
	self.mainbutton.removeno:SetPosition(257, -77, 0)
	self.mainbutton.removeno:Hide()
	self.mainbutton.removeno:SetNormalScale(1,1,1)
	self.mainbutton.removeno:SetFocusScale(1.1,1.1,1)
	self.mainbutton.removeno:SetOnClick(function()
		self.mainbutton.removeinfo:Hide()
		self.mainbutton.removeyes:Hide()
		self.mainbutton.removeno:Hide()
	end)

	--self.mainbutton.configdrag = self.mainbutton:AddChild(Image("images/button/config_drag.xml", "config_drag.tex"))
	--self.mainbutton.configdrag:SetPosition(271, -5, 0)
	--self.mainbutton.configdrag:Hide()
	--self.mainbutton.configdrag:SetHoverText("拖动")
	--self.mainbutton.configdrag:SetOnGainFocus(function() self.mainbutton.dragcheck = true end)
	--self.mainbutton.configdrag:SetOnLoseFocus(function() self.mainbutton.dragcheck = false end)

	--self.mainbutton.oldOnControl = self.mainbutton.OnControl
	--function self.mainbutton:OnControl (control, down)
	--	if control == CONTROL_ACCEPT and self.dragcheck == true then
	--		if down then
	--			self:StartDrag()
	--		else
	--			self:EndDrag()
	--		end
	--	end
	--	self:oldOnControl(control, down)
	--end

	--function self.mainbutton:SetDragPosition(x, y, z)
	--	local pos
	--	if type(x) == "number" then
	--		pos = Vector3(x, y, z)
	--	else
	--		pos = x
	--	end
	--	local p = pos + self.dragPosDiff
	--	self:SetPosition(p)
	--end
	--function self.mainbutton:StartDrag()
	--	if not self.followhandler then
	--		local mousepos = TheInput:GetScreenPosition()/self.hudscale.x/.72
	--		self.dragPosDiff = self:GetPosition()/self.hudscale.x/.72 - mousepos
	--		self.followhandler = TheInput:AddMoveHandler(function(x,y) self:SetDragPosition(x/self.hudscale.y/.72,y/self.hudscale.y/.72) end)
			--self:SetDragPosition(mousepos)
	--	end
	--end

	--function self.mainbutton:EndDrag()
	--	if self.followhandler then
	--		self.followhandler:Remove()
	--	end
	--	self.followhandler = nil
	--	self.dragPosDiff = nil
	--end

	self.mainui.infobutton = self.mainui:AddChild(Widget("infobutton"))
	self.mainui.infobutton:SetPosition(240, -30, 0)
	self.mainui.infobutton:Hide()

	self.mainui.infobutton.info = self.mainui.infobutton:AddChild(Image("images/button/info_en.xml", "info_en.tex"))
	self.mainui.infobutton.info:Hide()

	self.mainui.infobutton.question = self.mainui.infobutton:AddChild(ImageButton("images/button/infobutton.xml", "infobutton.tex"))
	self.mainui.infobutton.question:SetPosition(180, -370, 0)
	self.mainui.infobutton.question:SetOnClick(function()
		if self.mainui.infobutton.info.shown then
			self.mainui.infobutton.info:Hide()
		else
			self.mainui.infobutton.info:Show()
		end
	end)
	--Buttons
	self.mainui.infobutton.cat1 = self.mainui.infobutton:AddChild(ImageButton("images/button/cat1_dact.xml", "cat1_dact.tex"))
	self.mainui.infobutton.cat1:SetPosition(-681, -370, 0)
	self.mainui.infobutton.cat1:SetOnClick(function()
		if self.mainui.allachiv.shown then
			self.numpage = 1
			self:build()
			self.mainui.infobutton.cat1:SetTextures("images/button/cat1_dact.xml", "cat1_dact.tex")
			self.mainui.infobutton.cat2:SetTextures("images/button/cat2_act.xml", "cat2_act.tex")
			self.mainui.infobutton.cat3:SetTextures("images/button/cat3_act.xml", "cat3_act.tex")
			self.mainui.infobutton.cat4:SetTextures("images/button/cat4_act.xml", "cat4_act.tex")
			self.mainui.infobutton.cat5:SetTextures("images/button/cat5_act.xml", "cat5_act.tex")
			self.mainui.infobutton.cat6:SetTextures("images/button/cat6_act.xml", "cat6_act.tex")
			self.mainui.infobutton.cat7:SetTextures("images/button/cat7_act.xml", "cat7_act.tex")
			self.mainui.infobutton.cat8:SetTextures("images/button/cat8_act.xml", "cat8_act.tex")
			self.mainui.infobutton.cat9:SetTextures("images/button/cat9_act.xml", "cat9_act.tex")
		end
	end)

	self.mainui.infobutton.cat2 = self.mainui.infobutton:AddChild(ImageButton("images/button/cat2_dact.xml", "cat2_dact.tex"))
	self.mainui.infobutton.cat2:SetPosition(-618, -370, 0)
	self.mainui.infobutton.cat2:SetOnClick(function()
		if self.mainui.allachiv.shown then
			self.numpage = 2
			self:build()
			self.mainui.infobutton.cat1:SetTextures("images/button/cat1_act.xml", "cat1_act.tex")
			self.mainui.infobutton.cat2:SetTextures("images/button/cat2_dact.xml", "cat2_dact.tex")
			self.mainui.infobutton.cat3:SetTextures("images/button/cat3_act.xml", "cat3_act.tex")
			self.mainui.infobutton.cat4:SetTextures("images/button/cat4_act.xml", "cat4_act.tex")
			self.mainui.infobutton.cat5:SetTextures("images/button/cat5_act.xml", "cat5_act.tex")
			self.mainui.infobutton.cat6:SetTextures("images/button/cat6_act.xml", "cat6_act.tex")
			self.mainui.infobutton.cat7:SetTextures("images/button/cat7_act.xml", "cat7_act.tex")
			self.mainui.infobutton.cat8:SetTextures("images/button/cat8_act.xml", "cat8_act.tex")
			self.mainui.infobutton.cat9:SetTextures("images/button/cat9_act.xml", "cat9_act.tex")
		end
	end)

	self.mainui.infobutton.cat3 = self.mainui.infobutton:AddChild(ImageButton("images/button/cat3_dact.xml", "cat3_dact.tex"))
	self.mainui.infobutton.cat3:SetPosition(-555, -370, 0)
	self.mainui.infobutton.cat3:SetOnClick(function()
		if self.mainui.allachiv.shown then
			self.numpage = 3
			self:build()
			self.mainui.infobutton.cat1:SetTextures("images/button/cat1_act.xml", "cat1_act.tex")
			self.mainui.infobutton.cat2:SetTextures("images/button/cat2_act.xml", "cat2_act.tex")
			self.mainui.infobutton.cat3:SetTextures("images/button/cat3_dact.xml", "cat3_dact.tex")
			self.mainui.infobutton.cat4:SetTextures("images/button/cat4_act.xml", "cat4_act.tex")
			self.mainui.infobutton.cat5:SetTextures("images/button/cat5_act.xml", "cat5_act.tex")
			self.mainui.infobutton.cat6:SetTextures("images/button/cat6_act.xml", "cat6_act.tex")
			self.mainui.infobutton.cat7:SetTextures("images/button/cat7_act.xml", "cat7_act.tex")
			self.mainui.infobutton.cat8:SetTextures("images/button/cat8_act.xml", "cat8_act.tex")
			self.mainui.infobutton.cat9:SetTextures("images/button/cat9_act.xml", "cat9_act.tex")
		end
	end)

	self.mainui.infobutton.cat4 = self.mainui.infobutton:AddChild(ImageButton("images/button/cat4_dact.xml", "cat4_dact.tex"))
	self.mainui.infobutton.cat4:SetPosition(-492, -370, 0)
	self.mainui.infobutton.cat4:SetOnClick(function()
		if self.mainui.allachiv.shown then
			self.numpage = 4
			self:build()
			self.mainui.infobutton.cat1:SetTextures("images/button/cat1_act.xml", "cat1_act.tex")
			self.mainui.infobutton.cat2:SetTextures("images/button/cat2_act.xml", "cat2_act.tex")
			self.mainui.infobutton.cat3:SetTextures("images/button/cat3_act.xml", "cat3_act.tex")
			self.mainui.infobutton.cat4:SetTextures("images/button/cat4_dact.xml", "cat4_dact.tex")
			self.mainui.infobutton.cat5:SetTextures("images/button/cat5_act.xml", "cat5_act.tex")
			self.mainui.infobutton.cat6:SetTextures("images/button/cat6_act.xml", "cat6_act.tex")
			self.mainui.infobutton.cat7:SetTextures("images/button/cat7_act.xml", "cat7_act.tex")
			self.mainui.infobutton.cat8:SetTextures("images/button/cat8_act.xml", "cat8_act.tex")
			self.mainui.infobutton.cat9:SetTextures("images/button/cat9_act.xml", "cat9_act.tex")
		end
	end)

	self.mainui.infobutton.cat5 = self.mainui.infobutton:AddChild(ImageButton("images/button/cat5_dact.xml", "cat5_dact.tex"))
	self.mainui.infobutton.cat5:SetPosition(-429, -370, 0)
	self.mainui.infobutton.cat5:SetOnClick(function()
		if self.mainui.allachiv.shown then
			self.numpage = 5
			self:build()
			self.mainui.infobutton.cat1:SetTextures("images/button/cat1_act.xml", "cat1_act.tex")
			self.mainui.infobutton.cat2:SetTextures("images/button/cat2_act.xml", "cat2_act.tex")
			self.mainui.infobutton.cat3:SetTextures("images/button/cat3_act.xml", "cat3_act.tex")
			self.mainui.infobutton.cat4:SetTextures("images/button/cat4_act.xml", "cat4_act.tex")
			self.mainui.infobutton.cat5:SetTextures("images/button/cat5_dact.xml", "cat5_dact.tex")
			self.mainui.infobutton.cat6:SetTextures("images/button/cat6_act.xml", "cat6_act.tex")
			self.mainui.infobutton.cat7:SetTextures("images/button/cat7_act.xml", "cat7_act.tex")
			self.mainui.infobutton.cat8:SetTextures("images/button/cat8_act.xml", "cat8_act.tex")
			self.mainui.infobutton.cat9:SetTextures("images/button/cat9_act.xml", "cat9_act.tex")
		end
	end)

	self.mainui.infobutton.cat6 = self.mainui.infobutton:AddChild(ImageButton("images/button/cat6_dact.xml", "cat6_dact.tex"))
	self.mainui.infobutton.cat6:SetPosition(-366, -370, 0)
	self.mainui.infobutton.cat6:SetOnClick(function()
		if self.mainui.allachiv.shown then
			self.numpage = 6
			self:build()
			self.mainui.infobutton.cat1:SetTextures("images/button/cat1_act.xml", "cat1_act.tex")
			self.mainui.infobutton.cat2:SetTextures("images/button/cat2_act.xml", "cat2_act.tex")
			self.mainui.infobutton.cat3:SetTextures("images/button/cat3_act.xml", "cat3_act.tex")
			self.mainui.infobutton.cat4:SetTextures("images/button/cat4_act.xml", "cat4_act.tex")
			self.mainui.infobutton.cat5:SetTextures("images/button/cat5_act.xml", "cat5_act.tex")
			self.mainui.infobutton.cat6:SetTextures("images/button/cat6_dact.xml", "cat6_dact.tex")
			self.mainui.infobutton.cat7:SetTextures("images/button/cat7_act.xml", "cat7_act.tex")
			self.mainui.infobutton.cat8:SetTextures("images/button/cat8_act.xml", "cat8_act.tex")
			self.mainui.infobutton.cat9:SetTextures("images/button/cat9_act.xml", "cat9_act.tex")
		end
	end)

	self.mainui.infobutton.cat7 = self.mainui.infobutton:AddChild(ImageButton("images/button/cat7_dact.xml", "cat7_dact.tex"))
	self.mainui.infobutton.cat7:SetPosition(-303, -370, 0)
	self.mainui.infobutton.cat7:SetOnClick(function()
		if self.mainui.allachiv.shown then
			self.numpage = 7
			self:build()
			self.mainui.infobutton.cat1:SetTextures("images/button/cat1_act.xml", "cat1_act.tex")
			self.mainui.infobutton.cat2:SetTextures("images/button/cat2_act.xml", "cat2_act.tex")
			self.mainui.infobutton.cat3:SetTextures("images/button/cat3_act.xml", "cat3_act.tex")
			self.mainui.infobutton.cat4:SetTextures("images/button/cat4_act.xml", "cat4_act.tex")
			self.mainui.infobutton.cat5:SetTextures("images/button/cat5_act.xml", "cat5_act.tex")
			self.mainui.infobutton.cat6:SetTextures("images/button/cat6_act.xml", "cat6_act.tex")
			self.mainui.infobutton.cat7:SetTextures("images/button/cat7_dact.xml", "cat7_dact.tex")
			self.mainui.infobutton.cat8:SetTextures("images/button/cat8_act.xml", "cat8_act.tex")
			self.mainui.infobutton.cat9:SetTextures("images/button/cat9_act.xml", "cat9_act.tex")
		end
	end)

	self.mainui.infobutton.cat8 = self.mainui.infobutton:AddChild(ImageButton("images/button/cat8_dact.xml", "cat8_dact.tex"))
	self.mainui.infobutton.cat8:SetPosition(-240, -370, 0)
	self.mainui.infobutton.cat8:SetOnClick(function()
		if self.mainui.allachiv.shown then
			self.numpage = 8
			self:build()
			self.mainui.infobutton.cat1:SetTextures("images/button/cat1_act.xml", "cat1_act.tex")
			self.mainui.infobutton.cat2:SetTextures("images/button/cat2_act.xml", "cat2_act.tex")
			self.mainui.infobutton.cat3:SetTextures("images/button/cat3_act.xml", "cat3_act.tex")
			self.mainui.infobutton.cat4:SetTextures("images/button/cat4_act.xml", "cat4_act.tex")
			self.mainui.infobutton.cat5:SetTextures("images/button/cat5_act.xml", "cat5_act.tex")
			self.mainui.infobutton.cat6:SetTextures("images/button/cat6_act.xml", "cat6_act.tex")
			self.mainui.infobutton.cat7:SetTextures("images/button/cat7_act.xml", "cat7_act.tex")
			self.mainui.infobutton.cat8:SetTextures("images/button/cat8_dact.xml", "cat8_dact.tex")
			self.mainui.infobutton.cat9:SetTextures("images/button/cat9_act.xml", "cat9_act.tex")
		end
	end)

	self.mainui.infobutton.cat9 = self.mainui.infobutton:AddChild(ImageButton("images/button/cat9_dact.xml", "cat9_dact.tex"))
	self.mainui.infobutton.cat9:SetPosition(-177, -370, 0)
	self.mainui.infobutton.cat9:SetOnClick(function()
		if self.mainui.allachiv.shown then
			self.numpage = 9
			self:build()
			self.mainui.infobutton.cat1:SetTextures("images/button/cat1_act.xml", "cat1_act.tex")
			self.mainui.infobutton.cat2:SetTextures("images/button/cat2_act.xml", "cat2_act.tex")
			self.mainui.infobutton.cat3:SetTextures("images/button/cat3_act.xml", "cat3_act.tex")
			self.mainui.infobutton.cat4:SetTextures("images/button/cat4_act.xml", "cat4_act.tex")
			self.mainui.infobutton.cat5:SetTextures("images/button/cat5_act.xml", "cat5_act.tex")
			self.mainui.infobutton.cat6:SetTextures("images/button/cat6_act.xml", "cat6_act.tex")
			self.mainui.infobutton.cat7:SetTextures("images/button/cat7_act.xml", "cat7_act.tex")
			self.mainui.infobutton.cat8:SetTextures("images/button/cat8_act.xml", "cat8_act.tex")
			self.mainui.infobutton.cat9:SetTextures("images/button/cat9_dact.xml", "cat9_dact.tex")
		end
	end)
	--Coin
	self.mainui.infobutton.catcoin1 = self.mainui.infobutton:AddChild(ImageButton("images/button/coin_dact.xml", "coin_dact.tex"))
	self.mainui.infobutton.catcoin1:SetPosition(54, -370, 0)
	self.mainui.infobutton.catcoin1:SetOnClick(function()
		if self.mainui.allcoin.shown then
			self.numpage_coin = 1
			self:coinbuild()
			self.mainui.infobutton.catcoin1:SetTextures("images/button/coin_dact.xml", "coin_dact.tex")
			self.mainui.infobutton.catcoin2:SetTextures("images/button/coin_end_act.xml", "coin_end_act.tex")
		end
	end)
	self.mainui.infobutton.catcoin2 = self.mainui.infobutton:AddChild(ImageButton("images/button/coin_end_dact.xml", "coin_end_dact.tex"))
	self.mainui.infobutton.catcoin2:SetPosition(117, -370, 0)
	self.mainui.infobutton.catcoin2:SetOnClick(function()
		if self.mainui.allcoin.shown then
			self.numpage_coin = 2
			self:coinbuild()
			self.mainui.infobutton.catcoin1:SetTextures("images/button/coin_act.xml", "coin_act.tex")
			self.mainui.infobutton.catcoin2:SetTextures("images/button/coin_end_dact.xml", "coin_end_dact.tex")
		end
	end)
	--self.mainui.infobutton.last = self.mainui.infobutton:AddChild(ImageButton("images/button/last_dact.xml", "last_dact.tex"))
	--self.mainui.infobutton.last:SetPosition(98, -370, 0)
	--self.mainui.infobutton.last:SetOnClick(function()
		--if self.numpage > 1 and self.mainui.allachiv.shown then
			--self.numpage = self.numpage - 1
			--self:build()
			--self.mainui.infobutton.next:SetTextures("images/button/next_act.xml", "next_act.tex")
		--end
		--if self.numpage == 1 then
			--self.mainui.infobutton.last:SetTextures("images/button/last_dact.xml", "last_dact.tex")
		--end
	--end)

	--self.mainui.infobutton.next = self.mainui.infobutton:AddChild(ImageButton("images/button/next_act.xml", "next_act.tex"))
	--self.mainui.infobutton.next:SetPosition(161, -370, 0)
	--self.mainui.infobutton.next:SetOnClick(function()
		--if self.numpage < self.maxnumpage and self.mainui.allachiv.shown then
			--self.numpage = self.numpage + 1
			--self:build()
			--self.mainui.infobutton.last:SetTextures("images/button/last_act.xml", "last_act.tex")
		--end
		--if self.numpage == self.maxnumpage then
			--self.mainui.infobutton.next:SetTextures("images/button/next_dact.xml", "next_dact.tex")
		--end
	--end)

	self.mainui.infobutton.close = self.mainui.infobutton:AddChild(ImageButton("images/button/close.xml", "close.tex"))
	self.mainui.infobutton.close:SetPosition(220, -370, 0)
	self.mainui.infobutton.close:SetOnClick(function()
		self.mainui.allachiv:Hide()
		self.mainui.allcoin:Hide()
		self.mainui.bigtitle:Hide()
		self.mainui.coinamount:Hide()
		self.mainui.infobutton:Hide()
	end)

	self.inst:DoTaskInTime(.2, function()
		self.numpage = 1
		self.numpage_coin = 1
		self:loadlist()
		self:loadcoinlist()
		self.maxnumpage = 9
		self.maxnumpage_coin = 2
		--self.achivlistbg = {}
		self.achivlisttile = {}
		self.coinlistbutton = {}
		self:build()
		self:coinbuild()
		self:StartUpdating()
	end)
end)


function uiachievement:updatepage(i)
	local check = "dact"
    if self.achivlist[i].check == 1 then check = "act" end
	--self.achivlistbg[i]:SetTexture("images/hud/achivbg_"..check..".xml", "achivbg_"..check..".tex")

    self.achivlisttile[i]:SetTexture("images/hud/achivtile_"..check.."_"..TUNING.AllAchivLan.."_"..self.achivlist[i].name..".xml", "achivtile_"..check.."_"..TUNING.AllAchivLan.."_"..self.achivlist[i].name..".tex")

    if allachiv_eventdata[self.achivlist[i].name] ~= nil and self.achivlist[i].name ~= "king" and self.achivlist[i].name ~= "all" then
    	self.achivlisttile[i]:SetHoverText(STRINGS.ALLACHIVCURRENCY[9]..self.achivlist[i].current.."/"..allachiv_eventdata[self.achivlist[i].name])
    else
    	self.achivlisttile[i]:SetHoverText(STRINGS.ALLACHIVCURRENCY[9]..self.achivlist[i].check.."/1")
    end
    if self.achivlist[i].name == "king" then
    	self.achivlisttile[i]:SetHoverText(STRINGS.ALLACHIVCURRENCY[9]..STRINGS.ALLACHIVCURRENCY[11]..self.achivlist[i].current1.."  "..STRINGS.ALLACHIVCURRENCY[12]..self.achivlist[i].current2.."  "..STRINGS.ALLACHIVCURRENCY[13]..self.achivlist[i].current3.."  "..STRINGS.ALLACHIVCURRENCY[14]..self.achivlist[i].current4)
    end
    if self.achivlist[i].name == "all" then
    	self.achivlisttile[i]:SetHoverText(STRINGS.ALLACHIVCURRENCY[9]..self.achivlist[i].current.."/"..(#self.achivlist-1))
    end
end

function uiachievement:OnUpdate(dt)
	self.mainui.coinamount:SetString(self.owner.currentcoinamount:value())

	self:loadlist()
	local x = 1
	local y = cat_food

	-- Food
	if self.numpage == 1 then
		for i = x,y do
			self:updatepage(i)
		end
	end
	x = y + 1
	y = y + cat_life

	-- Life
	if self.numpage == 2 then
		for i = x,y do
			self:updatepage(i)
		end
	end
	x = y + 1
	y = y + cat_work

	-- Work
	if self.numpage == 3 then
		for i = x,y do
			self:updatepage(i)
		end
	end
	x = y + 1
	y = y + cat_hire

	-- Hire
	if self.numpage == 4 then
		for i = x,y do
			self:updatepage(i)
		end
	end
	x = y + 1
	y = y + cat_hurt

	-- Hurt
	if self.numpage == 5 then
		for i = x,y do
			self:updatepage(i)
		end
	end
	x = y + 1
	y = y + cat_hunt

	-- Hunt
	if self.numpage == 6 then
		for i = x,y do
			self:updatepage(i)
		end
	end
	x = y + 1
	y = y + cat_slay

	-- Slay
	if self.numpage == 7 then
		for i = x,y do
			self:updatepage(i)
		end
	end
	x = y + 1
	y = y + cat_misc

	-- Misc
	if self.numpage == 8 then
		for i = x,y do
			self:updatepage(i)
		end
	end
	x = y + 1
	y = y + cat_mile

	-- Mile
	if self.numpage == 9 then
		for i = x,y do
			self:updatepage(i)
		end
	end
end

function uiachievement:buildpage(j,i)
	local x = 240
	local y = - (97.5 * (math.ceil(j/2) + 1))

	if math.ceil(j/2) ~= j/2 then x = -240 else x = 240 end

	local check = "dact"
    if self.achivlist[i].check == 1 then check = "act" end

    self.achivlisttile[i] = self.mainui.allachiv:AddChild(Image("images/hud/achivtile_"..check.."_"..TUNING.AllAchivLan.."_"..self.achivlist[i].name..".xml", "achivtile_"..check.."_"..TUNING.AllAchivLan.."_"..self.achivlist[i].name..".tex"))
	self.achivlisttile[i]:SetPosition(x, y, 0)
    self.achivlisttile[i]:SetTint(1,1,1,0.95)

    if allachiv_eventdata[self.achivlist[i].name] ~= nil and self.achivlist[i].name ~= "king" and self.achivlist[i].name ~= "all" then
    	self.achivlisttile[i]:SetHoverText(STRINGS.ALLACHIVCURRENCY[9]..self.achivlist[i].current.."/"..allachiv_eventdata[self.achivlist[i].name])
    else
    	self.achivlisttile[i]:SetHoverText(STRINGS.ALLACHIVCURRENCY[9]..self.achivlist[i].check.."/1")
    end
    if self.achivlist[i].name == "king" then
    	self.achivlisttile[i]:SetHoverText(STRINGS.ALLACHIVCURRENCY[9]..STRINGS.ALLACHIVCURRENCY[11]..self.achivlist[i].current1.."  "..STRINGS.ALLACHIVCURRENCY[12]..self.achivlist[i].current2.."  "..STRINGS.ALLACHIVCURRENCY[13]..self.achivlist[i].current3.."  "..STRINGS.ALLACHIVCURRENCY[14]..self.achivlist[i].current4)
    end
    if self.achivlist[i].name == "all" then
    	self.achivlisttile[i]:SetHoverText(STRINGS.ALLACHIVCURRENCY[9]..self.achivlist[i].current.."/"..(#self.achivlist-1))
    end
end

function uiachievement:build()
	self.mainui.allachiv:KillAllChildren()
	local x = 1
	local y = cat_food

	-- Food
	if self.numpage == 1 then
		for i = x,y do
			self:buildpage(i-(x-1) ,i)
		end
	end
	x = y + 1
	y = y + cat_life

	-- Life
	if self.numpage == 2 then
		for i = x,y do
			self:buildpage(i-(x-1) ,i)
		end
	end
	x = y + 1
	y = y + cat_work

	-- Work
	if self.numpage == 3 then
		for i = x,y do
			self:buildpage(i-(x-1) ,i)
		end
	end
	x = y + 1
	y = y + cat_hire

	-- Hire
	if self.numpage == 4 then
		for i = x,y do
			self:buildpage(i-(x-1) ,i)
		end
	end
	x = y + 1
	y = y + cat_hurt

	-- Hurt
	if self.numpage == 5 then
		for i = x,y do
			self:buildpage(i-(x-1) ,i)
		end
	end
	x = y + 1
	y = y + cat_hunt

	-- Hunt
	if self.numpage == 6 then
		for i = x,y do
			self:buildpage(i-(x-1) ,i)
		end
	end
	x = y + 1
	y = y + cat_slay

	-- Slay
	if self.numpage == 7 then
		for i = x,y do
			self:buildpage(i-(x-1) ,i)
		end
	end
	x = y + 1
	y = y + cat_misc

	-- Misc
	if self.numpage == 8 then
		for i = x,y do
			self:buildpage(i-(x-1) ,i)
		end
	end
	x = y + 1
	y = y + cat_mile

	-- Mile
	if self.numpage == 9 then
		for i = x,y do
			self:buildpage(i-(x-1) ,i)
		end
	end
end

function uiachievement:coinbuildpage(j,i)
	local x = -360 + ((360*2/3) * ((j-1) % 4))
	local y = -192.5-96*(math.ceil(j/4)-1)

	self.coinlistbutton[i] = self.mainui.allcoin:AddChild(ImageButton("images/coin_"..TUNING.AllAchivLan.."/"..self.coinlist[i].name.."".._G.MODE..".xml", self.coinlist[i].name.."".._G.MODE..".tex"))
	self.coinlistbutton[i]:SetPosition(x, y, 0)
    self.coinlistbutton[i]:SetImageNormalColour(1,1,1,0.95)
    self.coinlistbutton[i]:SetOnClick(function()
    	SendModRPCToServer(MOD_RPC["DSTAchievement"][self.coinlist[i].name])
    	self.owner:DoTaskInTime(.3, function()
    		self:loadcoinlist()
    		self.coinlistbutton[i]:SetHoverText(STRINGS.ALLACHIVCURRENCY[10]..self.coinlist[i].current)
		end)
	end)
	self.coinlistbutton[i]:SetNormalScale(1,1,1)
    self.coinlistbutton[i]:SetFocusScale(1.02,1.02,1)
	self.coinlistbutton[i]:SetHoverText(STRINGS.ALLACHIVCURRENCY[10]..self.coinlist[i].current)
end

function uiachievement:coinbuild()
	self.mainui.allcoin:KillAllChildren()
	local x = 1
	local y = cat_coinblue

	-- Blue Coin
	if self.numpage_coin == 1 then
		for i = x,y do
			self:coinbuildpage(i-(x-1) ,i)
		end
	end
	x = y + 1
	y = y + cat_coinpurple
	-- Purple Coin
	if self.numpage_coin == 2 then
		for i = x,y do
			self:coinbuildpage(i-(x-1) ,i)
		end
	end
end

function uiachievement:loadlist()
	self.achivlist = {
		--Food
		{
			name = "firsteat",
			check = self.owner.checkfirsteat:value(),
			current = nil,
		},
		{
			name = "supereat",
			check = self.owner.checksupereat:value(),
			current = self.owner.currenteatamount:value(),
		},
		{
			name = "danding",
			check = self.owner.checkdanding:value(),
			current = self.owner.currenteatmonsterlasagna:value(),
		},
		{
			name = "alldiet",
			check = self.owner.checkalldiet:value(),
			current = self.owner.currenteatall:value(),
		},
		{
			name = "eathot",
			check = self.owner.checkeathot:value(),
			current = self.owner.currenteathotamount:value(),
		},
		{
			name = "eatcold",
			check = self.owner.checkeatcold:value(),
			current = self.owner.currenteatcoldamount:value(),
		},
		--Life
		{
			name = "noob",
			check = self.owner.checknoob:value(),
			current = nil,
		},
		{
			name = "tooyoung",
			check = self.owner.checktooyoung:value(),
			current = nil,
		},
		{
			name = "rose",
			check = self.owner.checkrose:value(),
			current = nil,
		},
		{
			name = "rot",
			check = self.owner.checkrot:value(),
			current = nil,
		},
		{
			name = "antdeath",
			check = self.owner.checkantdeath:value(),
			current = nil,
		},
		{
			name = "deathalot",
			check = self.owner.checkdeathalot:value(),
			current = self.owner.currentdeathamouth:value(),
		},
		{
			name = "secondchance",
			check = self.owner.checksecondchance:value(),
			current = nil,
		},
		{
			name = "messiah",
			check = self.owner.checkmessiah:value(),
			current = self.owner.currentrespawnamount:value(),
		},
		--Work
		{
			name = "nature",
			check = self.owner.checknature:value(),
			current = self.owner.currentnatureamount:value(),
		},
		{
			name = "fishmaster",
			check = self.owner.checkfishmaster:value(),
			current = self.owner.currentfishamount:value(),
		},
		{
			name = "pickappren",
			check = self.owner.checkpickappren:value(),
			current = self.owner.currentpickamount:value(),
		},
		{
			name = "pickmaster",
			check = self.owner.checkpickmaster:value(),
			current = self.owner.currentpickamount:value(),
		},
		{
			name = "chopappren",
			check = self.owner.checkchopappren:value(),
			current = self.owner.currentchopamount:value(),
		},
		{
			name = "chopmaster",
			check = self.owner.checkchopmaster:value(),
			current = self.owner.currentchopamount:value(),
		},
		{
			name = "mineappren",
			check = self.owner.checkmineappren:value(),
			current = self.owner.currentmineamount:value(),
		},
		{
			name = "minemaster",
			check = self.owner.checkminemaster:value(),
			current = self.owner.currentmineamount:value(),
		},
		{
			name = "cookappren",
			check = self.owner.checkcookappren:value(),
			current = self.owner.currentcookamount:value(),
		},
		{
			name = "cookmaster",
			check = self.owner.checkcookmaster:value(),
			current = self.owner.currentcookamount:value(),
		},
		{
			name = "buildappren",
			check = self.owner.checkbuildappren:value(),
			current = self.owner.currentbuildamount:value(),
		},
		{
			name = "buildmaster",
			check = self.owner.checkbuildmaster:value(),
			current = self.owner.currentbuildamount:value(),
		},
		--Hire
		{
			name = "goodman",
			check = self.owner.checkgoodman:value(),
			current = self.owner.currentfriendpig:value(),
		},
		{
			name = "brother",
			check = self.owner.checkbrother:value(),
			current = self.owner.currentfriendbunny:value(),
		},
		{
			name = "catperson",
			check = self.owner.checkcatperson:value(),
			current = self.owner.currentfriendcat:value(),
		},
		{
			name = "rocklob",
			check = self.owner.checkrocklob:value(),
			current = self.owner.currentfriendrocky:value(),
		},
		{
			name = "spooder",
			check = self.owner.checkspooder:value(),
			current = self.owner.currentfriendspider:value(),
		},
		{
			name = "evil",
			check = self.owner.checkevil:value(),
			current = self.owner.currentevilamount:value(),
		},
		--Hurt
		{
			name = "burn",
			check = self.owner.checkburn:value(),
			current = nil,
		},
		{
			name = "freeze",
			check = self.owner.checkfreeze:value(),
			current = nil,
		},
		{
			name = "sleep",
			check = self.owner.checksleep:value(),
			current = nil,
		},
		{
			name = "starve",
			check = self.owner.checkstarve:value(),
			current = self.owner.currentstarvetime:value(),
		},
		{
			name = "nosanity",
			check = self.owner.checknosanity:value(),
			current = self.owner.currentnosanitytime:value(),
		},
		{
			name = "icebody",
			check = self.owner.checkicebody:value(),
			current = self.owner.currenticetime:value(),
		},
		{
			name = "firebody",
			check = self.owner.checkfirebody:value(),
			current = self.owner.currentfiretime:value(),
		},
		{
			name = "moistbody",
			check = self.owner.checkmoistbody:value(),
			current = self.owner.currentmoisttime:value(),
		},
		--Hunt
		{
			name = "butcher",
			check = self.owner.checkbutcher:value(),
			current = self.owner.currentbutcheramount:value(),
		},
		{
			name = "goatperd",
			check = self.owner.checkgoatperd:value(),
			current = self.owner.currentgoatperdamount:value(),
		},
		{
			name = "mossling",
			check = self.owner.checkmossling:value(),
			current = self.owner.currentmosslingamount:value(),
		},
		{
			name = "weetusk",
			check = self.owner.checkweetusk:value(),
			current = self.owner.currentweetuskamount:value(),
		},
		{
			name = "snake",
			check = self.owner.checksnake:value(),
			current = self.owner.currentsnakeamount:value(),
		},
		{
			name = "luck",
			check = self.owner.checkluck:value(),
			current = nil,
		},
		{
			name = "black",
			check = self.owner.checkblack:value(),
			current = nil,
		},
		{
			name = "hentai",
			check = self.owner.checkhentai:value(),
			current = self.owner.currenthentaiamount:value(),
		},
		{
			name = "sick",
			check = self.owner.checksick:value(),
			current = nil,
		},
		{
			name = "coldblood",
			check = self.owner.checkcoldblood:value(),
			current = nil,
		},
		{
			name = "hutch",
			check = self.owner.checkhutch:value(),
			current = nil,
		},
		--Slay
		{
			name = "santa",
			check = self.owner.checksanta:value(),
			current = nil,
		},
		{
			name = "sand",
			check = self.owner.checksand:value(),
			current = nil,
		},
		{
			name = "knight",
			check = self.owner.checkknight:value(),
			current = nil,
		},
		{
			name = "bishop",
			check = self.owner.checkbishop:value(),
			current = nil,
		},
		{
			name = "rook",
			check = self.owner.checkrook:value(),
			current = nil,
		},
		{
			name = "minotaur",
			check = self.owner.checkminotaur:value(),
			current = nil,
		},
		{
			name = "ancient",
			check = self.owner.checkancient:value(),
			current = nil,
		},
		{
			name = "rigid",
			check = self.owner.checkrigid:value(),
			current = nil,
		},
		{
			name = "queen",
			check = self.owner.checkqueen:value(),
			current = nil,
		},
		{
			name = "king",
			check = self.owner.checkking:value(),
			current1 = self.owner.checkbossspring:value(),
			current2 = self.owner.checkbossdragonfly:value(),
			current3 = self.owner.checkbossautumn:value(),
			current4 = self.owner.checkbosswinter:value(),
		},
		{
			name = "malb",
			check = self.owner.checkmalb:value(),
			current = nil,
		},
		--Misc
		{
			name = "trader",
			check = self.owner.checktrader:value(),
			current = self.owner.currenttradeamount:value(),
		},
		{
			name = "fuzzy",
			check = self.owner.checkfuzzy:value(),
			current = self.owner.currentfuzzyamount:value(),
		},
		{
			name = "birdclop",
			check = self.owner.checkbirdclop:value(),
			current = nil,
		},
		{
			name = "pet",
			check = self.owner.checkpet:value(),
			current = nil,
		},
		{
			name = "knowledge",
			check = self.owner.checkknowledge:value(),
			current = nil,
		},
		{
			name = "dance",
			check = self.owner.checkdance:value(),
			current = self.owner.currentdanceamount:value(),
		},
		{
			name = "teleport",
			check = self.owner.checkteleport:value(),
			current = self.owner.currentteleportamount:value(),
		},
		{
			name = "horror",
			check = self.owner.checkhorror:value(),
			current = self.owner.currenthorroramount:value(),
		},
		{
			name = "beefalo",
			check = self.owner.checkbeefalo:value(),
			current = nil,
		},
		{
			name = "revenge",
			check = self.owner.checkrevenge:value(),
			current = nil,
		},
		--Mile
		{
			name = "intogame",
			check = self.owner.checkintogame:value(),
			current = nil,
		},
		{
			name = "all",
			check = self.owner.checkall:value(),
			current = 0,
		},
		{
			name = "longage",
			check = self.owner.checklongage:value(),
			current = self.owner.currentage:value(),
		},
		{
			name = "oldage",
			check = self.owner.checkoldage:value(),
			current = self.owner.currentage:value(),
		},
		{
			name = "walkalot",
			check = self.owner.checkwalkalot:value(),
			current = self.owner.currentwalktime:value(),
		},
		{
			name = "stopalot",
			check = self.owner.checkstopalot:value(),
			current = self.owner.currentstoptime:value(),
		},
		{
			name = "angry",
			check = self.owner.checkangry:value(),
			current = self.owner.currentonhitdamage:value(),
		},
		{
			name = "tank",
			check = self.owner.checktank:value(),
			current = self.owner.currentattackeddamage:value(),
		},
		{
			name = "caveage",
			check = self.owner.checkcaveage:value(),
			current = self.owner.currentcavetime:value(),
		},
		{
			name = "superstar",
			check = self.owner.checksuperstar:value(),
			current = self.owner.currentstarspent:value(),
		},
		{
			name = "pacifist",
			check = self.owner.checkpacifist:value(),
			current = self.owner.currentpacifisttime:value(),
		},
		{
			name = "kite",
			check = self.owner.checkkite:value(),
			current = self.owner.currentkiteamount:value(),
		},
	}

	local achivvalue = 0
	for i=1, #self.achivlist do
		if self.achivlist[i].name ~= "all" then
			achivvalue = achivvalue + self.achivlist[i].check
		else
			self.achivlist[i].current = achivvalue
		end
	end
end

function uiachievement:loadcoinlist()
	self.coinlist = {
		-- ----------------------Stats-----------------------------
		-- ---------------------1st Row----------------------------
		{
			name = "hungerup",
			current = self.owner.currenthungerup:value(),
		},
		{
			name = "sanityup",
			current = self.owner.currentsanityup:value(),
		},
		{
			name = "healthup",
			current = self.owner.currenthealthup:value(),
		},
		{
			name = "damageup",
			current = self.owner.currentdamageup:value(),
		},
		-- ---------------------2nd Row----------------------------
		{
			name = "hungerrateup",
			current = self.owner.currenthungerrateup:value(),
		},
		{
			name = "sanityregen",
			current = self.owner.currentsanityregen:value(),
		},
		{
			name = "healthregen",
			current = self.owner.currenthealthregen:value(),
		},
		{
			name = "crit",
			current = self.owner.currentcrit:value(),
		},
		-- ---------------------3rd Row----------------------------
		{
			name = "speedup",
			current = self.owner.currentspeedup:value(),
		},
		{
			name = "absorbup",
			current = self.owner.currentabsorbup:value(),
		},

		-- ----------------------Perks-----------------------------
		-- ---------------------1st Row----------------------------
		{
			name = "chopmaster",
			current = self.owner.currentchopmaster:value(),
		},
		{
			name = "minemaster",
			current = self.owner.currentminemaster:value(),
		},
		{
			name = "fishmaster",
			current = self.owner.currentfishmaster:value(),
		},
		{
			name = "cookmaster",
			current = self.owner.currentcookmaster:value(),
		},
		-- ---------------------2nd Row----------------------------
		{
			name = "pickmaster",
			current = self.owner.currentpickmaster:value(),
		},
		{
			name = "doubledrop",
			current = self.owner.currentdoubledrop:value(),
		},
		{
			name = "nanobots",
			current = self.owner.currentnanobots:value(),
		},
		{
			name = "refresh",
			current = self.owner.currentrefresh:value(),
		},
		-- ---------------------3rd Row----------------------------
		{
			name = "firebody",
			current = self.owner.currentfirebody:value(),
		},
		{
			name = "icebody",
			current = self.owner.currenticebody:value(),
		},
		{
			name = "nomoist",
			current = self.owner.currentnomoist:value(),
		},
		{
			name = "fireflylight",
			current = self.owner.currentfireflylight:value(),
		},
		-- ---------------------4th Row----------------------------
		{
			name = "reader",
			current = self.owner.currentreader:value(),
		},
		{
			name = "masterchef",
			current = self.owner.currentmasterchef:value(),
		},
		{
			name = "supply",
			current = self.owner.currentsupply:value(),
		},
		{
			name = "festive",
			current = self.owner.currentfestive:value(),
		},
		-- ---------------------5th Row----------------------------
		{
			name = "buildmaster",
			current = self.owner.currentbuildmaster:value(),
		},
		{
			name = "fastworker",
			current = self.owner.currentfastworker:value(),
		},
		{
			name = "disguise",
			current = self.owner.currentdisguise:value(),
		},
		{
			name = "goodman",
			current = self.owner.currentgoodman:value(),
		},
	}
end

return uiachievement
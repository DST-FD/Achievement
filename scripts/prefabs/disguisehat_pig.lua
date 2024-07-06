local assets =
{ 
    Asset("ANIM", "anim/hat_disguise.zip"),

    Asset("ATLAS", "images/inventoryimages/disguisehat_pig.xml"),
    Asset("IMAGE", "images/inventoryimages/disguisehat_pig.tex"),
}

local prefabs = 
{
}

local function OnEquip(inst, owner) 
    local skin_build = inst:GetSkinBuild()
		if skin_build ~= nil then
            
            local skin_name = inst:GetSkinName()
            if skin_name ~= nil then
                owner:PushEvent("equipskinneditem", skin_name)
            else
                owner:PushEvent("equipskinneditem", skin_build)
            end
			
            owner.AnimState:OverrideItemSkinSymbol("swap_hat", "hat_disguise", "swap_hat", inst.GUID, build)
		else
			owner.AnimState:OverrideSymbol("swap_hat", "hat_disguise", "swap_hat")
		end
	
    owner.AnimState:Show("HAT")
    --owner.AnimState:Show("HAT_HAIR")
    if owner:HasTag("player") then
    --    owner.AnimState:Hide("HEAD")
    --    owner.AnimState:Show("HEAD_HAT")	
    end
	
	if owner:HasTag("monster") then
        owner:AddTag("unmonster")  --Used to be monster
		owner:RemoveTag("monster")
    end
	if owner:HasTag("merm") then
        owner:AddTag("unmerm")  --Used to be merm
		owner:RemoveTag("merm")
		owner:RemoveTag("mermguard")
		owner:RemoveTag("mermfluent")
    end
    if owner:HasTag("spiderwhisperer") then
        owner:AddTag("unspider")  --Used to be spiderwhisperer
        owner:RemoveTag("spiderwhisperer")
        owner.components.leader:RemoveFollowersByTag("spider")
    end
	
	-- if inst.components.fueled ~= nil then
 --       inst.components.fueled:StartConsuming()
 --    end
end

local function OnUnequip(inst, owner) 

	local skin_build = inst:GetSkinBuild()
	if skin_build ~= nil then
		local skin_name = inst:GetSkinName()
		if skin_name ~= nil then
			owner:PushEvent("unequipskinneditem", skin_name)
		else
			owner:PushEvent("unequipskinneditem", skin_build)
		end
	end
	
	if owner:HasTag("unmonster") then
        owner:AddTag("monster")    --Back to moster
		owner:RemoveTag("unmonster")
        owner.components.leader:RemoveFollowersByTag("pig")
        owner.components.leader:RemoveFollowersByTag("catcoon")
    end
    if owner:HasTag("unspider") then
        owner:AddTag("spiderwhisperer")  --Back to spider
        owner:RemoveTag("unspider")
    end
	if owner:HasTag("unmerm") then
        owner:RemoveTag("unmerm")  --Used to be merm
		owner:AddTag("merm")
		owner:AddTag("mermguard")
		owner:AddTag("mermfluent")
        owner.components.leader:RemoveFollowersByTag("pig")
        owner.components.leader:RemoveFollowersByTag("catcoon")
    end

    owner.AnimState:Hide("HAT")
    if owner:HasTag("player") then
    owner.AnimState:Show("HEAD")
    end
	
	-- if inst.components.fueled ~= nil then
 --       inst.components.fueled:StopConsuming()
 --    end
end

local function fn()

    local inst = CreateEntity()
    
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
	
	inst.entity:AddSoundEmitter()
	
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("disguise")
    inst.AnimState:SetBuild("hat_disguise")
    inst.AnimState:PlayAnimation("anim")

    inst:AddTag("hat")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()
	
    inst:AddComponent("inspectable")
    inst:AddComponent("tradable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "disguisehat_pig"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/disguisehat_pig.xml"
	
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)
	inst.components.equippable.dapperness = 0
	
	-- if hatnormal then
	-- inst:AddComponent("fueled")
 --    inst.components.fueled.fueltype = FUELTYPE.USAGE
 --    inst.components.fueled:InitializeFuelLevel(TUNING.STRAWHAT_PERISHTIME)
 --    inst.components.fueled:SetDepletedFn(inst.Remove)
	-- elseif hathard then
	-- inst:AddComponent("fueled")
 --    inst.components.fueled.fueltype = FUELTYPE.USAGE
 --    inst.components.fueled:InitializeFuelLevel(TUNING.SPIDERHAT_PERISHTIME)
 --    inst.components.fueled:SetDepletedFn(inst.Remove)
	-- end
	

    MakeHauntableLaunch(inst)

    return inst
end

return  Prefab("common/inventory/disguisehat_pig", fn, assets, prefabs)
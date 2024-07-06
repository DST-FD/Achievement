local assets =
{ 
    Asset("ANIM", "anim/hat_bat.zip"),

    Asset("ATLAS", "images/inventoryimages/new_inventory.xml"),
    Asset("IMAGE", "images/inventoryimages/new_inventory.tex"),
}

local prefabs = 
{
}

local function OnEquip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_hat", "hat_bat", "swap_hat")
    owner.AnimState:Show("HAT")
    owner.AnimState:Show("HAT_HAIR")
    owner.AnimState:Hide("HAIR_NOHAT")
    owner.AnimState:Hide("HAIR")

    if owner:HasTag("player") then
        owner.AnimState:Hide("HEAD")
        owner.AnimState:Show("HEAD_HAT")
    end

	if not (owner:HasTag("wasmonster") or owner:HasTag("wasspiderwhisperer") or owner:HasTag("wasmerm")) then
        if owner:HasTag("monster") then
            owner:AddTag("wasmonster")
        end
        if owner:HasTag("spiderwhisperer") then
            owner:AddTag("wasspiderwhisperer")
        end
		if owner:HasTag("merm") then
            owner:AddTag("wasmerm")
		end
    end
	if not owner:HasTag("wasmonster") then
        owner:AddTag("monster")  --Used to be monster
        owner.components.leader:RemoveFollowersByTag("pig")
        owner.components.leader:RemoveFollowersByTag("catcoon")
    end
    if not owner:HasTag("wasspiderwhisperer") then
        owner:AddTag("spiderwhisperer")
    end
    if not owner:HasTag("wasspiderwhisperer") then
        owner:AddTag("spiderwhisperer")
    end
	
	-- if inst.components.fueled ~= nil then
 --       inst.components.fueled:StartConsuming()
 --    end
end

local function OnUnequip(inst, owner) 
    owner.AnimState:ClearOverrideSymbol("swap_hat")
    owner.AnimState:Hide("HAT")
    owner.AnimState:Hide("HAT_HAIR")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")

    if owner:HasTag("player") then
        owner.AnimState:Show("HEAD")
        owner.AnimState:Hide("HEAD_HAT")
    end

	if not owner:HasTag("wasmonster") then
		owner:RemoveTag("monster")
    end
    if not owner:HasTag("wasspiderwhisperer") then
        owner:RemoveTag("spiderwhisperer")
        owner.components.leader:RemoveFollowersByTag("spider")
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
    inst.AnimState:SetBuild("hat_bat")
    inst.AnimState:PlayAnimation("anim")

    inst:AddTag("hat")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()
	
    inst:AddComponent("inspectable")
    inst:AddComponent("tradable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "bathat"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/new_inventory.xml"
	
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

return  Prefab("common/inventory/disguisehat_spider", fn, assets, prefabs)
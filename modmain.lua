local _G = GLOBAL
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local Recipe = GLOBAL.Recipe
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH

local TUNING = _G.TUNING
local CUSTOM_RECIPETABS = _G.CUSTOM_RECIPETABS

local FRAMES = GLOBAL.FRAMES
local ACTIONS = GLOBAL.ACTIONS
local State = GLOBAL.State
local EventHandler = GLOBAL.EventHandler
local ActionHandler = GLOBAL.ActionHandler
local TimeEvent = GLOBAL.TimeEvent

_G.HARD = GetModConfigData('COST')
_G.SPEEDLIM = GetModConfigData('SPEEDLIMIT')
_G.MODE = ""
if _G.HARD then
    require 'AllAchiv/allachivbalancehard'
    _G.MODE = "_hard"
else
    require 'AllAchiv/allachivbalance'
end

require "AllAchiv/allachivrpc"

local MANRESPAWN = GetModConfigData('MANDRAKEBOI')
if MANRESPAWN then
    if GLOBAL.STRINGS.NAMES.MIGRATION_PORTAL then
        AddPrefabPostInit("forest", function(inst)
            if inst.ismastersim then
                inst:AddComponent("minspawner")
            end
        end)
    else
        AddPrefabPostInit("world", function(inst)
            if inst.ismastersim then
                inst:AddComponent("minspawner")
            end
        end)
    end
end

PrefabFiles = {
    "seffc",
    "klaussack_placer",
    "achivbooks",
    --"pigking",
    --"pigman",
    "perd",
    "berrybush",
    "bundle",
    "klaus",
    "klaus_sack",
    "antlion",
    "shadowwaxwell",
    "perkportableblender",
    "perkportablecookpot",
    "perkportablespicer",
    "winter_tree",
    "disguisehat_pig",
    "disguisehat_spider",
}

_G.SECONDRUN = GetModConfigData('SECOND')

require 'AllAchiv/strings_acm_e'
TUNING.AllAchivLan = "en"

Assets = {
    Asset("ATLAS", "images/inventoryimages/klaussack.xml"),
    Asset("IMAGE", "images/inventoryimages/klaussack.tex"),

    Asset("ATLAS", "images/inventoryimages/achivbook_birds.xml"),
    Asset("IMAGE", "images/inventoryimages/achivbook_birds.tex"),

    Asset("ATLAS", "images/inventoryimages/achivbook_brimstone.xml"),
    Asset("IMAGE", "images/inventoryimages/achivbook_brimstone.tex"),

    Asset("ATLAS", "images/inventoryimages/achivbook_gardening.xml"),
    Asset("IMAGE", "images/inventoryimages/achivbook_gardening.tex"),

    Asset("ATLAS", "images/inventoryimages/achivbook_sleep.xml"),
    Asset("IMAGE", "images/inventoryimages/achivbook_sleep.tex"),

    Asset("ATLAS", "images/inventoryimages/achivbook_tentacles.xml"),
    Asset("IMAGE", "images/inventoryimages/achivbook_tentacles.tex"),

    Asset("ATLAS", "images/inventoryimages/perkportablespicer.xml"),
    Asset("IMAGE", "images/inventoryimages/perkportablespicer.tex"),

    Asset("ATLAS", "images/inventoryimages/perkportableblender.xml"),
    Asset("IMAGE", "images/inventoryimages/perkportableblender.tex"),

    Asset("ATLAS", "images/inventoryimages/perkportablecookpot.xml"),
    Asset("IMAGE", "images/inventoryimages/perkportablecookpot.tex"),

    Asset("IMAGE", "images/inventoryimages/disguisehat_pig.tex"),
    Asset("ATLAS", "images/inventoryimages/disguisehat_pig.xml"),

    Asset("IMAGE", "images/inventoryimages/new_inventory.tex"),
    Asset("ATLAS", "images/inventoryimages/new_inventory.xml"),

    Asset("ATLAS", "images/hud/bigtitle_en.xml"),
    Asset("IMAGE", "images/hud/bigtitle_en.tex"),

    Asset("ATLAS", "images/hud/achivbg_act.xml"),
    Asset("IMAGE", "images/hud/achivbg_act.tex"),
    Asset("ATLAS", "images/hud/achivbg_dact.xml"),
    Asset("IMAGE", "images/hud/achivbg_dact.tex"),

    Asset("ATLAS", "images/button/cat1_act.xml"),
    Asset("IMAGE", "images/button/cat1_act.tex"),
    Asset("ATLAS", "images/button/cat1_dact.xml"),
    Asset("IMAGE", "images/button/cat1_dact.tex"),

    Asset("ATLAS", "images/button/cat2_act.xml"),
    Asset("IMAGE", "images/button/cat2_act.tex"),
    Asset("ATLAS", "images/button/cat2_dact.xml"),
    Asset("IMAGE", "images/button/cat2_dact.tex"),

    Asset("ATLAS", "images/button/cat3_act.xml"),
    Asset("IMAGE", "images/button/cat3_act.tex"),
    Asset("ATLAS", "images/button/cat3_dact.xml"),
    Asset("IMAGE", "images/button/cat3_dact.tex"),

    Asset("ATLAS", "images/button/cat4_act.xml"),
    Asset("IMAGE", "images/button/cat4_act.tex"),
    Asset("ATLAS", "images/button/cat4_dact.xml"),
    Asset("IMAGE", "images/button/cat4_dact.tex"),

    Asset("ATLAS", "images/button/cat5_act.xml"),
    Asset("IMAGE", "images/button/cat5_act.tex"),
    Asset("ATLAS", "images/button/cat5_dact.xml"),
    Asset("IMAGE", "images/button/cat5_dact.tex"),

    Asset("ATLAS", "images/button/cat6_act.xml"),
    Asset("IMAGE", "images/button/cat6_act.tex"),
    Asset("ATLAS", "images/button/cat6_dact.xml"),
    Asset("IMAGE", "images/button/cat6_dact.tex"),

    Asset("ATLAS", "images/button/cat7_act.xml"),
    Asset("IMAGE", "images/button/cat7_act.tex"),
    Asset("ATLAS", "images/button/cat7_dact.xml"),
    Asset("IMAGE", "images/button/cat7_dact.tex"),

    Asset("ATLAS", "images/button/cat8_act.xml"),
    Asset("IMAGE", "images/button/cat8_act.tex"),
    Asset("ATLAS", "images/button/cat8_dact.xml"),
    Asset("IMAGE", "images/button/cat8_dact.tex"),

    Asset("ATLAS", "images/button/cat9_act.xml"),
    Asset("IMAGE", "images/button/cat9_act.tex"),
    Asset("ATLAS", "images/button/cat9_dact.xml"),
    Asset("IMAGE", "images/button/cat9_dact.tex"),

    Asset("ATLAS", "images/button/coin_act.xml"),
    Asset("IMAGE", "images/button/coin_act.tex"),
    Asset("ATLAS", "images/button/coin_dact.xml"),
    Asset("IMAGE", "images/button/coin_dact.tex"),

    Asset("ATLAS", "images/button/coin_end_act.xml"),
    Asset("IMAGE", "images/button/coin_end_act.tex"),
    Asset("ATLAS", "images/button/coin_end_dact.xml"),
    Asset("IMAGE", "images/button/coin_end_dact.tex"),

    Asset("ATLAS", "images/button/close.xml"),
    Asset("IMAGE", "images/button/close.tex"),

    Asset("ATLAS", "images/button/infobutton.xml"),
    Asset("IMAGE", "images/button/infobutton.tex"),

    Asset("ATLAS", "images/button/info_en.xml"),
    Asset("IMAGE", "images/button/info_en.tex"),

    Asset("ATLAS", "images/button/checkbutton.xml"),
    Asset("IMAGE", "images/button/checkbutton.tex"),

    Asset("ATLAS", "images/button/checkbuttonglow.xml"),
    Asset("IMAGE", "images/button/checkbuttonglow.tex"),

    Asset("ATLAS", "images/button/coinbutton.xml"),
    Asset("IMAGE", "images/button/coinbutton.tex"),

    Asset("ATLAS", "images/button/coinbuttonglow.xml"),
    Asset("IMAGE", "images/button/coinbuttonglow.tex"),

    Asset("ATLAS", "images/button/config_act.xml"),
    Asset("IMAGE", "images/button/config_act.tex"),

    Asset("ATLAS", "images/button/config_dact.xml"),
    Asset("IMAGE", "images/button/config_dact.tex"),

    Asset("ATLAS", "images/button/config_bg.xml"),
    Asset("IMAGE", "images/button/config_bg.tex"),

    Asset("ATLAS", "images/button/config_bigger.xml"),
    Asset("IMAGE", "images/button/config_bigger.tex"),

    Asset("ATLAS", "images/button/config_smaller.xml"),
    Asset("IMAGE", "images/button/config_smaller.tex"),

    Asset("ATLAS", "images/button/config_drag.xml"),
    Asset("IMAGE", "images/button/config_drag.tex"),

    Asset("ATLAS", "images/button/config_remove.xml"),
    Asset("IMAGE", "images/button/config_remove.tex"),

    Asset("ATLAS", "images/button/remove_info_en.xml"),
    Asset("IMAGE", "images/button/remove_info_en.tex"),

    Asset("ATLAS", "images/button/remove_yes.xml"),
    Asset("IMAGE", "images/button/remove_yes.tex"),

    Asset("ATLAS", "images/button/remove_no.xml"),
    Asset("IMAGE", "images/button/remove_no.tex"),
    
-----Tab
    Asset( "ATLAS", "images/inventoryimages/perk_tab.xml" ),   
}

-- -----------------------------------------------------Perk Items---------------------------------------------------------
STRINGS.NAMES.PERK_TAB = "REWARD"
STRINGS.TABS.PERK_TAB = "Rewards"
GLOBAL.RECIPETABS['PERK_TAB'] = {str = "PERK_TAB", sort=25, icon = "perk_tab.tex", icon_atlas = "images/inventoryimages/perk_tab.xml"}
-- -----------------------------------------------------Mask Perk---------------------------------------------------------

AddRecipe("disguisehat_pig", {Ingredient("pigskin", 1) , Ingredient("beardhair", 2) , Ingredient("twigs", 4)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, nil, "perkdisguise",
"images/inventoryimages/disguisehat_pig.xml", "disguisehat_pig.tex")

AddRecipe("disguisehat_spider", {Ingredient("silk", 4) , Ingredient("beardhair", 4) , Ingredient("twigs", 4)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, nil, "perkdisguise",
"images/inventoryimages/new_inventory.xml", "bathat.tex")

-- -----------------------------------------------------Book Perk---------------------------------------------------------

AddRecipe("achivbook_birds", {Ingredient("papyrus", 2),Ingredient("bird_egg", 2)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, nil, "achivbookbuilder", 
"images/inventoryimages.xml", "book_birds.tex" )

AddRecipe("achivbook_gardening", {Ingredient("papyrus", 2), Ingredient("seeds", 1), Ingredient("poop", 1)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, nil, "achivbookbuilder", 
"images/inventoryimages.xml", "book_gardening.tex" )

AddRecipe("achivbook_sleep", {Ingredient("papyrus", 2), Ingredient("nightmarefuel", 2)}, 
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, nil, "achivbookbuilder", 
"images/inventoryimages.xml", "book_sleep.tex" )

AddRecipe("achivbook_brimstone", {Ingredient("papyrus", 2), Ingredient("redgem", 1)}, 
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, nil, "achivbookbuilder", 
"images/inventoryimages.xml", "book_brimstone.tex" )

AddRecipe("achivbook_tentacles", {Ingredient("papyrus", 2), Ingredient("tentaclespots", 1)}, 
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, nil, "achivbookbuilder", 
"images/inventoryimages.xml", "book_tentacles.tex" )

-- -----------------------------------------------------Cuisine Perk---------------------------------------------------------
--ReAdd for Warly
AddRecipe("portablecookpot_item", {Ingredient("goldnugget", 2) , Ingredient("charcoal", 6) , Ingredient("twigs", 6)},
GLOBAL.RECIPETABS.FARM, TECH.NONE, nil, nil, nil, nil, "realchef")
AddRecipe("portableblender_item", {Ingredient("goldnugget", 2) , Ingredient("transistor", 2) , Ingredient("twigs", 4)},
GLOBAL.RECIPETABS.FARM, TECH.NONE, nil, nil, nil, nil, "realchef")
AddRecipe("portablespicer_item", {Ingredient("goldnugget", 2) , Ingredient("cutstone", 3) , Ingredient("twigs", 6)},
GLOBAL.RECIPETABS.FARM, TECH.NONE, nil, nil, nil, nil, "realchef")

--Add for chef perk
AddRecipe("perkportablecookpot", {Ingredient("goldnugget", 6) , Ingredient("charcoal", 6) , Ingredient("twigs", 6)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, nil, "perkchef",
"images/inventoryimages1.xml", "portablecookpot_item.tex")
AddRecipe("perkportableblender", {Ingredient("goldnugget", 6) , Ingredient("transistor", 4) , Ingredient("twigs", 6)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, nil, "perkchef",
"images/inventoryimages1.xml", "portableblender_item.tex")
AddRecipe("perkportablespicer", {Ingredient("goldnugget", 6) , Ingredient("cutstone", 6) , Ingredient("twigs", 6)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, nil, "perkchef",
"images/inventoryimages1.xml", "portablespicer_item.tex")

-- -----------------------------------------------------Sack Perk---------------------------------------------------------

AddRecipe("klaus_sack", {Ingredient("redmooneye",1),Ingredient("bluemooneye",1),Ingredient("silk",8)}, GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, 
"klaussack_placer", --placer
nil, -- min_spacing
nil, -- nounlock
nil, -- numtogive
"achiveking", -- builder_tag
"images/inventoryimages/klaussack.xml", -- atlas
"klaussack.tex") -- image

--添加克劳斯背包钥匙建造
AddRecipe("deer_antler1", {Ingredient("boneshard",2),Ingredient("twigs",1)}, GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, 
nil, --placer
nil, -- min_spacing
nil, -- nounlock
nil, -- numtogive
"achiveking", -- builder_tag
"images/inventoryimages.xml", -- atlas
"deer_antler1.tex") -- image

-- -----------------------------------------------------Festive Perk---------------------------------------------------------

local perk_festive_gobbler = AddRecipe("perdshrine_perk", {Ingredient("goldnugget", 8), Ingredient("boards", 2), Ingredient("poop", 3)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, "perdshrine_placer", nil, nil, nil, "festive")
perk_festive_gobbler.image = "perdshrine.tex"
perk_festive_gobbler.product = "perdshrine"
GLOBAL.STRINGS.RECIPE_DESC.PERDSHRINE_PERK = GLOBAL.STRINGS.RECIPE_DESC.PERDSHRINE
GLOBAL.STRINGS.NAMES.PERDSHRINE_PERK = GLOBAL.STRINGS.NAMES.PERDSHRINE

local perk_festive_varg = AddRecipe("wargshrine_perk", {Ingredient("goldnugget", 8), Ingredient("boards", 2), Ingredient("houndstooth", 4)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, "wargshrine_placer", nil, nil, nil, "festive")
perk_festive_varg.image = "wargshrine.tex"
perk_festive_varg.product = "wargshrine"
GLOBAL.STRINGS.RECIPE_DESC.WARGSHRINE_PERK = GLOBAL.STRINGS.RECIPE_DESC.WARGSHRINE
GLOBAL.STRINGS.NAMES.WARGSHRINE_PERK = GLOBAL.STRINGS.NAMES.WARGSHRINE

local perk_festive_pig = AddRecipe("pigshrine_perk", {Ingredient("goldnugget", 8), Ingredient("boards", 2), Ingredient("pigskin", 2)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, "pigshrine_placer", nil, nil, nil, "festive")
perk_festive_pig.image = "pigshrine.tex"
perk_festive_pig.product = "pigshrine"
GLOBAL.STRINGS.RECIPE_DESC.PIGSHRINE_PERK = GLOBAL.STRINGS.RECIPE_DESC.PIGSHRINE
GLOBAL.STRINGS.NAMES.PIGSHRINE_PERK = GLOBAL.STRINGS.NAMES.PIGSHRINE

local perk_festive_lab = AddRecipe("madscience_lab_perk", {Ingredient("transistor", 2), Ingredient("cutstone", 2), Ingredient("phlegm", 1)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, "madscience_lab_placer", nil, nil, nil, "festive")
perk_festive_lab.image = "madscience_lab.tex"
perk_festive_lab.product = "madscience_lab"
GLOBAL.STRINGS.RECIPE_DESC.MADSCIENCE_LAB_PERK = GLOBAL.STRINGS.RECIPE_DESC.MADSCIENCE_LAB
GLOBAL.STRINGS.NAMES.MADSCIENCE_LAB_PERK = GLOBAL.STRINGS.NAMES.MADSCIENCE_LAB

local perk_festive_bag = AddRecipe("candybag_perk", {Ingredient("cutgrass", 6)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, nil, "festive")
perk_festive_bag.image = "candybag.tex"
perk_festive_bag.product = "candybag"
GLOBAL.STRINGS.RECIPE_DESC.CANDYBAG_PERK = GLOBAL.STRINGS.RECIPE_DESC.CANDYBAG
GLOBAL.STRINGS.NAMES.CANDYBAG_PERK = GLOBAL.STRINGS.NAMES.CANDYBAG

local perk_festive_tree = AddRecipe("winter_treestand_perk", {Ingredient("poop", 4), Ingredient("boards", 2)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, "winter_treestand_placer", nil, nil, nil, "festive")
perk_festive_tree.image = "winter_treestand.tex"
perk_festive_tree.product = "winter_treestand"
GLOBAL.STRINGS.RECIPE_DESC.WINTER_TREESTAND_PERK = GLOBAL.STRINGS.RECIPE_DESC.WINTER_TREESTAND
GLOBAL.STRINGS.NAMES.WINTER_TREESTAND_PERK = GLOBAL.STRINGS.NAMES.WINTER_TREESTAND

local perk_festive_wrap = AddRecipe("giftwrap_perk", {Ingredient("papyrus", 1), Ingredient("petals", 1)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, 2, "festive")
perk_festive_wrap.image = "giftwrap.tex"
perk_festive_wrap.product = "giftwrap"
GLOBAL.STRINGS.RECIPE_DESC.GIFTWRAP_PERK = GLOBAL.STRINGS.RECIPE_DESC.GIFTWRAP
GLOBAL.STRINGS.NAMES.GIFTWRAP_PERK = GLOBAL.STRINGS.NAMES.GIFTWRAP

-- -----------------------------------------------------------------------------------------------------------------------

local namelist = {
	"intogame",
	"firsteat",
	"supereat",
	"danding",
	"messiah",
	"walkalot",
	"stopalot",
	"tooyoung",
	"evil",
	"snake",
	"deathalot",
	"nosanity",
	"sick",
	"coldblood",
	"burn",
	"freeze",
	"goodman",
	"brother",
	"fishmaster",
	"pickappren",
	"pickmaster",
	"chopappren",
	"chopmaster",
	"mineappren",
	"minemaster",
	"cookappren",
	"cookmaster",
	"buildappren",
	"buildmaster",
	"longage",
	"noob",
	"luck",
	"black",
	"tank",
	"angry",
	"starve",
	"icebody",
	"firebody",
	"moistbody",
	"santa",
	"knight",
	"bishop",
	"rook",
	"ancient",
	"rigid",
	"queen",
	"king",
	"all",
	"catperson",
	"rose",
	"butcher",
	"weetusk",
	"mossling",
	"goatperd",
	"secondchance",
	"nature",
	"alldiet",
	"spooder",
	"hentai",
	"hutch",
	"minotaur",
	"sand",
	"sleep",
	"trader",
	"fuzzy",
    "pet",
    "birdclop",
    "caveage",
    "eathot",
    "eatcold",
    "rot",
    "knowledge",
    "dance",
    "oldage",
    "teleport",
    "rocklob",
    "superstar",
    "horror",
    "malb",
    "revenge",
    "beefalo",
    "antdeath",
    "pacifist",
    "kite",
}

for k,v in pairs(namelist) do
    table.insert(Assets, Asset("ATLAS", "images/hud/achivtile_act_"..TUNING.AllAchivLan.."_"..v..".xml"))
    table.insert(Assets, Asset("IMAGE", "images/hud/achivtile_act_"..TUNING.AllAchivLan.."_"..v..".tex"))
    table.insert(Assets, Asset("ATLAS", "images/hud/achivtile_dact_"..TUNING.AllAchivLan.."_"..v..".xml"))
    table.insert(Assets, Asset("IMAGE", "images/hud/achivtile_dact_"..TUNING.AllAchivLan.."_"..v..".tex"))
	-- table.insert(Assets, Asset("ATLAS", "images/hud/achivtile_act_en_"..v..".xml"))
 --    table.insert(Assets, Asset("IMAGE", "images/hud/achivtile_act_en_"..v..".tex"))
 --    table.insert(Assets, Asset("ATLAS", "images/hud/achivtile_dact_en_"..v..".xml"))
 --    table.insert(Assets, Asset("IMAGE", "images/hud/achivtile_dact_en_"..v..".tex"))
end

local coinlist = {
	"hungerup",
	"sanityup",
	"healthup",
	"hungerrateup",
	"healthregen",
	"sanityregen",
	"speedup",
	"damageup",
	"absorbup",
	"crit",
	"fireflylight",
	"nomoist",
	"doubledrop",
	"goodman",
	"fishmaster",
	"pickmaster",
	"chopmaster",
	"cookmaster",
	"buildmaster",
	"refresh",
	"icebody",
	"firebody",
	"supply",
	"reader",
    "masterchef",
    "festive",
    "minemaster",
    "disguise",
    "nanobots",
    "fastworker",
}

for k,v in pairs(coinlist) do
    table.insert(Assets, Asset("ATLAS", "images/coin_"..TUNING.AllAchivLan.."/"..v.."".._G.MODE..".xml"))
    table.insert(Assets, Asset("IMAGE", "images/coin_"..TUNING.AllAchivLan.."/"..v.."".._G.MODE..".tex"))
    -- table.insert(Assets, Asset("ATLAS", "images/coin_en/"..v.."".._G.MODE..".xml"))
    -- table.insert(Assets, Asset("IMAGE", "images/coin_en/"..v.."".._G.MODE..".tex"))
end

--预运行
AddPlayerPostInit(function(inst)
	inst.checkintogame = GLOBAL.net_shortint(inst.GUID,"checkintogame")
	inst.checkfirsteat = GLOBAL.net_shortint(inst.GUID,"checkfirsteat")
	inst.checksupereat = GLOBAL.net_shortint(inst.GUID,"checksupereat")
	inst.checkdanding = GLOBAL.net_shortint(inst.GUID,"checkdanding")
    inst.checkmessiah = GLOBAL.net_shortint(inst.GUID,"checkmessiah")
    inst.checkwalkalot = GLOBAL.net_shortint(inst.GUID,"checkwalkalot")
    inst.checkstopalot = GLOBAL.net_shortint(inst.GUID,"checkstopalot")
    inst.checktooyoung = GLOBAL.net_shortint(inst.GUID,"checktooyoung")
    inst.checkevil = GLOBAL.net_shortint(inst.GUID,"checkevil")
    inst.checksnake = GLOBAL.net_shortint(inst.GUID,"checksnake")
    inst.checkdeathalot = GLOBAL.net_shortint(inst.GUID,"checkdeathalot")
    inst.checknosanity = GLOBAL.net_shortint(inst.GUID,"checknosanity")
    inst.checksick = GLOBAL.net_shortint(inst.GUID,"checksick")
    inst.checkcoldblood = GLOBAL.net_shortint(inst.GUID,"checkcoldblood")
    inst.checkburn = GLOBAL.net_shortint(inst.GUID,"checkburn")
    inst.checkfreeze = GLOBAL.net_shortint(inst.GUID,"checkfreeze")
    inst.checksleep = GLOBAL.net_shortint(inst.GUID,"checksleep")
    inst.checkgoodman = GLOBAL.net_shortint(inst.GUID,"checkgoodman")
    inst.checkbrother = GLOBAL.net_shortint(inst.GUID,"checkbrother")
    inst.checkfishmaster = GLOBAL.net_shortint(inst.GUID,"checkfishmaster")
    inst.checkpickappren = GLOBAL.net_shortint(inst.GUID,"checkpickappren")
    inst.checkpickmaster = GLOBAL.net_shortint(inst.GUID,"checkpickmaster")
    inst.checkchopappren = GLOBAL.net_shortint(inst.GUID,"checkchopappren")
    inst.checkchopmaster = GLOBAL.net_shortint(inst.GUID,"checkchopmaster")
    inst.checkmineappren = GLOBAL.net_shortint(inst.GUID,"checkmineappren")
    inst.checkminemaster = GLOBAL.net_shortint(inst.GUID,"checkminemaster")
    inst.checknoob = GLOBAL.net_shortint(inst.GUID,"checknoob")
    inst.checkcookappren = GLOBAL.net_shortint(inst.GUID,"checkcookappren")
    inst.checkcookmaster = GLOBAL.net_shortint(inst.GUID,"checkcookmaster")
    inst.checklongage = GLOBAL.net_shortint(inst.GUID,"checklongage")
    inst.checkluck = GLOBAL.net_shortint(inst.GUID,"checkluck")
    inst.checkblack = GLOBAL.net_shortint(inst.GUID,"checkblack")
    inst.checkbuildappren = GLOBAL.net_shortint(inst.GUID,"checkbuildappren")
    inst.checkbuildmaster = GLOBAL.net_shortint(inst.GUID,"checkbuildmaster")
    inst.checktank = GLOBAL.net_shortint(inst.GUID,"checktank")
    inst.checkangry = GLOBAL.net_shortint(inst.GUID,"checkangry")
    inst.checkicebody = GLOBAL.net_shortint(inst.GUID,"checkicebody")
    inst.checkfirebody = GLOBAL.net_shortint(inst.GUID,"checkfirebody")
    inst.checksanta = GLOBAL.net_shortint(inst.GUID,"checksanta")
    inst.checkknight = GLOBAL.net_shortint(inst.GUID,"checkknight")
    inst.checkbishop = GLOBAL.net_shortint(inst.GUID,"checkbishop")
    inst.checkrook = GLOBAL.net_shortint(inst.GUID,"checkrook")
    inst.checkancient = GLOBAL.net_shortint(inst.GUID,"checkancient")
    inst.checkminotaur = GLOBAL.net_shortint(inst.GUID,"checkminotaur")
    inst.checkrigid = GLOBAL.net_shortint(inst.GUID,"checkrigid")
    inst.checkqueen = GLOBAL.net_shortint(inst.GUID,"checkqueen")
    inst.checkking = GLOBAL.net_shortint(inst.GUID,"checkking")
    inst.checkmoistbody = GLOBAL.net_shortint(inst.GUID,"checkmoistbody")
    inst.checkstarve = GLOBAL.net_shortint(inst.GUID,"checkstarve")
    inst.checkall = GLOBAL.net_shortint(inst.GUID,"checkall")
    inst.checkcatperson = GLOBAL.net_shortint(inst.GUID,"checkcatperson")
    inst.checkrose = GLOBAL.net_shortint(inst.GUID,"checkrose")
    inst.checkbutcher = GLOBAL.net_shortint(inst.GUID,"checkbutcher")
    inst.checkgoatperd = GLOBAL.net_shortint(inst.GUID,"checkgoatperd")
    inst.checkmossling = GLOBAL.net_shortint(inst.GUID,"checkmossling")
    inst.checkweetusk = GLOBAL.net_shortint(inst.GUID,"checkweetusk")
    inst.checksecondchance = GLOBAL.net_shortint(inst.GUID,"checksecondchance")
    inst.checknature = GLOBAL.net_shortint(inst.GUID,"checknature")
    inst.checkalldiet = GLOBAL.net_shortint(inst.GUID,"checkalldiet")
    inst.checkspooder = GLOBAL.net_shortint(inst.GUID,"checkspooder")
    inst.checkhutch = GLOBAL.net_shortint(inst.GUID,"checkhutch")
    inst.checkhentai = GLOBAL.net_shortint(inst.GUID,"checkhentai")
	inst.checksand = GLOBAL.net_shortint(inst.GUID,"checksand")
	inst.checktrader = GLOBAL.net_shortint(inst.GUID,"checktrader")
	inst.checkfuzzy = GLOBAL.net_shortint(inst.GUID,"checkfuzzy")
    inst.checkpet = GLOBAL.net_shortint(inst.GUID,"checkpet")
    inst.checkbirdclop = GLOBAL.net_shortint(inst.GUID,"checkbirdclop")
    inst.checkcaveage = GLOBAL.net_shortint(inst.GUID,"checkcaveage")
    inst.checkeathot = GLOBAL.net_shortint(inst.GUID,"checkeathot")
    inst.checkeatcold = GLOBAL.net_shortint(inst.GUID,"checkeatcold")
    inst.checkrot = GLOBAL.net_shortint(inst.GUID,"checkrot")
    inst.checkknowledge = GLOBAL.net_shortint(inst.GUID,"checkknowledge")
    inst.checkdance = GLOBAL.net_shortint(inst.GUID,"checkdance")
    inst.checkteleport = GLOBAL.net_shortint(inst.GUID,"checkteleport")
    inst.checkrocklob = GLOBAL.net_shortint(inst.GUID,"checkrocklob")
    inst.checksuperstar = GLOBAL.net_shortint(inst.GUID,"checksuperstar")
    inst.checkoldage = GLOBAL.net_shortint(inst.GUID,"checkoldage")
    inst.checkhorror = GLOBAL.net_shortint(inst.GUID,"checkhorror")
    inst.checkmalb = GLOBAL.net_shortint(inst.GUID,"checkmalb")
    inst.checkrevenge = GLOBAL.net_shortint(inst.GUID,"checkrevenge")
    inst.checkantdeath = GLOBAL.net_shortint(inst.GUID,"checkantdeath")
    inst.checkpacifist = GLOBAL.net_shortint(inst.GUID,"checkpacifist")
    inst.checkkite = GLOBAL.net_shortint(inst.GUID,"checkkite")
    inst.checkbeefalo = GLOBAL.net_shortint(inst.GUID,"checkbeefalo")

	inst.currenteatamount = GLOBAL.net_shortint(inst.GUID,"currenteatamount")
	inst.currenteatmonsterlasagna = GLOBAL.net_shortint(inst.GUID,"currenteatmonsterlasagna")
    inst.currentrespawnamount = GLOBAL.net_shortint(inst.GUID,"currentrespawnamount")
    inst.currentwalktime = GLOBAL.net_shortint(inst.GUID,"currentwalktime")
    inst.currentstoptime = GLOBAL.net_shortint(inst.GUID,"currentstoptime")
    inst.currentevilamount = GLOBAL.net_shortint(inst.GUID,"currentevilamount")
    inst.currentdeathamouth = GLOBAL.net_shortint(inst.GUID,"currentdeathamouth")
    inst.currentnosanitytime = GLOBAL.net_shortint(inst.GUID,"currentnosanitytime")
    inst.currentsnakeamount = GLOBAL.net_shortint(inst.GUID,"currentsnakeamount")
    inst.currentfriendpig = GLOBAL.net_shortint(inst.GUID,"currentfriendpig")
    inst.currentfriendbunny = GLOBAL.net_shortint(inst.GUID,"currentfriendbunny")
    inst.currentfishamount = GLOBAL.net_shortint(inst.GUID,"currentfishamount")
    inst.currentpickamount = GLOBAL.net_shortint(inst.GUID,"currentpickamount")
    inst.currentchopamount = GLOBAL.net_shortint(inst.GUID,"currentchopamount")
    inst.currentcookamount = GLOBAL.net_shortint(inst.GUID,"currentcookamount")
    inst.currentmineamount = GLOBAL.net_shortint(inst.GUID,"currentmineamount")
    inst.currentbuildamount = GLOBAL.net_shortint(inst.GUID,"currentbuildamount")
    inst.currentattackeddamage = GLOBAL.net_shortint(inst.GUID,"currentattackeddamage")
    inst.currentonhitdamage = GLOBAL.net_int(inst.GUID,"currentonhitdamage")
    inst.currenticetime = GLOBAL.net_shortint(inst.GUID,"currenticetime")
    inst.currentfiretime = GLOBAL.net_shortint(inst.GUID,"currentfiretime")
    inst.currentmoisttime = GLOBAL.net_shortint(inst.GUID,"currentmoisttime")
    inst.currentstarvetime = GLOBAL.net_shortint(inst.GUID,"currentstarvetime")
    inst.currentage = GLOBAL.net_shortint(inst.GUID,"currentage")
    inst.currentfriendcat = GLOBAL.net_shortint(inst.GUID,"currentfriendcat")
    inst.currentbutcheramount = GLOBAL.net_shortint(inst.GUID,"currentbutcheramount")
    inst.currentgoatperdamount = GLOBAL.net_shortint(inst.GUID,"currentgoatperdamount")
    inst.currentmosslingamount = GLOBAL.net_shortint(inst.GUID,"currentmosslingamount")
    inst.currentweetuskamount = GLOBAL.net_shortint(inst.GUID,"currentweetuskamount")
    inst.currentnatureamount = GLOBAL.net_shortint(inst.GUID,"currentnatureamount")
    inst.currenteatall = GLOBAL.net_shortint(inst.GUID,"currenteatall")
    inst.currentfriendspider = GLOBAL.net_shortint(inst.GUID,"currentfriendspider")
    inst.currenthentaiamount = GLOBAL.net_shortint(inst.GUID,"currenthentaiamount")
    inst.currenttradeamount = GLOBAL.net_shortint(inst.GUID,"currenttradeamount")
    inst.currentfuzzyamount = GLOBAL.net_shortint(inst.GUID,"currentfuzzyamount")
    inst.currentcavetime = GLOBAL.net_shortint(inst.GUID,"currentcavetime")
    inst.currenteathotamount = GLOBAL.net_shortint(inst.GUID,"currenteathotamount")
    inst.currenteatcoldamount = GLOBAL.net_shortint(inst.GUID,"currenteatcoldamount")
    inst.currentdanceamount = GLOBAL.net_shortint(inst.GUID,"currentdanceamount")
    inst.currentfriendrocky = GLOBAL.net_shortint(inst.GUID,"currentfriendrocky")
    inst.currentstarspent = GLOBAL.net_shortint(inst.GUID,"currentstarspent")
    inst.currentteleportamount = GLOBAL.net_shortint(inst.GUID,"currentteleportamount")
    inst.currenthorroramount = GLOBAL.net_shortint(inst.GUID,"currenthorroramount")
    inst.currentkiteamount = GLOBAL.net_shortint(inst.GUID,"currentkiteamount")
    inst.currentpacifisttime = GLOBAL.net_shortint(inst.GUID,"currentpacifisttime")

    inst.checkbosswinter = GLOBAL.net_shortint(inst.GUID,"checkbosswinter")
    inst.checkbossspring = GLOBAL.net_shortint(inst.GUID,"checkbossspring")
    inst.checkbossdragonfly = GLOBAL.net_shortint(inst.GUID,"checkbossdragonfly")
    inst.checkbossautumn = GLOBAL.net_shortint(inst.GUID,"checkbossautumn")

	inst.currentcoinamount = GLOBAL.net_shortint(inst.GUID,"currentcoinamount")

	inst.currenthungerup = GLOBAL.net_shortint(inst.GUID,"currenthungerup")
	inst.currentsanityup = GLOBAL.net_shortint(inst.GUID,"currentsanityup")
	inst.currenthealthup = GLOBAL.net_shortint(inst.GUID,"currenthealthup")
	inst.currenthealthregen = GLOBAL.net_shortint(inst.GUID,"currenthealthregen")
	inst.currentsanityregen = GLOBAL.net_shortint(inst.GUID,"currentsanityregen")
	inst.currenthungerrateup = GLOBAL.net_shortint(inst.GUID,"currenthungerrateup")
	inst.currentspeedup = GLOBAL.net_shortint(inst.GUID,"currentspeedup")
	inst.currentabsorbup = GLOBAL.net_shortint(inst.GUID,"currentabsorbup")
	inst.currentdamageup = GLOBAL.net_shortint(inst.GUID,"currentdamageup")
	inst.currentcrit = GLOBAL.net_shortint(inst.GUID,"currentcrit")

	inst.currentdoubledrop = GLOBAL.net_shortint(inst.GUID,"currentdoubledrop")
	inst.currentfireflylight = GLOBAL.net_shortint(inst.GUID,"currentfireflylight")
	inst.currentnomoist = GLOBAL.net_shortint(inst.GUID,"currentnomoist")
	inst.currentgoodman = GLOBAL.net_shortint(inst.GUID,"currentgoodman")
	inst.currentrefresh = GLOBAL.net_shortint(inst.GUID,"currentrefresh")
	inst.currentfishmaster = GLOBAL.net_shortint(inst.GUID,"currentfishmaster")
	inst.currentcookmaster = GLOBAL.net_shortint(inst.GUID,"currentcookmaster")
	inst.currentchopmaster = GLOBAL.net_shortint(inst.GUID,"currentchopmaster")
	inst.currentpickmaster = GLOBAL.net_shortint(inst.GUID,"currentpickmaster")
	inst.currentbuildmaster = GLOBAL.net_shortint(inst.GUID,"currentbuildmaster")
	inst.currenticebody = GLOBAL.net_shortint(inst.GUID,"currenticebody")
	inst.currentfirebody = GLOBAL.net_shortint(inst.GUID,"currentfirebody")
	inst.currentsupply = GLOBAL.net_shortint(inst.GUID,"currentsupply")
	inst.currentreader = GLOBAL.net_shortint(inst.GUID,"currentreader")
    inst.currentmasterchef = GLOBAL.net_shortint(inst.GUID,"currentmasterchef")
    inst.currentfestive = GLOBAL.net_shortint(inst.GUID,"currentfestive")
    inst.currentminemaster = GLOBAL.net_shortint(inst.GUID,"currentminemaster")
    inst.currentdisguise = GLOBAL.net_shortint(inst.GUID,"currentdisguise")
    inst.currentnanobots = GLOBAL.net_shortint(inst.GUID,"currentnanobots")
    inst.currentfastworker = GLOBAL.net_shortint(inst.GUID,"currentfastworker")
	
    inst:AddComponent("allachivevent")
	inst:AddComponent("allachivcoin")
	if not GLOBAL.TheNet:GetIsClient() then
		inst.components.allachivevent:Init(inst)
		inst.components.allachivcoin:Init(inst)
	end
end)

--UI尺寸
local function PositionUI(self, screensize)
	local hudscale = self.top_root:GetScale()
	self.uiachievement:SetScale(.72*hudscale.x,.72*hudscale.y,1)
	--self.uiachievement.mainbutton.hudscale = self.top_root:GetScale()
end

--UI
local uiachievement = require("widgets/uiachievement")
local function Adduiachievement(self)
    self.uiachievement = self.top_root:AddChild(uiachievement(self.owner))
    local screensize = {GLOBAL.TheSim:GetScreenSize()}
    PositionUI(self, screensize)
    self.uiachievement:SetHAnchor(0)
    self.uiachievement:SetVAnchor(0)
    --H: 0=中间 1=左端 2=右端
    --V: 0=中间 1=顶端 2=底端
    self.uiachievement:MoveToFront()
    local OnUpdate_base = self.OnUpdate
	self.OnUpdate = function(self, dt)
		OnUpdate_base(self, dt)
		local curscreensize = {GLOBAL.TheSim:GetScreenSize()}
		if curscreensize[1] ~= screensize[1] or curscreensize[2] ~= screensize[2] then
			PositionUI(self, curscreensize)
			screensize = curscreensize
		end
	end
end
AddClassPostConstruct("widgets/controls", Adduiachievement)

--欧皇检测
AddPrefabPostInit("krampus_sack", function(inst)
    inst:AddComponent("ksmark")
end)
AddPrefabPostInit("klaussackkey", function(inst)
    inst:AddComponent("ksmark")
end)
AddPrefabPostInit("warly", function(inst)
    inst:AddTag("realchef")
end)
AddPrefabPostInit("tallbird", function(inst)
    inst:AddComponent("matricide")
    inst.components.matricide:Init(inst)
end)


AddPlayerPostInit(function(inst)
    STRINGS.CHARACTERS.GENERIC.ANNOUNCE_EAT['GENERIC'] = ""
    STRINGS.CHARACTERS.GENERIC.ACTIONFAIL['COOK']['GENERIC'] = ""
    local name = string.upper(inst.prefab)
    if STRINGS.CHARACTERS[name] then

        if STRINGS.CHARACTERS[name].ANNOUNCE_EAT then
            if STRINGS.CHARACTERS[name].ANNOUNCE_EAT['GENERIC'] then
                STRINGS.CHARACTERS[name].ANNOUNCE_EAT['GENERIC'] = ""
            end
        end

        if STRINGS.CHARACTERS[name].ACTIONFAIL then
            if STRINGS.CHARACTERS[name].ACTIONFAIL['COOK'] then
                if STRINGS.CHARACTERS[name].ACTIONFAIL['COOK']['GENERIC'] then
                    STRINGS.CHARACTERS[name].ACTIONFAIL['COOK']['GENERIC'] = ""
                end
            end
        end

        local b = false

        if STRINGS.CHARACTERS[name].DESCRIBE then
            if STRINGS.CHARACTERS[name].DESCRIBE["spider_moon"] then
                if STRING.CHARACTERS[name].DESCRIBE["spider_moon"].GENERIC  then
                    b = true
                end
            end
        end

        if b == false then
            inst:AddTag("nohorror")
        end

        STRINGS.CHARACTERS[name].DESCRIBE.PERKPORTABLEBLENDER = GLOBAL.STRINGS.CHARACTERS[name].DESCRIBE.PORTABLEBLENDER_ITEM
        STRINGS.CHARACTERS[name].DESCRIBE.PERKPORTABLESPICER = GLOBAL.STRINGS.CHARACTERS[name].DESCRIBE.PORTABLESPICER_ITEM
        STRINGS.CHARACTERS[name].DESCRIBE.PERKPORTABLECOOKPOT = GLOBAL.STRINGS.CHARACTERS[name].DESCRIBE.PORTABLECOOKPOT_ITEM
        STRINGS.CHARACTERS[name].DESCRIBE.ACHIVBOOK_BIRDS = GLOBAL.STRINGS.CHARACTERS[name].DESCRIBE.BOOK_BIRDS
        STRINGS.CHARACTERS[name].DESCRIBE.ACHIVBOOK_GARDENING = GLOBAL.STRINGS.CHARACTERS[name].DESCRIBE.BOOK_GARDENING
        STRINGS.CHARACTERS[name].DESCRIBE.ACHIVBOOK_SLEEP = GLOBAL.STRINGS.CHARACTERS[name].DESCRIBE.BOOK_SLEEP
        STRINGS.CHARACTERS[name].DESCRIBE.ACHIVBOOK_BRIMSTONE = GLOBAL.STRINGS.CHARACTERS[name].DESCRIBE.BOOK_BRIMSTONE
        STRINGS.CHARACTERS[name].DESCRIBE.ACHIVBOOK_TENTACLES = GLOBAL.STRINGS.CHARACTERS[name].DESCRIBE.BOOK_TENTACLES
    end
end)

local function NewQuickAction(inst, action)
    local quick = false
    if inst and inst:HasTag("fastpick") then
        quick = true
    end 
        if quick then
            return "doshortaction"
        elseif action.target and action.target.components.pickable then
            if action.target.components.pickable.quickpick then
                return "doshortaction"
            else
                return "dolongaction"
            end
        else 
            return "dolongaction"
        end
end

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.PICK, NewQuickAction))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.TAKEITEM, NewQuickAction))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.HARVEST, NewQuickAction))
GLOBAL.package.loaded["stategraphs/SGwilson"] = nil 
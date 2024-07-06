name =
[[  DST Achievement Tweak
]]
description =
[[
v 3.0.5
Unlock achievements throughout gameplay to collect achievement points.
Exchange points for permanent buffs via the user interface.
For details, click open the UI on the top left corner.
]]
author = "Webber-ah"
version = "3.0.5"
priority = -1000
server_filter_tags = {"achievement"}

forumthread = ""

api_version = 10

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
all_clients_require_mod = true

--What to do next?
-- • Purple Staff count toward teleport ach

icon_atlas = "modicon.xml"
icon = "modicon.tex"

configuration_options =
{
    {
        name = "COST",
        label = "Perks Cost",
        options =   {
                        {description = "Normal", data = false},
                        {description = "Hard", data = true},
                    },
        default = false,
		hover = "Whether or not the perks cost should be expensive. (For balancing purpose)",
    },
    {
        name = "MANDRAKEBOI",
        label = "Mandrake Respawn",
        options =   {
                        {description = "Off", data = false},
                        {description = "On", data = true},
                    },
        default = false,
        hover = "Whether or not up to 4 mandrakes should respawn every new autumn on Sinkhole Turf",
    },
    {
        name = "SECOND",
        label = "Second Playthrough",
        options =   {
                        {description = "Yes", data = true},
                        {description = "No", data = false},
                    },
        default = true,
        hover = "Whether or not the complete all achievements will reset all the achievement (2nd run)",
    },
    {
        name = "SPEEDLIMIT",
        label = "Speed Reward Limit",
        options =   {
                        {description = "Limit x70", data = 70},
                        {description = "Unlimited", data = 999},
                    },
        default = 70,
        hover = "Whether or not a player can upgrade their speed more than 70 times (+350% speed)",
    },
}
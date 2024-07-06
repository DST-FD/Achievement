local matricide = Class(function(self, inst)
    self.inst = inst
    self.time = 0
    self.killer = false
end)

function matricide:OnSave()
    local data = {
        time = self.time,
        killer = self.killer,
    }
    return data
end

function matricide:OnLoad(data)
    self.time = data.time or 0
    self.killer = data.killer or false
end

--Init
function matricide:Init(inst)
    inst:ListenForEvent("killed", function(inst, data)
        local victim = data.victim
        --Smallbird
        if victim and victim.prefab == "smallbird" and self.killer ~= true then
            self.time = 480
            self.killer = true
        end
    end)
    inst:DoPeriodicTask(1, function()
        if self.killer then
            self.time = self.time - 1
            if self.time < 0 then
                self.killer = false
            end
        end
    end)
end

return matricide
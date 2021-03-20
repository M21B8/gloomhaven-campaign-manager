local EventManager = require("ge_tts.EventManager")
local EventType = require("gloomhaven-campaign-manager.EventType")

local Task = {}

Task.Event = EventType

function Task.complete(event, ...)
    EventManager.triggerEvent(event, ...)
end

---@param handler fun(savefile: gh_Savefile): void
---@param event string
function Task.registerSave(handler, event)
    EventManager.addHandler(event, handler)
end

---@param event string
---@param savefile gh_Savefile
function Task.completeSave(event, savefile)
    EventManager.triggerEvent(event, savefile)
end

---@param handler fun(obj: tts__Object, player: number, character: gh_Save_Character): void
---@param events string | string[]
function Task.registerPerPlayer(handler, events)
    if type(events) == "table" then
        local perPlayer = {}
        local totalSize = #events
        local function callback(obj, player, character)
            local current = perPlayer[player]
            if current == nil then
                current = 0
            end
            current = current + 1
            perPlayer[player] = current

            if current == totalSize then
                perPlayer[player] = 0
                handler(obj, player, character)
            end
        end
        for _, event in ipairs(--[[---@type string[] ]] events) do
            EventManager.addHandler(event, callback)
        end
    else
        EventManager.addHandler(--[[---@type string]] events, handler)
    end
end

return Task
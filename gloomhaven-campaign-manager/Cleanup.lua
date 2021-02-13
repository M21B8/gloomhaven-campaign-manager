local TableUtil = require("sebaestschjin-tts.TableUtil")

local Component = require("gloomhaven-campaign-manager.Component")
local Game = require("gloomhaven-campaign-manager.Game")

local Cleanup = {}

local unlocked = 0

---@param guid GUID
local function placeIntoGamebox(guid)
    local object = getObjectFromGUID(guid)
    if object then
        Component.gamebox().putObject(--[[---@not nil]] object)
    end
end

function Cleanup.onClassUnlocked()
    unlocked = unlocked + 1
    if unlocked == TableUtil.length(Game.CLASSES) then
        placeIntoGamebox(Component.guids.LOCKED_CLASSES)
    end
end

function Cleanup.onTreasureLoaded()
    placeIntoGamebox(Component.guids.TREASURE_DECK)
end

return Cleanup

--- The complete savefile format
---@shape gh_Savefile
---@field enhancements gh_Save_EnhancedClass[]
---@field unlocked gh_Save_Unlocked
---@field global gh_Save_Global
---@field party gh_Save_Party
---@field retired gh_Save_Retired[]
---@field events gh_Save_EventDeck[]
---@field metadata gh_Save_Metadata

--- The savefile format with optional values
---@shape gh_Savefile_Partial
---@field enhancements nil | gh_Save_EnhancedClass[]
---@field unlocked nil | gh_Save_Unlocked_Partial
---@field global nil | gh_Save_Global_Partial
---@field party nil | gh_Save_Party
---@field retired nil | gh_Save_Retired[]
---@field events nil | gh_Save_EventDeck[]
---@field metadata nil | gh_Save_Metadata

---@shape gh_Save_EnhancedClass
---@field class string
---@field abilities gh_Save_Enhanced_Ability[]

---@shape gh_Save_Enhanced_Ability
---@field name string
---@field enhancements gh_Save_Ability_Enhancement[]

---@shape gh_Save_Ability_Enhancement
---@field enhancement string
---@field position number

---@shape gh_Save_Global
---@field scenarios gh_Save_Scenario[]
---@field achievements gh_Save_Achievement[]
---@field prosperity number the number of prosperity checkmarks

---@shape gh_Save_Global_Partial
---@field scenarios nil | gh_Save_Scenario[] @Default []
---@field achievements nil | gh_Save_Achievement[] @Default []
---@field prosperity nil | number @Default 0

---@shape gh_Save_Scenario
---@field number number
---@field state gh_Scenario_State

---@shape gh_Save_Achievement
---@field name string
---@field count nil | number

---@alias gh_Scenario_State 'Open' | 'Done' | 'Locked'

---@shape gh_Save_Party
---@field name string
---@field location string
---@field notes string[]
---@field achievements string[]
---@field reputation number
---@field characters gh_Save_Character[]

---@shape gh_Save_Character
---@field class string
---@field name string
---@field xp number
---@field gold number
---@field quest string | number
---@field checkmarks number
---@field perks number[]
---@field items gh_Save_Character_Item[]
---@field abilities string[]
---@field notes string[]
---@field hiddenNotes string[]

---@shape gh_Save_Character_Item
---@field name string
---@field position gh_Save_Character_Item_Position

---@alias gh_Save_Character_Item_Position 'Head' | 'Armor' | 'HandLeft' | 'HandRight' | 'Boots' | 'Bag1' | 'Bag2' | 'Bag3' | 'Active4' | 'Active1' | 'Active2' | 'Active3' | 'Unequipped'

---@shape gh_Save_Unlocked
---@field classes string[]
---@field treasures number[]
---@field sanctuary number
---@field items string[]
---@field specialConditions gh_Save_Unlocked_Conditions

---@shape gh_Save_Unlocked_Partial
---@field classes nil | string[]
---@field treasures nil | number[]
---@field sanctuary nil | number
---@field items nil | string[]
---@field specialConditions nil | gh_Save_Unlocked_Conditions

---@shape gh_Save_Unlocked_Conditions
---@field ancientTechnology boolean
---@field drakeAided boolean
---@field lowReputation boolean
---@field lowestReputation boolean
---@field highReputation boolean
---@field highestReputation boolean
---@field retired boolean
---@field donations number

---@shape gh_Save_Retired
---@field player string
---@field character string
---@field class string
---@field level number
---@field perks number
---@field quest string

---@shape gh_Save_EventDeck
---@field deck string
---@field bottomUp number[]
---@field add number[]
---@field remove number[]

---@shape gh_Save_Metadata
---@field version string
---@field date string
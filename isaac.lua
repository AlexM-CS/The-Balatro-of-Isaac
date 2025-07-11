--- STEAMODDED HEADER
--- MOD NAME: The Balatro of Isaac
--- MOD_ID: The Balatro of Isaac
--- MOD_AUTHOR: [Jedi]
--- MOD_DESCRIPTION: Turns Balatro into the Binding of Isaac!
--- MOD_VERSION: 1.0.10.0
--- MOD_SITE: https://github.com/AlexM-CS/The-Balatro-of-Isaac
--- PREFIX: tboi

BI = {}

BI.config = {
    vanilla_reworks = true,
    enable_jokers = true,
    -- enable_boosters = true,
    enable_consumables = true,
}

-- Load util
SMODS.load_file("utility/definitions.lua")()
SMODS.load_file("utility/functions.lua")()

-- Load atlases
SMODS.load_file("content/atlas.lua")()

-- Load vanilla Joker reworks
if BI.config.vanilla_reworks then
    BI.register(BI.VANILLA_JOKERS, "content/joker/vanilla")
end

-- Load Jokers
if BI.config.enable_jokers then
    BI.register(BI.ENABLED_JOKERS, "content/joker")
end

-- Load Boosters
if BI.config.enable_boosters then
    BI.register(BI.ENABLED_BOOSTERS, "content/boosters")
end

-- Load Consumables
if BI.config.enable_consumables then
    BI.register(BI.ENABLED_CONSUMABLES.TYPES, "content/consumables")
    BI.register(BI.ENABLED_CONSUMABLES.ENABLED_REVERSED_TAROTS, "content/consumables/reversed_tarots")
    BI.register(BI.ENABLED_CONSUMABLES.ENABLED_RUNES, "content/consumables/runes")
    -- BI.register(BI.ENABLED_CONSUMABLES.ENABLED_SOUL_STONES, "content/consumables/soul_stones")
end

-- Opt-in to SMODS features
SMODS.current_mod.optional_features = {
    retrigger_joker = true
}
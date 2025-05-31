--- STEAMODDED HEADER
--- MOD NAME: The Balatro of Isaac
--- MOD_ID: The Balatro of Isaac
--- MOD_AUTHOR: [Jedi]
--- MOD_DESCRIPTION: Adds 15 new Jokers based on the 15 playable decks!
--- MOD_VERSION: 1.0.0
--- MOD_SITE: https://github.com/AlexM-CS/Deckception
--- PREFIX: tboi

BI = {}

BI.config = {
    enable_jokers = true,
    enable_reversed_tarots = true
}

-- Load util
SMODS.load_file("utility/definitions.lua")()
SMODS.load_file("utility/functions.lua")()

-- Load atlases
SMODS.load_file("content/atlas.lua")()

-- Load jokers
if BI.config.enable_jokers then
    BI.register(BI.ENABLED_JOKERS, "content/joker")
end

-- Load Consumables
if BI.config.enable_reversed_tarots then
    BI.register(BI.ENABLED_CONSUMABLES.ENABLED_REVERSED_TAROTS, "content/consumables/reversed_tarots")
end

-- Opt-in to SMODS features
SMODS.current_mod.optional_features = {
    retrigger_joker = true
}
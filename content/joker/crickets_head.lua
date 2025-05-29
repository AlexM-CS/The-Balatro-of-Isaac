SMODS.Joker {
    key = "crickets_head",
    loc_txt = {
        name = "Cricket's Head",
        text = {
            "Applies a {X:red,C:white}X#1#{} Mult",
            "multiplier to most other {C:attention}Jokers",
            "that give {C:red}Mult",
            "{s:0.8}{C:inactive}\"DMG up\""
        }
    },
    config = {
        extra = {
            multiplier = 1.5
        }
    },
    rarity = 4,
    pos = { x = 3, y = 2 },
    atlas = "tboi_jokers",
    cost = 20,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.multiplier
            }
        }
    end,

    calculate = function(self, card, context)
        -- Note:
        -- Many Jokers with "for each" effects (like Shoot the Moon), special effects (like Raised Fist),
        -- or that build their Mult gain, either over time (like Ride the Bus) or by some special
        -- condition (like Steel Joker or Supernova) are not yet functional with this Joker.
        -- Some of this is due to restrictions on how Mult is applied by these Jokers, but some interactions
        -- that (I think) should work don't
        
        -- Interactions that I think are simply bugged are listed below.
        -- Any Jokers not listed either work as intended or have a special effect that I haven't messed with

        -- Bugged interactions:
        -- Joker Stencil
        -- Misprint
        -- Raised Fist
        -- Shoot the Moon
        -- Canio
        
        if context.before then
            for _, other_card in ipairs(G.jokers.cards) do
                if other_card ~= card then
                    if type(other_card.ability.extra) ~= "table" then
                        if other_card.label == "Fibonacci" or 
                        other_card.label == "Abstract Joker" or 
                        other_card.label == "Blackboard" or 
                        other_card.label == "Baron" or 
                        other_card.label == "Photograph" or 
                        other_card.label == "Baseball Card" or 
                        other_card.label == "Ancient Joker" or 
                        other_card.label == "Smiley Face" or 
                        other_card.label == "Acrobat" or 
                        other_card.label == "Onyx Agate" or 
                        other_card.label == "Flower Pot" or 
                        other_card.label == "The Idol" or 
                        other_card.label == "Seeing Double" or 
                        other_card.label == "Shoot the Moon" or 
                        other_card.label == "Driver's License" or 
                        other_card.label == "Triboulet" then
                            other_card.ability.extra = other_card.ability.extra * card.ability.extra.multiplier
                        end
                    else
                        if other_card.ability.extra ~= nil then
                            if other_card.ability.extra.mult ~= nil then other_card.ability.extra.mult = other_card.ability.extra.mult * card.ability.extra.multiplier end
                            if other_card.ability.extra.s_mult ~= nil then other_card.ability.extra.s_mult = other_card.ability.extra.s_mult * card.ability.extra.multiplier end
                            if other_card.ability.extra.Xmult ~= nil then other_card.ability.extra.Xmult = other_card.ability.extra.Xmult * card.ability.extra.multiplier end
                        end
                    end
                    if other_card.ability.mult ~= nil then other_card.ability.mult = other_card.ability.mult * card.ability.extra.multiplier end
                    if other_card.ability.t_mult ~= nil then other_card.ability.t_mult = other_card.ability.t_mult * card.ability.extra.multiplier end
                    if other_card.ability.Xmult ~= nil then other_card.ability.Xmult = other_card.ability.Xmult * card.ability.extra.multiplier end
                end
            end
        end
        if context.final_scoring_step then
            for _, other_card in ipairs(G.jokers.cards) do
                if other_card ~= card then
                    if type(other_card.ability.extra) ~= "table" then
                        if other_card.label == "Fibonacci" or 
                        other_card.label == "Abstract Joker" or 
                        other_card.label == "Supernova" or 
                        other_card.label == "Blackboard" or 
                        other_card.label == "Baron" or 
                        other_card.label == "Photograph" or 
                        other_card.label == "Baseball Card" or 
                        other_card.label == "Ancient Joker" or 
                        other_card.label == "Smiley Face" or 
                        other_card.label == "Acrobat" or 
                        other_card.label == "Onyx Agate" or 
                        other_card.label == "Flower Pot" or 
                        other_card.label == "The Idol" or 
                        other_card.label == "Seeing Double" or 
                        other_card.label == "Shoot the Moon" or 
                        other_card.label == "Driver's License" or 
                        other_card.label == "Canio" or 
                        other_card.label == "Triboulet" then
                            other_card.ability.extra = other_card.ability.extra / card.ability.extra.multiplier
                        end
                    else
                        if other_card.ability.extra ~= nil then
                            if other_card.ability.extra.mult ~= nil then other_card.ability.extra.mult = other_card.ability.extra.mult / card.ability.extra.multiplier end
                            if other_card.ability.extra.s_mult ~= nil then other_card.ability.extra.s_mult = other_card.ability.extra.s_mult / card.ability.extra.multiplier end
                            if other_card.ability.extra.Xmult ~= nil then other_card.ability.extra.Xmult = other_card.ability.extra.Xmult / card.ability.extra.multiplier end
                        end
                    end
                    if other_card.ability.mult ~= nil then other_card.ability.mult = other_card.ability.mult / card.ability.extra.multiplier end
                    if other_card.ability.t_mult ~= nil then other_card.ability.t_mult = other_card.ability.t_mult / card.ability.extra.multiplier end
                    if other_card.ability.Xmult ~= nil then other_card.ability.Xmult = other_card.ability.Xmult / card.ability.extra.multiplier end
                end
            end
        end
    end
}
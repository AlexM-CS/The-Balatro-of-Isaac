SMODS.Joker {
    key = "pluto",
    config = {
        extra = {
            odds = 4
        }
    },
    rarity = 3,
    pos = { x = 11, y = 4 },
    atlas = "tboi_jokers",
    cost = 10,
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        info_queue[#info_queue + 1] = G.P_CENTERS.c_pluto
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator,
                denominator
            }
        }
    end,

    calculate = function(self, card, context)
        if context.card_added and 
           context.card.ability.set == "Planet" and 
           context.card.ability.name == "Pluto" and 
           SMODS.pseudorandom_probability(card, "pluto", 1, card.ability.extra.odds) then
            context.card:set_edition("e_negative")
        end
    end
}
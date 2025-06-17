SMODS.Joker {
    key = "the_belt",
    config = {
        extra = {
            chip_mod = 2,
            chips = 0
        },
        special = {
        }
    },
    rarity = 1,
    pos = { x = 6, y = 3 },
    atlas = "tboi_jokers",
    cost = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chip_mod,
                card.ability.extra.chips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
        if context.other_joker and context.other_joker.calculate ~= nil then
            local ret = context.other_joker:calculate(self, context.other_joker, context)
            if ret[chips] ~= nil or ret[x_chips] ~= nil then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
                return {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.BLUE
                }
            end
        end
    end
}
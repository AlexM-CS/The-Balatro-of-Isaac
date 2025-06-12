SMODS.Joker {
    key = "blood_of_the_martyr",
    config = {
        extra = {
            mult = 12,
            Xmult = 1.5
        }
    },
    rarity = 3,
    pos = { x = 6, y = 2 },
    atlas = "tboi_jokers",
    cost = 8,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.Xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if next(SMODS.find_card("j_tboi_book_of_belial")) then
                return {
                    mult = card.ability.extra.mult,
                    x_mult = card.ability.extra.Xmult
                }
            else
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}
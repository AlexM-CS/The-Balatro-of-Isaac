SMODS.Joker {
    key = "the_virus",
    config = {
        extra = {
            repetitions = 1
        }
    },
    rarity = 2,
    pos = { x = 12, y = 2 },
    atlas = "tboi_jokers",
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "poisonous", set = "Other" }
        return {
            vars = {
            }
        }
    end,

    calculate = function(self, card, context)
        if context.retrigger_joker_check and
           context.other_card.config.center_key ~= self.key and
           BI.POISONOUS[context.other_card.config.center_key] ~= nil then
            return {
                repetitions = card.ability.extra.repetitions,
                message = localize("k_again_ex"),
                colour = G.C.RED
            }
        end
    end
}
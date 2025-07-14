SMODS.Joker {
    key = "spoon_bender",
    config = {
    },
    rarity = 3,
    pos = { x = 2, y = 2},
    atlas = "tboi_jokers",
    cost = 8,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card.debuff then
                    scored_card:juice_up()
                    scored_card:set_debuff(false)
                end
            end
        end
    end
}
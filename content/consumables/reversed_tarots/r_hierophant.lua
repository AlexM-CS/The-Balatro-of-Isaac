SMODS.Consumable {
    key = "r_hierophant",
    set = "tboi_reversed",
    config = {
        extra = {
            upgrade = 20,
            max = 2
        }
    },
    pos = { x = 0, y = 1 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.upgrade,
                card.ability.extra.max
            }
        }
    end,

    use = function(self, card, area, copier)
        for _, playing_card in ipairs(G.hand.highlighted) do
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.1,
                func = function()
                    playing_card.ability.perma_bonus = playing_card.ability.perma_bonus + card.ability.extra.upgrade
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.1,
                func = function()
                    playing_card:juice_up()
                    return true
                end
            }))
        end
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.extra.max
    end
}
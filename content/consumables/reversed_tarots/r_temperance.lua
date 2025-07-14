SMODS.Consumable {
    key = "r_temperance",
    set = "Reversed_Tarot",
    config = {
        extra = {
            create = 2
        }
    },
    pos = { x = 4, y = 2 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.create
            }
        }
    end,

    use = function(self, card, area, copier)
        for _, joker in ipairs(G.jokers.cards) do
            G.E_MANAGER:add_event(Event({
                func = function()
                    joker:sell_card()
                    return true
                end
            }))
        end
        for i = 1, math.min(card.ability.extra.create, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound("timpani")
                        SMODS.add_card({ set = "Spectral" })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        delay(0.6)
    end,

    can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit + 1
    end
}
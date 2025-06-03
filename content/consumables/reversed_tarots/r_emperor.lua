SMODS.Consumable {
    key = "r_emperor",
    set = "tboi_reversed",
    loc_txt = {
        name = "The Emperor?",
        text = {
            "Creates up to {C:attention}#1#",
            "{V:1}Reversed Tarot{} Cards",
            "{C:inactive}(Must have room)",
            "{s:0.8}{C:inactive}\"May you find a worthy opponent\""
        }
    },
    config = {
        extra = {
            create = 2
        }
    },
    pos = { x = 4, y = 0 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.create,
                colours = {
                    HEX("89093a")
                }
            }
        }
    end,

    use = function(self, card, area, copier)
        for i = 1, math.min(card.ability.extra.create, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound("timpani")
                        SMODS.add_card({ set = "tboi_reversed" })
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
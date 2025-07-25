SMODS.Consumable {
    key = "r_high_priestess",
    set = "Reversed_Tarot",
    config = {
    },
    pos = { x = 2, y = 0 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                if G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound("timpani")
                    SMODS.add_card({
                        set = "Planet",
                        edition = "e_negative"
                    })
                    card:juice_up(0.3, 0.5)
                end
                return true
            end
        }))
        delay(0.6)
    end,

    can_use = function(self, card)
        return G.consumeables
    end
}
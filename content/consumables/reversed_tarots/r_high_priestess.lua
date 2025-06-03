SMODS.Consumable {
    key = "r_high_priestess",
    set = "tboi_reversed",
    loc_txt = {
        name = "The High Priestess?",
        text = {
            "Create a random",
            "{C:dark_edition}Negative{} {C:planet}Planet{} Card",
            "{s:0.8}{C:inactive}\"Run\""
        }
    },
    config = {
        extra = {
            planets = 1
        }
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
                    SMODS.add_card({ set = "Planet" , edition = "e_negative"})
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
SMODS.Consumable {
    key = "r_empress",
    set = "tboi_reversed",
    config = {
        extra = {
            mod_conv = "m_mult",
            cards = 3
        }
    },
    pos = { x = 3, y = 0 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cards
            }
        }
    end,

    use = function(self, card, area, copier)
        local enhanced_cards = {}
        local temp_hand = {}

        for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
        table.sort(temp_hand,
            function(a, b)
                return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
            end
        )

        pseudoshuffle(temp_hand, pseudoseed("r_empress"))

        for i = 1, card.ability.extra.cards do enhanced_cards[#enhanced_cards + 1] = temp_hand[i] end

        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("tarot1")
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for _, playing_card in ipairs(enhanced_cards) do
            local percent = 1.15 - (_ - 0.999) / (#enhanced_cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.15,
                func = function()
                    playing_card:flip()
                    play_sound("card1", percent)
                    playing_card:juice_up(0.3, 0.3)
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.1,
                func = function()
                    playing_card:set_ability(G.P_CENTERS[card.ability.extra.mod_conv])
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.15,
                func = function()
                    playing_card:flip()
                    play_sound("card1", percent)
                    playing_card:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
    end,

    can_use = function(self, card)
        return G.hand
    end
}
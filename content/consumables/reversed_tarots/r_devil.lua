SMODS.Consumable {
    key = "r_devil",
    set = "tboi_reversed",
    config = {
        extra = {
            destroy = 1,
            seal = "Gold"
        }
    },
    pos = { x = 0, y = 3 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
        return {
            vars = {
            }
        }
    end,

    use = function(self, card, area, copier)
        local destroyed_cards = {}
        local temp_hand = {}

        for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
        table.sort(temp_hand,
            function(a, b)
                return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
            end
        )

        pseudoshuffle(temp_hand, pseudoseed("r_devil"))

        for i = 1, card.ability.extra.destroy do destroyed_cards[#destroyed_cards + 1] = temp_hand[i] end

        G.E_MANAGER:add_event(Event({
            trigger = "after",
            func = function()
                play_sound("tarot1")
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            func = function()
                SMODS.destroy_cards(destroyed_cards)
                return true
            end
        }))

        local _seal = pseudorandom_element(G.hand.cards, pseudoseed("r_devil"))

        G.E_MANAGER:add_event(Event({
            trigger = "after",
            func = function()
                play_sound("tarot1")
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.2,
            func = function()
                _seal:set_seal(card.ability.extra.seal, nil, true)
                return true
            end
        }))
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.cards > 1
    end
}
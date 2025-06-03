SMODS.Consumable {
    key = "r_chariot",
    set = "tboi_reversed",
    loc_txt = {
        name = "The Chariot?",
        text = {
            "Add a random {C:attention}Steel Card",
            "to your hand",
            "{s:0.8}{C:inactive}\"May nothing walk past you\""
        }
    },
    config = {
        mod_conv = "m_steel"
    },
    pos = { x = 2, y = 1 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS[card.ability.mod_conv]
        return {
            vars = {
                localize { type = "name_text", set = "Enhanced", key = card.ability.mod_conv }
            }
        }
    end,

    use = function(self, card, area, copier)
        local _card = create_playing_card({
                front = pseudorandom_element(G.P_CARDS, pseudoseed("r_chariot")),
                center = G.P_CENTERS.c_base
            }, G.discard, true, nil, { G.C.SECONDARY_SET.Enhanced }, true)
        _card:set_ability(G.P_CENTERS[card.ability.mod_conv])
        G.hand:emplace(_card)
        SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
    end,

    can_use = function(self, card)
        return G.hand
    end
}
SMODS.Joker {
    key = "less_than_3",
    loc_txt = {
        name = "<3",
        text = {
            "{C:attention}+#1#{} Hand, refills",
            "Hands if found mid-blind",
            "{s:0.8}\"HP up\""
        }
    },
    config = {
        extra = {
            h_size = 1
        }
    },
    rarity = 2,
    pos = { x = 14, y = 2 },
    atlas = "tboi_jokers",
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.h_size
            }
        }
    end,

    add_to_deck = function(self, card)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.h_size
        ease_hands_played(G.GAME.round_resets.hands)
    end,

    remove_from_deck = function(self, card)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.h_size
        ease_hands_played(-card.ability.extra.h_size)
    end
}
SMODS.Joker {
    key = "raw_liver",
    config = {
        extra = {
            h_plays = 0
        }
    },
    rarity = 2,
    pos = { x = 15, y = 2 },
    atlas = "tboi_jokers",
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                1
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        if G.jokers then
            for i = 1, #G.jokers.cards do
                local _card = G.jokers.cards[i]
                if _card ~= card and (_card.config.center.rarity == 2 or _card.config.center.rarity == "Uncommon") then
                    card.ability.extra.h_plays = card.ability.extra.h_plays + 1
                end
            end
        end
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.h_plays
        ease_hands_played(card.ability.extra.h_plays)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.h_plays
        ease_hands_played(-card.ability.extra.h_plays)
    end,

    calculate = function(self, card, context)
        if context.card_added then
            if context.card.config.center.rarity == 2 or context.card.config.center.rarity == "Uncommon" then
                card.ability.extra.h_plays =  card.ability.extra.h_plays + 1
                G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
                ease_hands_played(1)
            end
        end
        --[[
        NOTE: This Joker is unfinished. When SMODS adds a context that I can use to determine when a card
        is removed, I'll add the remove functionality. But for now, this Joker can be exploited by selling
        and buying Uncommon Jokers over and over.
        ]]--

    end
}
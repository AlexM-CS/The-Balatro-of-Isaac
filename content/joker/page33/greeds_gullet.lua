SMODS.Joker {
    --[[
    NOTE: As of 6/21/2025, this card has a small visual bug.
    When copied by Blueprint or Brainstorm, the '+# Hands' message will
    always appear under Greed's Gullet instead of under the copying cards.
    This is in contrast to Burglar, where the text is correctly displayed
    under the copy card.
    ]]--
    key = "greeds_gullet",
    config = {
        extra = {
            h_plays = 1,
            dollars = 50
        }
    },
    rarity = 1,
    pos = { x = 15, y = 3 },
    atlas = "tboi_jokers",
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        if BI.show_item_pools_check() then
            local text = BI.generate_pool_text(card)
            info_queue[#info_queue + 1] = {
                set = "Other", key = "item_pool", vars = {
                    text.is_modded,
                    text.pool,
                    colours = {
                        text.colour
                    }
                }
            }
        end
        return {
            vars = {
                card.ability.extra.h_plays,
                card.ability.extra.dollars,
                card.ability.extra.h_plays * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars)
            }
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            local _hands = card.ability.extra.h_plays * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars)
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_hands_played(_hands)
                    SMODS.calculate_effect({
                        message = localize({
                            type = "variable",
                            key = "a_hands",
                            vars = { _hands }
                        })
                        }, context.blueprint_card or card)
                    return true
                end
            }))
            return nil, true
        end
    end
}
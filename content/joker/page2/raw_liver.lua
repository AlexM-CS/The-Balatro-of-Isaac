SMODS.Joker {
    --[[
    NOTE: As of 6/21/2025, this card has a small visual bug.
    When copied by Blueprint or Brainstorm, the '+# Hands' message will
    always appear under Raw Liver instead of under the copying cards.
    This is in contrast to Burglar, where the text is correctly displayed
    under the copy card.
    NOTE: Fixed as of Update 1.0.9.0
    ]]--
    key = "raw_liver",
    config = {
        extra = {
            h_plays = 1
        }
    },
    rarity = 2,
    pos = { x = 15, y = 2 },
    atlas = "tboi_jokers",
    cost = 6,
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
                card.ability.extra.h_plays
            }
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and G.jokers then
            local count = 0
            for _, joker in ipairs(G.jokers.cards) do
                if joker.config.center.rarity == 2 or joker.config.center.rarity == "Uncommon" then count = count + 1 end
            end
            return {
                message = localize({
                    type = "variable",
                    key = "a_hands",
                    vars = { count }
                }),
                func = function()
                    G.E_MANAGER:add_event(Event({
                        trigger = "immediate",
                        func = function()
                            ease_hands_played(count, true)
                            return true
                        end
                    }))
                end
            }
        end
    end
}
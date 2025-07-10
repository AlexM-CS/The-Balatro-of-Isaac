SMODS.Joker {
    key = "neptunus",
    config = {
        extra = {
            poker_hand = "Straight Flush"
        }
    },
    rarity = 3,
    pos = { x = 4, y = 4 },
    atlas = "tboi_jokers",
    cost = 8,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = false,
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
            }
        }
    end,

    calculate = function(self, card, context)
        if context.scoring_name == card.ability.extra.poker_hand and context.repetition and context.cardarea == G.play then
            return {
                repetitions = 1
            }
        end
    end
}
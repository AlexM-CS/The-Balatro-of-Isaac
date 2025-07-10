SMODS.Joker {
    key = "moms_underwear",
    config = {
        extra = {
            h_size = 1
        },
        special = {
            flies = 6,
            type = "Basic"
        }
    },
    rarity = 1,
    pos = { x = 7, y = 3 },
    atlas = "tboi_jokers",
    cost = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "flies", set = "Other" }
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
                card.ability.extra.h_size,
                card.ability.special.flies,
                card.ability.special.type
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return BI.calculate_flies(card, context)
        end
    end
}
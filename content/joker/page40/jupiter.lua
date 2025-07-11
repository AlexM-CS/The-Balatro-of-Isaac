SMODS.Joker {
    key = "jupiter",
    config = {
        extra = {
            sell_cost = 1,
            poker_hand = "Flush"
        }
    },
    rarity = 2,
    pos = { x = 3, y = 4 },
    atlas = "tboi_jokers",
    cost = 6,
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "poisonous", set = "Other" }
        info_queue[#info_queue + 1] = G.P_CENTERS.c_jupiter
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
                card.ability.extra.sell_cost
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval and context.scoring_name == card.ability.extra.poker_hand then
            if G.GAME.jupiter_value == nil then
                G.GAME.jupiter_value = card.ability.extra.sell_cost
            else
                G.GAME.jupiter_value = G.GAME.jupiter_value + card.ability.extra.sell_cost
            end
            for _, consumable in ipairs(G.consumeables.cards) do
                if consumable.ability.name == "Jupiter" then
                    consumable.sell_cost = consumable.sell_cost + card.ability.extra.sell_cost
                end
            end
            return {
                message = localize("k_val_up"),
                colour = G.C.SECONDARY_SET.Planet
            }
        end
    end
}
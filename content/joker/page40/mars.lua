SMODS.Joker {
    key = "mars",
    config = {
        extra = {
            Xmult = 1,
            Xmult_gain = 0.25,
            poker_hand = "Four of a Kind"
        }
    },
    rarity = 2,
    pos = { x = 2, y = 4 },
    atlas = "tboi_jokers",
    cost = 6,
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
                card.ability.extra.Xmult_gain,
                card.ability.extra.Xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            if context.scoring_name ~= card.ability.extra.poker_hand then
                if card.ability.extra.Xmult > 1 then
                    if next(SMODS.find_card("j_tboi_crickets_head")) then
                        card.ability.extra.Xmult = 1.5
                    else
                        card.ability.extra.Xmult = 1
                    end
                    return {
                        message = localize("k_reset")
                    }
                end
            else
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
                return {
                    message = localize("k_upgrade_ex")
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
    end
}
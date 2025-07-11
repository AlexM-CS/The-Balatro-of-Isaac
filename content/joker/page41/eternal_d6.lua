SMODS.Joker {
    key = "eternal_d6",
    config = {
        tboi_active = true,
        reroll_type = "NORMAL",
        extra = {
            max_charges = 2,
            full_charge = 2,
            current_charges = 2,
            odds = 3
        }
    },
    rarity = 3,
    pos = { x = 8, y = 4 },
    atlas = "tboi_jokers",
    cost = 8,
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        local status = "Active!"
        if card.ability.extra.current_charges < card.ability.extra.full_charge then
            status = "Inactive"
        end
        info_queue[#info_queue + 1] = {
            set = "Other", key = "charges", vars = {
                card.ability.extra.current_charges,
                card.ability.extra.full_charge,
                status
            }
        }
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
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator,
                denominator
            }
        }
    end,

    use = function(self, card, area, copier)
        if G.STATE == G.STATES.SHOP then
            BI.tboi_area_reroll("Joker", G.shop_jokers, card.ability.reroll_type, false, false, card.ability.extra.odds)
        elseif G.STATE == G.STATES.SMODS_BOOSTER_OPENED then
            BI.tboi_area_reroll("Joker", G.pack_cards, card.ability.reroll_type, false, false, card.ability.extra.odds)
        end
        card.ability.extra.current_charges = card.ability.extra.current_charges - card.ability.extra.full_charge
    end,

    tboi_can_use = function(self, card)
        return (G.STATE == G.STATES.SHOP or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and card.ability.extra.current_charges >= card.ability.extra.full_charge
    end,

    calculate = function(self, card, context)
        if context.after and card.ability.extra.current_charges < card.ability.extra.max_charges then
            card.ability.extra.current_charges = card.ability.extra.current_charges + 1
        end
    end
}
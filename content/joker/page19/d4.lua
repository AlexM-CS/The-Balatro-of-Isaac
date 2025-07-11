SMODS.Joker {
    key = "d4",
    config = {
        tboi_active = true,
        reroll_type = "NORMAL",
        extra = {
            max_charges = 6,
            full_charge = 6,
            current_charges = 6
        }
    },
    rarity = 2,
    pos = { x = 11, y = 3 },
    atlas = "tboi_jokers",
    cost = 6,
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
        return {
            vars = {
            }
        }
    end,

    use = function(self, card, area, copier)
        if G.jokers then
            BI.tboi_area_reroll("Joker", G.jokers, card.ability.reroll_type, true, true, nil)
        end
        card.ability.extra.current_charges = card.ability.extra.current_charges - card.ability.extra.full_charge
    end,

    tboi_can_use = function(self, card)
        return G.jokers and card.ability.extra.current_charges >= card.ability.extra.full_charge
    end,

    calculate = function(self, card, context)
        if context.after and card.ability.extra.current_charges < card.ability.extra.max_charges then
            card.ability.extra.current_charges = card.ability.extra.current_charges + 1
        end
    end
}
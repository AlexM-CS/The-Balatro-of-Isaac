SMODS.Joker {
    key = "d7",
    config = {
        tboi_active = true,
        reroll_type = "VOUCHER",
        extra = {
            max_charges = 3,
            full_charge = 3,
            current_charges = 3
        }
    },
    rarity = 1,
    pos = { x = 18, y = 3 },
    atlas = "tboi_jokers",
    cost = 5,
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
        return {
            vars = {
            }
        }
    end,

    use = function(self, card, area, copier)
        if G.STATE == G.STATES.SHOP then
            BI.tboi_reroll(card, "Voucher", G.shop_vouchers, card.ability.reroll_type, false, false, nil)
        end
        card.ability.extra.current_charges = card.ability.extra.current_charges - card.ability.extra.full_charge
    end,

    tboi_can_use = function(self, card)
        return G.STATE == G.STATES.SHOP and card.ability.extra.current_charges >= card.ability.extra.full_charge
    end,

    calculate = function(self, card, context)
        if context.after and card.ability.extra.current_charges < card.ability.extra.max_charges then
            card.ability.extra.current_charges = card.ability.extra.current_charges + 1
        end
    end
}
SMODS.Joker {
    key = "the_d6",
    config = {
        tboi_active = true,
        reroll_type = "NORMAL",
        extra = {
            max_charges = 6,
            full_charge = 6,
            current_charges = 6
        }
    },
    rarity = 4,
    pos = { x = 9, y = 3 },
    atlas = "tboi_jokers",
    cost = 20,
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
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
            BI.tboi_area_reroll("Joker", G.shop_jokers, card.ability.reroll_type, false)
        elseif G.STATE == G.STATES.SMODS_BOOSTER_OPENED then
            BI.tboi_area_reroll("Joker", G.pack_cards, card.ability.reroll_type, false)
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
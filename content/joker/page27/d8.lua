SMODS.Joker {
    --[[
    NOTE: As of 7/13/2025, this card has a minor visual bug where flames will
    appear while hands are being upgraded if the hand alone would be enough to
    defeat the blind. I'll try and fix this later on, but as far as I can tell
    it's going to be pretty involved. I consider it a bug because it IS possible
    to disable the flames (since Planet card uses never have them), I just don't
    know how.
    ]]--
    key = "d8",
    config = {
        tboi_active = true,
        reroll_type = "POKER_HANDS",
        extra = {
            max_charges = 4,
            full_charge = 4,
            current_charges = 4,
            max = 2
        }
    },
    rarity = 2,
    pos = { x = 15, y = 3 },
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
        return {
            vars = {
                card.ability.extra.max
            }
        }
    end,

    use = function(self, card, area, copier)
        BI.tboi_reroll(card, "", nil, card.ability.reroll_type, false, false, nil)
        card.ability.extra.current_charges = card.ability.extra.current_charges - card.ability.extra.full_charge
    end,

    tboi_can_use = function(self, card)
        return true
    end,

    calculate = function(self, card, context)
        if context.after and card.ability.extra.current_charges < card.ability.extra.max_charges then
            card.ability.extra.current_charges = card.ability.extra.current_charges + 1
        end
    end
}
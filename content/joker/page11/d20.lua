SMODS.Joker {
    key = "d20",
    config = {
        tboi_active = true,
        reroll_type = "NORMAL",
        extra = {
            max_charge = 6,
            full_charge = 6,
            current_charges = 6
        }
    },
    rarity = 2,
    pos = { x = 10, y = 3 },
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
            }
        }
    end,

    use = function(self, card, area, copier)
        if G.consumeables and #G.consumeables.cards > 0 then
            for _, _card in ipairs(G.consumeables.cards) do
                BI.tboi_reroll(_card, _card.config.center.set, G.consumeables, card.ability.reroll_type, true, true, nil)
            end
        end
        if G.pack_cards and #G.pack_cards.cards > 0 then
            -- For some reason the game freezes when using an enhanced for,
            -- but not when using a normal one?
            for i = 1, #G.pack_cards.cards do
                BI.tboi_reroll(G.pack_cards.cards[i], G.pack_cards.cards[i].config.center.set, G.pack_cards, card.ability.reroll_type, false, false, nil)
            end
        end
        card.ability.extra.current_charges = card.ability.extra.current_charges - card.ability.extra.full_charge
    end,

    tboi_can_use = function(self, card)
        return (G.STATE == G.STATES.SHOP or
                G.STATE == G.STATES.SMODS_BOOSTER_OPENED or
                G.consumeables and #G.consumeables.cards > 0) and
                card.ability.extra.current_charges >= card.ability.extra.full_charge
    end,

    calculate = function(self, card, context)
        if context.after and card.ability.extra.current_charges < card.ability.extra.max_charges then
            card.ability.extra.current_charges = card.ability.extra.current_charges + 1
        end
    end
}
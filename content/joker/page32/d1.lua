SMODS.Joker {
    key = "d1",
    config = {
        tboi_active = true,
        extra = {
            max_charges = 4,
            full_charge = 4,
            current_charges = 4
        }
    },
    rarity = 2,
    pos = { x = 20, y = 3 },
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
        if G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit + 1 then
            print(#G.consumeables.cards)
            print(G.consumeables.config.card_limit)
            local _dupe = pseudorandom_element(G.consumeables.cards, "d1")
            if _dupe ~= nil then
                local _edition = nil
                if _dupe.edition then _edition = _dupe.edition.key end
                SMODS.add_card({ key = _dupe.config.center.key, edition = _edition })
            end
        end
        card.ability.extra.current_charges = card.ability.extra.current_charges - card.ability.extra.full_charge
    end,

    tboi_can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit + 1
    end,

    calculate = function(self, card, context)
        if context.after and card.ability.extra.current_charges < card.ability.extra.max_charges then
            card.ability.extra.current_charges = card.ability.extra.current_charges + 1
        end
    end
}
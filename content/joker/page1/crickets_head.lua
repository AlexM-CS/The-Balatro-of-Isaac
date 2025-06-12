SMODS.Joker {
    key = "crickets_head",
    config = {
        special = {
            multiplier = 1.5
        }
    },
    rarity = 4,
    pos = { x = 3, y = 2 },
    atlas = "tboi_jokers",
    cost = 20,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.special.multiplier
            }
        }
    end,

    add_to_deck = function(self, card)
        for _, v in ipairs(G.jokers.cards) do
            if v ~= card and v.ability.extra ~= nil then
                if v.ability.extra.mult ~= nil then v.ability.extra.mult = v.ability.extra.mult * card.ability.special.multiplier end
                if v.ability.extra.s_mult ~= nil then v.ability.extra.s_mult = v.ability.extra.s_mult * card.ability.special.multiplier end
                if v.ability.extra.t_mult ~= nil then v.ability.extra.t_mult = v.ability.extra.t_mult * card.ability.special.multiplier end
                if v.ability.extra.Xmult ~= nil then v.ability.extra.Xmult = v.ability.extra.Xmult * card.ability.special.multiplier end
                if v.ability.extra.stencil_Xmult ~= nil then v.ability.extra.stencil_Xmult = v.ability.extra.stencil_Xmult * card.ability.special.multiplier end
                if v.ability.extra.misprint_max ~= nil then v.ability.extra.misprint_max = v.ability.extra.misprint_max * card.ability.special.multiplier end
                if v.ability.extra.raised_fist_Xmult ~= nil then v.ability.extra.raised_fist_Xmult = v.ability.extra.raised_fist_Xmult * card.ability.special.multiplier end
            end
        end
    end,

    remove_from_deck = function(self, card)
        for _, v in ipairs(G.jokers.cards) do
            if v ~= card and v.ability.extra ~= nil then
                if v.ability.extra.mult ~= nil then v.ability.extra.mult = v.ability.extra.mult / card.ability.special.multiplier end
                if v.ability.extra.s_mult ~= nil then v.ability.extra.s_mult = v.ability.extra.s_mult / card.ability.special.multiplier end
                if v.ability.extra.t_mult ~= nil then v.ability.extra.t_mult = v.ability.extra.t_mult / card.ability.special.multiplier end
                if v.ability.extra.Xmult ~= nil then v.ability.extra.Xmult = v.ability.extra.Xmult / card.ability.special.multiplier end
                if v.ability.extra.stencil_Xmult ~= nil then v.ability.extra.stencil_Xmult = v.ability.extra.stencil_Xmult / card.ability.special.multiplier end
                if v.ability.extra.misprint_max ~= nil then v.ability.extra.misprint_max = v.ability.extra.misprint_max / card.ability.special.multiplier end
                if v.ability.extra.raised_fist_Xmult ~= nil then v.ability.extra.raised_fist_Xmult = v.ability.extra.raised_fist_Xmult / card.ability.special.multiplier end
            end
        end
    end,

    calculate = function(self, card, context)
        if context.card_added and context.card.ability.set == "Joker" and context.card.ability.extra ~= nil then
            if context.card.ability.extra.mult ~= nil then context.card.ability.extra.mult = context.card.ability.extra.mult * card.ability.special.multiplier end
            if context.card.ability.extra.s_mult ~= nil then context.card.ability.extra.s_mult = context.card.ability.extra.s_mult * card.ability.special.multiplier end
            if context.card.ability.extra.t_mult ~= nil then context.card.ability.extra.t_mult = context.card.ability.extra.t_mult * card.ability.special.multiplier end
            if context.card.ability.extra.Xmult ~= nil then context.card.ability.extra.Xmult = context.card.ability.extra.Xmult * card.ability.special.multiplier end
            if context.card.ability.extra.stencil_Xmult ~= nil then context.card.ability.extra.stencil_Xmult = context.card.ability.extra.stencil_Xmult * card.ability.special.multiplier end
            if context.card.ability.extra.misprint_max ~= nil then context.card.ability.extra.misprint_max = context.card.ability.extra.misprint_max * card.ability.special.multiplier end
            if context.card.ability.extra.raised_fist_Xmult ~= nil then context.card.ability.extra.raised_fist_Xmult = context.card.ability.extra.raised_fist_Xmult * card.ability.special.multiplier end
        end
    end
}
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
                card.ability.special.multiplier
            }
        }
    end,

    add_to_deck = function(self, card)
        for _, v in ipairs(G.jokers.cards) do
            if v ~= card and v.ability.extra ~= nil and type(v.ability.extra) == "table" then
                if v.ability.extra.mult ~= nil then
                    v.ability.extra.mult = v.ability.extra.mult * card.ability.special.multiplier
                end
                if v.ability.extra.mult_gain ~= nil then
                    v.ability.extra.mult_gain = v.ability.extra.mult_gain * card.ability.special.multiplier
                end
                if v.ability.extra.mult_loss ~= nil then
                    v.ability.extra.mult_loss = v.ability.extra.mult_loss * card.ability.special.multiplier
                end
                if v.ability.extra.s_mult ~= nil then
                    v.ability.extra.s_mult = v.ability.extra.s_mult * card.ability.special.multiplier
                end
                if v.ability.extra.t_mult ~= nil then
                    v.ability.extra.t_mult = v.ability.extra.t_mult * card.ability.special.multiplier
                end
                if v.ability.extra.Xmult ~= nil then
                    v.ability.extra.Xmult = v.ability.extra.Xmult * card.ability.special.multiplier
                end
                if v.ability.extra.Xmult_gain ~= nil then
                    v.ability.extra.Xmult_gain = v.ability.extra.Xmult_gain * card.ability.special.multiplier
                end
                if v.ability.extra.Xmult_loss ~= nil then
                    v.ability.extra.Xmult_loss = v.ability.extra.Xmult_loss * card.ability.special.multiplier
                end
                if v.config.center_key == "j_misprint" then
                    v.ability.extra.max = v.ability.extra.max * card.ability.special.multiplier
                end
            end
            if v ~= card and v.ability.special ~= nil and type(v.ability.special) == "table" then
                if v.ability.special.stencil_Xmult ~= nil then
                    v.ability.special.stencil_Xmult = v.ability.special.stencil_Xmult * card.ability.special.multiplier
                end
                if v.ability.special.raised_fist_Xmult ~= nil then
                    v.ability.special.raised_fist_Xmult = v.ability.special.raised_fist_Xmult * card.ability.special.multiplier
                end
                if v.ability.special.supernova_Xmult ~= nil then
                    v.ability.special.supernova_Xmult = v.ability.special.supernova_Xmult * card.ability.special.multiplier
                end
                if v.ability.special.ceremonial_dagger_Xmult ~= nil then
                    v.ability.special.ceremonial_dagger_Xmult = v.ability.special.ceremonial_dagger_Xmult * card.ability.special.multiplier
                end
            end
        end
    end,

    remove_from_deck = function(self, card)
        for _, v in ipairs(G.jokers.cards) do
            if v ~= card and v.ability.extra ~= nil and type(v.ability.extra) == "table" then
                if v.ability.extra.mult ~= nil then     
                    v.ability.extra.mult = v.ability.extra.mult / card.ability.special.multiplier
                end
                if v.ability.extra.mult_gain ~= nil then
                    v.ability.extra.mult_gain = v.ability.extra.mult_gain / card.ability.special.multiplier
                end
                if v.ability.extra.mult_loss ~= nil then
                    v.ability.extra.mult_loss = v.ability.extra.mult_loss / card.ability.special.multiplier
                end
                if v.ability.extra.s_mult ~= nil then
                    v.ability.extra.s_mult = v.ability.extra.s_mult / card.ability.special.multiplier
                end
                if v.ability.extra.t_mult ~= nil then
                    v.ability.extra.t_mult = v.ability.extra.t_mult / card.ability.special.multiplier
                end
                if v.ability.extra.Xmult ~= nil then
                    v.ability.extra.Xmult = v.ability.extra.Xmult / card.ability.special.multiplier
                end
                if v.ability.extra.Xmult_gain ~= nil then
                    v.ability.extra.Xmult_gain = v.ability.extra.Xmult_gain / card.ability.special.multiplier
                end
                if v.ability.extra.Xmult_loss ~= nil then
                    v.ability.extra.Xmult_loss = v.ability.extra.Xmult_loss / card.ability.special.multiplier
                end
                if v.config.center_key == "j_misprint" then
                    v.ability.extra.max = v.ability.extra.max / card.ability.special.multiplier
                end
            end
            if v ~= card and v.ability.special ~= nil and type(v.ability.special) == "table" then
                if v.ability.special.stencil_Xmult ~= nil then
                    v.ability.special.stencil_Xmult = v.ability.special.stencil_Xmult / card.ability.special.multiplier
                end
                if v.ability.special.raised_fist_Xmult ~= nil then
                    v.ability.special.raised_fist_Xmult = v.ability.special.raised_fist_Xmult / card.ability.special.multiplier
                end
                if v.ability.special.supernova_Xmult ~= nil then
                    v.ability.special.supernova_Xmult = v.ability.special.supernova_Xmult / card.ability.special.multiplier
                end
                if v.ability.special.ceremonial_dagger_Xmult ~= nil then
                    v.ability.special.ceremonial_dagger_Xmult = v.ability.special.ceremonial_dagger_Xmult / card.ability.special.multiplier
                end
            end
        end
    end,

    calculate = function(self, card, context)
        if context.card_added and context.card.ability.set == "Joker" then 
            if context.card.ability.extra ~= nil and type(context.card.ability.extra) == "table" then
                if context.card.ability.extra.mult ~= nil then
                    context.card.ability.extra.mult = context.card.ability.extra.mult * card.ability.special.multiplier
                end
                if context.card.ability.extra.mult_gain ~= nil then
                    context.card.ability.extra.mult_gain = context.card.ability.extra.mult_gain * card.ability.special.multiplier
                end
                if context.card.ability.extra.mult_loss ~= nil then
                    context.card.ability.extra.mult_loss = context.card.ability.extra.mult_loss * card.ability.special.multiplier
                end
                if context.card.ability.extra.s_mult ~= nil then
                    context.card.ability.extra.s_mult = context.card.ability.extra.s_mult * card.ability.special.multiplier
                end
                if context.card.ability.extra.t_mult ~= nil then
                    context.card.ability.extra.t_mult = context.card.ability.extra.t_mult * card.ability.special.multiplier
                end
                if context.card.ability.extra.Xmult ~= nil then
                    context.card.ability.extra.Xmult = context.card.ability.extra.Xmult * card.ability.special.multiplier
                end
                if context.card.ability.extra.Xmult_gain ~= nil then
                    context.card.ability.extra.Xmult_gain = context.card.ability.extra.Xmult_gain * card.ability.special.multiplier
                end
                if context.card.ability.extra.Xmult_loss ~= nil then
                    context.card.ability.extra.Xmult_loss = context.card.ability.extra.Xmult_loss * card.ability.special.multiplier
                end
                if context.card.config.center_key == "j_misprint" then
                    context.card.ability.extra.max = context.card.ability.extra.max * card.ability.special.multiplier
                end
            end
            if context.card ~= card and context.card.ability.special ~= nil and type(context.card.ability.special) == "table" then
                if context.card.ability.special.stencil_Xmult ~= nil then
                    context.card.ability.special.stencil_Xmult = context.card.ability.special.stencil_Xmult * card.ability.special.multiplier
                end
                if context.card.ability.special.raised_fist_Xmult ~= nil then
                    context.card.ability.special.raised_fist_Xmult = context.card.ability.special.raised_fist_Xmult * card.ability.special.multiplier
                end
                if context.card.ability.special.supernova_Xmult ~= nil then
                    context.card.ability.special.supernova_Xmult = context.card.ability.special.supernova_Xmult * card.ability.special.multiplier
                end
                if context.card.ability.special.ceremonial_dagger_Xmult ~= nil then
                    context.card.ability.special.ceremonial_dagger_Xmult = context.card.ability.special.ceremonial_dagger_Xmult * card.ability.special.multiplier
                end
            end
        end
    end
}
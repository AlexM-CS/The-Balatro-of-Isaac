SMODS.Joker {
    key = "halo_of_flies",
    config = {
        extra = {
            odds = 8
        },
        special = {
            flies = 2,
            type = "Basic"
        }
    },
    rarity = 2,
    pos = { x = 9, y = 2 },
    atlas = "tboi_jokers",
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "flies", set = "Other" }
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
                card.ability.special.flies,
                card.ability.special.type,
                numerator,
                denominator
            }
        }
    end,

    add_to_deck = function(self, card)
        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
            if pseudorandom("flies") < G.GAME.probabilities.normal / card.ability.extra.odds then
                G.GAME.blind:disable()
                play_sound("timpani")
                SMODS.calculate_effect({ message = localize("ph_boss_disabled")}, card)
            end
        end
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint and G.GAME.blind.boss then
            if SMODS.pseudorandom_probability(card, "halo_of_flies", 1, card.ability.extra.odds) then
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.GAME.blind:disable()
                                        play_sound("timpani")
                                        delay(0.4)
                                        return true
                                    end
                                }))
                                SMODS.calculate_effect({ message = localize("ph_boss_disabled")}, card)
                                return true
                            end
                        }))
                    end
                }
            end
        end
        if context.joker_main then
            return BI.calculate_flies(card, context)
        end
    end
}
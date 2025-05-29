SMODS.Joker {
    key = "halo_of_flies",
    loc_txt = {
        name = "Halo of Flies",
        text = {
            "+#1# {C:attention}Flies",
            "{C:green}#2# in #3#{} chance to",
            "disable the {C:attention}Boss Blind",
            "{s:0.8}{C:inactive}\"Projectile Protection\""
        }
    },
    config = {
        extra = {
            flies = 2,
            odds = 8
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
        return {
            vars = {
                card.ability.extra.flies,
                G.GAME.probabilities.normal,
                card.ability.extra.odds
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
            if pseudorandom("flies") < G.GAME.probabilities.normal / card.ability.extra.odds then
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
            return BI.calculate_flies(self, card, context)
        end
    end
}
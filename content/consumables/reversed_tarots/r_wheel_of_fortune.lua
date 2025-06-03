SMODS.Consumable {
    key = "r_wheel_of_fortune",
    set = "tboi_reversed",
    loc_txt = {
        name = "Wheel of Fortune?",
        text = {
            "{C:green}#1# in #2#{} chance to",
            "add {C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or",
            "{C:dark_edition}Polychrome{} to a random card in hand",
            "{s:0.8}{C:inactive}\"Throw the dice of fate\""
        }
    },
    config = {
        extra = {
            odds = 4
        }
    },
    pos = { x = 0, y = 2 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds
            }
        }
    end,

    use = function(self, card, area, copier)
        if pseudorandom("r_wheel_of_fortune") < G.GAME.probabilities.normal / card.ability.extra.odds then
            local editionless_cards = SMODS.Edition:get_edition_cards(G.hand, true)

            local eligible_card = pseudorandom_element(editionless_cards, pseudoseed("r_wheel_of_fortune"))
            local edition = poll_edition("r_wheel_of_fortune", nil, true, true,
                { "e_polychrome", "e_holo", "e_foil" })
            eligible_card:set_edition(edition, true)
            check_for_unlock({ type = "have_edition" })
        else
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize("k_nope_ex"),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            "tm" or "cm",
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound("tarot2", 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound("tarot2", 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,

    can_use = function(self, card)
        return next(SMODS.Edition:get_edition_cards(G.hand, true))
    end
}
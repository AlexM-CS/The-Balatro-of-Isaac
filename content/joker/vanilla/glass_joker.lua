SMODS.Joker:take_ownership("glass",
    {
        --[[
        NOTE: As of writing (6/14/2025), Glass Joker has a known bug where cards like
        Immolate, Incantation, and other Spectrals that destroy random cards in hand
        DON'T work with Glass Joker, even though the Hanged Man does. Because my Reversed
        Tarot cards work similarly to these, where they destroy random cards in hand,
        I won't be going out of my way to make sure the behavior works. Once the bug is
        fixed in Vanilla, the cards should update Glass Joker as intended.
        ]]--
        name = "tboi-Glass Joker",
        config = {
            extra = {
                Xmult_gain = 0.75,
                Xmult = 1
            }
        },
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
            return {
                vars = {
                    card.ability.extra.Xmult_gain,
                    card.ability.extra.Xmult
                }
            }
        end,
        calculate = function(self, card, context)
            if context.remove_playing_cards and not context.blueprint then
                local glass_cards = 0
                for _, removed_card in ipairs(context.removed) do
                    if removed_card.shattered then glass_cards = glass_cards + 1 end
                end
                if glass_cards > 0 then
                    return {
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain * glass_cards
                                            return true
                                        end
                                    }))
                                    SMODS.calculate_effect({
                                            message = localize ({
                                                type = "variable",
                                                key = "a_xmult", vars = {
                                                    card.ability.extra.Xmult + card.ability.extra.Xmult_gain * glass_cards
                                                }
                                            })
                                        }, card)
                                    return true
                                end
                            }))
                        end
                    }
                end
            end
            if context.using_consumeable and not context.blueprint and
               (context.consumeable.config.center.key == "c_hanged_man" or
               context.consumeable.config.center.key == "c_tboi_r_devil" or
               context.consumeable.config.center.key == "c_tboi_r_hanged_man" or
               context.consumeable.config.center.key == "c_tboi_r_moon" or
               context.consumeable.config.center.key == "c_tboi_r_star" or
               context.consumeable.config.center.key == "c_tboi_r_sun" or
               context.consumeable.config.center.key == "c_tboi_r_world") then
                -- We need to run this code for anything that can potentially destroy cards in hand
                local glass_cards = 0
                local temp_hand = {}
                for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
                for _, removed_card in ipairs(G.hand.highlighted) do
                    if SMODS.has_enhancement(removed_card, "m_glass") then glass_cards = glass_cards + 1 end
                end
                if glass_cards > 0 then
                    card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain * glass_cards
                    return {
                        message = localize ({
                            type = "variable",
                            key = "a_xmult",
                            vars = { card.ability.extra.Xmult }
                        })
                    }
                end
            end
            if context.joker_main then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    },
    true
)
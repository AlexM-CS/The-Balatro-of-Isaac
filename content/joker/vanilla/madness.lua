SMODS.Joker:take_ownership("madness",
    {
        config = {
            extra = {
                Xmult_gain = 0.5,
                Xmult = 1
            }
        },

        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.Xmult_gain,
                    card.ability.extra.Xmult
                }
            }
        end,

        calculate = function(self, card, context)
            if context.setting_blind and not context.blueprint and not context.blind.boss then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
                local destructable_jokers = {}
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced then
                        destructable_jokers[#destructable_jokers + 1] =
                            G.jokers.cards[i]
                    end
                end
                local joker_to_destroy = pseudorandom_element(destructable_jokers, pseudoseed("madness"))

                if joker_to_destroy then
                    joker_to_destroy.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            (context.blueprint_card or card):juice_up(0.8, 0.8)
                            joker_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
                            return true
                        end
                    }))
                end
                return {
                    message = localize({
                        type = "variable",
                        key = "a_xmult",
                        vars = { card.ability.extra.Xmult }
                    })
                }
            end
            if context.joker_main then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end,
    },
    true
)
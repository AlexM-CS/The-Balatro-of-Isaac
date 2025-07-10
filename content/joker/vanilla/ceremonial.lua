SMODS.Joker:take_ownership("ceremonial",
    {
        name = "tboi-Ceremonial Dagger",
        config = {
            extra = {
                mult = 0
            },
            special = {
                -- Some Jokers that gain mult, such as Ceremonial Dagger, can have their mult
                -- be set at an irregular position if it grows and then Cricket's Head is sold.
                -- To counter this, a multiplier that will specifically accessed by Cricket's
                -- Head is used.
                ceremonial_dagger_Xmult = 2
            }
        },

        loc_vars = function(self, info_queue, card)
            if BI.show_item_pools_check() then
                local text = BI.generate_pool_text(card)
                info_queue[#info_queue + 1] = {
                    set = "Other", key = "item_pool", vars = {
                        text.is_modded,
                        text.rarity,
                        colours = {
                            text.colour
                        }
                    }
                }
            end
            return {
                vars = {
                    card.ability.special.ceremonial_dagger_Xmult,
                    card.ability.extra.mult
                }
            }
        end,

        calculate = function(self, card, context)
            if context.setting_blind and not context.blueprint then
                local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        my_pos = i
                        break
                    end
                end
                if my_pos and G.jokers.cards[my_pos + 1] and not G.jokers.cards[my_pos + 1].ability.eternal and not G.jokers.cards[my_pos + 1].getting_sliced then
                    local sliced_card = G.jokers.cards[my_pos + 1]
                    sliced_card.getting_sliced = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.joker_buffer = 0
                            card.ability.extra.mult = card.ability.extra.mult + card.ability.special.ceremonial_dagger_Xmult * sliced_card.sell_cost
                            card:juice_up(0.8, 0.8)
                            sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                            play_sound("slice1", 0.96 + math.random() * 0.08)
                            return true
                        end
                    }))
                    return {
                        message = localize({
                            type = "variable",
                            key = "a_mult",
                            vars = { card.ability.special.ceremonial_dagger_Xmult * sliced_card.sell_cost  }
                        }),
                        colour = G.C.RED,
                        no_juice = true
                    }
                end
            end
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    },
    true
)
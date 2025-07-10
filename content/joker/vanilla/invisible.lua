SMODS.Joker:take_ownership("invisible",
    {
        config = {
            extra = {
                invis_rounds = 0,
                total_rounds = 2
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
            local main_end
            if G.jokers and G.jokers.cards then
                for _, joker in ipairs(G.jokers.cards) do
                    if joker.edition and joker.edition.negative then
                        main_end = {}
                        localize ({
                            type = "other",
                            key = "remove_negative",
                            nodes = main_end,
                            vars = {}
                        })
                        break
                    end
                end
            end
            return {
                vars = {
                    card.ability.extra.total_rounds,
                    card.ability.extra.invis_rounds
                },
                main_end = main_end
            }
        end,

        calculate = function(self, card, context)
            if context.selling_self and (card.ability.extra.invis_rounds >= card.ability.extra.total_rounds) and not context.blueprint then
                local jokers = {}
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] ~= card then
                        jokers[#jokers + 1] = G.jokers.cards[i]
                    end
                end
                if #jokers > 0 then
                    if #G.jokers.cards <= G.jokers.config.card_limit then
                        local chosen_joker = pseudorandom_element(jokers, "invisible")
                        local copied_joker = copy_card(chosen_joker, nil, nil, nil, chosen_joker.edition and chosen_joker.edition.negative)
                        copied_joker:add_to_deck()
                        G.jokers:emplace(copied_joker)
                        return {
                            message = localize("k_duplicated_ex")
                        }
                    else
                        return {
                            message = localize("k_no_room_ex")
                        }
                    end
                else
                    return {
                        message = localize("k_no_other_jokers")
                    }
                end
            end
            if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                card.ability.extra.invis_rounds = card.ability.extra.invis_rounds + 1
                if card.ability.extra.invis_rounds == card.ability.extra.total_rounds then
                    local eval = function(card) return not card.REMOVED end
                    juice_card_until(card, eval, true)
                end
                return {
                    message = (card.ability.extra.invis_rounds < card.ability.extra.total_rounds) and
                        (card.ability.extra.invis_rounds.."/"..card.ability.extra.total_rounds) or
                        localize("k_active_ex"),
                    colour = G.C.FILTER
                }
            end
        end,
    },
    true
)
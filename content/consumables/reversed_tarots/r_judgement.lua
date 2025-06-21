SMODS.Consumable {
    key = "r_judgement",
    set = "tboi_reversed",
    config = {
        special = {
            multiplier = 3
        }
    },
    pos = { x = 0, y = 4 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.special.multiplier
            }
        }
    end,

    use = function(self, card, area, copier)
        local candidates = {}
        for i = 1, #G.jokers.cards do
            local _joker = G.jokers.cards[i]
            if not _joker.ability.eternal then
                candidates[#candidates + 1] = G.jokers.cards[i]
            end
        end
        local _card = pseudorandom_element(candidates, pseudoseed("r_judgement"))
        local _value = _card.sell_cost * card.ability.special.multiplier
        G.E_MANAGER:add_event(Event({
            func = function()
                _card:start_dissolve()
                ease_dollars(_value)
                return true
            end
        }))
    end,

    can_use = function(self, card)
        local noneternal = false
        for _, _joker in ipairs(G.jokers.cards) do
            if not _joker.ability.eternal then
                noneternal = true
                break
            end
        end
        return G.jokers and noneternal
    end
}
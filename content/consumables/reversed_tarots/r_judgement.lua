SMODS.Consumable {
    key = "r_judgement",
    set = "tboi_reversed",
    loc_txt = {
        name = "Judgement?",
        text = {
            "Destroy a random {C:attention}Joker",
            "and gain {X:money,C:white}X#1#{} its sell value",
            "{s:0.8}{C:inactive}\"May you redeem those found wanting\""
        }
    },
    config = {
        extra = {
            multiplier = 3
        }
    },
    pos = { x = 0, y = 4 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.multiplier
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
        local _value = _card.sell_cost * card.ability.extra.multiplier
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
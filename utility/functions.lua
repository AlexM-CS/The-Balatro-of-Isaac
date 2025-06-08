-- Functions to be used by The Balatro of Isaac

function BI.register(items, path)
    for i = 1, #items do
        SMODS.load_file(path.."/"..items[i]..".lua")()
    end
end

function BI.calculate_familiar(self, card, context)
    if context.before then
        card.ability.special.target = pseudorandom_element(context.scoring_hand, pseudoseed("familiar"))
    end
    if context.repetition and context.cardarea == G.play then
        if context.other_card == card.ability.extra.target then
            return {
                repetitions = BI.FAMILIARS.repetitions
            }
        end
    end
    if context.after then card.ability.special.target = nil end
end

function BI.calculate_flies(self, card, context)
    if context.joker_main then
        return {
            chips = card.ability.special.flies * BI.FLIES.fly_chips,
            mult = card.ability.special.flies * BI.FLIES.fly_mult
        }
    end
end
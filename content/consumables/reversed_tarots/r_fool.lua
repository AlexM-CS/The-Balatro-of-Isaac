SMODS.Consumable {
    key = "r_fool",
    set = "Reversed_Tarot",
    pos = { x = 0, y = 0 },
    atlas = "tboi_reversed_tarots",

    loc_vars = function(self, info_queue, card)
        local fool_c = G.GAME.last_tarot_planet and G.P_CENTERS[G.GAME.last_tarot_planet] or nil
        local last_tarot_planet = fool_c and localize { type = "name_text", key = fool_c.key, set = fool_c.set } or
            localize("k_none")
        local colour = (not fool_c or fool_c.name == "The Fool") and G.C.RED or G.C.GREEN

        if not (not fool_c) then
            info_queue[#info_queue + 1] = fool_c
        end

        local main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", padding = 0.02 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "m", colour = colour, r = 0.05, padding = 0.05 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. last_tarot_planet .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
                        }
                    }
                }
            }
        }

        return {
            vars = {
                last_tarot_planet,
                main_end = main_end
            }
        }
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                if G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound("timpani")
                    SMODS.add_card({ key = G.GAME.last_tarot_planet , edition = "e_negative" })
                    card:juice_up(0.3, 0.5)
                end
                return true
            end
        }))
        delay(0.6)
    end,

    can_use = function(self, card)
        return G.consumeables.config.card_limit > #G.consumeables.cards and G.GAME.last_tarot_planet ~= nil
    end
}
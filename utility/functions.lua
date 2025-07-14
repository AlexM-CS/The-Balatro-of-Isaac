-- Functions to be used by The Balatro of Isaac

----------------------------------------------------------------------------------------------------
-- Hooked Vanilla functions:
----------------------------------------------------------------------------------------------------

-- Hooks Card:set_cost
local set_cost_ref = Card.set_cost
function Card:set_cost()
    set_cost_ref(self)
    if self.ability.set == "Planet" and self.ability.name == "Jupiter" and self.sell_cost ~= nil and G.GAME.jupiter_value ~= nil then
        self.sell_cost = self.sell_cost + G.GAME.jupiter_value
    end
end

-- Hooks use_and_sell_buttons
local use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
    local t = use_and_sell_buttons_ref(card)
    if card.area.config.type == "joker" and card.config.center.config.tboi_active == true then
        sell = { n = G.UIT.C, config = {align = "cr"},
                    nodes = { { n = G.UIT.C, config = {
                        ref_table = card,
                        align = "cr",
                        padding = 0.1,
                        r = 0.08,
                        minw = 1.25,
                        hover = true,
                        shadow = true,
                        colour = G.C.UI.BACKGROUND_INACTIVE,
                        one_press = true,
                        button = "sell_card",
                        func = "can_sell_card"},
                        nodes = {
                            { n =G.UIT.B, config = {w = 0.1, h = 0.6} },
                            { n = G.UIT.C, config = {align = "tm"}, nodes = {
                                {n = G.UIT.R, config = {align = "cm", maxw = 1.25}, nodes = {
                                    {n = G.UIT.T, config = {text = localize("b_sell"), colour = G.C.UI.TEXT_LIGHT, scale = 0.4, shadow = true}}
                                }},
                                { n = G.UIT.R, config = {align = "cm"}, nodes = {
                                    { n = G.UIT.T, config = { text = localize("$"), colour = G.C.WHITE, scale = 0.4, shadow = true }},
                                    { n = G.UIT.T, config = { ref_table = card, ref_value = "sell_cost_label", colour = G.C.WHITE, scale = 0.55, shadow = true }}
                                }}}
                            }
                        }},
                    }
                }
        local use = {n = G.UIT.C, config = {align = "cr"},
                nodes = { { n=G.UIT.C, config = {
                            ref_table = card,
                            align = "cr",
                            maxw = 1.25,
                            padding = 0.1,
                            r = 0.08,
                            minw = 1.25,
                            minh = (card.area and card.area.config.type == "joker") and 0 or 1,
                            hover = true,
                            shadow = true,
                            colour = G.C.UI.BACKGROUND_INACTIVE,
                            one_press = true,
                            button = "tboi_use_card",
                            func = "tboi_can_use"
                        },
                        nodes = {
                            { n = G.UIT.B, config = { w = 0.1 ,h = 0.6} },
                            { n = G.UIT.T, config = { text = localize("b_use"), colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true }}
                        }
                    }
                }
            }
        return {
            n = G.UIT.ROOT,
            config = {padding = 0, colour = G.C.CLEAR},
            nodes = {
                { n = G.UIT.C, config = {padding = 0.15, align = "cl"}, nodes = {
                    { n = G.UIT.R, config = {align = "cl"}, nodes = { sell } },
                    { n = G.UIT.R, config = {align = "cl"}, nodes = { use } }
                }},
            }
        }
    end
    return t
end

----------------------------------------------------------------------------------------------------
-- Hooked SMODS functions:
----------------------------------------------------------------------------------------------------

-- Hooks create_card
local create_card_ref = SMODS.create_card
function SMODS.create_card(t)
    local _card = create_card_ref(t)
    if _card ~= nil and t.key_append then
        _card.config.center.tboi_pool = t.key_append
    end
    return _card
end

-- Hooks add_card
---@param t {}
---@param add_to_deck boolean
function SMODS.add_card(t, add_to_deck)
    local card = SMODS.create_card(t)
    if t.set == "Base" or t.set == "Enhanced" then
        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
        card.playing_card = G.playing_card
        table.insert(G.playing_cards, card)
    end
    if add_to_deck then card:add_to_deck() end
    if card.config.center.set == "Joker" and card.config.center.mod then card.config.center.tboi_pool = t.key_append end
    local area = t.area or G.jokers
    area:emplace(card)
    return card
end

----------------------------------------------------------------------------------------------------
-- The Balatro of Isaac functions:
----------------------------------------------------------------------------------------------------

-- Registers things in the mod to be shown in-game
---@param items {}
---@param path string
function BI.register(items, path)
    for i = 1, #items do
        SMODS.load_file(path.."/"..items[i]..".lua")()
    end
end

-- Returns a card's rarity in numerical form
---@param card Card
function BI.get_rarity_as_num(card)
    local rarity = card.config.center.rarity
    if rarity == "Common" then rarity = 1
    elseif rarity == "Uncommon" then rarity = 2
    elseif rarity == "Rare" then rarity = 3
    elseif rarity == "Legendary" then rarity = 4
    end
    return rarity
end

-- Returns a card's rarity in text form
---@param card Card
function BI.get_rarity_as_text(card)
    local rarity = card.config.center.rarity
    if rarity == 1 then rarity = "Common"
    elseif rarity == 2 then rarity = "Uncommon"
    elseif rarity == 3 then rarity = "Rare"
    elseif rarity == 4 then rarity = "Legendary"
    end
    return rarity
end

-- "Can Use" function for TBoI Jokers
---@param any_state boolean
---@param skip_check boolean
function Card:tboi_can_use(any_state, skip_check)
    if not skip_check and ((G.play and #G.play.cards > 0) or
        (G.CONTROLLER.locked) or
        (G.GAME.STOP_USE and G.GAME.STOP_USE > 0))
        then return false end
    if G.STATE ~= G.STATES.HAND_PLAYED and G.STATE ~= G.STATES.DRAW_TO_HAND and G.STATE ~= G.STATES.PLAY_TAROT or any_state then
        return self.config.center.tboi_can_use(self, self)
    end
    return false
end

-- Color change for TBoI Jokers
---@param e {}
G.FUNCS.tboi_can_use = function(e)
    if e.config.ref_table:tboi_can_use(false, false) then
        e.config.colour = G.C.RED
        e.config.button = "tboi_use_card"
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

-- Function to activate Jokers with an active ability
---@param e {}
function G.FUNCS.tboi_use_card(e)
    local card = e.config.ref_table
    local prev_state = G.STATE

    if card.config.center.use then
        G.CONTROLLER.locks.use = true
        if G.booster_pack and not G.booster_pack.alignment.offset.py then
            G.booster_pack.alignment.offset.py = G.booster_pack.alignment.offset.y
            G.booster_pack.alignment.offset.y = G.ROOM.T.y + 29
        end
        if G.shop and not G.shop.alignment.offset.py then
            G.shop.alignment.offset.py = G.shop.alignment.offset.y
            G.shop.alignment.offset.y = G.ROOM.T.y + 29
        end
        if G.blind_select and not G.blind_select.alignment.offset.py then
            G.blind_select.alignment.offset.py = G.blind_select.alignment.offset.y
            G.blind_select.alignment.offset.y = G.ROOM.T.y + 39
        end
        if G.round_eval and not G.round_eval.alignment.offset.py then
            G.round_eval.alignment.offset.py = G.round_eval.alignment.offset.y
            G.round_eval.alignment.offset.y = G.ROOM.T.y + 29
        end

        if card.children.use_button then card.children.use_button:remove(); card.children.use_button = nil end
        if card.children.sell_button then card.children.sell_button:remove(); card.children.sell_button = nil end
        if card.children.price then card.children.price:remove(); card.children.price = nil end

        G.jokers:remove_card(card)
        draw_card(G.play, G.jokers, 1, "up", true, card, nil, false)
        card:juice_up()
        delay(0.2)
        stop_use()
        set_consumeable_usage(card)
        card.config.center:use(card, card, G.jokers, nil)
        SMODS.calculate_context({ using_consumeable = true, consumeable = card, area = G.jokers })

        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.2,
            func = function()
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.1,
                    func = function()
                        G.STATE = prev_state
                        G.TAROT_INTERRUPT = nil
                        G.CONTROLLER.locks.use = false

                        if (prev_state == G.STATES.TAROT_PACK or prev_state == G.STATES.PLANET_PACK or
                                prev_state == G.STATES.SPECTRAL_PACK or prev_state == G.STATES.STANDARD_PACK or
                                prev_state == G.STATES.SMODS_BOOSTER_OPENED or
                                prev_state == G.STATES.BUFFOON_PACK) and G.booster_pack then
                            G.booster_pack.alignment.offset.y = G.booster_pack.alignment.offset.py
                            G.booster_pack.alignment.offset.py = nil
                        else
                            if G.shop then
                                G.shop.alignment.offset.y = G.shop.alignment.offset.py
                                G.shop.alignment.offset.py = nil
                            end
                            if G.blind_select then
                                G.blind_select.alignment.offset.y = G.blind_select.alignment.offset.py
                                G.blind_select.alignment.offset.py = nil
                            end
                            if G.round_eval then
                                G.round_eval.alignment.offset.y = G.round_eval.alignment.offset.py
                                G.round_eval.alignment.offset.py = nil
                            end
                            if G.jokers and G.jokers.cards[1] then
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.E_MANAGER:add_event(Event({
                                            func = function()
                                                G.CONTROLLER.interrupt.focus = nil
                                                if G.jokers then
                                                    G.CONTROLLER:recall_cardarea_focus(G.jokers)
                                                end
                                                return true
                                            end
                                        }))
                                        return true
                                    end
                                }))
                            end
                        end
                        return true
                    end
                }))
                return true
            end
        }))
    end
end

-- Rerolls a card using the specified parameters
---@param card {}
---@param card_type string
---@param area CardArea
---@param reroll_type string
---@param add_to_deck boolean
---@param flip boolean
---@param odds any
function BI.tboi_reroll(card, card_type, area, reroll_type, add_to_deck, flip, odds)
    if reroll_type == "NORMAL" then -- Reroll type used by The D6, Eternal D6, D4, D7, D20, D100, and D Infinity (when using one of the previous)
        if card.config.center.set == card_type then
            if flip then
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.2,
                    func = function()
                        card:flip()
                        play_sound("card1", percent)
                        card:juice_up(0.3, 0.3)
                        return true
                    end
                }))
                if card.config.center.mod and card.config.center.mod.prefix == "tboi" then
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.2,
                        func = function()
                            local new_card_key = pseudorandom_element(BI.POOLS["TBOI_"..(card.config.center.tboi_pool or card.config.center.set)] or BI.POOLS.TBOI_Chaos, reroll_type)
                            card:set_ability(new_card_key)
                            return true
                        end
                    }))
                else
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.2,
                        func = function()
                            local suffix
                            if card.config.center.set == "Joker" then
                                suffix = BI.get_rarity_as_text(card)
                            else
                                suffix = card.config.center.set
                            end
                            local new_card_key = pseudorandom_element(BI.POOLS["VANILLA_"..suffix], reroll_type)
                            card:set_ability(new_card_key)
                            return true
                        end
                    }))
                end
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.2,
                    func = function()
                        card:flip()
                        play_sound("card1", percent)
                        card:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            else
                SMODS.destroy_cards({card})
                local new_card = SMODS.add_card({set = card_type, area = area, key_append = "reroll"..reroll_type}, add_to_deck)
                if area == G.shop_jokers then create_shop_card_ui(new_card) end
                if odds ~= nil and SMODS.pseudorandom_probability(new_card, reroll_type, 1, odds) then SMODS.debuff_card(new_card, true, reroll_type) end
            end
        end
    elseif reroll_type == "RANKS" or reroll_type == "SUITS" then -- Reroll type used by D10 and D12, respectively
        if flip then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.25,
                func = function()
                    card:flip()
                    play_sound("card1", percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end
            }))
            local _rank = nil
            local _suit = nil
            if reroll_type == "RANKS" then _rank = pseudorandom_element(SMODS.Ranks, reroll_type).key end
            if reroll_type == "SUITS" then _suit = pseudorandom_element(SMODS.Suits, reroll_type).key end
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.25,
                func = function()
                    SMODS.change_base(card, _suit, _rank)
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.25,
                func = function()
                    card:flip()
                    play_sound("card1", percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
    elseif reroll_type == "POKER_HANDS" then -- Reroll type used by D8
        local hands = {}
        for k, v in pairs(G.GAME.hands) do if SMODS.is_poker_hand_visible(k) then table.insert(hands, #hands + 1, k) end end
        pseudoshuffle(hands, pseudoseed(reroll_type))
        for i = 1, 4 do -- The D8 picks 4 hands to change
            SMODS.smart_level_up_hand(card, hands[i], false, pseudorandom_element({ -2, -1, 1, 2}, reroll_type))
        end
    elseif reroll_type == "VOUCHER" then -- Reroll type used by D7
        local eligible = {}
        for i = 1, #G.P_CENTER_POOLS.Voucher do
            local _voucher = G.P_CENTER_POOLS.Voucher[i]
            if not G.GAME.used_vouchers[_voucher.key] and _voucher.requires == nil then
                table.insert(eligible, #eligible + 1, _voucher.key)
            elseif _voucher.requires and G.GAME.used_vouchers[_voucher.requires[1]] then
                table.insert(eligible, #eligible + 1, _voucher.key)
            end
        end
        pseudoshuffle(eligible, pseudoseed(reroll_type))
        for i = 1, #G.shop_vouchers.cards do
            G.shop_vouchers.cards[i]:set_ability(eligible[i])
        end
    end
end

-- Helper function that does an area reroll
---@param card_type string
---@param area CardArea
---@param reroll_type string
---@param add_to_deck boolean
---@param flip boolean
---@param odds any
function BI.tboi_area_reroll(card_type, area, reroll_type, add_to_deck, flip, odds)
    for i = 1, #area.cards do
        BI.tboi_reroll(area.cards[i], card_type, area, reroll_type, add_to_deck, flip, odds)
    end
end

-- Returns true when holding an item that can reroll held Jokers
function BI.has_joker_reroll()
    local next = next -- Faster than simply using next. Thanks StackOverflow :)
    return next(SMODS.find_card("j_tboi_d4")) ~= nil
end

-- Returns true when holding an item that can reroll held consumables
function BI.has_consumable_reroll()
    local next = next -- Faster than simply using next. Thanks StackOverflow :)
    return next(SMODS.find_card("j_tboi_d20")) ~= nil
end

-- Returns true when item pools should be displayed
---@param card_type string
function BI.show_item_pools(card_type)
    return (card_type == "Joker" and BI.has_joker_reroll()) or
           (BI.CONSUMABLE_TYPES[card_type] and BI.has_consumable_reroll())
end

-- Generates the text to be used in the item_pool localization for vanilla Jokers
---@param card Card
function BI.generate_pool_text(card)
    local ret = {}
    if card.config.center.set == "Joker" then
        if not card.config.center.mod then
            ret["is_modded"] = "Vanilla"
            ret["pool"] = BI.get_rarity_as_text(card)
            ret["colour"] = G.C.RARITY[BI.get_rarity_as_num(card)]
            return ret
        else
            if card.config.center.mod.prefix == "tboi" then ret["is_modded"] = "Isaac"
            else ret["is_modded"] = card.config.center.mod.prefix
            end
            ret["pool"] = card.config.center.tboi_pool or "Chaos"
            ret["colour"] = BI.C[ret["pool"]]
            return ret
        end
    elseif BI.CONSUMABLE_TYPES[card.config.center.set] then
        if not card.config.center.mod then
            ret["is_modded"] = "Vanilla"
            ret["pool"] = card.config.center.set
            ret["colour"] = G.C.SECONDARY_SET[ret["pool"]]
            return ret
        else
            if card.config.center.mod.prefix == "tboi" then ret["is_modded"] = "Isaac"
            else ret["is_modded"] = card.config.center.mod.prefix
            end
            ret["pool"] = card.config.center.set
            ret["colour"] = BI.C[ret["pool"]]
            return ret
        end
    end
end

-- Calculates the effects of familiars
---@param card {}
---@param context {}
function BI.calculate_familiar(card, context)
    if context.before then
        card.ability.special.target = pseudorandom_element(context.scoring_hand, pseudoseed("familiar"))
    end
    if context.repetition and context.cardarea == G.play then
        if context.other_card == card.ability.special.target then
            return {
                repetitions = BI.FAMILIARS.repetitions
            }
        end
    end
    if context.after then card.ability.special.target = nil end
end

-- Calculates the effects of flies
---@param card {}
---@param context {}
function BI.calculate_flies(card, context)
    if context.joker_main then
        return {
            chips = card.ability.special.flies * BI.FLIES.fly_chips,
            mult = card.ability.special.flies * BI.FLIES.fly_mult
        }
    end
end
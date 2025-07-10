SMODS.Booster {
    key = "treasure_normal_1",
    kind = "Treasure",
    config = {
        extra = 2,
        choose = 1
    },
    atlas = "tboi_boosters",
    pos = { x = 0, y = 0 },
    cost = 4,
    weight = 0,
    create_card = function(self, card)
        return SMODS.create_card({
            set = "Joker",
            area = G.pack_cards,
            key_append = "Treasure"
        })
    end,

    --ease_background_colour = function(self)
        
    --end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.choose,
                card.ability.extra
            }
        }
    end
}

SMODS.Booster {
    key = "treasure_normal_2",
    kind = "Treasure",
    config = {
        extra = 2,
        choose = 1
    },
    atlas = "tboi_boosters",
    pos = { x = 1, y = 0 },
    cost = 4,
    weight = 0,
    create_card = function(self, card)
        return SMODS.create_card({
            set = "Joker",
            area = G.pack_cards,
            key_append = "Treasure"
        })
    end,

    --ease_background_colour = function(self)
        
    --end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.choose,
                card.ability.extra
            }
        }
    end
}

SMODS.Booster {
    key = "treasure_jumbo_1",
    kind = "Treasure",
    config = {
        extra = 4,
        choose = 1
    },
    atlas = "tboi_boosters",
    pos = { x = 2, y = 0 },
    cost = 6,
    weight = 0,
    create_card = function(self, card)
        return SMODS.create_card({
            set = "Joker",
            area = G.pack_cards,
            key_append = "Treasure"
        })
    end,

    --ease_background_colour = function(self)
        
    --end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.choose,
                card.ability.extra
            }
        }
    end
}

SMODS.Booster {
    key = "treasure_mega_1",
    kind = "Treasure",
    config = {
        extra = 4,
        choose = 2
    },
    atlas = "tboi_boosters",
    pos = { x = 3, y = 0 },
    cost = 8,
    weight = 0,
    create_card = function(self, card)
        return SMODS.create_card({
            set = "Joker",
            area = G.pack_cards,
            key_append = "Treasure"
        })
    end,

    --ease_background_colour = function(self)
        
    --end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.choose,
                card.ability.extra
            }
        }
    end
}
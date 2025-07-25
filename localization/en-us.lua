return {
    descriptions = {
        Joker = {
            -- Vanilla Jokers with modified descriptions

            j_stencil = {
                name = "Joker Stencil",
                text = {
                    "{X:red,C:white} X#1# {} Mult for each",
                    "empty {C:attention}Joker{} slot",
                    "{s:0.8}Joker Stencil included",
                    "{C:inactive}(Currently {X:red,C:white} X#2# {C:inactive})",
                }
            },
            j_ceremonial={
                name="Ceremonial Dagger",
                text={
                    "When {C:attention}Blind{} is selected,",
                    "destroy Joker to the right",
                    "and permanently add {X:red,C:white}#1#X",
                    "its sell value to this {C:red}Mult",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                }
            },
            j_raised_fist = {
                name = "Raised Fist",
                text = {
                    "Adds {X:red,C:white}#1#X{} the rank",
                    "of {C:attention}lowest{} ranked card",
                    "held in hand to Mult"
                }
            },
            j_supernova={
                name= "Supernova",
                text = {
                    "Adds {V:1,C:white}#1#{}the number of times",
                    "{C:attention}poker hand{} has been",
                    "played this run to Mult",
                }
            },
            j_drivers_license={
                name="Driver's License",
                text={
                    "{X:mult,C:white} X#1# {} Mult if you have",
                    "at least {C:attention}#2#{} Enhanced",
                    "cards in your full deck",
                    "{C:inactive}(Currently {C:attention}#3#{C:inactive})",
                },
                unlock={
                    "Enhance {E:1,C:attention}#1#{} cards",
                    "in your deck",
                },
            },

            -- TBOI Jokers

            j_tboi_sad_onion = {
                name = "The Sad Onion",
                text = {
                    "{C:blue}+#1#{} Chips for",
                    "every {C:attention}Joker{} card",
                    "{C:inactive}(Currently {}{C:blue}+#2#{}{C:inactive} Chips)",
                    "{s:0.8}{C:inactive}\"Tears up\""
                }
            },
            j_tboi_inner_eye = {
                name = "The Inner Eye",
                text = {
                    "Makes 3 random retriggers",
                    "on scored cards",
                    "{s:0.8}{C:inactive}\"Triple shot\""
                },
                unlock = {
                    "Placeholder"
                }
            },
            j_tboi_spoon_bender = {
                name = "Spoon Bender",
                text = {
                    "{C:attention}Debuffed{} cards",
                    "still score",
                    "{s:0.8}{C:inactive}\"Homing Shots\""
                }
            },
            j_tboi_crickets_head = {
                name = "Cricket's Head",
                text = {
                    "Applies a {X:red,C:white}X#1#{} Mult",
                    "multiplier to other {C:attention}Jokers'",
                    "{C:red}Mult{} effects",
                    "{s:0.8}{C:inactive}\"DMG up\""
                },
                unlock = {
                    "Placeholder"
                }
            },
            j_tboi_my_reflection = {
                name = "My Reflection",
                text = {
                    "Swaps {C:blue}Chips{} and {C:red}Mult{}",
                    "{s:0.8}{C:inactive}\"Boomerang tears\""
                }
            },
            j_tboi_number_one = {
                name = "Number One",
                text = {
                    "Halves base {C:red}Mult",
                    "For every {C:red}#1#{} Mult lost",
                    "this gives {C:blue}+#2#{} Chips",
                    "{s:0.8}{C:inactive}\"Tears up\""
                }
            },
            j_tboi_blood_of_the_martyr = {
                name = "Blood of the Martyr",
                text = {
                    "{C:red}+#1#{} Mult",
                    "{X:red,C:white}X#2#{} Mult if you also have",
                    "{C:attention}Book of Belial",
                    "{s:0.8}{C:inactive}\"DMG up\""
                },
                unlock = {
                    "Placeholder"
                }
            },
            j_tboi_brother_bobby = {
                name = "Brother Bobby",
                text = {
                    "{C:attention}Familiar",
                    "No extra effect",
                    "{s:0.8}{C:inactive}\"Friends 'till the end\""
                },
                unlock = {
                    "Placeholder"
                }
            },
            j_tboi_skatole = {
                name = "Skatole",
                text = {
                    "All {C:attention}Flies{} give",
                    "{C:red}+#1#{} Mult",
                    "{s:0.8}{C:inactive}\"Fly love\""
                }
            },
            j_tboi_halo_of_flies = {
                name = "Halo of Flies",
                text = {
                    "+#1# #2# {C:attention}Flies",
                    "{C:green}#3# in #4#{} chance to",
                    "disable the {C:attention}Boss Blind",
                    "{s:0.8}{C:inactive}\"Projectile Protection\""
                },
                unlock = {
                    "Placeholder"
                }
            },
            j_tboi_1up = {
                name = "1 Up",
                text = {
                    "Prevents death once",
                    "{C:red}self destructs",
                    "{s:0.8,C:inactive}\"Extra life\""
                },
                unlock = {
                    "Placeholder"
                }
            },
            j_tboi_magic_mushroom = {
                name = "Magic Mushroom",
                text = {
                    "{C:attention}+#1#{} Hand, {C:red}+#2#{} discard",
                    "{C:blue}+#3#{} Chips, {C:red}+#4#{} Mult",
                    "{X:red,C:white}X#5#{} Mult",
                    "{s:0.8}{C:inactive}\"All stats up!\""
                },
                unlock = {
                    "Placeholder"
                }
            },
            j_tboi_the_virus = {
                name = "The Virus",
                text = {
                    "{C:attention}Poisonous",
                    "Retrigger {C:attention}Poisonous{} Jokers",
                    "{s:0.8}{C:inactive}\"Poison Touch\""
                }
            },
            j_tboi_roid_rage = {
                name = "Roid Rage",
                text = {
                    "{C:blue}+#1#{} Chips",
                    "{C:attention}-#2#{} Chips for every",
                    "card scored this {C:attention}Ante",
                    "{s:0.8}{C:inactive}\"Speed and range up\""
                }
            },
            j_tboi_less_than_3 = {
                name = "<3",
                text = {
                    "{C:attention}+#1#{} Hand, refills",
                    "Hands if found mid-blind",
                    "{s:0.8}\"HP up\""
                },
                unlock = {
                    "Placeholder"
                }
            },
            j_tboi_raw_liver = {
                name = "Raw Liver",
                text = {
                    "At the start of each round,",
                    "this Joker gives {C:blue}+#1#{} Hand",
                    "for each {C:green}Uncommon{} Joker",
                    "{s:0.8}{C:inactive}\"HP up\""
                }
            },
            j_tboi_skeleton_key = {
                name = "Skeleton Key",
                text = {
                    "Gives #1# {C:attention}Keys",
                    "on pickup",
                    "{s:0.8}{C:inactive}\"99 Keys\""
                }
            },
            j_tboi_a_dollar = {
                name = "A Dollar",
                text = {
                    "Sells for {C:money}$100{}",
                    "{s:0.8}{C:inactive}\"$$$\""
                }
            },
            j_tboi_boom = {
                name = "Boom!",
                text = {
                    "Gives #1# {C:attention}Bombs",
                    "on pickup",
                    "{s:0.8}{C:inactive}\"10 Bombs\""
                }
            },
            j_tboi_transcendence = {
                name = "Transcendence",
                text = {
                    "{C:red}+#1#{} Mult for each",
                    "{C:attention}Blind{} skipped this run",
                    "{C:inactive}(Currently {C:red}+#2#{}{C:inactive} Mult)",
                    "{s:0.8}{C:inactive}\"We all float down here...\""
                }
            },
            j_tboi_the_compass = {
                name = "The Compass",
                text = {
                    "For every {C:attention}Boss Blind",
                    "defeated, gain {C:red}+#1#{} Mult",
                    "{C:inactive}(Currently {C:red}+#2#{}{C:inactive} Mult)",
                    "{s:0.8}{C:inactive}\"The end is near\""
                }
            },
            j_tboi_lunch = {
                name = "Lunch",
                text = {
                    "{C:blue}+#1#{} Hand, {C:blue}+#2#{} Chips",
                    "Eaten after {C:attention}#3#{} rounds",
                    "{s:0.8}{C:inactive}\"HP up\""
                }
            },
            j_tboi_dinner = {
                name = "Dinner",
                text = {
                    "{C:blue}+#1#{} Hands, {X:red,C:white}X#2#{} Mult",
                    "Eaten after {C:attention}#3#{} rounds",
                    "{s:0.8}{C:inactive}\"HP up\""
                }
            },
            j_tboi_dessert = {
                name = "Dessert",
                text = {
                    "{C:blue}+#1#{} Hands",
                    "Eaten after {C:attention}#2#{} rounds",
                    "{s:0.8}{C:inactive}\"HP up\""
                }
            },
            j_tboi_breakfast = {
                name = "Breakfast",
                text = {
                    "{C:blue}+#1#{} Hand, {C:red}+#2#{} Mult",
                    "Eaten after {C:attention}#3#{} rounds",
                    "{s:0.8}{C:inactive}\"HP up\""
                }
            },
            j_tboi_rotten_meat = {
                name = "Rotten Meat",
                text = {
                    "{C:blue}+#1#{} Hand, {C:attention}+#2#{} Retrigger",
                    "on scored {C:attention}number cards",
                    "Eaten after {C:attention}#3#{} rounds",
                    "{s:0.8}{C:inactive}\"HP up\""
                }
            },
            j_tboi_wooden_spoon = {
                name = "Wooden Spoon",
                text = {
                    "{X:blue,C:white}X#1#{} Chips",
                    "{s:0.8}{C:inactive}\"Speed up\""
                }
            },
            j_tboi_the_belt = {
                name = "The Belt",
                text = {
                    "This Joker gets {C:blue}+#1#{} Chips",
                    "when a Blind is defeated",
                    "{C:inactive}(Currently {C:blue}+#2#{} {C:inactive}Chips)",
                    "{s:0.8}{C:inactive}\"Speed up\""
                }
            },
            j_tboi_moms_underwear = {
                name = "Mom's Underwear",
                text = {
                    "+#2# #3# {C:attention}Flies",
                    "{C:attention}+#1#{} hand size",
                    "{s:0.8}{C:inactive}\"Range up\""
                }
            },
            j_tboi_moms_heels = {
                name = "Mom's Heels",
                text = {
                    "{C:attention}+#1#{} hand size",
                    "This Joker gains {C:red}+#2#{} Mult",
                    "if played hand triggers the",
                    "{C:attention}Boss Blind{} ability",
                    "{C:inactive}(Currently {C:red}+#3#{} {C:inactive}Mult)",
                    "{s:0.8}{C:inactive}\"Range up\""
                }
            },
            j_tboi_the_d6 = {
                name = "The D6",
                text = {
                    "Reroll all {C:attention}Jokers",
                    "in the shop or in",
                    "{C:attention}Booster Packs",
                    "{s:0.8}{C:inactive}\"Reroll your destiny\""
                }
            },
            j_tboi_d20 = {
                name = "D20",
                text = {
                    "Reroll all {C:attention}consumables",
                    "{s:0.8}{C:inactive}\"Reroll the basics\""
                }
            },
            j_tboi_midas_touch = {
                name = "Midas Touch",
                text = {
                    "Scored cards have a",
                    "{C:green}#1# in #2#{} chance to become",
                    "{C:money}Gold Cards{} and a {C:green}#1# in #3#",
                    "chance to gain a {C:money}Gold Seal",
                    "{s:0.8}{C:inactive}\"Golden Touch\""
                }
            },
            j_tboi_d4 = {
                name = "D4",
                text = {
                    "Reroll all held {C:attention}Jokers",
                    "into another Joker from",
                    "the same {C:attention}item pool",
                    "{s:0.8}{C:inactive}\"Reroll into something else\""
                }
            },
            j_tboi_d10 = {
                name = "D10",
                text = {
                    "Reroll the {C:attention}ranks{} of",
                    "cards in hand",
                    "{s:0.8}{C:inactive}\"Rerolls enemies\""
                }
            },
            j_tboi_d12 = {
                name = "D12",
                text = {
                    "Reroll the {C:attention}suits{} of",
                    "cards in hand",
                    "{s:0.8}{C:inactive}\"Rerolls rocks\""
                }
            },
            j_tboi_d8 = {
                name = "D8",
                text = {
                    "Reroll the levels of 4",
                    "different {C:attention}poker hands{} {C:inactive}(±#1#)",
                    "{s:0.8}{C:inactive}\"Reroll stats\""
                }
            },
            j_tboi_empty_vessel = {
                name = "Empty Vessel",
                text = {
                    "Earn {C:money}$#1#{} when played",
                    "hand does not defeat the",
                    "current {C:attention}Blind",
                    "{s:0.8}{C:inactive}\"I reward an empty vessel\""
                }
            },
            j_tboi_head_of_the_keeper = {
                name = "Head of the Keeper",
                text = {
                    "Played cards have a",
                    "{C:green}#1# in #2#{} chance to give {C:money}$#3#",
                    "when scored",
                    "{s:0.8}{C:inactive}\"Penny tears!\""
                }
            },
            j_tboi_d7 = {
                name = "D7",
                text = {
                    "Reroll all {C:attention}Vouchers",
                    "in the shop",
                    "{s:0.8}{C:inactive}\"Reroll rewards!\""
                }
            },
            j_tboi_midnight_snack = {
                name = "Midnight Snack",
                text = {
                    "{C:blue}+#1#{} Hand, {C:attention}+#2#{} Retrigger",
                    "on scored {C:attention}face cards",
                    "Eaten after {C:attention}#3#{} rounds",
                    "{s:0.8}{C:inactive}\"HP up\""
                }
            },
            j_tboi_d1 = {
                name = "D1",
                text = {
                    "Duplicate a random",
                    "held {C:attention}consumable",
                    "{C:inactive}(Must have room)",
                    "{s:0.8}{C:inactive}\"What will it be?\""
                }
            },
            j_tboi_greeds_gullet = {
                name = "Greed's Gullet",
                text = {
                    "At the start of each round,",
                    "gives {C:blue}+#1#{} Hand for every",
                    "{C:money}$#2#{} you have",
                    "{C:inactive}(Currently{} {C:blue}+#3#{} {C:inactive}Hands)",
                    "{s:0.8}{C:inactive}\"Money = Health!\""
                }
            },
            j_tboi_sol = {
                name = "Sol",
                text = {
                    "Gives {C:money}$#1#{} when played",
                    "hand is a {C:planet}Five of a Kind",
                    "{s:0.8}{C:inactive}\"Radiant victory\""
                }
            },
            j_tboi_luna = {
                name = "Luna",
                text = {
                    "Creates a copy of {C:planet}Eris",
                    "when played hand is a",
                    "{C:planet}Flush Five",
                    "{C:inactive}(Must have room)",
                    "{s:0.8}{C:inactive}\"More secrets\""
                }
            },
            j_tboi_mercurius = {
                name = "Mercurius",
                text = {
                    "Creates a {C:dark_edition}Negative{} copy",
                    "of {C:planet}Mercury{} when skipping {C:attention}Blinds",
                    "{s:0.8}{C:inactive}\"Speed up + you feel elusive\""
                }
            },
            j_tboi_venus = {
                name = "Venus",
                text = {
                    "Playing a {C:planet}Three of a Kind",
                    "has a {C:green}#1# in #2#{} chance",
                    "to give {C:blue}+#3#{} Hand",
                    "{s:0.8}{C:inactive}\"HP up + you feel pretty\""
                }
            },
            j_tboi_terra = {
                name = "Terra",
                text = {
                    "Playing a {C:planet}Full House",
                    "adds a {C:attention}Stone Card{} with",
                    "a random {C:attention}Seal{} to your deck",
                    "{s:0.8}{C:inactive}\"Born to rock\""
                }
            },
            j_tboi_mars = {
                name = "Mars",
                text = {
                    "This Joker gains {X:red,C:white}X#1#{} Mult",
                    "per {C:attention}consecutive{} played",
                    "{C:planet}Four of a Kind",
                    "{C:inactive}(Currently {X:red,C:white}X#2#{} {C:inactive}Mult)",
                    "{s:0.8}{C:inactive}\"Double tap dash\""
                }
            },
            j_tboi_jupiter = {
                name = "Jupiter",
                text = {
                    "Playing a {C:planet}Flush{} permanently ",
                    "adds {C:money}$#1#{} of sell value",
                    "to consumable {C:planet}Jupiter{} cards",
                    "{s:0.8}{C:inactive}\"You're a gas giant!\""
                }
            },
            j_tboi_saturnus = {
                name = "Saturnus",
                text = {
                    "Every played hand is a",
                    "{C:planet}Straight",
                    "{s:0.8}{C:inactive}\"Ring of tears\""
                }
            },
            j_tboi_uranus = {
                name = "Uranus",
                text = {
                    "Defeating a {C:attention}Blind{} with",
                    "a {C:planet}Two Pair{} lowers",
                    "Ante scaling by {X:attention,C:white}X#1#",
                    "{s:0.8}{C:inactive}\"Ice tears\""
                }
            },
            j_tboi_neptunus = {
                name = "Neptunus",
                text = {
                    "If played hand is a",
                    "{C:planet}Straight Flush{}, retrigger",
                    "all played cards",
                    "{s:0.8}{C:inactive}\"Open the floodgates\""
                }
            },
            j_tboi_pluto = {
                name = "Pluto",
                text = {
                    "Copies of consumable {C:planet}Pluto",
                    "cards have a {C:green}#1# in #2#{} chance",
                    "to become {C:dark_edition}Negative{} when obtained",
                    "{s:0.8}{C:inactive}\"Size down\""
                }
            },
            j_tboi_eternal_d6 = {
                name = "Eternal D6",
                text = {
                    "Reroll all {C:attention}Jokers",
                    "in the shop or in",
                    "{C:attention}Booster Packs",
                    "{C:green}#1# in #2#{} chance to {C:attention}debuff",
                    "{s:0.8}{C:inactive}\"Reroll your destiny\""
                }
            },
            j_tboi_binge_eater = {
                name = "Binge Eater",
                text = {
                    "Absorbs the effects of",
                    "eaten {C:attention}Food Items",
                    "{s:0.8}{C:inactive}\"All you can eat\""
                }
            },
        },

        Other = {
            -- Bombs --
            bomb = {
                name = "Bomb",
                text = {
                    "Use during a {C:attention}Blind{}",
                    "to add 150 chips",
                    "to your score"
                }
            },

            -- Keys --
            key = {
                name = "Key",
                text = {
                    "Use to open special",
                    "{C:attention}Booster Packs",
                    "in the shop"
                }
            },

            -- Charges --
            charges = {
                name = "Charges",
                text = {
                    "Charges: {C:gold}#1#/#2#",
                    "{C:inactive}#3#"
                }
            },

            -- Pools --
            item_pool = {
                name = "Item Pool",
                text = {
                    "#1#",
                    "{V:1}#2#"
                }
            },

            -- Packs --
            p_tboi_treasure_normal_1 = {
                name = "Treasure Room Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:joker} Joker{} cards",
                    "from the {C:gold}Treasure Room{} pool"
                }
            },

            p_tboi_treasure_normal_2 = {
                name = "Treasure Room Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:joker} Joker{} cards",
                    "from the {C:gold}Treasure Room{} pool"
                }
            },

            p_tboi_treasure_jumbo_1 = {
                name = "Jumbo Treasure Room Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:joker} Joker{} cards",
                    "from the {C:gold}Treasure Room{} pool"
                }
            },

            p_tboi_treasure_mega_1 = {
                name = "Jumbo Treasure Room Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:joker} Joker{} cards",
                    "from the {C:gold}Treasure Room{} pool"
                }
            },

            -- Familiars --
            familiar = {
                name = "Familiar",
                text = {
                    "Retrigger a random",
                    "scored card"
                }
            },

            -- Synergies --
            poisonous = {
                name = "Poisonous",
                text = {
                    "Synergy with:",
                    "{C:attention}The Virus"
                }
            },
            food = {
                name = "Food Item",
                text = {
                    "Synergy with:",
                    "{C:attention}Binge Eater"
                }
            },

            -- Flies --
            flies = {
                name = "Flies",
                text = {
                    "+25 Chips each"
                }
            },
            Fire = {
                name = "Fire Flies",
                text = {

                }
            },
            Fire_explosive = {
                name = {
                    "Fire + ",
                    "Explosive Flies",
                },
                text = {
                    
                }
            },
            Poison = {
                name = "Poison",
                text = {
                    
                }
            },
            Poison_explosive = {
                name = {
                    "Poison +",
                    "Explosive Flied"
                },
                text = {
                    
                }
            },
            Bleed = {
                name = "Bleed Flies",
                text = {
                    
                }
            },
            Fear = {
                name = "Fear Flies",
                text = {
                    
                }
            },
            Petrify = {
                name = "Petrify Flies",
                text = {
                    
                }
            },
            Charm = {
                name = "Charm Flies",
                text = {
                    
                }
            },
            Slow = {
                name = "Slow Flies",
                text = {
                    
                }
            },
            Slow_explosive = {
                name = {
                    "Slow +",
                    "Explosive Flies"
                },
                text = {
                    
                }
            },
            Confusion = {
                name = "Confusion Flies",
                text = {
                    
                }
            },
            Knockback = {
                name = "Knockback Flies",
                text = {
                    
                }
            },
            Knockback_confusion_poison = {
                name = {
                    "Knockback +",
                    "Confusion +",
                    "Poison Flies"
                },
                text = {
                    
                }
            },
            Magnetic = {
                name = "Magnetic Flies",
                text = {
                    
                }
            },
            Bone = {
                name = "Bone Flies",
                text = {
                    
                }
            },
            Godhead = {
                name = "Godhead Flies",
                text = {
                    
                }
            },
            Holy = {
                name = "Holy Flies",
                text = {
                    
                }
            },
            Homing = {
                name = "Homing Flies",
                text = {
                    
                }
            },
            Electric = {
                name = "Electric Flies",
                text = {
                    
                }
            },
            Shield = {
                name = "Shield Flies",
                text = {
                    
                }
            },
            Explosive = {
                name = "Explosive Flies",
                text = {
                    
                }
            },
            Random = {
                name = "Random Flies",
                text = {
                    
                }
            }
        },

        Reversed_Tarot = {
            c_tboi_r_fool = {
                name = "The Fool?",
                text = {
                    "Creates a {C:dark_edition}Negative{} copy",
                    "of the last used {C:tarot}Tarot{} or",
                    "{C:planet}Planet{} card used during this run",
                    "{s:0.8}{C:inactive}\"Let go and move on\""
                }
            },
            c_tboi_r_magician = {
                name = "The Magician?",
                text = {
                    "Remove {C:attention}Enhancements",
                    "from #1# selected cards",
                    "gain {C:money}$#2#",
                    "{s:0.8}{C:inactive}\"May no harm come to you\""
                }
            },
            c_tboi_r_high_priestess = {
                name = "The High Priestess?",
                text = {
                    "Create a random",
                    "{C:dark_edition}Negative{} {C:planet}Planet{} Card",
                    "{s:0.8}{C:inactive}\"Run\""
                }
            },
            c_tboi_r_empress = {
                name = "The Empress?",
                text = {
                    "Enhances #1# random cards",
                    "to {C:red}Mult{} cards",
                    "{s:0.8}{C:inactive}\"May your love bring protection\""
                }
            },
            c_tboi_r_emperor = {
                name = "The Emperor?",
                text = {
                    "Creates up to {C:attention}#1#",
                    "{V:1}Reversed Tarot{} Cards",
                    "{C:inactive}(Must have room)",
                    "{s:0.8}{C:inactive}\"May you find a worthy opponent\""
                }
            },
            c_tboi_r_hierophant = {
                name = "The Hierophant?",
                text = {
                    "Permanently add {C:blue}+#1#{} Chips",
                    "to up to #2# cards",
                    "{s:0.8}{C:inactive}\"Two prayers for the forgotten\""
                }
            },
            c_tboi_r_lovers = {
                name = "The Lovers?",
                text = {
                    "Select up to #1# cards",
                    "Change suits randomly",
                    "{s:0.8}{C:inactive}\"May your heart shatter to pieces\""
                }
            },
            c_tboi_r_chariot = {
                name = "The Chariot?",
                text = {
                    "Add a random {C:attention}Steel Card",
                    "to your hand",
                    "{s:0.8}{C:inactive}\"May nothing walk past you\""
                }
            },
            c_tboi_r_justice = {
                name = "Justice?",
                text = {
                    "Adds a random {C:attention}Glass Card",
                    "to your deck",
                    "{s:0.8}{C:inactive}\"May your sins come back to torment you\""
                }
            },
            c_tboi_r_hermit = {
                name = "The Hermit?",
                text = {
                    "Gives {C:money}$#1#{}",
                    "{s:0.8}{C:inactive}\"May you see the value",
                    "{s:0.8}{C:inactive}of all things in life\"",
                }
            },
            c_tboi_r_wheel_of_fortune = {
                name = "Wheel of Fortune?",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "add {C:dark_edition}Negative{} to a",
                    "random card in hand",
                    "{s:0.8}{C:inactive}\"Throw the dice of fate\""
                }
            },
            c_tboi_r_strength = {
                name = "Strength?",
                text = {
                    "Lowers the rank of up",
                    "to {C:attention}#1#{} selected cards by 1",
                    "{s:0.8}{C:inactive}\"May you break their resolve\""
                }
            },
            c_tboi_r_hanged_man = {
                name = "The Hanged Man?",
                text = {
                    "Destroy up to {C:attention}#1#{}",
                    "random cards in hand",
                    "{s:0.8}{C:inactive}\"May your greed know no bounds\""
                }
            },
            c_tboi_r_death = {
                name = "Death?",
                text = {
                    "Creates {C:attention}#1#{} copy of",
                    "a selected card in your hand",
                    "{s:0.8}{C:inactive}\"May life spring forth",
                    "{s:0.8}{C:inactive}from the fallen\""
                }
            },
            c_tboi_r_temperance = {
                name = "Temperance?",
                text = {
                    "Sell all your {C:attention}Jokers",
                    "Create #1# {C:blue}Spectral{} cards",
                    "{C:inactive}(Must have room)",
                    "{s:0.8}{C:inactive}\"May your hunger be satiated\""
                }
            },
            c_tboi_r_devil = {
                name = "The Devil?",
                text = {
                    "Destroy a random card in your hand",
                    "Add a {C:money}Gold Seal{} to another",
                    "random card in your hand",
                    "{s:0.8}{C:inactive}\"Bask in the light",
                    "{s:0.8}{C:inactive}of your mercy\""
                }
            },
            c_tboi_r_tower = {
                name = "The Tower?",
                text = {
                    "Enhances every card in",
                    "your hand to a {C:attention}Stone Card",
                    "{s:0.8}{C:inactive}\"Creation brings destruction\""
                }
            },
            c_tboi_r_star = {
                name = "The Star?",
                text = {
                    "Destroy all {V:1}Diamonds",
                    "cards in your hand",
                    "{s:0.8}{C:inactive}\"May your loss bring fortune\""
                }
            },
            c_tboi_r_moon = {
                name = "The Moon?",
                text = {
                    "Destroy all {V:1}Clubs",
                    "cards in your hand",
                    "{s:0.8}{C:inactive}\"May you remember lost memories\""
                }
            },
            c_tboi_r_sun = {
                name = "The Sun?",
                text = {
                    "Destroy all {V:1}Hearts",
                    "cards in your hand",
                    "{s:0.8}{C:inactive}\"May the darkness swallow",
                    "{s:0.8}{C:inactive}all around you\""
                }
            },
            c_tboi_r_judgement = {
                name = "Judgement?",
                text = {
                    "Destroy a random {C:attention}Joker",
                    "and gain {X:money,C:white}X#1#{} its sell value",
                    "{s:0.8}{C:inactive}\"May you redeem those found wanting\""
                }
            },
            c_tboi_r_world = {
                name = "The World?",
                text = {
                    "Destroy all {V:1}Spades",
                    "cards in your hand",
                    "{s:0.8}{C:inactive}\"Step into the abyss\""
                }
            }
        }
    },
    misc = {
        dictionary = {
            a_hands_singular = "+#1# Hand",
            k_buffed = "Buffed!",
            k_halved = "Halved!",
            k_scaled = "Scaled!",
            k_descaled = "De-scaled!",
            k_swapped = "Swapped!",

            -- Saves
            ph_1_up = "Saved by 1 Up"
        }
    }
}
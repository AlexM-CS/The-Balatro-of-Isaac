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
                    "Adds {X:red,C:white}#1#{}the number of times",
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
                    "card played this {C:attention}Ante",
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
                    "This Joker gives {C:blue}+#1#{} Hand",
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
                    "every time another Joker",
                    "gives {C:blue}Chips",
                    "{C:inactive}(Currently {C:blue}#2#{} {C:inactive}Chips)",
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
            j_tboi_midnight_snack = {
                name = "Midnight Snack",
                text = {
                    "{C:blue}+#1#{} Hand, {C:attention}+#2#{} Retrigger",
                    "on scored {C:attention}face cards",
                    "Eaten after {C:attention}#3#{} rounds",
                    "{s:0.8}{C:inactive}\"HP up\""
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
        }
    },
    misc = {
        dictionary = {
            k_buffed = "Buffed!",
            k_halved = "Halved!",
            k_minus_3 = "-3",
            k_minus_6 = "-6",
            k_minus_9 = "-9",
            k_minus_12 = "-12",
            k_minus_15 = "-15",
            k_swapped = "Swapped!",
            ph_1up = "Saved by 1 Up"
        }
    }
}
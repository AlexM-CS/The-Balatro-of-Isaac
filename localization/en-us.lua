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
                },
                unlock = {
                    "Placeholder"
                }
            },

            -- TBOI Jokers

            tboi_j_1up = {
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
            tboi_j_blood_of_the_martyr = {
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
            tboi_j_brother_bobby = {
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
            tboi_j_crickets_head = {
                name = "Cricket's Head",
                text = {
                    "Applies a {X:red,C:white}X#1#{} Mult",
                    "multiplier to most other {C:attention}Jokers",
                    "that give {C:red}Mult",
                    "{s:0.8}{C:inactive}\"DMG up\""
                },
                unlock = {
                    "Placeholder"
                }
            },
            tboi_j_halo_of_flies = {
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
            tboi_j_inner_eye = {
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
            tboi_j_less_than_3 = {
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
            tboi_j_magic_mushroom = {
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
        },

        Other = {
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
SMODS.Joker {
    key = "null_joker",
    config = {
      
    },
    loc_txt = {
      name = "Null Joker",
      text ={
          "{C:attention}Debuffed{} cards still score any",
          "of their {C:attention}own{} abilities."
      },
  },
    rarity = 1,
    pos = { x = 7, y = 3 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  }
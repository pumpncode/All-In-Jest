SMODS.Joker {
    key = "toto",
    config = {
      
    },
    loc_txt = {
      name = "Toto",
      text ={
          "All {C:attention}numbered cards{} give {C:blue}+0{}",
          "Chips when scored.",
          "Increases by {C:blue}+5{} Chips every time a", 
          "{C:attention}numbered card{} is scored.",
      },
  },
    rarity = 4,
    pos = { x = 0, y = 2},
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 0, y = 3},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  }
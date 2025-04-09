SMODS.Joker {
  key = "dim_bulb",
  config = {
    extra = { xmult = 3 }
  },
  loc_txt = {
    name = "Dim Bulb",
    text ={
        "{X:red,C:white}X#1#{} Mult if only {C:common}Common",
        "{C:attention}Jokers{} are owned"
    },
},
  rarity = 1,
  pos = { x = 5, y = 3 },
  atlas = 'joker_atlas',
  cost = 4,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true, 

  loc_vars = function(self, info_queue, card)
      return { vars = {card.ability.extra.xmult}}
  end,

  calculate = function(self, card, context)
      if context.joker_main then
          local only_common = true
          if G.jokers and G.jokers.cards then
              for _, joker_card in ipairs(G.jokers.cards) do
                  if joker_card ~= card and joker_card.config.center.rarity ~= 1 then
                      only_common = false
                      break
                  end
              end
          end
          
          if only_common then
              return {
                  Xmult_mod = card.ability.extra.xmult,
                  card = card,
                  message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}}
              }
          end
      end
  end
}
SMODS.Joker {
    key = "public_bathroom",
    config = {
      extra = {
        mult = 0,
        mult_mod = 2
      }
    },
    loc_txt = {
      name = "Public Bathroom",
      text ={
          "This Joker gains {C:red}+2{}",
          "Mult per played {C:attention}2{}",
          "in a {C:attention}Flush{}",
          "{C:inactive}(Currently {C:red}+#1#{C:inactive} Mult)"
      },
  },
    rarity = 1,
    pos = { x = 3, y = 1 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.mult
        }
      }
    end,
  
    calculate = function(self, card, context)
      if context.before and not context.blueprint then
        if context.poker_hands and next(context.poker_hands['Flush']) then
            local twos_in_flush = 0

            if context.scoring_hand then
                for _, scoring_card in ipairs(context.scoring_hand) do
                    if scoring_card:get_id() == 2 then
                        twos_in_flush = twos_in_flush + 1
                    end
                end
            end

            if twos_in_flush > 0 then
                local mult_to_add = card.ability.extra.mult_mod * twos_in_flush

                card.ability.extra.mult = card.ability.extra.mult + mult_to_add

                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = localize('k_upgrade_ex'),
                })
                return true 
            end
        end
    end
    if context.joker_main then 
      if card.ability.extra.mult > 0 then 
        return {
          mult = card.ability.extra.mult
        }
      end
    end
  end
  }
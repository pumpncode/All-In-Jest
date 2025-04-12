SMODS.Joker {
  key = "straight_to_hell",
  config = {
    extra = {
      xmult = 1,
      xmult_mod = 0.25
    }
  },
  loc_txt = {
    name = "Straight to Hell",
    text ={
        "This {C:attention}Joker{} gains {X:red,C:white}X0.25{}",
        "Mult when a {C:attention}Straight{}",
        "is {C:attention}discarded{}",
        '{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)'
    },
},
  rarity = 2,
  pos = { x = 0, y = 6},
  atlas = 'joker_atlas',
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult
      }
    }
  end,
  calculate = function(self, card, context)
    if context.pre_discard then
        if not context.blueprint then
            if G.hand and G.hand.highlighted and #G.hand.highlighted > 0 then
                local hand_info = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                if hand_info == 'Straight' then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod

                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = 'X'..number_format(card.ability.extra.xmult).. ' Mult',
                        colour = G.C.MULT
                    })

                    return nil, true
                end
            end
        end
    end

    if context.joker_main then
        if card.ability.extra.xmult > 1 then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
    end
  end
}
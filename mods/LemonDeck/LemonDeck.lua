--- STEAMODDED HEADER
--- MOD_NAME: Deck de Lemon
--- MOD_ID: LemonDeck
--- MOD_AUTHOR: [Lem0n]
--- MOD_DESCRIPTION: Mon deck personnalisé

----------------------------------------------
------------MOD CODE -------------------------

function SMODS.INIT.LemonDeck()

    local lemondeck_mod = SMODS.findModByID("LemonDeck")
    local sprite_card = SMODS.Sprite:new("centers", lemondeck_mod.path, "Enhancers.png", 71, 95, "asset_atli")
    
    sprite_card:register()
end


local loc_def = {
	["name"]="Deck de Lemon",
	["text"]={
		[1]="Vive les",
		[2]="{C:attention}Citrons{} !"
	},
}

local dddeck = SMODS.Deck:new("Deck du citron", "lemondeck", {lemondeck = true, dollars = 20, spectral_rate = 2, joker_slot = 1, jokers = 'j_supernova', vouchers = {'v_crystal_ball', 'v_overstock_norm', 'v_overstock_plus'}}, {x = 0, y = 5}, loc_def)
dddeck:register()

local Backapply_to_runRef = Back.apply_to_run
-- Function used to apply new Deck effects
function Back.apply_to_run(arg_56_0)
	
	if arg_56_0.effect.config.lemondeck then
		G.E_MANAGER:add_event(Event({
			func = function()
				local card1 = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_oops', nil)
				local card2 = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_perkeo', nil)
				local card3 = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_constellation', nil)
				local card4 = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_supernova', nil)
				

				card2:set_edition({polychrome = true}, nil, true)
				card3:set_edition({negative = true}, nil, true)

				
				card1:add_to_deck()
				card2:add_to_deck()
				card3:add_to_deck()
				card4:add_to_deck()
				
				G.jokers:emplace(card1)
				G.jokers:emplace(card2)
				G.jokers:emplace(card3)
				G.jokers:emplace(card4)
				
				card1:start_materialize()
				card2:start_materialize()
				card3:start_materialize()
				card4:start_materialize()
				
				add_tag(Tag('tag_investment'))
				add_tag(Tag('tag_voucher'))

				
				G.GAME.joker_buffer = 0

				return true
			end
		
		}))
	
	end
	Backapply_to_runRef(arg_56_0)
end


----------------------------------------------
------------MOD CODE END----------------------

--- STEAMODDED HEADER
--- MOD_NAME: Deck du soleil
--- MOD_ID: SunDeck
--- MOD_AUTHOR: [Lem0n]
--- MOD_DESCRIPTION: Create a special with spatial joker and vouchers

----------------------------------------------
------------MOD CODE -------------------------

function SMODS.INIT.SunDeck()

    local sundeck_mod = SMODS.findModByID("SunDeck")
    local sprite_card = SMODS.Sprite:new("centers", sundeck_mod.path, "Enhancers.png", 71, 95, "asset_atli")
    
    sprite_card:register()
end


local loc_def = {
	["name"]="Deck du soleil",
	["text"]={
		[1]="Cartes planètes",
		[2]="à gogo !",
	},
}

local dddeck = SMODS.Deck:new("Deck du soleil", "sundeck", {sundeck = true, vouchers = {'v_planet_tycoon', 'v_overstock_norm', 'v_planet_merchant'}}, {x = 1, y = 5}, loc_def)
dddeck:register()

local Backapply_to_runRef = Back.apply_to_run
-- Function used to apply new Deck effects
function Back.apply_to_run(arg_56_0)
	
	if arg_56_0.effect.config.sundeck then
		G.E_MANAGER:add_event(Event({
			func = function()
				local card1 = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_supernova', nil)
				local card2 = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_space', nil)
				local card3 = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_constellation', nil)
				local card4 = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_rocket', nil)
				local card5 = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_satellite', nil)
				

				card1:set_edition({polychrome = true}, nil, true)
				card3:set_edition({negative = true}, nil, true)

				
				card1:add_to_deck()
				card2:add_to_deck()
				card3:add_to_deck()
				card4:add_to_deck()
				card5:add_to_deck()
				
				G.jokers:emplace(card1)
				G.jokers:emplace(card2)
				G.jokers:emplace(card3)
				G.jokers:emplace(card4)
				G.jokers:emplace(card5)
				
				card1:start_materialize()
				card2:start_materialize()
				card3:start_materialize()
				card4:start_materialize()
				card5:start_materialize()
				
				add_tag(Tag('tag_meteor'))

				
				G.GAME.joker_buffer = 0

				return true
			end
		
		}))
	
	end
	Backapply_to_runRef(arg_56_0)
end


----------------------------------------------
------------MOD CODE END----------------------

-- Atli
SMODS.Atlas {
	key = "modicon",
	path = "modicon.png",
	px = 34,
	py = 34
}

SMODS.Atlas {
	key = "jokers",
	path = "jokers.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "consumables",
	path = "consumables.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "enhancers",
	path = "enhancers.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "vouchers",
	path = "vouchers.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "tags",
	path = "tags.png",
	px = 34,
	py = 34
}

-- Jokers
local jokers = {
    grief_stages = {
        'denial',
        'anger',
        'bargaining',
        'depression',
        'acceptance',
    },

    deadly_sins = {
        'pride',
        'envy',
        'wrath',
        'greed',
        'gluttony',
        'lust',
        'sloth',
    },

    love_languages = {
        'acts_of_service',
        'quality_time',
        'words_of_affirmation',
        'physical_touch',
        'gifts',
    },

    jokers_batch_4 = {
    --    'netwons_cradle',
    --    'fermis_paradox',
    --    'darwins_finches',
    --    'platos_cave',
    --    'theseuss_ship',
    --    'schrodingers_cat',
    --    'trolley_problem',
    --    'sisyphuss_boulder',
    --    'pandoras_box',
    --    'goldilocks_zone',
    --
    --    'confirmation_bias',
    --    'hindsight_bias',
    --    'slippery_slope',
    --    'straw_man',
    --    'gamblers_fallacy',
    --    'occams_razor',
    --    'texas_sharpshooter',
    --    'boomerang_effect',
    --    'pavlovs_dog',
    --    'mandela_effect',
    
    --    'checkovs_gun',
    --    'bechdel_test',
    --    'double_jeopardy',
    --    'devils_advocate',
    --    'trojan_horse',
    --    'jumbo_shrimp',
    --    'black_sheep',
    --    'blind_spot',
    --    'bermuda_triangle',
    --    'peter_principle',
    
    --    'package_deal',
    --    'catch_22',
    --    'monte_hall',
    --    'uncertainty_principle',
    --    'murphys_law',
    --    'event_horizon',
    --    'scorched_earth',
    --    'maxwells_demon',
    --    'cocktail_effect',
    --    'echo_chamber'
    }
}

for batch, items in pairs(jokers) do
    for _, key in ipairs(items) do
        SMODS.load_file('objects/jokers/'..batch..'/'..key..'.lua')()
    end
end

-- Consumables

local consumables = {
    tarot = {
        --
    },
    planets = {
        --'io',
    },
    spectrals = {
        'void',
        'branch',
        'chance'
    },
}

for batch, items in pairs(consumables) do
    for _, key in ipairs(items) do
        SMODS.load_file('objects/consumables/'..batch..'/'..key..'.lua')()
    end
end

-- Jokers

local decks = {
    'aid',
    'cathedral',
    'rogue',
    'modulo',
}

for _, key in ipairs(decks) do
    SMODS.load_file('objects/decks/'..key..'.lua')()
end

-- Vouchers

local vouchers = {
    --'refund',
    --'fraud'
}

for _, key in ipairs(vouchers) do
    SMODS.load_file('objects/vouchers/'..key..'.lua')()
end

-- Tags

local tags = {
    'common',
    'legendary'
}

for _, key in ipairs(tags) do
    SMODS.load_file('objects/tags/'..key..'.lua')()
end

-- Enhancements

local enhancements = {
    'stained_red',
    'stained_blue',
    'stained_gold',
    'stained_green',
    'wild_glass',
    'kintsugi',
    'geode',
    'deposit',
}

for _, key in ipairs(enhancements) do
    SMODS.load_file('objects/enhancements/'..key..'.lua')()
end

-- Seals

local seals = {
    'green',
}

for _, key in ipairs(seals) do
    SMODS.load_file('objects/seals/'..key..'.lua')()
end
-- Challenges

local challenges = {
    --'tester',
    --'copycat',
    --'cost_of_business',
    --'golden_bite',
    --'stargazer',
    --'wild_side'
}

for _, key in ipairs(challenges) do
    SMODS.load_file('objects/challenges/'..key..'.lua')()
end
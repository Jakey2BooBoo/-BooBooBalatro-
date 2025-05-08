-- Atli

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
	key = "tags",
	path = "tags.png",
	px = 34,
	py = 34
}

-- Jokers

local jokers = {
    'denial',
    'anger',
    'bargaining',
    'depression',
    'acceptance',
    'pride',
    'envy',
    'wrath',
    'greed',
    'gluttony',
    'lust',
    'sloth',
    'acts_of_service',
    'quality_time',
    'words_of_affirmation',
    'physical_touch',
    'gifts'
}

for _, key in ipairs(jokers) do
    SMODS.load_file('objects/jokers/'..key..'.lua')()
end

-- Consumables

local consumables = {
    --'io',
    'void'
}

for _, key in ipairs(consumables) do
    SMODS.load_file('objects/consumables/'..key..'.lua')()
end

-- Jokers

local decks = {
    'modulo',
    'cathedral'
}

for _, key in ipairs(decks) do
    SMODS.load_file('objects/decks/'..key..'.lua')()
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
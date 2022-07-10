local mod_id = "zneixs_fixes"
local module = DMod:new(mod_id, {
	name = "Zneix's fixes",
	abbr = "ZFX",
	version = "1.0.1",
	author = "zneix",
	categories = { "bugfixes", "hud", "qol", },
	description = {
		english = "Some improvements and further enhancements to DAHM and/or game's code that didn't really fit into anything else.",
	},
	dependencies = {
		"hud",
	},
	update = {
		id = mod_id,
		url = "https://cdn.zneix.eu/pdthmods/versions.json",
	},
})

-- == CONFIG OPTIONS
-- Custom format for assault break timer
module:add_config_option("zfx_assault_break_timer_str", "")
module:add_config_option("zfx_disable_assault_image", false)
module:add_config_option("zfx_fix_bain_coaching_solo", true)
module:add_config_option("zfx_simplify_quit_dialog", false)

-- == MENU OPTIONS
module:add_menu_option("zfx_disable_assault_image", {
	type = "boolean",
	localize = false,
	text_id = "Remove assault image and title",
	help_id = "Removes red triangle and text during an ongoing assault.",
})
module:add_menu_option("zfx_fix_bain_coaching_solo", {
	type = "boolean",
	localize = false,
	text_id = "Fix bain coaching last man standing",
	help_id = "Stops bain from instructing last man standing during assault breaks when there's no teammates to be traded out of custody.",
})
module:add_menu_option("zfx_simplify_quit_dialog", {
	type = "boolean",
	localize = false,
	text_id = "Simplify game quit dialog",
	help_id = "Replaces original game quit dialog, so you can exit this miserable game even quicker.",
})

-- == HOOKS
-- Fix bain coaching solo heisters, telling them how to trade
module:hook_post_require("lib/managers/group_ai_states/groupaistatebase", "groupaistatebase")
-- Patch assault timer to respect custom assault break timer config option
module:hook_post_require("lib/managers/hudmanager", "hudmanager")
-- Make quit dialog less annoying
module:hook_post_require("lib/managers/menumanager", "menumanager")
-- Support colors in some localization overrides
module:hook_post_require("lib/managers/menu/menulobbyrenderer", "menulobbyrenderer")

-- == LOCALIZATION
module:add_localization_string("dialog_yes_save", {
	english = "YES, SAVE PROGRESS",
})
module:add_localization_string("dialog_yes_dont_save", {
	english = "YES, DON'T SAVE PROGRESS",
})

return module

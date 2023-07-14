local mod_id = "zneixs_fixes"
local module = DMod:new(mod_id, {
	name = "Zneix's fixes",
	abbr = "ZFX",
	version = "1.0.2",
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
	localization = {
		english = {
			dialog_yes_save = "YES, SAVE PROGRESS",
			dialog_yes_dont_save = "YES, DON'T SAVE PROGRESS",
			-- menu options
			zfx_disable_assault_image = "Remove assault image and title",
			zfx_disable_assault_image_help = "Removes red triangle and text during an ongoing assault.",
			zfx_fix_bain_coaching_solo = "Fix bain coaching last man standing",
			zfx_fix_bain_coaching_solo_help = "Stops bain from instructing last man standing during assault breaks when there's no teammates to be traded out of custody.",
			zfx_simplify_quit_dialog = "Simplify game quit dialog",
			zfx_simplify_quit_dialog_help = "Replaces original game quit dialog, so you can exit this miserable game even quicker.",
		}
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
	text_id = "zfx_disable_assault_image",
	help_id = "zfx_disable_assault_image_help",
})
module:add_menu_option("zfx_fix_bain_coaching_solo", {
	type = "boolean",
	text_id = "zfx_fix_bain_coaching_solo",
	help_id = "zfx_fix_bain_coaching_solo_help",
})
module:add_menu_option("zfx_simplify_quit_dialog", {
	type = "boolean",
	text_id = "zfx_simplify_quit_dialog",
	help_id = "zfx_simplify_quit_dialog_help",
})

-- == HOOKS
-- Fix bain coaching solo heisters, telling them how to trade
module:hook_post_require("lib/managers/group_ai_states/groupaistatebase", "groupaistatebase")
-- Patch assault timer to respect custom assault break timer config option
module:hook_post_require("lib/managers/hudmanager", "hudmanager")
-- Make quit dialog less annoying
-- Show game difficulty in the lobby browser entry
module:hook_post_require("lib/managers/menumanager", "menumanager")
-- Support colours in some localization overrides
module:hook_post_require("lib/managers/menu/menulobbyrenderer", "menulobbyrenderer")

return module

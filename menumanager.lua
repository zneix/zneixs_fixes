local module = ... or D:module("zneixs_fixes")
local MenuCallbackHandler = module:hook_class("MenuCallbackHandler")

local quit_game_orig = MenuCallbackHandler.quit_game

function MenuCallbackHandler:quit_game()
	if not D:conf("zfx_simplify_quit_dialog") then
		return quit_game_orig(self)
	end

	return managers.system_menu:show({
		title = managers.localization:text("dialog_warning_title"),
		text = managers.localization:text("dialog_are_you_sure_you_want_to_quit"),
		button_list = {
			-- yes_save_button
			{
				text = managers.localization:text("dialog_yes_save"),
				callback_func = callback(self, self, "_dialog_save_progress_backup_yes"),
			},
			-- yes_dont_save_button
			{
				text = managers.localization:text("dialog_yes_dont_save"),
				callback_func = callback(self, self, "_dialog_save_progress_backup_no"),
			},
			-- no_button
			{
				text = managers.localization:text("dialog_no"),
				callback_func = callback(self, self, "_dialog_quit_no"),
				cancel_button = true,
			},
		},
		focus_button = 1,
	})
end

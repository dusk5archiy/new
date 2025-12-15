-- local wezterm = require("wezterm")
-- local CONFIG_DIR = wezterm.config_dir

local configs = {
  color_scheme = "Catppuccin Macchiato",
  window_decorations = "INTEGRATED_BUTTONS|RESIZE",
  tab_bar_at_bottom = false,
  show_tab_index_in_tab_bar = true,
  tab_and_split_indices_are_zero_based = false,
  use_fancy_tab_bar = false,
  colors = {
    tab_bar = {
      background = "none",
      active_tab = {
        bg_color = "none",
        fg_color = "white",
        intensity = "Bold",    -- [use_fancy_tab_bar = false]
        underline = "None",    -- [use_fancy_tab_bar = false]
        italic = false,        -- [use_fancy_tab_bar = false]
        strikethrough = false, -- [use_fancy_tab_bar = false]
      },
      inactive_tab = {
        bg_color = "none",
        fg_color = "#ddd",
        italic = true,                  -- [use_fancy_tab_bar = false]
      },
      inactive_tab_edge = "none",       -- [use_fancy_tab_bar = true]
      inactive_tab_edge_hover = "none", -- [use_fancy_tab_bar = true]
      new_tab = {
        bg_color = "none",
        fg_color = "#ddd",
      },
      new_tab_hover = {
        bg_color = "none",
        fg_color = "white",
      },
    },
  },
}

return configs

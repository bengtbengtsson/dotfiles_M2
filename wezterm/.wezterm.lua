local wezterm = require("wezterm")

return {
  -- Font settings
  font_size = 16.0,

  -- Colors: Gruvbox-Material
  color_scheme = "GruvboxDark", -- WezTerm includes Gruvbox by default. Alternatively, define colors below.

  -- Custom Colors (if needed)
  colors = {
    foreground = "#ebdbb2", -- Light foreground
    background = "#282828", -- Dark background

    ansi = {
      "#282828", -- black
      "#cc241d", -- red
      "#98971a", -- green
      "#d79921", -- yellow
      "#458588", -- blue
      "#b16286", -- magenta
      "#689d6a", -- cyan
      "#a89984", -- white
    },
    brights = {
      "#928374", -- bright black
      "#fb4934", -- bright red
      "#b8bb26", -- bright green
      "#fabd2f", -- bright yellow
      "#83a598", -- bright blue
      "#d3869b", -- bright magenta
      "#8ec07c", -- bright cyan
      "#ebdbb2", -- bright white
    },
  },

  -- Scrolling
  scrollback_lines = 10000, -- Number of scrollback lines

  -- Mouse behavior
  hide_mouse_cursor_when_typing = true,

  -- Other optional settings
  enable_scroll_bar = true, -- Enable scroll bar (optional)
}

-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

-- Alternative icon sets and widget icons:
--  * http://awesome.naquadah.org/wiki/Nice_Icons

-- {{{ Main
theme = {}
theme.wallpaper = "/opt/local/share/awesome/themes/zenburn/zenburn-background.png"
-- }}}

-- {{{ Styles
theme.font      = "JetBrains Mono 12"

-- {{{ Colors
theme.fg_normal  = "#FFFFFF"
theme.fg_focus   = "#FFFFFF"
theme.fg_urgent  = "#FFFFFF"
theme.bg_normal  = "#30353d"
theme.bg_focus   = "#2a2d33"
theme.bg_urgent  = "#2a2d33"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.border_width  = 0
theme.border_normal = "#F4B940"
theme.border_focus  = "#F4B940"
theme.border_marked = "#F4B940"
-- }}}

-- {{{ Titlebars
theme.bg_normal  = "#30353d"
theme.bg_focus   = "#2a2d33"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = 14
theme.menu_width  = 100
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = "/opt/local/share/awesome/themes/zenburn/taglist/squarefz.png"
theme.taglist_squares_unsel = "/opt/local/share/awesome/themes/zenburn/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
--theme.awesome_icon           = "/opt/local/share/awesome/themes/zenburn/awesome-icon.png"
--theme.menu_submenu_icon      = "/opt/local/share/awesome/themes/default/submenu.png"
-- }}}

-- {{{ Layout
--theme.layout_tile       = "/opt/local/share/awesome/themes/zenburn/layouts/tile.png"
--theme.layout_tileleft   = "/opt/local/share/awesome/themes/zenburn/layouts/tileleft.png"
--theme.layout_tilebottom = "/opt/local/share/awesome/themes/zenburn/layouts/tilebottom.png"
--theme.layout_tiletop    = "/opt/local/share/awesome/themes/zenburn/layouts/tiletop.png"
--theme.layout_fairv      = "/opt/local/share/awesome/themes/zenburn/layouts/fairv.png"
--theme.layout_fairh      = "/opt/local/share/awesome/themes/zenburn/layouts/fairh.png"
--theme.layout_spiral     = "/opt/local/share/awesome/themes/zenburn/layouts/spiral.png"
--theme.layout_dwindle    = "/opt/local/share/awesome/themes/zenburn/layouts/dwindle.png"
--theme.layout_max        = "/opt/local/share/awesome/themes/zenburn/layouts/max.png"
--theme.layout_fullscreen = "/opt/local/share/awesome/themes/zenburn/layouts/fullscreen.png"
--theme.layout_magnifier  = "/opt/local/share/awesome/themes/zenburn/layouts/magnifier.png"
--theme.layout_floating   = "/opt/local/share/awesome/themes/zenburn/layouts/floating.png"
-- }}}
-- {{{ Titlebar
theme.titlebar_close_button_focus  = "/opt/local/share/awesome/themes/zenburn/titlebar/close_focus.png"
theme.titlebar_close_button_normal = "/opt/local/share/awesome/themes/zenburn/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = "/opt/local/share/awesome/themes/zenburn/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = "/opt/local/share/awesome/themes/zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = "/opt/local/share/awesome/themes/zenburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = "/opt/local/share/awesome/themes/zenburn/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = "/opt/local/share/awesome/themes/zenburn/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = "/opt/local/share/awesome/themes/zenburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = "/opt/local/share/awesome/themes/zenburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = "/opt/local/share/awesome/themes/zenburn/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = "/opt/local/share/awesome/themes/zenburn/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = "/opt/local/share/awesome/themes/zenburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = "/opt/local/share/awesome/themes/zenburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = "/opt/local/share/awesome/themes/zenburn/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = "/opt/local/share/awesome/themes/zenburn/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = "/opt/local/share/awesome/themes/zenburn/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = "/opt/local/share/awesome/themes/zenburn/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = "/opt/local/share/awesome/themes/zenburn/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme

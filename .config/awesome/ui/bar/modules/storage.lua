-- -- Storage Widget
-- local storage_update_time = 7200
-- local container_storage_widget = wibox.container
--
-- local storage_widget_root = wibox.widget {
--     align = 'center',
--     valign = 'center',
--     widget = wibox.widget.textbox,
-- }
--
-- local update_storage_root = function(st_root)
--     storage_widget_root.text = " " .. st_root
-- end
--
-- -- local storage_widget_home = wibox.widget {
-- --     align = 'center',
-- --     valign = 'center',
-- --     widget = wibox.widget.textbox,
-- -- }
--
-- -- local update_storage_home = function(st_home)
-- --     storage_widget_home.text = " " .. st_home
-- -- end
--
-- local storage_root = awful.widget.watch('bash -c "df -h | awk \'NR==4 {print $4}\'"', storage_update_time,
--     function(self, stdout)
--         local st_root = stdout
--         update_storage_root(st_root)
--     end)
--
-- -- local storage_home = awful.widget.watch(os.getenv("HOME") .. '/scripts/disk-usage.sh', 60, function(self, stdout)
-- -- 	st_home = stdout
-- -- 	update_storage_home(st_home)
-- -- end)
--
-- container_storage_widget = {
--     {
--         {
--             {
--                 {
--                     {
--                         widget = storage_widget_root,
--                     },
--                     -- {
--                     --     widget = storage_widget_home,
--                     -- },
--                     layout = wibox.layout.flex.horizontal
--                 },
--                 left = 5,
--                 right = 5,
--                 top = 2,
--                 bottom = 2,
--                 widget = wibox.container.margin,
--             },
--             shape = gears.shape.rounded_bar,
--             fg = color.lavender,
--             bg = widget_bg,
--             forced_width = 70, -- 140,
--             widget = wibox.container.background
--         },
--         left = 10,
--         right = 5,
--         top = 7,
--         bottom = 7,
--         widget = wibox.container.margin
--     },
--     spacing = 5,
--     layout = wibox.layout.fixed.horizontal,
-- }

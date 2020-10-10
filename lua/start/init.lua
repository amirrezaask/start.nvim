local api = vim.api


local M = {}

local function count_lines(ascii)
   local lines = {}
   local line_start = 1
   for i=1,#ascii do
      if string.sub(ascii, i, i) == '\n' then
         local this_line = string.sub(ascii, line_start, i-1)
         line_start = i+1
         table.insert(lines, this_line)
      end
   end
   return lines
end

M['default_ascii_1'] = [[
  _   _        __      _______ __  __ 
 | \ | |       \ \    / /_   _|  \/  |
 |  \| | ___  __\ \  / /  | | | \  / |
 | . ` |/ _ \/ _ \ \/ /   | | | |\/| |
 | |\  |  __/ (_) \  /   _| |_| |  | |
 |_| \_|\___|\___/ \/   |_____|_|  |_|

]]

M['default_ascii_2'] = [[

   / | / /__  ____| |  / (_)___ ___ 
  /  |/ / _ \/ __ \ | / / / __ `__ \
 / /|  /  __/ /_/ / |/ / / / / / / /
/_/ |_/\___/\____/|___/_/_/ /_/ /_/ 

]]
local function start_point(width, height, lines)
   local h = math.ceil(height - #lines / 2)
   local w = math.ceil(width - #lines[1] / 2)
   return w,h
end


M['set_background_ascii'] = function(ascii)
   local height = vim.api.nvim_get_option('columns')
   local width = vim.api.nvim_get_option('lines')
   local lines = count_lines(ascii) 
   if vim.fn.argc() < 1 then
      local buf = vim.api.nvim_create_buf(true, true) 
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
      vim.api.nvim_buf_set_option(buf, 'modifiable', false)
      local win = api.nvim_get_current_win()
      api.nvim_set_current_buf(buf)
   end
end

return M


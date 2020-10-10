local api = vim.api


local M = {}


local function string_to_lines_table(ascii)
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
local function start_point(width, height, ascii_col, ascii_lines)
   local h = math.ceil(height /2 ) - (ascii_lines / 2)
   local w = math.ceil(width /2 ) - ( ascii_col / 2)
   print(string.format('start width %s', w))
   print(string.format('start height', h))
   return w,h
end

local function str_repeat(str, number)
   s = ""
   for i=1,number do
      s = s .. str
   end
   return s 
end

M['set_background_ascii'] = function(ascii)
   local height = vim.api.nvim_get_option('lines')
   local width = vim.api.nvim_get_option('columns')
   local lines = string_to_lines_table(ascii) 
   local ascii_col = #lines[1]
   local ascii_lines = #lines
   print(string.format("ascii col %s", ascii_col))
   print(string.format("ascii row %s", ascii_lines))
   local start_col, start_row = start_point(width, height, ascii_col, ascii_lines)
   
   if vim.fn.argc() < 1 then
      local buf = vim.api.nvim_create_buf(true, true) 
      for i, _ in ipairs(lines) do
         lines[i] = (str_repeat(' ', start_col)) .. (lines[i])
      end
      local new_lines = {}
      for i=1,start_row do
         table.insert(new_lines, '')
      end
      for _, l in ipairs(lines) do
         table.insert(new_lines, l)
      end
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, new_lines)
      vim.api.nvim_buf_set_option(buf, 'modifiable', false)
      vim.api.nvim_buf_set_option(buf, 'buflisted', false)
      local win = api.nvim_get_current_win()
      api.nvim_set_current_buf(buf)
   end
end

return M


-- Enable hop motion
require('hop').setup()

local hop = require('hop')
local directions = require('hop.hint').HintDirection
local positions = require('hop.hint').HintPosition

vim.keymap.set('', 'f', function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })

vim.keymap.set('', 'F', function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })

vim.keymap.set('', '<C-f>', function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR })
end, { remap = true })

vim.keymap.set('', 't', function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })

vim.keymap.set('', 'T', function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })

vim.keymap.set('', 'H', function()
	hop.hint_words()
end, { remap = true })

vim.keymap.set('', 'L', function()
	hop.hint_words({ hint_position = positions.END })
end, { remap = true })

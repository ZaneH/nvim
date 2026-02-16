local mc = require("multicursor-nvim")
mc.setup()

local set = vim.keymap.set
local function map(mode, lhs, rhs, desc)
	set(mode, lhs, rhs, { desc = desc, silent = true })
end

-- Add or skip cursor above/below the main cursor.
map({ "n", "x" }, "<leader>mk", function()
	mc.lineAddCursor(-1)
end, "Add cursor above")
map({ "n", "x" }, "<leader>mj", function()
	mc.lineAddCursor(1)
end, "Add cursor below")
map({ "n", "x" }, "<leader>mK", function()
	mc.lineSkipCursor(-1)
end, "Skip cursor above")
map({ "n", "x" }, "<leader>mJ", function()
	mc.lineSkipCursor(1)
end, "Skip cursor below")

-- Add or skip adding a new cursor by matching word/selection
map({ "n", "x" }, "<leader>mn", function()
	mc.matchAddCursor(1)
end, "Add next match")
map({ "n", "x" }, "<leader>ms", function()
	mc.matchSkipCursor(1)
end, "Skip next match")
map({ "n", "x" }, "<leader>mN", function()
	mc.matchAddCursor(-1)
end, "Add previous match")
map({ "n", "x" }, "<leader>mS", function()
	mc.matchSkipCursor(-1)
end, "Skip previous match")
map({ "n", "x" }, "<leader>mA", mc.matchAllAddCursors, "Add all matches")

-- Block-style multi-editing from visual selections.
map("x", "<leader>mi", mc.insertVisual, "Insert at each cursor")
map("x", "<leader>ma", mc.appendVisual, "Append at each cursor")

-- Add and remove cursors with control + left click.
map("n", "<c-leftmouse>", mc.handleMouse, "Toggle cursor with mouse")
map("n", "<c-leftdrag>", mc.handleMouseDrag, "Drag cursor with mouse")
map("n", "<c-leftrelease>", mc.handleMouseRelease, "Finish mouse cursor drag")

-- Disable and enable cursors.
map({ "n", "x" }, "<leader>mq", mc.toggleCursor, "Toggle cursor")
map("n", "<leader>mu", mc.restoreCursors, "Restore cleared cursors")

-- Mappings defined in a keymap layer only apply when there are
-- multiple cursors. This lets you have overlapping mappings.
mc.addKeymapLayer(function(layerSet)
	-- Select a different cursor as the main one.
	layerSet({ "n", "x" }, "[m", mc.prevCursor)
	layerSet({ "n", "x" }, "]m", mc.nextCursor)

	-- Delete the main cursor.
	layerSet({ "n", "x" }, "<leader>md", mc.deleteCursor)

	-- Enable and clear cursors using escape.
	layerSet("n", "<esc>", function()
		if not mc.cursorsEnabled() then
			mc.enableCursors()
		else
			mc.clearCursors()
		end
	end)
end)

-- Customize how cursors look.
local hl = vim.api.nvim_set_hl
hl(0, "MultiCursorCursor", { reverse = true })
hl(0, "MultiCursorVisual", { link = "Visual" })
hl(0, "MultiCursorSign", { link = "SignColumn" })
hl(0, "MultiCursorMatchPreview", { link = "Search" })
hl(0, "MultiCursorDisabledCursor", { reverse = true })
hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })

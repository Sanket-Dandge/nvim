local opt = vim.opt -- for conciseness

-- Line Numbers
opt.number = true
opt.showtabline = 4

-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.breakindent = true

-- Line Wrapping
opt.wrap = false

-- Search Setting 
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Splitt Windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- UndoFile (For still being able to undo when exited the file and come back again.)
opt.undofile = true

-- Mapleader
vim.g.mapleader = " "

vim.o.guifont = "Monospace:h8"

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

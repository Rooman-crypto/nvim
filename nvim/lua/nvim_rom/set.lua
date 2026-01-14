-- INDENTATION & TABS
vim.opt.tabstop = 2          -- 1 tab visually looks like 2 spaces
vim.opt.softtabstop = 2      -- when hitting <Tab> in insert mode → insert/remove 2 spaces
vim.opt.shiftwidth = 2       -- size of one indentation level (>> / << / cindent)
vim.opt.expandtab = true     -- pressing <Tab> produces spaces, not real tab character
vim.opt.autoindent = true    -- new line continues the previous line's indentation
vim.opt.smartindent = true   -- smarter autoindent (especially for C-like languages)
vim.opt.smarttab = true      -- <Tab> in front of line uses shiftwidth, not tabstop

-- VISUAL HELPERS
vim.opt.list = true
vim.opt.listchars = "eol:.,tab:>-,trail:~,extends:>,precedes:<"
    -- • shows EOL as .
    -- • tab as >--
    -- • trailing spaces as ~
    -- • when line is too long → shows > / < characters

vim.opt.number = true            -- show absolute line numbers
vim.opt.relativenumber = true    -- relative numbers (very useful for motions)
vim.opt.cursorline = true        -- highlight current line
vim.opt.signcolumn = "yes:1"     -- always show sign column with width 1
                                 -- (prevents annoying jumping when signs appear/disappear)
vim.opt.scrolloff = 8            -- keep at least 8 lines above/below cursor when scrolling
vim.opt.showcmd = true           -- show (partial) command in bottom line (e.g. 3d, y2w)

-- FILE & HISTORY
vim.opt.swapfile = false         -- no swap files → less disk I/O, no annoying swap messages
vim.opt.backup = false           -- no backup files (many people use git/version control anyway)
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true          -- persistent undo → undo even after closing file


vim.opt.clipboard = "unnamedplus"    -- use system clipboard by default (most people want this)
                                 -- note: many prefer "unnamedplus" nowadays

-- SEARCH
vim.opt.hlsearch = true      -- highlight all search matches
vim.opt.incsearch = true     -- show matches while typing search pattern (/ ?)
vim.opt.ignorecase = true    -- search is case-insensitive...
vim.opt.smartcase = true     -- ...unless pattern contains uppercase letter

-- LOOK & FEEL
vim.opt.termguicolors = true     -- enable true color support (24-bit RGB)

vim.opt.showmode = false         -- show/hide -- INSERT -- / -- VISUAL -- etc
                                 -- (usually because you use statusline/lualine)
vim.opt.background = "dark" -- set this to dark or light
vim.cmd("colorscheme oxocarbon")-- ANNOYING AUTO-COMMENTS PREVENTION

vim.cmd([[autocmd FileType * set formatoptions-=ro]])
-- removes 'r' and 'o' flags from formatoptions
--   r = auto-insert comment leader on next line when pressing <Enter>
--   o = auto-insert comment leader when pressing 'o'/'O' in normal mode

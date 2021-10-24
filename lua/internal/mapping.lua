local pbind = require('publibs.plbind')
local map_cr = pbind.map_cr
local map_cu = pbind.map_cu
local map_cmd = pbind.map_cmd
local map_args = pbind.map_args
local vim = vim

local mapping = setmetatable({}, { __index = { vim = {},plugin = {} } })

function _G.check_back_space()
    local col = vim.api.col('.') - 1
    if col == 0 or vim.api.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

function mapping:load_vim_define()
  self.vim= {
    -- Vim map
    ["n|<C-x>h"]     = map_cr('set hls!'):with_noremap():with_silent(),
    ["n|<C-x>k"]     = map_cr('Bdelete!'):with_noremap():with_silent(),
    ["n|Y"]          = map_cmd('y$'),
    ["n|]b"]         = map_cu('bn'):with_noremap(),
    ["n|[b"]         = map_cu('bp'):with_noremap(),
    ["n|<C-h>"]      = map_cmd('<C-w>h'):with_noremap(),
    ["n|<C-l>"]      = map_cmd('<C-w>l'):with_noremap(),
    ["n|<C-j>"]      = map_cmd('<C-w>j'):with_noremap(),
    ["n|<C-k>"]      = map_cmd('<C-w>k'):with_noremap(),
    ["n|<A-[>"]     = map_cr('vertical resize -5'),
    ["n|<A-]>"]     = map_cr('vertical resize +5'),
    ["n|<Leader>ss"] = map_cu('SessionSave'):with_noremap(),
    ["n|<Leader>sl"] = map_cu('SessionLoad'):with_noremap(),
  -- command line
    ["c|<C-b>"]      = map_cmd('<Left>'):with_noremap(),
    ["c|<C-f>"]      = map_cmd('<Right>'):with_noremap(),
    ["c|<C-a>"]      = map_cmd('<Home>'):with_noremap(),
    ["c|<C-e>"]      = map_cmd('<End>'):with_noremap(),
    ["c|<C-d>"]      = map_cmd('<Del>'):with_noremap(),
    ["c|<C-h>"]      = map_cmd('<BS>'):with_noremap(),
    ["c|<C-t>"]      = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
    ["c|w!!"] = map_cmd("execute 'silent! write !sudo tee % >/dev/null' <bar> edit!"),
  }
end

function mapping:load_plugin_define()
  self.plugin = {
    ["n|gb"]             = map_cr("BufferLinePick"):with_noremap():with_silent(),
    -- dein
    ["n|<Leader>tr"]     = map_cr("call dein#recache_runtimepath()"):with_noremap(),
    -- Plugin nvim-tree
    ["n|<Leader>e"]      = map_cr('NvimTreeToggle'):with_noremap():with_silent(),
    ["n|<Leader>F"]      = map_cr('NvimTreeFindFile'):with_noremap():with_silent(),
    -- Plugin MarkdownPreview
    ["n|<Leader>om"]     = map_cu('MarkdownPreview'):with_noremap():with_silent(),
    -- Plugin Telescope
    ["n|<Leader>bb"]     = map_cu('Telescope buffers'):with_noremap():with_silent(),
    ["n|<Leader>fa"]     = map_cu('DashboardFindWord'):with_noremap():with_silent(),
    ["n|<Leader>fb"]     = map_cu('DashboardJumpMark'):with_noremap():with_silent(),
    ["n|<Leader>ff"]     = map_cu('DashboardFindFile'):with_noremap():with_silent(),
    ["n|<Leader>fg"]     = map_cu('Telescope git_files'):with_noremap():with_silent(),
    ["n|<Leader>fw"]     = map_cu('Telescope grep_string'):with_noremap():with_silent(),
    ["n|<Leader>fh"]     = map_cu('DashboardFindHistory'):with_noremap():with_silent(),
    ["n|<Leader>fl"]     = map_cu('Telescope loclist'):with_noremap():with_silent(),
    ["n|<Leader>fc"]     = map_cu('Telescope git_commits'):with_noremap():with_silent(),
    ["n|<Leader>ft"]     = map_cu('Telescope help_tags'):with_noremap():with_silent(),
    ["n|<Leader>,"]      = map_cr('Telescope buffers'):with_noremap():with_silent(),
    ["n|<Leader>."]      = map_cr('DashboardFindFile'):with_noremap():with_silent(),

    -- Plugin QuickRun
    ["n|<Leader>R"]     = map_cr("<cmd> lua require'internal.selfunc'.run_command()"):with_noremap():with_silent(),
    -- Plugin Vista
    ["n|<Leader>v"]      = map_cu('Vista!!'):with_noremap():with_silent(),
    -- Plugin vim-operator-replace
    ["x|p"]              = map_cmd("<Plug>(operator-replace)"),
    -- Plugin hrsh7th/vim-eft
    ["n|;"]              = map_cmd("<Plug>(eft-repeat)"),
    ["x|;"]              = map_cmd("<Plug>(eft-fepeat)"),
    ["n|f"]              = map_cmd("<Plug>(eft-f)"),
    ["x|f"]              = map_cmd("<Plug>(eft-f)"),
    ["o|f"]              = map_cmd("<Plug>(eft-f)"),
    ["n|F"]              = map_cmd("<Plug>(eft-F)"),
    ["x|F"]              = map_cmd("<Plug>(eft-F)"),
    ["o|F"]              = map_cmd("<Plug>(eft-F)"),
    -- my configuration
    ["n|<Leader>r"]      = map_cu('RnvimrToggle'):with_noremap():with_silent(),
    ["n|<C-\\>"]      = map_cu('ToggleTerm'):with_noremap(),
  };
end

local function load_mapping()
  mapping:load_vim_define()
  mapping:load_plugin_define()
  pbind.nvim_load_mapping(mapping.vim)
  pbind.nvim_load_mapping(mapping.plugin)
end

load_mapping()

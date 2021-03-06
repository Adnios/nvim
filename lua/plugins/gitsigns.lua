require('gitsigns').setup {
    signs = {
        add = {hl = 'GitGutterAdd', text = '▋'},
        change = {hl = 'GitGutterChange', text = '▋'},
        delete = {hl = 'GitGutterDelete', text = '▋'},
        topdelete = {hl = 'GitGutterDeleteChange', text = '▔'},
        changedelete = {hl = 'GitGutterChange', text = '▎'}
    },
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,

        ['n ]g'] = {
            expr = true,
            "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"
        },
        ['n [g'] = {
            expr = true,
            "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"
        },

        -- ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        -- ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        -- ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        -- ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        -- ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        -- ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
        -- ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
        ['n <leader>gt'] = '<cmd>Gitsigns toggle_current_line_blame<CR>',

        -- Text objects
        -- ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
        -- ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>'
    },
    watch_gitdir = {interval = 1000, follow_files = true},
    current_line_blame = false,
    current_line_blame_opts = {delay = 1000, virtual_text_pos = 'eol'},-- 'eol' | 'overlay' | 'right_align'
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    word_diff = false,
    diff_opts = {internal = true}
}

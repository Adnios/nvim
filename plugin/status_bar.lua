if vim.g.vscode then
  vim.opt.showmode = false
  local status = require('vscode-neovim').get_status_item('my-mode-indicator')
  local mode_names = setmetatable({
    ['n'] = 'NORMAL',
    ['no'] = 'N·OPERATOR PENDING ',
    ['v'] = 'VISUAL',
    ['V'] = 'V·LINE',
    ['\x16'] = 'V·BLOCK',
    ['s'] = 'SELECT',
    ['S'] = 'S·LINE',
    ['^S'] = 'S·BLOCK',
    ['i'] = 'INSERT',
    ['R'] = 'REPLACE',
    ['Rv'] = 'V·REPLACE',
    ['Rx'] = 'C·REPLACE',
    ['Rc'] = 'C·REPLACE',
    ['c'] = 'COMMAND',
    ['cv'] = 'VIM EX',
    ['ce'] = 'EX',
    ['r'] = 'PROMPT',
    ['rm'] = 'MORE',
    ['r?'] = 'CONFIRM',
    ['!'] = 'SHELL',
    ['t'] = 'TERMINAL',
  }, {
    __index = function(t, k)
      t[k] = 'UNKNOWN'
      return t[k]
    end,
  })
  vim.api.nvim_create_autocmd({ 'VimEnter', 'ModeChanged' }, {
    callback = function()
      local mode = vim.api.nvim_get_mode().mode
      status.text = mode_names[mode]
    end,
  })
end
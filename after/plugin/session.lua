local api, fn, uv = vim.api, vim.fn, vim.loop
local dbs = {}

local function iswin()
  return uv.os_uname().sysname == 'Windows_NT'
end

local function path_sep()
  return iswin() and '\\' or '/'
end

local function path_join(...)
  return table.concat({ ... }, path_sep())
end

local function default_session_name()
  local cwd = vim.fs.normalize(fn.getcwd())
  local tbl = vim.split(cwd, path_sep(), { trimempty = true })
  tbl = vim.tbl_map(function(item)
    if item:find('%p') then
      item = item:gsub('%p', '_')
    end
    return item
  end,tbl)
  cwd = table.concat(tbl, '_')
  if iswin() then
    cwd = cwd:gsub('C:', '')
  end
  cwd = fn.substitute(cwd, [[^\.]], '', '')
  return cwd
end

local function session_list()
  return vim.split(fn.globpath(dbs.opt.dir, '*.vim'), '\n')
end

local function full_name(session_name)
  return path_join(dbs.opt.dir, session_name .. '.vim')
end

local function session_save(session_name)
  local file_name = (not session_name or #session_name == 0) and default_session_name() or session_name
  local file_path = path_join(dbs.opt.dir,file_name .. '.vim')
  api.nvim_command('mksession! ' .. fn.fnameescape(file_path))
  vim.v.this_session = file_path

  print('[session] save ' .. file_name, vim.log.levels.INFO)
end

local function session_load(session_name)
  local file_name = (not session_name or #session_name == 0) and default_session_name() or session_name
  local file_path = path_join(dbs.opt.dir,file_name .. '.vim')

  if vim.v.this_session ~= '' and fn.exists('g:SessionLoad') == 0 then
    api.nvim_command('mksession! ' .. fn.fnameescape(vim.v.this_session))
  end

  if fn.filereadable(file_path) == 1 then
    --save before load session
    local curbuf = vim.api.nvim_get_current_buf()
    if vim.bo[curbuf].modified then
      vim.cmd.write()
    end
    vim.cmd([[ noautocmd silent! %bwipeout!]])
    api.nvim_command('silent! source ' .. file_path)
    print('[session] load session ' .. file_path)
    return
  end

  vim.notify('[session] load failed ' .. file_path, vim.log.levels.ERROR)
end

local function session_delete(name)
  if not name then
    vim.notify('[session] please choice a session to delete', vim.log.levels.WARN)
    return
  end

  local file_path = full_name(name)

  if fn.filereadable(file_path) == 1 then
    fn.delete(file_path)
    vim.notify('[session] deleted ' .. name, vim.log.levels.INFO)
    return
  end

  vim.notify('[session] delete failed ' .. name, vim.log.levels.ERROR)
end

local function complete_list()
  local list = session_list()
  list = vim.tbl_map(function(k)
    local tbl = vim.split(k, path_sep(), { trimempty = true })
    return fn.fnamemodify(tbl[#tbl], ':r')
  end, list)
  return list
end


local function default()
  return {
    dir = path_join(fn.stdpath('cache'), 'session'),
    auto_save_on_exit = true,
  }
end

local function session_exists(session_name)
  local file_name = (not session_name or #session_name == 0) and default_session_name() or session_name
  local file_path = path_join(dbs.opt.dir,file_name .. '.vim')
  return fn.filereadable(file_path) == 1
end

dbs.opt = vim.tbl_extend('force', default(), {})
dbs.opt.dir = vim.fs.normalize(dbs.opt.dir)
if fn.isdirectory(dbs.opt.dir) == 0 then
  fn.mkdir(dbs.opt.dir, 'p')
end

-- auto_save_on_exit
-- bug: exit in startup will trigger session save too
-- if dbs.opt.auto_save_on_exit and session_exists() then
--   print("session_exists")
--   api.nvim_create_autocmd('VimLeavePre', {
--     group = api.nvim_create_augroup('session_auto_save', { clear = true }),
--     callback = function()
--       session_save()
--     end,
--   })
-- end

api.nvim_create_user_command('SessionSave', function(args)
  api.nvim_create_autocmd('VimLeavePre', {
    group = api.nvim_create_augroup('session_auto_save', { clear = true }),
    callback = function()
      session_save()
    end,
  })
  session_save(args.args)
end, {
  nargs = '?',
})

api.nvim_create_user_command('SessionLoad', function(args)
  api.nvim_create_autocmd('VimLeavePre', {
    group = api.nvim_create_augroup('session_auto_save', { clear = true }),
    callback = function()
      session_save()
    end,
  })
  session_load(args.args)
end, {
  nargs = '?',
  complete = complete_list,
})

api.nvim_create_user_command('SessionDelete', function(args)
  session_delete(args.args)
end, {
  nargs = '?',
  complete = complete_list,
})

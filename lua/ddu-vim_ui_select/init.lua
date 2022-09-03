local M = {}
local ddu_options = {}
local save_on_choice = nil

M.setup = function(config)
  config = config or {}
  ddu_options = config.ddu_options or {}
  config.auto_register = config.auto_register or true

  ddu_options.sources = {
    { name = 'vim_ui_select', params = { items = {} } }
  }
  if config.auto_register then
    vim.ui.select = M.select
  end
end

M.select = function(items, opts, on_choice)
  opts = opts or {}
  opts.format_item = opts.format_item or function(e) return tostring(e) end
  save_on_choice = on_choice

  local indexed_items = {}
  for index, item in ipairs(items) do
    local text = opts.format_item(item)
    table.insert(indexed_items, { index = index, raw = item, text = text })
  end

  ddu_options.sources[1].params.items = indexed_items
  vim.fn['ddu#start'](ddu_options)
end

M.on_choice = function(item, index)
  if save_on_choice == nil then
    return
  end
  save_on_choice(item, index)
  save_on_choice = nil
end

return M

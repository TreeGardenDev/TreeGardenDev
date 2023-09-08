-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/baum/.cache/nvim/packer_hererocks/2.1.1693350652/share/lua/5.1/?.lua;/home/baum/.cache/nvim/packer_hererocks/2.1.1693350652/share/lua/5.1/?/init.lua;/home/baum/.cache/nvim/packer_hererocks/2.1.1693350652/lib/luarocks/rocks-5.1/?.lua;/home/baum/.cache/nvim/packer_hererocks/2.1.1693350652/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/baum/.cache/nvim/packer_hererocks/2.1.1693350652/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["copilot-cmp"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16copilot_cmp\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/baum/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  harpoon = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["lsp-debug-tools.nvim"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/lsp-debug-tools.nvim",
    url = "https://github.com/ThePrimeagen/lsp-debug-tools.nvim"
  },
  ["lsp-inlayhints.nvim"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/lsp-inlayhints.nvim",
    url = "https://github.com/lvimuser/lsp-inlayhints.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["neoai.nvim"] = {
    commands = { "NeoAI", "NeoAIOpen", "NeoAIClose", "NeoAIToggle", "NeoAIContext", "NeoAIContextOpen", "NeoAIContextClose", "NeoAIInject", "NeoAIInjectCode", "NeoAIInjectContext", "NeoAIInjectContextCode" },
    config = { "\27LJ\2\n\v\0\1\1\0\0\0\1L\0\2\0Í\3\1\0\a\0\23\0\0306\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\3\0005\4\6\0>\4\1\3=\3\a\0025\3\t\0003\4\b\0=\4\n\0036\4\0\0'\6\v\0B\4\2\0029\4\f\4=\4\r\3=\3\14\0025\3\15\0=\3\16\0025\3\17\0=\3\18\0025\3\20\0005\4\19\0=\4\21\3=\3\22\2B\0\2\1K\0\1\0\fopen_ai\fapi_key\1\0\0\1\0\1\benv\19OPENAI_API_KEY\rmappings\1\0\2\16select_down\n<C-j>\14select_up\n<C-k>\vinject\1\0\1\17cutoff_width\3K\20register_output\6c\26extract_code_snippets\16neoai.utils\6g\1\0\0\0\vmodels\1\0\2\tname\vopenai\nmodel\18gpt-3.5-turbo\aui\1\0\0\1\0\5\21input_popup_text\vPrompt\22output_popup_text\nNeoAI\vsubmit\f<Enter>\24output_popup_height\3P\nwidth\3\30\nsetup\nneoai\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/baum/.local/share/nvim/site/pack/packer/opt/neoai.nvim",
    url = "https://github.com/Bryley/neoai.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  vimtex = {
    loaded = true,
    path = "/home/baum/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  }
}

time([[Defining packer_plugins]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd copilot.lua ]]
vim.cmd [[ packadd copilot-cmp ]]

-- Config for: copilot-cmp
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16copilot_cmp\frequire\0", "config", "copilot-cmp")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'NeoAIInjectCode', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIInjectCode', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIInjectCode ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIInjectContext', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIInjectContext', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIInjectContext ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIInjectContextCode', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIInjectContextCode', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIInjectContextCode ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAI', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAI', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAI ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIOpen', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIOpen', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIOpen ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIClose', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIClose', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIClose ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIToggle', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIContext', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIContext', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIContext ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIContextOpen', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIContextOpen', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIContextOpen ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIContextClose', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIContextClose', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIContextClose ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NeoAIInject', function(cmdargs)
          require('packer.load')({'neoai.nvim'}, { cmd = 'NeoAIInject', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neoai.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NeoAIInject ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

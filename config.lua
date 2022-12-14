--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedark"

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-f>"] = ":Telescope find_files<CR>"
lvim.keys.normal_mode["<C-g>"] = ":Telescope live_grep<CR>"

-- for vimspector
lvim.builtin.which_key.mappings["d"] = {
  name = "Debug",
  s = { ":call vimspector#Launch()<cr>", "Launch" },
  q = { ":call vimspector#Reset()<cr>", "Quit" },
  r = { ":call vimspector#Restart()<cr>", "Restart" },
  c = { ":call vimspector#Continue()<cr>", "Continue" },
  t = { ":call vimspector#ToggleBreakpoint()<cr>", "Toggle Breakpoint" },
  T = { ":call vimspector#ClearBreakpoints()<cr>", "Clear Breakpoints" },
  j = { "<Plug>VimspectorStepOver()", "Step Over" },
  k = { "<Plug>VimspectorStepOut()", "Step Out" },
  l = { "<Plug>VimspectorStepInto()", "Step Into" },
  e = { "<Plug>VimspectorBalloonEval()", "Eval" },
}

-- for zen-mode
lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" }

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.actions.open_file.resize_window = true

lvim.builtin.alpha.dashboard.section.header.val = {
  [[                                            ]],
  [[ ????????????????????????????????????????????????????????????   ?????????????????????????????? ???????????????????????? ]],
  [[ ???????????????????????????????????????????????????????????????  ????????????????????????????????????????????????????????? ]],
  [[   ??????????????? ??????????????????  ?????????????????? ??????????????????  ???????????????????????????   ]],
  [[  ???????????????  ??????????????????  ???????????????????????????????????????  ???????????????????????????   ]],
  [[ ????????????????????????????????????????????????????????? ?????????????????????????????????????????????????????????????????? ]],
  [[ ?????????????????????????????????????????????????????????  ???????????????????????????????????? ???????????????????????? ]],
  [[                                            ]],
  [[      [coding is easy, life is hard]        ]],
  [[                                            ]]
}
lvim.builtin.alpha.dashboard.section.footer.val = { "Zen's development environment" }
lvim.builtin.alpha.dashboard.section.buttons.entries = {
  { "SPC n", "???  New File", "<CMD>ene!<CR>" },
  { "SPC P", "???  Recent Projects ", "<CMD>Telescope projects<CR>" },
  { "SPC s r", "???  Recently Used Files", "<CMD>Telescope oldfiles<CR>" },
  {
    "SPC L c",
    "???  Configuration",
    "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>",
  },
}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Dap setting
lvim.builtin.dap.active = false
lvim.builtin.dap.breakpoint.text = "????"
lvim.builtin.dap.breakpoint_rejected.text = "???"
lvim.builtin.dap.stopped.text = "????"

if lvim.builtin.dap.active then
  require("user.dap").config()
end

lvim.builtin.which_key.mappings[";"] = { "<cmd>Alpha<CR>", "???Dashboard" }
if lvim.builtin.dap.active then
  lvim.builtin.which_key.mappings["de"] = { "<cmd>lua require('dapui').eval()<cr>", "Eval" }
  lvim.builtin.which_key.mappings["dU"] = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" }
end

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "python" },
  },
}

-- Additional Plugins
lvim.plugins = {
  { "puremourning/vimspector" },
  -- Colorscheme
  { "EdenEast/nightfox.nvim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    -- Debug setup
    "rcarriga/nvim-dap-ui",
    config = function()
      require("user.dapui").config()
    end,
    ft = { "python", "rust", "go" },
    event = "BufReadPost",
    requires = { "mfussenegger/nvim-dap" },
    disable = not lvim.builtin.dap.active,
  },
  { "folke/zen-mode.nvim" },
  { "navarasu/onedark.nvim" }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.json", "*.jsonc" },
  -- enable wrap mode for json files only
  command = "setlocal wrap",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- Remap ç to open command mode on pt-br keyboards
        ["ç"] = { ":", desc = "Command Mode" },
        ["Ç"] = { ":", desc = "Command Mode" },
        -- Use tab and shift tab to navigate open buffers
        ["<Tab>"] = { "<cmd>bn<CR>", desc = "Next Buffer" },
        ["<S-Tab>"] = { "<cmd>bp<CR>", desc = "Previous Buffer" },
        -- Change split orientation
        ["<c-w>,"] = { "<c-w>t<c-w>H", desc = "Change Split to Vertical" },
        ["<c-w>."] = { "<c-w>t<c-w>K", desc = "Change Split to Horizontal" },
        -- Let focus on center of screen when  jumping pages
        ["<c-u>"] = { "<c-u>zz", desc = "Move Half Page UP" },
        ["<c-d>"] = { "<c-d>zz", desc = "Move Half Page DOWN" },
        -- Display de current buffer file info
        ["<c-g>"] = { "1<c-g>", desc = "Display Current File Path" },
        -- Paste tricks
        [",p"] = { '"0p', desc = "Paste last yanked text after cursor" },
        [",P"] = { '"0P', desc = "Paste last yanked text before cursor" },
        -- Trouble menu
        ["<leader>x"] = { desc = "󱍼 Trouble" },
      },
      i = {
        -- Temporary go to normal mode
        ["<C-o>"] = { "<C-\\><C-o>" },
      },
      v = {
        -- Remap ç to open command mode on pt-br keyboards
        ["Ç"] = { ":", desc = "Enter Command Mode" },
        ["ç"] = { ":", desc = "Enter Command Mode" },
        -- Paste tricks
        [",p"] = { '"0p', desc = "Paste last yanked text after cursor" },
        [",P"] = { '"0P', desc = "Paste last yanked text before cursor" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}

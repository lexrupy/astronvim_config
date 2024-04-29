return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        -- [[                                                                       ]],
        -- [[                                                                     ]],
        -- [[       ████ ██████           █████      ██                     ]],
        -- [[      ███████████             █████                             ]],
        -- [[      █████████ ███████████████████ ███   ███████████   ]],
        -- [[     █████████  ███    █████████████ █████ ██████████████   ]],
        -- [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        -- [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        -- [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        -- [[                                                                       ]],
        --
        [[                                                                       ]],
        [[  ██████   █████                   █████   █████  ███                  ]],
        [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
        [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
        [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
        [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
        [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
        [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
        [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
        [[                                                                       ]],
      }
      return opts
    end,
  },

  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },
  {
    "Wansmer/treesj",
    keys = {
      {
        "<leader>m",
        "<CMD>TSJToggle<CR>",
        desc = "Toggle Treesitter Join",
      },
    },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false },
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      disable_italics = true,
    },
  },
  {
    "folke/tokyonight.nvim",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- Disable Super-tab feature
      -- --------------------------------------------------
      local luasnip, cmp = require "luasnip", require "cmp"

      local function has_words_before()
        local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      if not opts.mappings then opts.mappings = {} end
      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" })
      opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" })
      -- --------------------------------------------------
      -- End of disable Super-tab feature
    end,
  },
}

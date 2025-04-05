return {
  { "HiPhish/rainbow-delimiters.nvim" },
  --- {
  ---   "maxmx03/solarized.nvim",
  ---   lazy = false,
  ---   priority = 1000,
  ---   ---@type solarized.config
  ---   opts = {},
  ---   config = function(_, opts)
  ---     vim.o.termguicolors = true
  ---     vim.o.background = "light"
  ---     require("solarized").setup(opts)
  ---     vim.cmd.colorscheme("solarized")
  ---   end,
  --- },
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[ colorscheme NeoSolarized ]])
    end,
  },
  -- { "brenoprata10/nvim-highlight-colors" },
  --- lets me tag words that I want highlighted
  {
    "Mr-LLLLL/interestingwords.nvim",
    enabled = false,
    config = true,
    commit = "afe7dd8977c6dd258b25dcadeb8bff76e1e41b2d",
    opts = {
      colors = { "#aeee00", "#ff0000", "#0000ff", "#b88823", "#ffa724", "#ff2c4b" },
      search_key = "\\m",
      cancel_search_key = "\\M",
      color_key = "\\k",
      cancel_color_key = "\\K",
      select_mode = "loop",
    },
  },
  --  this one was written for vim. The aboe is a **fork** of it.
  -- {
  --   "lfv89/vim-interestingwords",
  --
  --   config = function()
  --     vim.keymap.set("n", "\\k", "<CMD> InterestingWords('n')<CR>", { desc = "Highlight all instances of this word" })
  --     vim.keymap.set("n", "\\K", "<CMD> UncolorAllWords()<CR>", { desc = "Remove all bespoke word highlights" })
  --   end,
  -- },
  {
    "dwrdx/mywords.nvim",
    keys = {
        {"\\h", "", desc = "Highlight words"},
        {"\\hw", function () require('mywords').hl_toggle() end, desc = "Highlight all instances of this word"},
        {"\\hr", function () require('mywords').hl_toggle_regex() end, desc = "Highlight all instances of this regex"},
        {"\\hc", function () require('mywords').uhl_all() end, desc = "Clear all highlights"},
    },
  },
}

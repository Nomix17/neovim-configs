local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#474646" })
end)

require("ibl").setup({
  indent = {
    char = "┊",
    highlight = { "IndentBlanklineChar" }
  },
  scope = {
    enabled = true,
    show_start = true,
    show_end = false,
  },
})


return {
  {
    'romgrk/barbar.nvim',
    config = function()
      require'barbar'.setup {
        icons = {
          separator = {left = '▎', right = ''},
          inactive = {separator = {left = '▎', right = ''}},
        },
        animation = true,
        clickable = true,
      }
    end
  }
}

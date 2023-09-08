return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 
      'nvim-tree/nvim-web-devicons'
    },
    options = { theme = 'everforest' },
    config = function(_, opts)
      require('lualine').setup()
    end
  }
}

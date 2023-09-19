return {
  -- Install telescope file browser extention
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-web-devicons",
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
  -- Configure telescope-file-browser
  keys = {
    {
      "<leader>fv",
      ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
      { noremap = true },
      desc = "Browse Files",
    },
  },

  -- Change some optionsns
  --opts = {
  --  theme = "ivy",
  --},
}

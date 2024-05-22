return {
  -- Download OneDark Theme
  { "navarasu/onedark.nvim" },
  -- Configure One Dark Theme
  -- require("onedark").setup({
  --   style = "darker", }),
  --   Configure LazyVim to load onedark
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}

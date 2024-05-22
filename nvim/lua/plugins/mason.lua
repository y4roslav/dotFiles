return {
  -- add any tools you want to have installed below
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
      "black",
      "ruff",
      "pyright",
      "rust-analyzer",
      "codelldb",
      "haskell-language-server",
      "mypy",
      "java-test",
      "java-debug-adapter",
    },
  },
}

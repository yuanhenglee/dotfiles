return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- add vim as global variable for lua diagnostic
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      },
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=Google",
        },
      },
    },
  },
}

return {
  "saghen/blink.cmp",
  dependencies = {
    "saghen/blink.lib",
    -- optional: provides snippets for the snippet source
    "rafamadriz/friendly-snippets",
  },
  build = function() require("blink.cmp").build():pwait() end,

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "super-tab" },
    sources = {
      -- add lazydev to your completion providers
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
        snippets = {
          opts = {
            extended_filetypes = {
              razor = { "html", "csharp" },
              cshtml = { "html", "csharp" },
            },
          },
        },
      },
    },

    -- -- (Default) Only show the documentation popup when manually triggered
    -- completion = { documentation = { auto_show = false } },
    --
    -- -- (Default) list of enabled providers defined so that you can extend it
    -- -- elsewhere in your config, without redefining it, due to `opts_extend`
    -- sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    --
    -- -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- -- You may use a lua implementation instead by using `implementation = "lua"`
    -- -- See the fuzzy documentation for more information
    -- fuzzy = { implementation = "rust" }
  },
}

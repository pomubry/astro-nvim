---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["gr"] = { desc = "LSP stuff" },
          ["<Leader>gD"] = { "<cmd> wincmd p | q <cr>", desc = "Close Git Diff" },
          ["<Leader>un"] = { "<cmd> set norelativenumber <cr>", desc = "Turn off relativenumber" },
        },
      },
      options = {
        opt = {
          relativenumber = true, -- Enable relative numbers
          number = false, -- Disable absolute numbers
        },
      },
    },
  },
}

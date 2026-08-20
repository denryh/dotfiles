return {
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", desc = "Toggle comment on line" },
      { "gc", desc = "Toggle comment on selection", mode = "v" },
    },
    config = function()
      require("Comment").setup()
    end,
  },
}
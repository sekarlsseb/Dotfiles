-- Quality-of-life additions on top of LazyVim.
-- (harpoon and mini-surround come from the extras listed in lazyvim.json.)
return {
  -- Edit the filesystem like a buffer. Press `-` to open the parent directory.
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    keys = { { "-", "<cmd>Oil<cr>", desc = "Open parent directory (Oil)" } },
    opts = {
      default_file_explorer = false, -- keep netrw/snacks explorer untouched
      view_options = { show_hidden = true },
    },
  },
}

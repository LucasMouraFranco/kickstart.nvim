vim.pack.add({
  {
    -- Load the Neovim integration for the OpenCode CLI.
    src = "https://github.com/nickjvandyke/opencode.nvim",
    version = vim.version.range("*"), -- Latest stable release
  },
})

---@type opencode.Opts
vim.g.opencode_opts = {
  events = {
    enabled = true,
    reload = true,
    permissions = {
      enabled = true,
      edits = {
        -- Shows proposed edits in a diff before OpenCode writes them.
        -- In that diff: `da` accepts, `dr` rejects, `dp`/`do` accept/reject hunks.
        enabled = true, -- Show OpenCode edit requests as Neovim diffs before accepting.
      },
    },
  },
}

vim.o.autoread = true -- Required for `vim.g.opencode_opts.events.reload`

-- Recommended/example keymaps
vim.keymap.set({ "n", "x" }, "<leader>oa", function() require("opencode").ask("@this: ") end, { desc = "[O]pencode [A]sk" })
vim.keymap.set({ "n", "x" }, "<leader>os", function() require("opencode").select() end,       { desc = "[O]pencode [S]elect" })

-- Operator mappings let OpenCode receive a motion or visual range as context.
vim.keymap.set({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end,        { desc = "[O]pencode Append Range", expr = true })
vim.keymap.set("n",          "goo", function() return require("opencode").operator("@this ") .. "_" end, { desc = "[O]pencode Append Line", expr = true })

vim.keymap.set("n", "<S-C-p>", function() require("opencode").command("session.half.page.up") end,   { desc = "[O]pencode Scroll Up" })
vim.keymap.set("n", "<S-C-n>", function() require("opencode").command("session.half.page.down") end, { desc = "[O]pencode Scroll Down" })

-- Open a side-by-side diff of the current file against the version in HEAD.
vim.keymap.set("n", "<leader>od", function()
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" then
    vim.notify("Current buffer has no file", vim.log.levels.WARN)
    return
  end

  local root = vim.fn.systemlist({ "git", "-C", vim.fn.fnamemodify(file, ":h"), "rev-parse", "--show-toplevel" })[1]
  if vim.v.shell_error ~= 0 or not root then
    vim.notify("Current file is not inside a git repository", vim.log.levels.WARN)
    return
  end

  local rel = vim.fn.fnamemodify(file, ":p"):sub(#root + 2)
  vim.fn.system({ "git", "-C", root, "ls-files", "--error-unmatch", rel })
  if vim.v.shell_error ~= 0 then
    vim.notify("Current file is not tracked by git", vim.log.levels.WARN)
    return
  end

  -- Build a scratch buffer containing the committed version of this file.
  local original = vim.fn.systemlist({ "git", "-C", root, "show", "HEAD:" .. rel })
  if vim.v.shell_error ~= 0 then
    vim.notify("Could not load file from HEAD", vim.log.levels.ERROR)
    return
  end

  vim.cmd("tab split")
  vim.cmd("diffthis")
  vim.cmd("vnew")
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
  vim.bo.swapfile = false
  vim.api.nvim_buf_set_name(0, rel .. " (HEAD)")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, original)
  vim.bo.modified = false
  vim.cmd("diffthis")
end, { desc = "[O]pencode [D]iff" })

-- Show a named group for the <leader>o prefix in which-key
require("which-key").add({
  { "<leader>o", group = "[O]pencode", mode = { "n", "v" } },
})

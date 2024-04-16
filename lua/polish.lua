-- Disable capslock when leave insert mode to avoid anoying behavior
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    local _, _, caps_state = vim.fn.system("xset -q"):find "00: Caps Lock:%s+(%a+)"
    if caps_state == "on" then vim.fn.system "xdotool key Caps_Lock" end
  end,
})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.py", "*.lua" },
--   command = [[%s/\s\+$//e]],
-- })

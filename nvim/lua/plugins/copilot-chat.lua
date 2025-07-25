require("CopilotChat").setup {
  -- See Configuration section for options

}

--copilot chat
vim.keymap.set('n', '<leader>cc', function()
  if vim.fn.exists(':CopilotChat') == 2 then
    vim.cmd('CopilotChatToggle')
  else
    print('Copilot Chat is not available')
  end
end)

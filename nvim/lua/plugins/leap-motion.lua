local leap = require("leap")
leap.opts.highlight_unlabeled_phase_one_targets = true
leap.opts.case_sensitive = false
vim.keymap.set({'n', 'x', 'o'}, '//w', function()
    leap.leap({
        target_windows = {vim.api.nvim_get_current_win()},
        inclusive_op = true,
    })
end
)

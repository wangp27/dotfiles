require('smear_cursor').setup({
    -- Cursor animation settings
    stiffness = 0.8,               -- Higher = more responsive
    trailing_stiffness = 0.4,      -- Lower = longer trail
    distance_stop_animating = 0.3, -- Stop animation threshold
    hide_target_hack = true,       -- Better performance
    
    -- Advanced options
    legacy_computing_symbols_support = false,
    transparent_bg_fallback_color = "#303030",
})

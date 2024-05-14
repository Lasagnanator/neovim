-- NOTE: right now unusued
return {
    toggler = {            -- LHS of toggle mappings in NORMAL mode
        line = 'gcc',      -- Line-comment toggle keymap
        block = 'gbc',     -- Block-comment toggle keymap
    },
    opleader = {           -- LHS of operator-pending mappings in NORMAL and VISUAL mode
        line = 'gc',       -- Line-comment keymap
        block = 'gb',      -- Block-comment keymap
    },
    extra = {              -- LHS of extra mappings
        above = 'gcO',     -- Add comment on the line above
        below = 'gco',     -- Add comment on the line below
        eol = 'gca',       -- Add comment at the end of line, maybe useless
    },
}

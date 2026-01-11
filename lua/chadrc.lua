-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "catppuccin",
    theme_toggle = { "github_light", "catppuccin" },
}

M.ui = {
    cmp = {
        format_colors = {
            tailwind = true,
            icon = "󱓻",
        },
    },
    statusline = {
        theme = "vscode_colored",
    },

    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
}

M.nvdash = {
    load_on_startup = true,
}

return M

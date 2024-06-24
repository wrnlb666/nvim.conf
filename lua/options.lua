require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- insert behavior
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

local sysname = vim.loop.os_uname().sysname

if sysname == "Linux" then
    vim.opt.clipboard = "unnamedplus"
else
    vim.opt.clipboard = "unnamed"
end

-- default shell
-- vim.opt.shell = 'zsh'
if sysname == "Linux" then
    vim.opt.shell = 'zsh'
else
    vim.o.shell = "powershell"
    vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
    vim.o.shellquote = ""
    vim.o.shellxquote = ""
end

-- treesitter fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "normal! zR"
})


-- nvim tree automatic behavior
vim.api.nvim_exec([[
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'cd '.argv()[0] | execute 'NvimTreeToggle' argv()[0] | endif
]], false)

vim.api.nvim_exec([[
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | execute 'NvimTreeToggle' | endif
]], false)

vim.api.nvim_exec([[
  autocmd BufEnter * if (winnr('$') == 1 && &filetype == 'NvimTree') | q | endif
]], false)


-- line break
vim.wo.linebreak = true


-- add `.templ` file extension
vim.filetype.add({
    extension = {
        templ = "templ",
        proto = "proto",
    },
})


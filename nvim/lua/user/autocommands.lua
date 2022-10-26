vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _whitespace
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
  augroup end
]])

-- Autoformat
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.ts", "*.rs", "*.go" },
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})

-- codelens
--[[ vim.api.nvim_create_autocmd({ "BufWritePost" }, { ]]
--[[   pattern = { "*.java", "*.rs" }, ]]
--[[   callback = function() ]]
--[[     vim.lsp.codelens.refresh() ]]
--[[   end, ]]
--[[ }) ]]
vim.cmd [[
try
  " colorscheme tokyonight-night
	" colorscheme dracula
	" colorscheme embark
	" colorscheme monokai
	" colorscheme oxocarbon
	" colorscheme kanagawa
	" colorscheme catppuccin
	colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
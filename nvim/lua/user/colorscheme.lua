vim.cmd [[
try
  " colorscheme tokyonight-night
	" colorscheme dracula
	" colorscheme embark
	" colorscheme monokai
	" colorscheme oxocarbon
	" colorscheme kanagawa
	" colorscheme catppuccin
	" colorscheme gruvbox
	colorscheme rosebones
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=light
endtry
]]
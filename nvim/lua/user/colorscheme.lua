vim.cmd [[
try
  " colorscheme tokyonight-night
	" colorscheme tender
	colorscheme embark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
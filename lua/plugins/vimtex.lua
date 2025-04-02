return {
  'lervag/vimtex',
  ft = 'tex',
  config = function()
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_compiler_engine = 'XeLaTeX' -- Change this to 'lualatex' if needed
    vim.g.vimtex_quickfix_mode = 0
  end
}

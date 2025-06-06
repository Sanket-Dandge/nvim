return {
  'xuhdev/vim-latex-live-preview',
  ft = 'tex',
  lazy = false,
  config = function()
    vim.g.livepreview_previewer = 'zathura'
    vim.g.livepreview_engine = 'pdflatex'
    vim.g.livepreview_use_xdvi = 0
  end
}

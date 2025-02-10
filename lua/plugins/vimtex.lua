return {
  "lervag/vimtex",
  event = "BufRead *.tex",
  init = function()
    vim.cmd[[set conceallevel=2]]
    vim.cmd[[let g:tex_conceal='abdmg']]
    vim.g.vimtex_view_method = "zathura"
  end
}

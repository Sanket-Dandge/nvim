return {
  "brenoprata10/nvim-highlight-colors",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-highlight-colors").setup({
      render = "background",           -- Show color as background highlight
      enable_named_colors = true,      -- Support named colors (red, blue, etc)
      enable_tailwind = true,          -- Support tailwind colors (bg-red-500)
    })

    -- blink.cmp integration for color preview inside completion menu
    require("blink.cmp").setup {
        completion = {
            menu = {
                draw = {
                    components = {
                        -- customize the drawing of kind icons
                        kind_icon = {
                            text = function(ctx)
                              -- default kind icon
                              local icon = ctx.kind_icon
                                -- if LSP source, check for color derived from documentation
                                if ctx.item.source_name == "LSP" then
                                    local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                                    if color_item and color_item.abbr ~= "" then
                                      icon = color_item.abbr
                                    end
                                end
                                return icon .. ctx.icon_gap
                            end,
                            highlight = function(ctx)
                                -- default highlight group
                                local highlight = "BlinkCmpKind" .. ctx.kind
                                -- if LSP source, check for color derived from documentation
                                if ctx.item.source_name == "LSP" then
                                    local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                                    if color_item and color_item.abbr_hl_group then
                                      highlight = color_item.abbr_hl_group
                                    end
                                end
                                return highlight
                            end,
                        },
                    },
                },
            },
        },
    }
  end,
}

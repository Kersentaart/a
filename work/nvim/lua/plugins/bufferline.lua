-----------------------------------------------------------
-- Bufferline configuration file
-----------------------------------------------------------

-- Plugin: bufferline.nvim
-- https://github.com/akinsho/bufferline.nvim#installation

require'bufferline'.setup {
  options = {
    buffer_close_icon = '',
    separator_style = "slant",
    max_name_length = 20,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
          or (e == "warning" and " " or "" )
        s = s .. n .. sym
      end
      return s
    end
  }
}

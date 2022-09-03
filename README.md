forked from [matsui54/ddu-vim-ui-select](https://github.com/matsui54/ddu-vim-ui-select)

# ddu-vim-ui-select

Replace `vim.ui.select` with ddu.

See [help](doc/ddu-vim_ui_select.txt) for details.

## Setup

Unlike matsui54/ddu-vim-ui-select, This plugin duse not automatically register |vim.ui.select()| on initialization.  
You need to call `setup` function.

```lua
require('ddu-vim_ui_select').setup()
```

## Example

```lua
require('ddu-vim_ui_select').setup {
    ddu_options = {
        ui = 'ff',
        uiParams = {
            ff = { autoResize = true }
        },
        kindOptions = {
            vim_ui_select = { defaultAction = 'select' },
        }
    },
}
```

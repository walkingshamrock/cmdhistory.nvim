# cmdhistory.nvim

`cmdhistory.nvim` is a Neovim plugin that enhances your command-line experience by providing an intuitive and efficient command history management system.

## Features

- Seamless integration with Neovim.
- Easy navigation and search through command history.
- Lightweight and fast.

## Installation

Install `cmdhistory.nvim` using your preferred plugin manager. For example, with [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
require('lazy').setup({
  'walkingshamrock/cmdhistory.nvim'
})
```

Restart Neovim to load the plugin.

## Usage

Once installed, the plugin automatically manages your command history. Use the following commands to interact with it:

- `:CmdHistory` - Opens the command history window.
- `:CmdHistoryClear` - Clears the command history.

In the command history window:
- Press `Enter` to execute the selected command.
- Press `Shift-Enter` to edit the selected command.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to improve the plugin.

## Acknowledgments

Special thanks to the Neovim community for their support and inspiration.

# My Vim Configuration

This is my personal Vim configuration, tailored for a productive development workflow. It is based on the configuration described in [this article](https://leehengtong.com/modern_neovim/).

## Installation

1.  Clone this repository to `~/.vim`:
    ```bash
    git clone https://github.com/your-username/your-vim-config.git ~/.vim
    ```
2.  From your home directory, create a symbolic link to the `.vimrc` file:
    ```bash
    ln -s -f .vim/.vimrc .vimrc
    ```
3.  Install vim-plug:
    ```bash
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```
4.  Open Vim and run `:PlugInstall` to install all the plugins.


## File Structure

The configuration is split into several files for better organization:

-   `.vimrc`: The main entry point, sources all other configuration files.
-   `settings.vim`: General Vim settings.
-   `plugins.vim`: Plugin management with `vim-plug` and plugin-specific configurations.
-   `keymaps.vim`: Custom key mappings.
-   `scripts.vim`: Custom Vimscript functions and commands.
-   `build_run.vim`: Scripts for building and running code.

## Build and Run

You can build and run the current file by pressing `<F5>`. This will open a terminal at the bottom of the screen and execute the appropriate command based on the file type. Press `<F6>` to stop the currently running process.

-   **C++**: Compiles with `g++ -std=c++20` and runs the output file. If a `Makefile` is present, it will run `make` instead.
-   **Python**: Executes the script with `python3`.

## Custom Scripts

-   **Toggle NERDTree and Refresh**: `<C-n>` toggles the NERDTree file explorer and refreshes it if it was just opened.
-   **Toggle Auto-Highlight**: `z/` toggles highlighting of all instances of the word under the cursor.
-   **Rename File**: `<leader><leader>rn` renames the current file.
-   **Auto-save**: The configuration is set to automatically save files when Vim loses focus.

## Plugins

This configuration uses `vim-plug` to manage plugins. Here is a list of the main plugins used:

| Plugin | Description |
|---|---|
| [fzf.vim](https://github.com/junegunn/fzf.vim) | A command-line fuzzy finder with Vim integration. |
| [copilot.vim](https://github.com/github/copilot.vim) | GitHub Copilot for Vim. |
| [vim-go](https://github.com/fatih/vim-go) | Go development plugin for Vim. |
| [coc.nvim](https://github.com/neoclide/coc.nvim) | An Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode. |
| [vim-airline](https://github.com/vim-airline/vim-airline) | A light-weight statusline for Vim. |
| [auto-pairs](https://github.com/jiangmiao/auto-pairs) | Insert or delete brackets, parens, quotes in pair. |
| [vim-sandwich](https://github.com/machakann/vim-sandwich) | A plugin to add/delete/replace surroundings of a text object. |
| [nerdtree](https://github.com/scrooloose/nerdtree) | A tree explorer plugin for Vim. |
| [nerdcommenter](https://github.com/preservim/nerdcommenter) | A plugin for easy commenting of code for many filetypes. |
| [vim-snippets](https://github.com/honza/vim-snippets) | A collection of snippets for various programming languages. |
| [gruvbox](https://github.com/gruvbox-community/gruvbox) | A retro groove color scheme for Vim. |
| [onedark.vim](https://github.com/joshdick/onedark.vim) | A dark color scheme for Vim. |
| [catppuccin](https://github.com/catppuccin/nvim) | A soothing pastel theme for Vim. |
| [vim-floaterm](https://github.com/voldikss/vim-floaterm) | A floating terminal for Vim. |
| [vim-easymotion](https://github.com/easymotion/vim-easymotion) | A Vim plugin that allows you to move to any character in the visible area with a few keystrokes. |
| [vimspector](https://github.com/puremourning/vimspector) | A multi-language debugging plugin for Vim. |
| [ctrlsf.vim](https://github.com/dyng/ctrlsf.vim) | A Vim plugin for project-wide search and replace. |
| [ale](https://github.com/dense-analysis/ale) | Asynchronous Lint Engine for Vim. |
| [vim-devicons](https://github.com/ryanoasis/vim-devicons) | Adds file type icons to Vim plugins. |
| [tagbar](https://github.com/preservim/tagbar) | A Vim plugin that provides an easy way to browse the tags of the current file. |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | A Git wrapper so awesome, it should be illegal. |
| [gv.vim](https://github.com/junegunn/gv.vim) | A Git commit browser. |
| [vim-gitgutter](https://github.com/airblade/vim-gitgutter) | A Vim plugin which shows a git diff in the sign column. |
| [indentLine](https://github.com/Yggdroot/indentLine) | A Vim plugin to display the indention levels with vertical lines. |
| [vim-clang-format](https://github.com/rhysd/vim-clang-format) | A Vim plugin for clang-format. |
| [goyo.vim](https://github.com/junegunn/goyo.vim) | A distraction-free writing mode for Vim. |
| [black](https://github.com/psf/black) | The uncompromising Python code formatter. |
| [bracey.vim](https://github.com/turbio/bracey.vim) | A live-editing, REPL-driven development tool for Vim. |

## Key Mappings

Here are some of the custom key mappings:

| Key | Description |
|---|---|
| `<leader>o` | Close all other windows. |
| `<leader>e` | Open a new tab. |
| `<leader>R` | Reload the `.vimrc` file. |
| `<leader>w` | Save the current file. |
| `<C-s>` | Save the current file. |
| `<leader>q` | Quit the current window. |
| `<leader>t` | Open the file under the cursor in a new tab. |
| `<leader>s` | Open the file under the cursor in a horizontal split. |
| `<leader>v` | Open the file under the cursor in a vertical split. |
| `_` / `+` | Move the current line up/down in normal mode. |
| `_` / `+` | Move the selected lines up/down in visual mode. |
| `[o` / `]o` | Insert a new line above/below the current line. |
| `<leader>d` | Duplicate the current line. |
| `<C-h/j/k/l>` | Navigate between windows. |
| `<C-p>` | Fuzzy find files using fzf. |
| `<leader>rg` | Search for a string in the project using ripgrep. |
| `<F7>` | Launch the debugger (Vimspector). |
| `<F9>` | Toggle a breakpoint (Vimspector). |
| `<F10>` | Step over (Vimspector). |
| `<F11>` | Step into (Vimspector). |
| `<S-F11>` | Step out (Vimspector). |
| `<leader>n` | Find the current file in NERDTree. |
| `tt` | Toggle the floating terminal. |
| `<leader>f` | Search for the current word in the project using CtrlSF. |
| `tb` | Toggle the Tagbar. |

## Settings

- **Appearance**:
    - The `catppuccin-frappe` theme is used.
    - Line numbers are enabled.
    - The current line is highlighted.
    - Invisible characters are displayed.
- **Editing**:
    - Tabs are replaced with 4 spaces.
    - Auto-indentation is enabled.
    - The clipboard is shared with the system clipboard.
    - Incremental search is enabled.
- **Backups**:
    - Backup files are created in `~/.vim/backup/`.
# Vim Cheatsheet

Duke's curated list of new vim commands

| Command | Description |
|---------|-------------|
| `:set colorcolumn=80` | Sets a vertical line at column 80 |
| `:highlight ColorColumn ctermbg=236 guibg=#303030` | Changes the color of the colorcolumn |
| `:tabnew [filename]` | Opens a new tab, optionally with a file |
| `:w filename.txt` | Names and saves the current buffer to a file |
| `:tabonly` or `:tabo` | Closes all tabs except the current one |
| `:qa` | Quits Vim, closing all tabs |
| `gt` | Moves to the next tab |
| `gT` | Moves to the previous tab |
| `:vsplit` or `:vsp [filename]` | Opens a vertical split, optionally with a file |
| `:split` or `:sp [filename]` | Opens a horizontal split, optionally with a file |
| `:Vexplore` | Opens vertical split with file explorer on the left |
| `:Lexplore` | Opens vertical split with file explorer on the left, can be toggled |
| `:Explore` | Opens the file explorer in the current window |
| `:rightbelow vsplit test.py` | Opens test.py in a vertical split to the right |
| `set splitright` | Sets new vertical splits to open on the right |
| `set splitbelow` | Sets new horizontal splits to open below |
| `:q` | Exits the file explorer (when in the explorer window) |
| `Ctrl-w h` | Moves to the split on the left |
| `Ctrl-w j` | Moves to the split below |
| `Ctrl-w k` | Moves to the split above |
| `Ctrl-w l` | Moves to the split on the right |
| `Ctrl-w w` | Cycles through all splits |

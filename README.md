# vim-toggle-qf

### What is does:
Provides mappings for toggling the quickfix window without losing focus of the
active/previously focused window.
<br>

Handles the following cases:
1. quickfix window is not visible in the current tab<br>
The toggle function will display the quickfix window at the bottom of the
screen, with the width filling the width of the scree;
2. quickfix window is visible in the current tab<br>
2.1 quickfix is not in focus<br>
The toggle function will close the quickfix window, maintaining the current
focused window.<br>
2.2 quickfix is currenly in focus<br>
The toggle function will close the quickfix window and the focus will be taken
by the previously focused window;<br>

Mappings
```
F5 -> toggle quickfix window (no matter what window is currently in focus)
q  -> when quickfix window is in focus it will close it
```

### What it requires:
1. Available F5 key for the mapping to work.

### How does it look:

When F5 is pressed the quickfix window is shown/hidden. Pressing 'q' in the
quickfix window, will close it.

### What is the motivation:

Opening the quickfix window, then closing it will reset the focused window to
the top-left one. By using the mappings provided in this plugin, this issue is
no longer present.

### How to install:

Vundle<br/>
`Plugin 'mihaicristiantanase/vim-toggle-qf'`

vim-plug<br/>
`Plug 'mihaicristiantanase/vim-toggle-qf'`

Pathogen<br/>
`git clone https://github.com/mihaicristiantanase/vim-toggle-qf ~/.vim/bundle/vim-toggle-qf`

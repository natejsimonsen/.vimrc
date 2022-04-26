## Vim Setup
To Install vim setup run on Vim (Not Neovim)

```
sudo apt install vim
cd ~
git clone https://github.com/Khoza-Technology/vi-configuration
mv vi-configuration/init.vim .vimrc
rm -rf vi-configuration
```
If vim-plug is uninstalled, run 
```
# Vim:
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
If vim-plug is not working, make sure that github is installed with
```
sudo apt install git
```
At this point, you are ready to rock n roll!


### Awesome Vim movements
- D = Delete to the end of the line
- dtchar = delete to char
- dd = delete line
- yy = copy line
- V = Visual block by line
- tchar = go to character leading up to character
- fchar = go to character
- dit or cit = delete inside of html tags
- t> or t< = go to > or <, very useful for html tags
- ; and , = repeat previous t or f command
- J = join two lines together

### Awesome Vim Plugins
- **NerdTree** hit ctrl G and hit ? for documentation
- **Fugitive Vim**, run :Git git-command, to run git commands inside of vim!
- **Vim Surround**, changes outside surrounding quotes, html tags, etc perhaps the most useful plugin
- **Vim Commentary**, use gc in visual mode or gcc in normal mode to comment out code!
- **Coc Nvim**, use Vscode autocompletion!
- **Emmet Vim**, shorthand html coding, example div>li.list*4+a.list.href.link>p
  then hit ctrl + y and then , Enjoy!

Other nice plugins are only aesthetic
- **Vim Gruvbox**, a nice colorscheme
- **Rainbow Vim**, highlight brackets
- **Lightline Vim**, A nice display bar at the bottom of the page

### Awesome Vim Plugin Movements and Commands
#### Vim Surround

Vim surround offers the ys, yss, ds, and cs commands

cs + char + char will 'change the surrounding character to character' example

```
Example:
  "Hello World"
  cs"'
  'Hello World'
```

The ds command is very similar to cs, but instead of 'changing' the char to a certain char, 

ds will only delete surrounding character

```
Example:
  "hello world"
  ds" will render
  hello world
```

the ds and cs also work with html tags, but instead of ds char or cs + char + char, 

run dst or cst<desired-tag-name>

```
Example with dst:
  <p>Hello World</p>
  dst will render
  Hello World

Example with cst:
    <p>Hello World</p>
    cst<a>
    Will Render
    <a>Hello World</a>
```

ys is a command which will surround a sequence with a character

ys can be combined with any movement commands or be in Visual mode, also combined with numbers

most practical applications of ys are either ys + num + word or ystchar or ysfchar desired-surrounding

```
Simple Example:
  Hello World: It is nice to be here!
  At beginning of line,
  ysw' will render
  'Hello' World: It is nice to be here!

Example with html:
  Hello World: It is nice ot be here
  ysf:<strong> will render
  <strong>Hello World:</strong> It is nice to be here!
```

yss works the same as ys, but will surround an entire line

```
Example:
  Hello World
  yss" will render
  "Hello World"
```

#### NerdTree
Ctrl G will open NerdTree

For more help on commands, hit ? while in NerdTree

In the NerdTree window, the i, o, and t commands are the most useful

i = open window in vertical split

t = open window in new tab

o = open file

To navigate split windows, hit ctrl j, k, l, or h

#### Vim Commentary 
In visual mode, gc will comment out code!

#### Emmet Vim
Awesome plugin, docs are at emmet.io, too much to converts

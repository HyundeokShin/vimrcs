import zipfile
import shutil
import tempfile
import requests

from os import path


#--- Globals ----------------------------------------------
PLUGINS = """
vim-markdown https://github.com/plasticboy/vim-markdown
ack.vim https://github.com/mileszs/ack.vim
atp_vim https://github.com/coot/atp_vim
bufexplorer https://github.com/corntrace/bufexplorer
ctrlp.vim https://github.com/kien/ctrlp.vim
goyo.vim https://github.com/junegunn/goyo.vim
mayansmoke https://github.com/vim-scripts/mayansmoke
nerdtree https://github.com/scrooloose/nerdtree
nginx.vim https://github.com/vim-scripts/nginx.vim
open_file_under_cursor.vim https://github.com/amix/open_file_under_cursor.vim
snipmate-snippets https://github.com/scrooloose/snipmate-snippets
supertab https://github.com/ervandew/supertab
syntastic https://github.com/scrooloose/syntastic
taglist.vim https://github.com/vim-scripts/taglist.vim
tlib https://github.com/vim-scripts/tlib
vim-addon-mw-utils https://github.com/MarcWeber/vim-addon-mw-utils
vim-airline https://github.com/bling/vim-airline
vim-bundle-mako https://github.com/sophacles/vim-bundle-mako
vim-coffee-script https://github.com/kchmck/vim-coffee-script
vim-colors-solarized https://github.com/altercation/vim-colors-solarized
vim-commentary https://github.com/tpope/vim-commentary
vim-easy-align https://github.com/junegunn/vim-easy-align
vim-expand-region https://github.com/terryma/vim-expand-region
vim-fugitive https://github.com/tpope/vim-fugitive
vim-go https://github.com/fatih/vim-go
vim-indent-object https://github.com/michaeljsmith/vim-indent-object
vim-instant-markdown https://github.com/suan/vim-instant-markdown
vim-latex-live-preview https://github.com/xuhdev/vim-latex-live-preview
vim-less https://github.com/groenewege/vim-less
vim-multiple-cursors https://github.com/terryma/vim-multiple-cursors
vim-pandoc https://github.com/vim-pandoc/vim-pandoc
vim-pyte https://github.com/therubymug/vim-pyte
vim-repeat https://github.com/tpope/vim-repeat
vim-snipmate https://github.com/garbas/vim-snipmate
vim-snippets https://github.com/honza/vim-snippets
vim-surround https://github.com/tpope/vim-surround
vim-zenroom2 https://github.com/amix/vim-zenroom2
""".strip()

GITHUB_ZIP = '%s/archive/master.zip'

SOURCE_DIR = path.join(path.dirname(__file__), 'sources_non_forked')


def download_extract_replace(plugin_name, zip_path, temp_dir, source_dir):
    temp_zip_path = path.join(temp_dir, plugin_name)

    # Download and extract file in temp dir
    req = requests.get(zip_path)
    open(temp_zip_path, 'wb').write(req.content)

    zip_f = zipfile.ZipFile(temp_zip_path)
    zip_f.extractall(temp_dir)

    plugin_temp_path = path.join(temp_dir,
                                 path.join(temp_dir, '%s-master' % plugin_name))

    # Remove the current plugin and replace it with the extracted
    plugin_dest_path = path.join(source_dir, plugin_name)

    try:
        shutil.rmtree(plugin_dest_path)
    except OSError:
        pass

    shutil.move(plugin_temp_path, plugin_dest_path)

    print('Updated {0}'.format(plugin_name))


if __name__ == '__main__':
    temp_directory = tempfile.mkdtemp()

    try:
        for line in PLUGINS.splitlines():
            name, github_url = line.split(' ')
            zip_path = GITHUB_ZIP % github_url
            download_extract_replace(name, zip_path,
                                     temp_directory, SOURCE_DIR)
    finally:
        shutil.rmtree(temp_directory)

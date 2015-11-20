import sys, shutil, os

files = {
    'vimrc': '.vimrc',
    'bash_profile': '.bash_profile',
    'bashrc': '.bashrc',
    'i3config': '.i3/config',
    'packup': 'packup',
    'xinitrc': '.xinitrc',
    'gtkrc': '.gtkrc-2.0',
    'hybrid.vim': '.vim/colors/hybrid.vim',
    'Xresources': '.Xresources'}

thisDir = os.path.dirname(os.path.realpath(__file__))
home = os.path.expanduser('~')
print home

def copyFile(src, dest):
    try: 
        shutil.copy(src, dest)

    except shutil.Error as e:
        print 'Error: ' ,  e

    except IOError as e:
        print 'Error: ' , e

if sys.argv[1] == 'install':
    for item in files:
        src = thisDir + '/' + item    
        dest = home + '/' + files[item]
        print 'gonna copy ', src, 'to ',  dest
        copyFile(src, dest)

elif sys.argv[1] == 'backup':
    for item in files:
        dest = thisDir + '/' + item    
        src = home + '/' + files[item]
        print 'gonna copy ', src, 'to ',  dest
        copyFile(src, dest)

else:
    print 'Argument must be \'install\' or \'backup\''


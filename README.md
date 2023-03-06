Add the following to your `.profile` file,
before it potentially sources `.bashrc`:
```
export GARDEN="$HOME/your/path/to/git/repo/home-and-garden"
if [ -f "$GARDEN/.shrc" ] ; then
    . "$GARDEN/.shrc"
fi
```

Add the following to your `.bashrc` file:
```
if [ -f "$GARDEN"/.bash_setup.sh ] ; then
    . "$GARDEN"/.bash_setup.sh
fi
```


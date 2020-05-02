Add the following to your `.profile` file,
before it potentially sources `.bashrc`:
```
export GARDEN="$HOME/git/home-and-garden"
export PATH="$PATH":"$GARDEN"/scripts
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


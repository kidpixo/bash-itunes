I just addeded some extra shortcuts. In my system "itunes" is aliased as "i" so 

```
    > i p # alias for 'itunes play'
```

plays a song. Al the credits to the original project!

Some example :

```
    > i n # alias for 'itunes next'
    > i s # alias for 'itunes stop'
    > i pls # alias for 'itunes playlists' 
            # or 'itunes please!' for boring songs :-D    
```


Bash iTunes
===========

Bash iTunes is a command-line wrapper for iTunes, letting you easily
control iTunes from the terminal or over SSH.

Currently it supports the following commands:

```
Navigation commands:
    p   play        Resume playing or choose track.
    pa  pause       Pause playing.
    s   stop        Stop playing.
    n   next        Skip to next track.
    pr  prev        Skip back to previous track.
    i   info        View info about current track.
    se  search      Search for tracks.
    sh  shuffle     View or set shuffle status.
    r   repeat      View or set repeat status.
    pl  playlist    View or choose playlist.
    pls playlists   List all playlists.

Volume commands:
    v   vol[ume]    View or adjust iTunes volume 'up', 'down' or percentage.
    m   mute        Mutes iTunes.
    um  unmute      Unmutes iTunes, restoring previous volume level.
    sv  sysvol[ume] View or adjust system volume 'up', 'down' or percentage.
    sm  sysmute     Mute system sound.
    sum sysunmute   Unmute system sound.

Application commands:
    o  open        Start iTunes running.
    q  quit        Quit iTunes.
    sw show        Hide the iTunes window.
    h  hide        Show the iTunes window.
```

Setup
-----

Install the itunes script somewhere on your path, `~/bin` is
the usual choice, and type `itunes help` to get started.

Have fun.

Plugin Support
--------------

`bash-itunes` has rudimentary plugin support by creating subcommands
in the `$HOME/.bash-itunes/plugins` directory:

 1. Create a bash script in the plugins directory named after the command name.
 2. In the main body of the script do nothing but set the PLUGIN_NAME
    (a full name for the plugin), PLUGIN_VERSION (the plugin version) and
    PLUGIN_BRIEF (an under 70-char single-line description of the plugin)
    variables.
 3. Create a bash function named `_cmd_<plugin_name>` that performs the
    command.

For a simple example, `$HOME/.bash-itunes/plugins/party`:

```bash
#!/bin/bash

PLUGIN_NAME="Party Party!"
PLUGIN_VERSION="1.0.1"
PLUGIN_BRIEF="Gets the party started in style."

function _cmd_party() {
    say -v zarvox "Party party!" &
    echo "Party party!"
}
```

Results in the following:

```
$ itunes plugins
Installed plugins:
  party - Party Party! (1.0.1)

$ itunes party
Party party!
```

For a more extensive tutorial on writing plugins, check the blog
entry on my website:
http://www.illusori.co.uk/blog/2012/06/15/bash_itunes_plugin_tutorial.html

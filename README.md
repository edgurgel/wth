# WTH [![Build Status](https://travis-ci.org/edgurgel/wth.png?branch=master)](https://travis-ci.org/edgurgel/wth)

WTH is a command line tool much like old WTF that searchs on Urban Dictionary for a term definition.

## Usage

### Get a term description

```console
$ wth wth
1) Abbreviation for "What the Hell"

2) Shortened alternative to "With"
```

### Get a random term description

```console
$ wth --random
Random word: Goner
Video Game Boner. Made popular by YouTube show "20 Minutes or Less" co-host, Joe Bereta on the on the SourceFed channel.
```

## Building/Installing

Requirements:

* Erlang (to run)
* Elixir (to compile)

Download the last release at https://github.com/edgurgel/wth/releases or build it:

```console
mix deps.get
mix escriptize
```

`wth` binary will be avaiable.

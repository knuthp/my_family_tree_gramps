# Gramps Genealogy site for Knut H Pedersen
This repository is for managing my family tree using [Gramps](https://github.com/gramps-project/gramps)

## Requirement
Gramps 5.1.x installed

## Setup
1. Gramps prefrences media path root set to root of repository


## Make backup, import
Make a backup without media
```bash
gramps --open knuthp --export ./knuthp.gramps
```

First time import
```bash
gramps --create=from_backup --import=./knuthp.gramps
```

Import if db exists
```bash
gramps --import=./knuthp.gramps
```


## Generate html
Generates from knuthp database
```bash
./gramps_html.sh
```
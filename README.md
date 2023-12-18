# Gramps slekstshistorie data for Knut H Pedersen
Dette git repository brukes for lagring av mitt familietre ved bruk av programmet [Gramps](https://github.com/gramps-project/gramps)

## Krav
Gramps 5.1.x installert

## Setup
1. Gramps prefrences media path root settes til root av git repository.
1. Gramps på Engelsk språk

## Mine konvensjoner
Dette er beste praksis som jeg nå prøver å følge på nye ting
### Plasser (Places)
Bruk "Enclosed By" for hierarkiske plasser
1. Land

### Kilder for Hendelser (Source for events)
Legg linker til kilden på kilden og ikke på hendelsen.
Da kommer de ikke inn i hendelseslisten, men som del av kilden nederst.

### Linker til Internet for kilder
Lag en Link av teksten vha menyen til Internet Adress. La notatet være av typen LINK

## Ta backup, import
Ta backup av Gramps data uten å inkludere media
```bash
gramps --open knuthp --export ./knuthp.gramps
```

Første gangs import
```bash
gramps --create=knuthp --import=./knuthp.gramps
```

Import hvis databasen finnes på lokal maskin
```bash
gramps --import=./knuthp.gramps
```

Windows 11 WSL 2 special startup
```
GDK_BACKEND=x11 MOZ_ENABLE_WAYLAND=0 gramps
```

## Generere html
Generer fra knuthp databasen på lokal maskin
```bash
./gramps_html.sh
```


## Oppdatere Synology siten
```bash
sudo mount -vvv diskstation.local:/volume1/web /media/NAS/web
cp -r _build/* /media/NAS/web/knuthp/family/
```


## Laste ned media
```
wget https://www.nb.no/services/image/resolver/URN:NBN:no-nb_digibok_2011102708131_0013/full/568,/0/default.jpg -O 13.jpg
```

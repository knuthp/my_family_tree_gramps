# Gramps slekstshistorie data for Knut H Pedersen
Dette git repository brukes for lagring av mitt familietre ved bruk av programmet [Gramps](https://github.com/gramps-project/gramps)

## Krav
Gramps 5.1.x installert

```bash
...
sudo apt install language-pack-gnome-en
```

## Setup
1. Gramps prefrences media path root settes til root av git repository.
1. Gramps på Engelsk språk

## Mine konvensjoner
Dette er beste praksis som jeg nå prøver å følge på nye ting
### Plasser (Places)
Bruk "Enclosed By" for hierarkiske plasser
1. Land
2. Fylke
3. Kommune
4. Plass

### Kilder for Hendelser (Source for events)
Legg linker til kilden på kilden og ikke på hendelsen.
Da kommer de ikke inn i hendelseslisten, men som del av kilden nederst.


Legg bilde av kilden på kilden og ikke på hendelsen
Da kommer bildet i kildelisten og ikke som gallery på personen.


### Linker til Internet for kilder
Lag en Link av teksten vha menyen til Internet Adress. La notatet være av typen LINK

## Ta backup, import
Ta backup av Gramps data uten å inkludere media
```bash
gramps --open knuthp --export ./knuthp.gramps  && gunzip < knuthp.gramps > knuthp.xml
```

Første gangs import
```bash
sed -e "s~<mediapath>.*</mediapath>~<mediapath>`pwd`</mediapath>~g" knuthp.xml | gzip > knuthp.gramps && gramps --create=knuthp --import=./knuthp.gramps && gramps --create=knuthp --import=./knuthp.gramps
```

Import hvis databasen finnes på lokal maskin
```bash
sed -e "s~<mediapath>.*</mediapath>~<mediapath>`pwd`</mediapath>~g" knuthp.xml| gzip > knuthp.gramps && gramps --import=./knuthp.gramps && gramps --import=./knuthp.gramps
```

Windows 11 WSL 2 special startup
```
GDK_BACKEND=x11 MOZ_ENABLE_WAYLAND=0 gramps
```

## Generere html
Generer fra knuthp databasen på lokal maskin
```bash
./scripts/gramps_html
```


## Oppdatere Synology siten
```bash
sudo mount -vvv diskstation.local:/volume1/web /media/NAS/web
cp -r _build/* /media/NAS/web/knuthp/family/
```


## Laste ned media
```
poetry shell
cd media/aviser/<newspaper>
nbdownloader download <url for newspaper issue> <page>
```

example:
```
nbdownloader download "https://www.nb.no/items/1c07cc5197442ac4107022688b5cd86d?page=3&searchText=ernst%20paul%20hensel" 4
```
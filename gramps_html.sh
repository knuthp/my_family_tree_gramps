#!/bin/bash

# Dir of script
DIR=`dirname "$0"`

NAME="name=navwebpage"
LIVING_PEOPLE="living_people=99"
MAPSERVICE="mapservice=OpenStreetMap"
PLACEPAGES="placemappages=True"
INC="inc_places=True,inc_repository=True,inc_sources=True,inc_stats=True"
CSS="css=Basic-Cypress"
FAMILYMAPPAGES="familymappages=True"

TARGET_DIR=/home/knuthp/xfr/newfamily/
TARGET="target=${TARGET_DIR}"


mkdir -p ${TARGET_DIR}

gramps -O gramps_xml \
    -a report \
    -p ${NAME},${LIVING_PEOPLE},title="Knut H Pedersen slektstree",${MAPSERVICE},${PLACEPAGES},${INC},${FAMILYMAPPAGES},${CSS},${TARGET}


# Improve link visibility
#narrative-screen.css
#a {
#    color: blue;
#    text-decoration: underline;
#    word-wrap: break-word;
#}
cp ${DIR}/gramps_screen.css ${TARGET_DIR}/css/narrative-screen.css
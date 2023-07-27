#!/bin/bash

# Dir of script
DIR=`dirname "$0"`

# See https://www.gramps-project.org/wiki/index.php/Plugins_Command_Line
# https://github.com/gramps-project/gramps/blob/master/gramps/plugins/webreport/narrativeweb.py
NAME="name=navwebpage"
LIVING_PEOPLE="living_people=99"
MAPSERVICE="mapservice=OpenStreetMap"
PLACEPAGES="placemappages=True"
INC="inc_places=True,inc_repository=True,inc_sources=True,inc_stats=True"
HOMENOTE="homenote=N0930"
CSS="css=Basic-Cypress"
FAMILYMAPPAGES="familymappages=True"

TARGET_DIR=${DIR}/_build
TARGET="target=${TARGET_DIR}"


mkdir -p ${TARGET_DIR}/css

gramps -O knuthp \
    -a report \
    -p ${NAME},${LIVING_PEOPLE},title="Knut H Pedersen slektstree",${MAPSERVICE},${HOMENOTE},${PLACEPAGES},${INC},${FAMILYMAPPAGES},${CSS},${TARGET}


# Improve link visibility
#narrative-screen.css
#a {
#    color: blue;
#    text-decoration: underline;
#    word-wrap: break-word;
#}
cp ${DIR}/gramps_screen.css ${TARGET_DIR}/css/narrative-screen.css
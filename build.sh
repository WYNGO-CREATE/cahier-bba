#!/bin/sh
# Construit la version autonome (index.html) à partir du fragment source.
# L'artifact Claude reçoit le fragment tel quel : la plateforme fournit le <head>.
# La version hébergée a besoin d'un document complet — surtout de la balise
# viewport, sans laquelle les téléphones dessinent la page en 980 px de large.
SRC="${1:-cahier-source.html}"
{
  printf '%s\n' '<!doctype html>' '<html lang="fr">' '<head>' \
    '<meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">' \
    '<meta name="color-scheme" content="light dark">' \
    '<meta name="apple-mobile-web-app-capable" content="yes">' \
    '<meta name="description" content="Classeur de cours — Global BBA ESSEC">'
  cat "$SRC"
  printf '%s\n' '</head>' '<body>' '</body>' '</html>'
} > index.html

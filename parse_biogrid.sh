#!/usr/bin/env sh

# data: https://downloads.thebiogrid.org/BioGRID
# current release -> BIOGRID-ALL-<version>.tab2.zip
# important: biogrid.py only works for tab2 format

python biogrid.py "data/biogrid/BIOGRID-ORGANISM-Homo_sapiens-4.4.244.tab2.txt" 9606 PPI output/PPI-human.npz output/PPI-human-nodes.txt

python biogrid.py "data/biogrid/BIOGRID-ORGANISM-Homo_sapiens-4.4.244.tab2.txt" 9606 GI output/GI-human.npz output/GI-human-nodes.txt

python biogrid.py "data/biogrid/BIOGRID-ORGANISM-Saccharomyces_cerevisiae_S288c-4.4.244.tab2.txt" 559292 PPI output/PPI-yeast.npz output/PPI-yeast-nodes.txt

python biogrid.py "data/biogrid/BIOGRID-ORGANISM-Saccharomyces_cerevisiae_S288c-4.4.244.tab2.txt" 559292 GI output/GI-yeast.npz output/GI-yeast-nodes.txt


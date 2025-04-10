#!/usr/bin/env sh

python biogrid.py "data/biogrid/BIOGRID-ORGANISM-Homo_sapiens-4.4.244.tab2.txt" 9606 PPI output/PPI-Human.npz output/PPI-Human-nodes.txt

python biogrid.py "data/biogrid/BIOGRID-ORGANISM-Homo_sapiens-4.4.244.tab2.txt" 9606 GI output/GI-Human.npz output/GI-Human-nodes.txt

python biogrid.py "data/biogrid/BIOGRID-ORGANISM-Saccharomyces_cerevisiae_S288c-4.4.244.tab2.txt" 559292 PPI output/PPI-Yeast.npz output/PPI-Yeast-nodes.txt

python biogrid.py "data/biogrid/BIOGRID-ORGANISM-Saccharomyces_cerevisiae_S288c-4.4.244.tab2.txt" 559292 GI output/GI-Yeast.npz output/GI-Yeast-nodes.txt


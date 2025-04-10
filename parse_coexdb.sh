#!/usr/bin/env sh

# data: https://coxpresdb.jp/download/

python coexdb.py "data/coexdb/Sce-r.v21-11.G5718-S6225.combat_pca.subagging.ls.d/" 0.01 output/COEX-yeast-01.npz output/COEX-yeast-01-nodes.txt

python coexdb.py "data/coexdb/Sce-r.v21-11.G5718-S6225.combat_pca.subagging.ls.d/" 0.005 output/COEX-yeast-005.npz output/COEX-yeast-005-nodes.txt

python coexdb.py "data/coexdb/Sce-r.v21-11.G5718-S6225.combat_pca.subagging.ls.d/" 0.001 output/COEX-yeast-001.npz output/COEX-yeast-001-nodes.txt

python coexdb.py "data/coexdb/Hsa-r.v22-05.G16651-S235187.combat_pca.subagging.z.d/" 0.01 output/COEX-human-01.npz output/COEX-human-01-nodes.txt

python coexdb.py "data/coexdb/Hsa-r.v22-05.G16651-S235187.combat_pca.subagging.z.d/" 0.005 output/COEX-human-005.npz output/COEX-human-005-nodes.txt

python coexdb.py "data/coexdb/Hsa-r.v22-05.G16651-S235187.combat_pca.subagging.z.d/" 0.001 output/COEX-human-001.npz output/COEX-human-001-nodes.txt

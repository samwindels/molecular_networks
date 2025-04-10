#!/usr/bin/env sh

# data: https://coxpresdb.jp/download/

python coexdb.py "data/coexdb/Sce-r.v21-11.G5718-S6225.combat_pca.subagging.ls.d/" 0.01 output/COEX-Yeast-01.npz output/COEX-Yeast-01-nodes.txt

python coexdb.py "data/coexdb/Sce-r.v21-11.G5718-S6225.combat_pca.subagging.ls.d/" 0.005 output/COEX-Yeast-005.npz output/COEX-Yeast-005-nodes.txt

python coexdb.py "data/coexdb/Sce-r.v21-11.G5718-S6225.combat_pca.subagging.ls.d/" 0.001 output/COEX-Yeast-001.npz output/COEX-Yeast-001-nodes.txt

python coexdb.py "data/coexdb/Hsa-r.v22-05.G16651-S235187.combat_pca.subagging.z.d/" 0.01 output/COEX-Human-01.npz output/COEX-Human-01-nodes.txt

python coexdb.py "data/coexdb/Hsa-r.v22-05.G16651-S235187.combat_pca.subagging.z.d/" 0.005 output/COEX-Human-005.npz output/COEX-Human-005-nodes.txt

python coexdb.py "data/coexdb/Hsa-r.v22-05.G16651-S235187.combat_pca.subagging.z.d/" 0.001 output/COEX-Human-001.npz output/COEX-Human-001-nodes.txt

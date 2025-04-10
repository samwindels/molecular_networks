import pandas as pd
import os
import networkx as nx
import argparse


class CoexDB(object):

    """Parse coexpress db data dump"""

    def __init__(self, coexdb_rootdir):
        """TODO: to be defined1.

        :coexdb_filepath: (str). String pointing to the root -dir of the Coexdb
        data dump.

        """
        self._coexdb_rootdir = coexdb_rootdir
        self.genes = self._genes()

    def _genes(self):
        """Get all entrez ids

        :returns: list(str)

        """
        return os.listdir(self._coexdb_rootdir)

    def coexpressed(self, gene, threshold, genes_subset=None, legacy=False):
        """ For a given gene, get top x% coexpressed genes.

        :gene: (str). Entrez ID.
        :threshold: (float). Determines top number of genes to keep.
        :returns: list(str). List of top coexpressed gene IDs.

        legacy = version <=6
        """

        if legacy:
            df = pd.read_csv('{}{}{}'.format(self._coexdb_rootdir, '/', gene),
                             header=None, names=['Entrez ID', 'legacy column', 'value'], sep='\t',
                             dtype={'Entrez ID': 'str'})

            df = df.sort_values(by='value', ascending=False)

        else:
            df = pd.read_csv('{}{}{}'.format(self._coexdb_rootdir, '/', gene),
                             header=None, names=['Entrez ID', 'value'], sep='\t',
                             dtype={'Entrez ID': 'str'})

            df = df.sort_values(by='value', ascending=True)

        if len(df) != len(self.genes)-1:
            raise Warning('{} lines in file. Should match nr of genes: {}.'
                          .format(len(df), len(self.genes)))

        if genes_subset is not None:
            df = df.loc[df['Entrez ID'].isin(genes_subset)]

        nr_rows_to_keep = int(round(len(df)*threshold))
        return list(df.iloc[0:nr_rows_to_keep]['Entrez ID'])

    def get_network(self, threshold, genes_subset=None, legacy=False):

        G = nx.Graph()
        if genes_subset is None:
            genes_intersection = self.genes
        else:
            genes_intersection = list(
                set(genes_subset).intersection(self.genes))
            print(len(self.genes))
            print(genes_subset)
            print(genes_intersection)
        for i, gene in enumerate(genes_intersection):
            print(i+1, '/', len(genes_intersection))
            for coex_gene in self.coexpressed(gene, threshold, genes_intersection, legacy):
                if gene != coex_gene:
                    G.add_edge(gene, coex_gene)
        return G


def main():
    """Get CoExpression network at given threshold.
    """

    args = argparse.ArgumentParser(description="Parse CoExDB, write network")
    args.add_argument("--coexdb_root", help="path to coexdb root dir")
    args.add_argument("--threshold", help="threshold for coexpression",
                      type=float)
    args.add_argument("--output", help="the output file")
    args = args.parse_args()

    # coexdb_root = "Sce-r.v21-11.G5718-S6225.combat_pca.subagging.ls.d/"
    # coexdb_root = "Hsa-r.v22-05.G16651-S235187.combat_pca.subagging.z.d/"
    coexdb_root = args.coexdb_root
    threshold = args.threshold
    assert 0 <= threshold <= 1

    output = args.output

    coexdb = CoexDB(coexdb_root)
    G = coexdb.get_network(threshold, genes_subset=None)

    assert G.number_of_nodes() > 0
    assert G.number_of_edges() > 0
    assert nx.number_of_selfloops(G) == 0

    print("density:", nx.density(G))
    print("no. nodes:", G.number_of_nodes())
    print("no. edges:", G.number_of_edges())

    nx.write_edgelist(G, output)


if __name__ == "__main__":
    main()

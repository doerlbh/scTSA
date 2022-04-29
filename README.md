# scTSA


<img src="./img/tSNE_TDA_timepoints_c40.png" width="50%">


**Abstract**


The absence of a conventional association between the cell-cell cohabitation and its emergent dynamics into cliques during development has hindered our understanding of how cell populations proliferate, differentiate, and compete, i.e. the cell ecology. With the recent advancement of the single-cell RNA-sequencing (RNA-seq), we can potentially describe such a link by constructing network graphs that characterize the similarity of the gene expression profiles of the cell-specific transcriptional programs, and analyzing these graphs systematically using the summary statistics informed by the algebraic topology. We propose the single-cell topological simplicial analysis (scTSA). Applying this approach to the single-cell gene expression profiles from local networks of cells in different developmental stages with different outcomes reveals a previously unseen topology of cellular ecology. These networks contain an abundance of cliques of single-cell profiles bound into cavities that guide the emergence of more complicated habitation forms. We visualize these ecological patterns with topological simplicial architectures of these networks, compared with the null models. Benchmarked on the single-cell RNA-seq data of zebrafish embryogenesis spanning 38,731 cells, 25 cell types and 12 time steps, our approach highlights the gastrulation as the most critical stage, consistent with consensus in developmental biology. As a nonlinear, model-independent, and unsupervised framework, our approach can also be applied to tracing multi-scale cell lineage, identifying critical stages, or creating pseudo-time series.

<img src="./img/TDA_mds_timepoint_simplices_n100.png" width="50%">



## Info

Language: MATLAB, Java, Python3, bash

Platform: MacOS, Linux, Windows



## Citation

If you find this work helpful, please try the models out and cite our work. Thanks!

    @article{lin2022tda,
      title={Single-cell topological simplicial analysis reveals higher-order cellular complexity},
      author={Lin, Baihan},
      journal = {bioRxiv},
      year={2022},
      publisher={Cold Spring Harbor Laboratory}
    }


## Requirements

* Python 3, Java
* numpy and scikit-learn



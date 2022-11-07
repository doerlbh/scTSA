# scTSA

<img src="./img/tSNE_TDA_timepoints_c40.png" width="50%">

Single-Cell Topological Simplicial Analysis (scTSA) by [Baihan Lin](https://www.neuroinference.com/) (Columbia University)

Codes to our *Algorithms 2022* and *IEEE BIBM 2022* paper "Topological Data Analysis in Time Series: Temporal Filtration and Application to Single-Cell Genomics" [https://arxiv.org/abs/2204.14048](https://arxiv.org/abs/2204.14048)

**Abstract**

The absence of a conventional association between the cell–cell cohabitation and its emergent dynamics into cliques during development has hindered our understanding of how cell populations proliferate, differentiate, and compete (i.e., the cell ecology). With the recent advancement of single-cell RNA sequencing (RNA-seq), we can potentially describe such a link by constructing network graphs that characterize the similarity of the gene expression profiles of the cell-specific transcriptional programs and analyze these graphs systematically using the summary statistics given by the algebraic topology. We propose single-cell topological simplicial analysis (scTSA). Applying this approach to the single-cell gene expression profiles from local networks of cells in different developmental stages with different outcomes reveals a previously unseen topology of cellular ecology. These networks contain an abundance of cliques of single-cell profiles bound into cavities that guide the emergence of more complicated habitation forms. We visualize these ecological patterns with topological simplicial architectures of these networks, compared with the null models. Benchmarked on the single-cell RNA-seq data of zebrafish embryogenesis spanning 38,731 cells, 25 cell types, and 12 time steps, our approach highlights gastrulation as the most critical stage, consistent with the consensus in developmental biology. As a nonlinear, model-independent, and unsupervised framework, our approach can also be applied to tracing multi-scale cell lineage, identifying critical stages, or creating pseudo-time series.

<img src="./img/TDA_mds_timepoint_simplices_n100.png" width="50%">

## Info

Language: MATLAB, Java, Python3, bash

Platform: MacOS, Linux, Windows

## Citation

If you find this work helpful, please try the models out and cite our work. Thanks!

```
@article{lin2022topological,
  title={Topological Data Analysis in Time Series: Temporal Filtration and Application to Single-Cell Genomics},
  author={Lin, Baihan},
  journal={Algorithms},
  volume={15},
  year={2022},
  number={10},
  pages={371},
  doi={10.3390/a15100371},
  url={https://www.mdpi.com/1999-4893/15/10/371},
  issn = {1999-4893},
}

@inproceedings{lin2022single,
  title={Single-Cell Topological Simplicial Analysis Reveals Higher-Order Cellular Complexity},
  author={Lin, Baihan},
  booktitle={2022 IEEE International Conference on Bioinformatics and Biomedicine (BIBM)},
  year={2022},
  organization={IEEE}
}
```

## Requirements

* Python 3, Java
* numpy, scikit-learn, ripser, gudhi

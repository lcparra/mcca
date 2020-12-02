# Multi-set Cannonical Correlation Analysis

This matlab code implements Multi-Set Cannonical Correlation Analysis as explained in the first reference below. It does make a few additions to that simple approach described there. First, it adds regularization by reducing dimensions with PCA in each dataset. This is usefull if the data is noisy or ill-conditioned, i.e. you have lots of dimensions and not as many samples to estimate correlations reliably. Second, it computes the least-squares estimat of the inverse mapping from the CCA subspace back to the original data (called 'forward model' here). These additions are explained in the second reference. 


[Lucas C. Parra, "Multi-set Canonical Correlation Analysis simply explained", arXiv:1802.03759, Feb 11, 2018.](https://arxiv.org/abs/1802.03759).

[Lucas C. Parra, Stefan Haufe, Jacek P. Dmochowski, "Correlated Components Analysis --- Extracting Reliable Dimensions in Multivariate Data", Neurons, Behavior, Data Analysis and Theory (NBDT). arXiv:1801.08881. Jan 29, 2019.](https://nbdt.scholasticahq.com/article/7125-correlated-components-analysis-extracting-reliable-dimensions-in-multivariate-data) 




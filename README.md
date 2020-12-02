# Multi-set Cannonical Correlation Analysis

This matlab code implements Multi-Set Cannonical Correlation Analysis as explained in the first reference below. It does make a few additions to that simple approach described there. First, it adds regularization, which is usefull if the data is noisy or ill-conditioned, i.e. you have lots of dimensions and not as many samples to estimate correlation reliably. Second, it computes the inverse mapping from the CCA subspace back to the original dimensions of the data using least squares. These ideas are not explained in the MCCA, which is intended to provide a simple explanation. A better explanation can be found in the second reference. 


[Lucas C. Parra, "Multi-set Canonical Correlation Analysis simply explained", arXiv:1802.03759, Feb 11, 2018.](https://arxiv.org/abs/1802.03759).

[Lucas C. Parra, Stefan Haufe, Jacek P. Dmochowski, "Correlated Components Analysis --- Extracting Reliable Dimensions in Multivariate Data", Neurons, Behavior, Data Analysis and Theory (NBDT). arXiv:1801.08881. Jan 29, 2019.](https://nbdt.scholasticahq.com/article/7125-correlated-components-analysis-extracting-reliable-dimensions-in-multivariate-data) 




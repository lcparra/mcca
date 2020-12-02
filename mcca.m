function [V,rho,A,rhotest]=mcca(X,d,Xtest,k)
% [V,rho,A,rhotest]=mcca(X,d,Xtest,k) Multiset Canonical Correlation
% Analysis. X is the data arranged as samples by dimension, whereby all
% sets are concatenated along the dimensions. d is a vector with the
% dimensions of each set. V are the component vectors and rho the resulting
% inter-set correlations. A are the corresponding forward models, which
% are returned as a list of length N. If Xtest is given, it will also
% compute rho for the test data with the optimal V. If k is given then the
% within-set correlation will be reduced in dimension from d to k prior to
% inversion using PCA. This is useful for rank deficient data or for
% regularization. If k is not given, dimension is reduced to the rank of
% the data prior to inversion. 
% 
% See https://arxiv.org/abs/1802.03759, https://arxiv.org/abs/1801.08881

% Apr 30, 2018, Lucas Parra (c)
% Sep 11, 2018, removed hack for forward model computation that broke the code sometimes
% Sep 14, 2018, make forward model robust to ill conditioned data
% Sep 15, 2018, keep simpler code in case that there is no regularization or rank problem

if ~exist('k','var') || isempty(k), k=d; end

N=length(d);
R=cov(X);
for i=N:-1:1, j=(1:d(i))+sum(d(1:i-1)); 
    D(j,j)=R(j,j);
    k(i)=min(k(i),rank(D(j,j)));  % check rank for oblivious users
end
if sum(d)==sum(k) % simple case
    [V,lambda]=eig(R,D);
else  % if rank deficient, or if regularization requested
    for i=N:-1:1, j=(1:d(i))+sum(d(1:i-1)); Dinv(j,j)=regInv(D(j,j),k(i)); end
    [V,lambda]=eigs(Dinv*R,sum(k));
end  
rho = (diag(lambda)-1)/(N-1);
[~,indx]=sort(rho,'descend'); rho=rho(indx); V=V(:,indx);

% compute forward models
if nargout>2
    for i=N:-1:1, j=(1:d(i))+sum(d(1:i-1));
        W=V(j,1:k(i)); Rw=R(j,j);
        if k(i)==d(i), A{i}=Rw*W/(W'*Rw*W);        % original formula, but wont work for rank deficient Rw
        else A{i}=Rw*W*diag(1./diag(W'*Rw*W)); end % ignores correlation of components but robust to ill conditioned Rw
    end
end
    
% compute rho for test data
if exist('Xtest') && ~isempty(Xtest)
    R=cov(Xtest);
    for i=N:-1:1, j=(1:d(i))+sum(d(1:i-1)); D(j,j)=R(j,j); end
    lambda = diag(V'*R*V)./diag(V'*D*V);
    rhotest = (lambda-1)/(N-1);
end



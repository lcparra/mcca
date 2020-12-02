function invR = regInv(R, K)
%invR = regInv(R, K)
%   PCA regularized inverse of square symmetric positive definite matrix R
if nargin<2, K=size(R,1); end;
if ~ismatrix(R), error('JD: R must have two dimensions'); end;
if size(R,1)~=size(R,2), error('JD: R must be a square matrix'); end;

[U,S,V]=svd(R,0);
diagS=diag(S);
invR=U(:,1:K)*diag(1./diagS(1:K))*V(:,1:K).';

end


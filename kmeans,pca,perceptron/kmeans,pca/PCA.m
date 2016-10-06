function [Z,U,evals] = PCA(X,K)
  
% X is N*D input data, K is desired number of projection dimensions (assumed
% K<D).  Return values are the projected data Z, which should be N*K, U,
% the D*K projection matrix (the eigenvectors), and evals, which are the
% eigenvalues associated with the dimensions
  
[N,D] = size(X);

if K > D,
  error('PCA: you are trying to *increase* the dimension!');
end;

% first, we have to center the data
    data_mean=ones(1,D);
    data_mean=mean(X);
    temp=ones(N,D);
    temp=ones(N,1)*data_mean;
    X=X-temp;
%TODO

% next, compute the covariance matrix C of the data
S=ones(D,D);
S=(1/N)*(X'*X);
%TODO

% compute the top K eigenvalues and eigenvectors of C... 
% hint: you may use 'eigs' built-in function of MATLAB
[U,evals]=eigs(S,K);
evals=diag(evals);
%TODO
%evals=ones(K,1);
%evals=eigs(S,k);

% project the data

Z = X*U;

% You are only suppose to complete the "TODO" parts and the code should run
% if these parts are correctly implemented
clear all;close all;
load('mnist_big.mat');
[N D] = size(X_train);
Y_train = Y_train + 1;
Y_test = Y_test + 1;
W = randn(D,max(Y_train));
b = randn(1,max(Y_train));
W_avg = W;
b_avg = b;
k = 0; % number of mistakes (i.e., number of updates)
y_test_pred=zeros(10000,1);

% Just do a single pass over the training data (our stopping condition will
% simply be this)
for n=1:N
    % TODO: predict the label for the n-th training example
    % as y_pred = argmax W'x_n + b
    [random,y_pred]=max(X_train(n,:)*W + b);
    if y_pred ~= Y_train(n)
        k = k + 1;
        % TODO: Update W, b
        W(:,Y_train(n))= W(:,Y_train(n))+X_train(n,:)';
        W(:,y_pred)= W(:,y_pred)-X_train(n,:)';
        b(Y_train(n))=b(Y_train(n))+1 ;
        b(y_pred)=b(y_pred) - 1;
        % TODO: Update W_avg, b_avg using Ruppert Polyak Averaging
        % Important: You don't need to store all the previous W's and b's
        % to compute W_avg, b_avg
        W_avg= (k*W_avg+W)/(k+1); 
        b_avg= (k*b_avg+b)/(k+1);
        % TODO: Predict test labels using W, b
        b_rpt=repmat(b,10000,1);
        y_helper = X_test*W + b_rpt;
        [temp1,y_test_pred]= max(y_helper,[],2);
        
        acc(k) = mean(Y_test==y_test_pred);   % test accuracy     
        
        % TODO: Now predict test labels using W_avg, b_avg
        b_rpt_avg=repmat(b_avg,10000,1);
        y_helper_avg = X_test*W_avg + b_rpt_avg;
        [temp2,y_test_pred]= max(y_helper_avg,[],2);
        
        
        acc_avg(k) = mean(Y_test==y_test_pred); % test accuracy with R-P averaging
        
        fprintf('Update number %d, accuracy = %f, accuracy (with R-P averaging) = %f\n',k,acc(k),acc_avg(k));
               
    end
end
       plot(1:k,acc(1:k),'r');
        hold on;
        plot(1:k,acc_avg(1:k),'g');
        drawnow;  
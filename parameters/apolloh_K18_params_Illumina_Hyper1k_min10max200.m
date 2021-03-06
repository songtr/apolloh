%%%%%%%%%%%%%%% for cn=5 %%%%%%%%%%%%%%%%%%%
% alphaHyperS and betaHyperS are Beta hyperparameters for stromal parameter
% in general, higher alpha means higher stromal contamination; 
% higher beta means higher tumour content
%alphaHyperS = 90; betaHyperS = 10; % low cellularity
%alphaHyperS = 70; betaHyperS = 30; % low-moderate cellularity
%alphaHyperS = 50; betaHyperS = 50; % moderate cellularity
%alphaHyperS = 30; betaHyperS = 70; % moderate-high cellularity
alphaHyperS = 1000; betaHyperS = 9000; % high cellularity
estimateS = 0;
% order = [aa,ab,bb,aaa,aab,abb,bbb,aaaa,aaab,aabb,abbb,bbbb,aaaaa,aaaab,aaabb,aabbb,abbbb,bbbbb]
%% Data without allelic skew
% rn is theoretical normal reference allelic ratio
rn = 0.5;
% alpha and beta hyperparameters for Beta prior on Binomial means;
% initialize to theoretical values
maxHyper = 1000
alphaHyperR = [1000, 500, 2,...     %aa,ab,bb
    1000, 650, 350, 2,...           %aaa,aab,abb,bbb
    1000, 750, 500, 250, 2,...      %aaaa,aaab,aabb,abbb,bbbb
    1000, 800, 600, 400, 200, 2];   %aaaaa,aaaab,aaabb,aabbb,abbbb,bbbbb

%% Data with reference allelic skew (SOLiD)
%refSkew = 0.1;
%rn = rn + refSkew;
%alphaHyperR = alphaHyperR*(refSkew+1);
%alphaHyperR(alphaHyperR > maxHyper) = maxHyper;

betaHyperR = max(alphaHyperR) - alphaHyperR; 
betaHyperR(betaHyperR < 2) = 2;

% kappaHyper is Dirichlet hyperparameter for initial state distribution
kappaHyper = [1, 10, 1, 1, 5, 5, 1, 1, 2, 5, 2, 1, 1, 2, 5, 5, 2, 1]*100;

%%%%%%%%%%%%%%% other parameters %%%%%%%%%%%%%%%%%%%
mirror = 0; % do not transform read counts to symmetric reference counts
minDepth = 10;
maxDepth = 200;
txnExpLen = 100000000*100; %100Mb expected length
maxiter = 100;

save apolloh_K18_params_Illumina_Hyper1k_min10max200.mat

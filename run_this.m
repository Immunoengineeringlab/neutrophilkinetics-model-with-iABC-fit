%% clearing the workspace
clear all; clc; close all; warning off; format shortG;

%% options for the simulations

% number of iterations the estimation refinement occurs: k (SI SM1)
n_nest = 12;

% number of parameters sampled at every iteration: V (SI SM1)
n_rlz = 1e6;

% number of parameter combinations with lowest chi_sq values used to
% estimate the parameter value distribution at each iteration: M (SI SM1)
cut_off = max(floor(0.025*n_rlz), 25);

% number of bins in which the parameter value range is divided to define
% the distribution
n_bins = 50;

% strength of uniform noise to be added: to increase the robustness of
% fitting algorithm
alpha = 0.25;

% related information being repeatedly used in various functions
indexing;
%% fitting and analysis

group_ind = 1;
% corresponds to saline (multiple treatment groups can be added and indexed for ease
% of working. But as an example in this code, only saline is included.)

% displaying the current analysis
disp(['Fitting: ', Group{1, group_ind}]);

% fitting engine
iABC_mice(group_ind, n_rlz, cut_off, n_nest, n_bins, alpha);


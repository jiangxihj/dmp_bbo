addpath dynamicmovementprimitive
addpath(genpath('evolutionaryoptimization/'))
addpath(genpath('tasks/'))

% Get the task to be optimized

% A very simple 1-D DMP viapoint task
task = task_viapoint;
% The JMLR style n-DOF kinmatically simulated arm task
%n_dofs = 2;
%arm_length = 1;
%task = task_multidofviapoint(n_dofs,arm_length);

% Initial covariance matrix for exploration 
covar_init = 5*eye(size(task.theta_init,2));

% Number of updates, roll-outs per update, weighting method, and covariance
% update method
n_updates = 100;
K = 15;
weighting_method = 2; % 1=CEM, 2=CMAES, 3=PI2
eliteness = ceil(K/2);
%weighting_method = 3; eliteness = 10; % PI2 style weighting
covar_update = 0.99; %#ok<NASGU> % Set 0 < covar_update < 1 to decay exploration over time
covar_bounds = []; % No bounds
%covar_update = 2;    % Reward-weighted averaging update of covar
if (covar_update>=1)
  % For covariance matrix updating with RWA, a lower bound on the
  % eigenvalues is recommended to avoid premature convergence
  covar_bounds = [0.1]; %#ok<NBRAK> % 0.05 10]; %#ok<NBRAK> % Lower/upper bounds on covariance matrix
end

clf
evolutionaryoptimization(task,task.theta_init,covar_init,n_updates,K,eliteness,weighting_method,covar_update)




% NEXT STUFF IS WORK IN PROGRESS
% This is just to get the basis function activations
%[trajectory_dummy activations] = dmpintegrate(task.y0,task.g,task.theta_init,task.time,task.dt,task.time_exec);

%plot(activations)


%pol_pars.dt = pol_pars.duration/pol_pars.duration_ticks;
%[y yd ydd bases]  = integrate_dmp(pol_pars,pol_pars.mean);
%
%pol_pars.max_activation = max(abs(squeeze(bases(1,:,:))),[],2)';
%normalized_max_activation = pol_pars.max_activation/max(pol_pars.max_activation);
%pol_pars.max_activation = normalized_max_activation;
%
%for bb=1:length(pol_pars.max_activation)
%  pol_pars.covar(:,bb,bb) =  pol_pars.covar(:,bb,bb)/normalized_max_activation(bb);
%end

%return

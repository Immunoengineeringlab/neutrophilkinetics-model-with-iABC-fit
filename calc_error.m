function err_vec = calc_error(parameter_matrix)

    % % function inputs
    % parameter_matrix: matrix of sampled parameter combinations
    
    % n_rlz: number of parameter combination samples to be analyzed
    n_rlz = size(parameter_matrix, 1);
    
    err_vec = zeros(n_rlz, 1);
    
    parfor iter = 1:n_rlz
        prm_arr = parameter_matrix(iter, :);
        prm = prm_arr';
        
        if mod(iter-1, n_rlz/4)==0
            disp([num2str(100*(iter-1)/n_rlz), '% of current iteration completed']);
            % display completion status
        end
        
        % evaluating error between prediction and data for each parameter
        % combination for (1) HCV, (2) JEV or (3)PV.
            WSSE = Error_file(prm);
        
        err_vec(iter, :) = WSSE;
    end    
end
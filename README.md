MATLAB codes to fit the percentage neutrophil data, from various compartments at different timepoints, using iABC algorithm.

Model equations are coded in the file “marrowwithdelay.m”


iABC_mice: iABC algorithm to iteratively improve parameter value
distribution estimate.

posterior: converts the parameter occurrence into a distribution function

prm_rlz: generating random samples according to any given distribution.
Sampling based on Latin Hyper cube algorithm.


indexing: contains the name of the group (e.g. Saline, chitosan, alginate)

initial guess: input the lower and upper bounds for parameter values

#### Data specific

calc_error: used to pass current parameter combinations to “Error_file”

### File to run - users need to specify iABC options

run_this: executes the iABC_mice by passing iABC algorithm options. 

Experimental data used for the optimization is in the “Error_file” (see line 6).


To run the example(saline): Run “run_this.m” file with other supporting functions in the same directory. And use the data from the workspace to plot the distributions or curves as needed. 

### Plotting scripts
scripts used to generate the plots as shown in the paper is included in "histogramstack_plotter.m"(for generating histograms) and "familyofcurves_plotter.m"(to generate family of curves with experimental data overlayed). To get figures exactly like in the paper, manually edit the aesthetics, in the matlab plot window using "inspect element" option. 

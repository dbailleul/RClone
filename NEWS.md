# RClone v1.0.2 (05/31/2016)

## Minor fixes

- units tests on GenClone function are suspended because they make crash Travis due to too long computing time.

# RClone v1.0.2 (04/15/2016)

## Minor fixes

- *psex* and *psex_Fis* functions are corrected (thanks to Katia C.) ;  
Found a bug with pvalues generation with more than 9 loci: *sample* systematically re-orders loci then prevents *pgen* computation.  
Found a bug with warning message "No clone was found during Simulations" that stops the function.  
*psex.rd* file updated.

- typo correction on author email.


# RClone v1.0.1 (01/11/2016)

## Minor changes

- *factoR* data for *psex*/*psex_Fis* is removed from package (now works with dbinom(), thanks to reviewer) ;

- unit tests added for nearly every function (recommended by reviewers) ;

- Travis added ;

- email correction for better users service.

## Minor fixes

- DESCRIPTION file: the package url was linked to dropbox and now to Github ;

- *psex.rd* file: the old *pvalue* option was removed (thanks to reviewer) ;

- *export_genclone.rd* file: res$loc.nall was removed (thanks to reviewer) and updated ;

- *freq_finder* function (hidden function) was updated.


# RClone v1.0.1 (11/27/2015)

## Bug fixes

*psex* and *psex_Fis* functions now work with just ONE clone.


# RClone v1.0.1 (11/24/2015)

## Minor changes

- *genclone* function now named *GenClone* function to avoid problems with *genclone* objects ;

- *GenClone* function now allowed missing coordinates ;

- *GenClone* function now computes Fis with monomorphic loci.

## Minor fixes

- export_genclone.Rd fixed (Adegenet instead of Adegnet) ;

- clonal_index function now integrates N as first column and indicates N, G and R even if no clone are detected ;

- vignettes are corrected with improvements.

## Bug fixes

*nbrepeat* in *autocorrelation* function now works with few number of repeats (< 10).



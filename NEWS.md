# RClone v1.0.1 (01/11/2016)

## Minor changes

- *factoR* data for *psex*/*psex_Fis* is removed from package (now works with dbinom(), thanks to reviewer) ;

- unit tests added for nearly every function (recommended by reviewers).

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



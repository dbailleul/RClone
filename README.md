# RClone v1.0.1

*RClone* is a R package version of *GenClone* program: to analyse data (SSR, SNP, ...), test for clonality and describe spatial clonal organisation.

*RClone* allows:

1. Description of data set  
* discrimination of MLG (MultiLocus Genotypes);  
* test for reliability of data (in terms of loci and sampling).  
2. Determination of MLL (MultiLocus Lineages)  
* psex/psex Fis with pvalue computation;  
* genetic distance matrix computation and threshold definition.  
3. Genotypic diversity and evenness indices calculation  
* Simpson complement;  
* Shannon-Wiener diversity and evenness indices;  
* Hill's Simpson reciprocal;
* Pareto index.  
4. Spatial organisation of MLG/MLL  
* spatial autocorrelation methods;  
* clonal subrange estimation;  
* Aggregation index and Edge Effect estimation.  

Some of these analysis can be applied to dataset without clones. 

## Installation

Get the released version from CRAN:

    install.packages("RClone")

Or the development version from github:

    #install.packages("devtools")
    devtools::install_github("dbailleul/RClone")

And then, generate manuals:

    vignette("RClone_quickmanual") #analysing one population
    vignette("RClone_qmsevpops") #analysing several populations

\name{resvigncont}
\alias{resvigncont}
\alias{resvigncont2}
\docType{data}

\title{
Results contained in vignette Quick Manual
}

\description{
This file contains data to fast generate the vignette: RClone_quickmanual.
}

\usage{data("resvigncont")}

\format{
  The format is:
List of 14
 $ resee   :List of 2
  ..$ results    :'data.frame':	1 obs. of  3 variables:
  .. ..$ Ee      : num 0.0779
  .. ..$ pval_Ee : num 0.434
  .. ..$ nbrepeat: num 1000
  ..$ simulations: num [1:1000] 0.0316 -0.1692 -0.1411 -0.1172 -0.1289 ...
 $ resgen  :'data.frame':	1 obs. of  24 variables:
  ..$ N           :List of 1
  .. ..$ : int 40
  ..$ Lineage     :List of 1
  .. ..$ : chr "MLG"
  ..$ nb_L        :List of 1
  .. ..$ : int 28
  ..$ nb_all      :List of 1
  .. ..$ : num 4.14
  ..$ SE          :List of 1
  .. ..$ : num 0.769
  ..$ Fis         :List of 1
  .. ..$ : num 0.0508
  ..$ pval_2sides :List of 1
  .. ..$ : logi NA
  ..$ Fis_WR      :List of 1
  .. ..$ : num 0.0257
  ..$ pval_2sides :List of 1
  .. ..$ : logi NA
  ..$ R           :List of 1
  .. ..$ : num 0.692
  ..$ Pareto_index:List of 1
  .. ..$ : num 1.18
  ..$ Sp_Loiselle :List of 1
  .. ..$ : num 0.00123
  ..$ pval_2sides :List of 1
  .. ..$ : num NA
  ..$ Sp_L_WR     :List of 1
  .. ..$ : num 0.00124
  ..$ pval_2sides :List of 1
  .. ..$ : num NA
  ..$ Sp_Ritland  :List of 1
  .. ..$ : num 0.000769
  ..$ pval_2sides :List of 1
  .. ..$ : num NA
  ..$ Sp_R_WR     :List of 1
  .. ..$ : num 0.000803
  ..$ pval_2sides :List of 1
  .. ..$ : num NA
  ..$ H''         :List of 1
  .. ..$ : num 3.15
  ..$ J'          :List of 1
  .. ..$ : num 0.945
  ..$ D           :List of 1
  .. ..$ : num 0.971
  ..$ V           :List of 1
  .. ..$ : num 0.792
  ..$ Hill        :List of 1
  .. ..$ : num 33.9
 $ resagg  :List of 2
  ..$ results   : num [1, 1:3] 0.227 0 1000
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : NULL
  .. .. ..$ : chr [1:3] "Ac" "pval" "nbrepeat"
  ..$ simulation: num [1:1000] 0.034 0.034 0.034 0.034 0.034 ...
 $ rescs   :List of 2
  ..$               : num 11.7
  ..$ clonal_sub_tab:List of 60
  .. ..$ : int 97
  .. ..$ : int 157
  .. ..$ : int 119
  .. ..$ : int 110
  .. ..$ : int 121
  .. ..$ : int 64
  .. ..$ : int 34
  .. ..$ : int 29
  .. ..$ : int 31
  .. ..$ : int 18
  .. ..$ : num 0.5
  .. ..$ : num 7.62
  .. ..$ : num 15.2
  .. ..$ : num 22.9
  .. ..$ : num 30.5
  .. ..$ : num 38
  .. ..$ : num 46.1
  .. ..$ : num 53.5
  .. ..$ : num 61
  .. ..$ : num 68.5
  .. ..$ : num 7.52
  .. ..$ : num 15.2
  .. ..$ : num 22.8
  .. ..$ : num 30.4
  .. ..$ : num 38
  .. ..$ : num 45.6
  .. ..$ : num 53.1
  .. ..$ : num 60.7
  .. ..$ : num 68
  .. ..$ : num 76
  .. ..$ : num 4.68
  .. ..$ : num 11.1
  .. ..$ : num 18.8
  .. ..$ : num 26.6
  .. ..$ : num 34.2
  .. ..$ : num 41.5
  .. ..$ : num 49.6
  .. ..$ : num 57.1
  .. ..$ : num 64.7
  .. ..$ : num 70.9
  .. ..$ : num 0.165
  .. ..$ : num 0.0446
  .. ..$ : num 0
  .. ..$ : num 0
  .. ..$ : num 0
  .. ..$ : num 0
  .. ..$ : num 0
  .. ..$ : num 0
  .. ..$ : num 0
  .. ..$ : num 0
  .. ..$ : num -0.783
  .. ..$ : num -1.35
  .. ..$ : num -Inf
  .. ..$ : num -Inf
  .. ..$ : num -Inf
  .. ..$ : num -Inf
  .. ..$ : num -Inf
  .. ..$ : num -Inf
  .. ..$ : num -Inf
  .. ..$ : num -Inf
  .. ..- attr(*, "dim")= int [1:2] 10 6
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:10] "1" "2" "3" "4" ...
  .. .. ..$ : chr [1:6] "nb_pairs" "dist_min" "dist_max" "dist_mean" ...
 $ resauto :List of 7
  ..$ Main_results          :'data.frame':	10 obs. of  7 variables:
  .. ..$ dist_min     : num [1:10] 0.5 7.62 15.24 22.94 30.5 ...
  .. ..$ dist_max     : num [1:10] 7.52 15.21 22.8 30.41 38 ...
  .. ..$ dist_mean    : num [1:10] 4.68 11.15 18.81 26.65 34.21 ...
  .. ..$ ln(dist_mean): num [1:10] 1.54 2.41 2.93 3.28 3.53 ...
  .. ..$ nb_pairs     : num [1:10] 97 157 119 110 121 64 34 29 31 18
  .. ..$ mean_Ritland : num [1:10] 0.0892 0.0296 -0.0224 -0.0532 -0.0736 ...
  .. ..$ pval_kin     : num [1:10] 0 0 0.39 0 0 0 0.144 0.154 0.8 0.106
  ..$ Slope_and_Sp_index    :'data.frame':	10 obs. of  4 variables:
  .. ..$ b     : num [1:10] -7.01e-04 1.96e-06 2.75e-04 -6.25e-04 4.65e-04 ...
  .. ..$ b_log : num [1:10] -3.58e-02 3.47e-05 6.30e-03 -1.42e-02 1.01e-02 ...
  .. ..$ Sp    : num [1:10] 7.69e-04 -7.63e-07 2.73e-04 -4.58e-04 6.18e-04 ...
  .. ..$ Sp_log: num [1:10] 3.93e-02 9.75e-06 6.24e-03 -9.86e-03 1.41e-02 ...
  ..$ Slope_resample        :'data.frame':	1000 obs. of  4 variables:
  .. ..$ b     : num [1:1000] 8.95e-05 9.99e-05 1.64e-04 1.23e-04 1.53e-04 ...
  .. ..$ b_log : num [1:1000] 0.004679 0.000447 0.000649 0.004408 0.003708 ...
  .. ..$ Sp    : num [1:1000] -8.65e-05 -9.98e-05 -1.65e-04 -1.19e-04 -1.50e-04 ...
  .. ..$ Sp_log: num [1:1000] -0.004524 -0.000446 -0.000653 -0.004292 -0.003647 ...
  ..$ Kinship_resample      : num [1:1000, 1:10] -0.03434 -0.00168 0.00721 -0.02697 -0.01677 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : NULL
  .. .. ..$ : chr [1:10] "class_1" "class_2" "class_3" "class_4" ...
  ..$ Matrix_kinship_results:Class 'dist'  atomic [1:780] -0.16518 -0.00174 -0.00174 -0.00174 -0.00174 ...
  .. .. ..- attr(*, "Labels")= chr [1:40] "1" "2" "3" "4" ...
  .. .. ..- attr(*, "Size")= int 40
  .. .. ..- attr(*, "call")= language as.dist.default(m = mat_auto)
  .. .. ..- attr(*, "Diag")= logi FALSE
  .. .. ..- attr(*, "Upper")= logi FALSE
  ..$ Class_kinship_results :List of 10
  .. ..$ : num [1:97] -0.16518 -0.00174 -0.00174 -0.00174 -0.03193 ...
  .. ..$ : num [1:157] -0.00174 -0.00174 -0.02292 -0.08243 -0.15206 ...
  .. ..$ : num [1:119] -0.0455 -0.0921 -0.0455 -0.0455 0.036 ...
  .. ..$ : num [1:110] -0.0455 -0.1553 -0.1433 -0.047 -0.1513 ...
  .. ..$ : num [1:121] -0.143 -0.143 -0.114 0.301 -0.181 ...
  .. ..$ : num [1:64] -0.0918 -0.1236 -0.1236 -0.1024 -0.1236 ...
  .. ..$ : num [1:34] -0.08461 0.10111 0.1034 -0.00678 0.05459 ...
  .. ..$ : num [1:29] -0.00693 -0.00693 -0.00693 -0.00693 -0.00693 ...
  .. ..$ : num [1:31] 0.3935 -0.0646 -0.1289 -0.0656 -0.0825 ...
  .. ..$ : num [1:18] 0.00503 0.26968 0.00414 -0.02171 -0.04514 ...
  ..$ Class_distance_results:List of 10
  .. ..$ : num [1:97] 2 5.7 7.11 5.15 4.74 ...
  .. ..$ : num [1:157] 8.06 8.28 9.96 8.08 13.73 ...
  .. ..$ : num [1:119] 15.4 15.9 17.4 18.7 19.6 ...
  .. ..$ : num [1:110] 24.5 26.1 26.9 24.1 24.9 ...
  .. ..$ : num [1:121] 31.3 31.5 34.5 31.8 32.5 ...
  .. ..$ : num [1:64] 38.5 38.1 38.5 39.5 39.5 ...
  .. ..$ : num [1:34] 47.4 47.6 52 50 48.9 ...
  .. ..$ : num [1:29] 60.6 60.7 59.8 58.7 56.5 ...
  .. ..$ : num [1:31] 63.4 66 61.4 64.1 68 ...
  .. ..$ : num [1:18] 70 70.8 70.5 73.1 76 ...
 $ rescl   :'data.frame':	1 obs. of  7 variables:
  ..$ G   : num 28
  ..$ R   : num 0.692
  ..$ H'' : num 3.15
  ..$ J'  : num 0.945
  ..$ D   : num 0.971
  ..$ V   : num 0.792
  ..$ Hill: num 33.9
 $ ressimWS:List of 1
  ..$ distance_matrix:Class 'dist'  atomic [1:499500] 59 126 71 59 63 120 119 164 105 80 ...
  .. .. ..- attr(*, "Labels")= chr [1:1000] "1" "2" "3" "4" ...
  .. .. ..- attr(*, "Size")= int 1000
  .. .. ..- attr(*, "call")= language as.dist.default(m = dist_all)
  .. .. ..- attr(*, "Diag")= logi FALSE
  .. .. ..- attr(*, "Upper")= logi FALSE
 $ ressim  :List of 1
  ..$ distance_matrix:Class 'dist'  atomic [1:499500] 143 98 138 93 106 98 106 113 109 102 ...
  .. .. ..- attr(*, "Labels")= chr [1:1000] "1" "2" "3" "4" ...
  .. .. ..- attr(*, "Size")= int 1000
  .. .. ..- attr(*, "call")= language as.dist.default(m = dist_all)
  .. .. ..- attr(*, "Diag")= logi FALSE
  .. .. ..- attr(*, "Upper")= logi FALSE
 $ respop  :List of 1
  ..$ distance_matrix:Class 'dist'  atomic [1:153] 173 178 2 173 178 1 1 84 133 100 ...
  .. .. ..- attr(*, "Labels")= chr [1:18] "1" "2" "3" "4" ...
  .. .. ..- attr(*, "Size")= int 18
  .. .. ..- attr(*, "call")= language as.dist.default(m = dist_all)
  .. .. ..- attr(*, "Diag")= logi FALSE
  .. .. ..- attr(*, "Upper")= logi FALSE
 $ res_PS4 :'data.frame':	6 obs. of  4 variables:
  ..$ pgenFis: num [1:6] 1.05e-05 1.09e-10 4.39e-05 4.39e-05 4.39e-05 ...
  ..$ genet  : chr [1:6] "" "" "" "3" ...
  ..$ psexFis: chr [1:6] "" "" "" "0.00175402908240928" ...
  ..$ pvalue : chr [1:6] "" "" "" "0.258064516129032" ...
 $ res_PS3 :List of 2
  ..$ :'data.frame':	40 obs. of  3 variables:
  .. ..$ genet  : chr [1:40] "" "" "" "3" ...
  .. ..$ psexFis: chr [1:40] "" "" "" "0.00175402908240928" ...
  .. ..$ pvalue : chr [1:40] "" "" "" "0.258064516129032" ...
  ..$ : num [1:31] 0.004048 0.00316 0.009211 0.000587 0.007884 ...
 $ res_PS2 :'data.frame':	6 obs. of  4 variables:
  ..$ pgen  : num [1:6] 2.19e-06 2.04e-10 4.77e-05 4.77e-05 4.77e-05 ...
  ..$ genet : chr [1:6] "" "" "" "3" ...
  ..$ psex  : chr [1:6] "" "" "" "0.00190284159898287" ...
  ..$ pvalue: chr [1:6] "" "" "" "0.392857142857143" ...
 $ res_PS1 :List of 2
  ..$ :'data.frame':	40 obs. of  3 variables:
  .. ..$ genet : chr [1:40] "" "" "" "3" ...
  .. ..$ psex  : chr [1:40] "" "" "" "0.00190284159898287" ...
  .. ..$ pvalue: chr [1:40] "" "" "" "0.392857142857143" ...
  ..$ : num [1:28] 0.00268 0.00135 0.0034 0.00154 0.0043 ...
 $ res_SU1 :List of 5
  ..$ res_MLG    :'data.frame':	7 obs. of  5 variables:
  .. ..$ nb_loci : int [1:7] 1 2 3 4 5 6 7
  .. ..$ min     : int [1:7] 3 7 11 19 22 25 28
  .. ..$ max     : int [1:7] 13 21 26 27 28 28 28
  .. ..$ mean_MLG: num [1:7] 6.26 14.27 20.14 23.57 25.44 ...
  .. ..$ SE      : num [1:7] 0.1047 0.1362 0.0966 0.0618 0.046 ...
  ..$ res_alleles:'data.frame':	7 obs. of  7 variables:
  .. ..$ nb_loci : int [1:7] 1 2 3 4 5 6 7
  .. ..$ min     : int [1:7] 2 5 8 11 15 22 29
  .. ..$ max     : int [1:7] 7 14 18 21 24 27 29
  .. ..$ mean_all: num [1:7] 4.09 8.33 12.42 16.53 20.7 ...
  .. ..$ SE      : num [1:7] NA 132.3 88.3 70.2 60.7 ...
  .. ..$ He      : num [1:7] 0.549 0.549 0.55 0.55 0.55 ...
  .. ..$ SE      : num [1:7] NA 1.217 0.803 0.646 0.552 ...
  ..$ raw_He     :'data.frame':	1000 obs. of  7 variables:
  .. ..$ 1_locus: num [1:1000] 0.531 0.38 0.488 0.488 0.657 ...
  .. ..$ 2_loci : num [1:1000] 0.621 0.771 0.459 0.519 0.509 ...
  .. ..$ 3_loci : num [1:1000] 0.483 0.691 0.677 0.558 0.658 ...
  .. ..$ 4_loci : num [1:1000] 0.517 0.616 0.613 0.559 0.616 ...
  .. ..$ 5_loci : num [1:1000] 0.538 0.523 0.588 0.517 0.538 ...
  .. ..$ 6_loci : num [1:1000] 0.534 0.534 0.512 0.6 0.534 ...
  .. ..$ 7_loci : num [1:1000] 0.551 0.551 0.551 0.551 0.551 ...
  ..$ raw_MLG    :'data.frame':	1000 obs. of  7 variables:
  .. ..$ 1_locus: int [1:1000] 4 3 6 6 6 6 9 6 6 3 ...
  .. ..$ 2_loci : int [1:1000] 19 20 12 12 13 12 21 14 17 19 ...
  .. ..$ 3_loci : int [1:1000] 18 21 23 24 24 19 18 20 18 20 ...
  .. ..$ 4_loci : int [1:1000] 24 25 21 26 25 23 26 20 21 26 ...
  .. ..$ 5_loci : int [1:1000] 26 27 24 26 26 25 24 27 26 25 ...
  .. ..$ 6_loci : int [1:1000] 25 25 26 27 25 27 28 28 28 26 ...
  .. ..$ 7_loci : int [1:1000] 28 28 28 28 28 28 28 28 28 28 ...
  ..$ raw_all    :'data.frame':	1000 obs. of  7 variables:
  .. ..$ 1_locus: int [1:1000] 4 2 3 3 3 3 7 3 3 2 ...
  .. ..$ 2_loci : int [1:1000] 10 14 6 5 7 5 10 6 9 10 ...
  .. ..$ 3_loci : int [1:1000] 10 18 17 13 14 8 8 9 9 14 ...
  .. ..$ 4_loci : int [1:1000] 17 17 20 17 17 12 17 16 19 17 ...
  .. ..$ 5_loci : int [1:1000] 20 19 23 19 20 24 23 24 19 18 ...
  .. ..$ 6_loci : int [1:1000] 26 26 22 26 26 26 26 27 27 22 ...
  .. ..$ 7_loci : int [1:1000] 29 29 29 29 29 29 29 29 29 29 ...
}

\author{
The R implementation of \command{RClone} was written by Diane Bailleul working for Sophie Arnaud-Haond at IFREMER.


The design was inspired by GenClone program described in Arnaud-Haond & Belkhir (2007).


Maintainer: Diane Bailleul <diane.bailleul.pro@gmail.com>


Author: Sophie Arnaud-Haond <sohie.arnaud@ifremer.fr>
}

\examples{
#v1 <- vignette("RClone_quickmanual")
#print(v1)
}
\keyword{datasets}

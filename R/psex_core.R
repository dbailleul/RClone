#####################################################
#probability of one genotype with repro events: psex#
#####################################################

#core function of psex computation


psex_core <- function (data1, data2, haploid = FALSE, MLGsim = FALSE, nbrepeat = NULL, bar = FALSE){
    if (nrow(data1) == nrow(unique(data1))) {
        print("Warning: no repeated genotype in this population.")
        psexFR <- NULL
    }
    else {
        list_genet <- MLG_list(data1)
        ncol_all <- 2
        ncol_freq <- 3
        res_pgen <- pgen_core(data1, data2, haploid)
        tab <- as.data.frame(matrix(NA, ncol = 2, nrow = nrow(data1)))
        if (length(list_genet[which(sapply(list_genet, length) > 
            1)]) >= 1) {
            if (MLGsim) {
                for (m in 1:length(list_genet[which(sapply(list_genet, 
                  length) > 1)])) {
                  recup <- NULL
                  sub_list <- list_genet[which(sapply(list_genet, 
                    length) > 1)][[m]]
                  l <- sub_list[1]
                  recup <- c(recup, dbinom(length(sub_list), 
                    nrow(data1), res_pgen[l, ]))
                  tab[list_genet[which(sapply(list_genet, length) > 
                    1)][[m]], 2] <- recup
                  tab[list_genet[which(sapply(list_genet, length) > 
                    1)][[m]], 1] <- list_genet[which(sapply(list_genet, 
                    length) > 1)][[m]][1]
                }
            }
            else {
                for (m in 1:length(list_genet[which(sapply(list_genet, 
                  length) > 1)])) {
                  recup <- NULL
                  for (l in list_genet[which(sapply(list_genet, 
                    length) > 1)][[m]][-1]) {
                    recup <- c(recup, dbinom(which(list_genet[which(sapply(list_genet, 
                      length) > 1)][[m]][-1] == l), nrow(data1), 
                      res_pgen[l, ]))
                  }
                  tab[list_genet[which(sapply(list_genet, length) > 
                    1)][[m]][-1], 2] <- recup
                  tab[list_genet[which(sapply(list_genet, length) > 
                    1)][[m]][-1], 1] <- list_genet[which(sapply(list_genet, 
                    length) > 1)][[m]][1]
                }
            }
            names(tab) <- c("genet", "psex")
            psexFR <- tab
            if (length(nbrepeat) != 0) {
                psex_recup <- NULL
                nb_loci <- ncol(data1)/2
                index_l <- 1:c(ncol(data1)/2) * 2 - 1
                N <- nrow(data1)
                if (bar) {
                  total <- nbrepeat
                  pb <- txtProgressBar(min = 0, max = total, 
                    style = 3)
                }
				liste_all <- c(rep(1:length(unique(data2[, 1])), 
					times = table(data2[, 1])[unique(data2[, 1])]))
                for (s in 1:nbrepeat) {
                  tab2 <- as.data.frame(matrix(NA, nrow = N, 
                    ncol = nb_loci * 2))
                  for (j in 1:N) {
                    for (i in index_l) {
                      tab2[j, c(i, i + 1)] <- sort(sample(split(data2, 
                        liste_all)[[c((i + 1)/2)]][, ncol_all], 
                        2, prob = split(data2, liste_all)[[c((i + 
                          1)/2)]][, ncol_freq], replace = TRUE))
                    }
                  }
                  tab_sim <- tab2
                  colnames(tab_sim) <- colnames(data1)
                  MLG_sim <- unique(tab_sim)
                  if (nrow(MLG_sim) != nrow(tab_sim)) {
                    pgen_sim <- pgen_core(tab_sim, data2, haploid)
                    psex_sim <- NULL
                    list_genet_sim <- MLG_list(tab_sim)
                    if (MLGsim) {
                      for (m in 1:length(list_genet_sim[which(sapply(list_genet_sim, 
                        length) > 1)])) {
                        recup <- NULL
                        sub_list <- list_genet_sim[which(sapply(list_genet_sim, 
                          length) > 1)][[m]]
                        l <- sub_list[1]
                        recup <- c(recup, dbinom(length(sub_list), 
                          nrow(tab_sim), pgen_sim[l, ]))
                      }
                      psex_sim <- c(psex_sim, recup)
                    }
                    else {
                      for (m in 1:length(list_genet_sim[which(sapply(list_genet_sim, 
                        length) > 1)])) {
                        recup <- NULL
                        for (l in list_genet_sim[which(sapply(list_genet_sim, 
                          length) > 1)][[m]][-1]) {
                          recup <- c(recup, dbinom(which(list_genet_sim[which(sapply(list_genet_sim, 
                            length) > 1)][[m]][-1] == l), nrow(tab_sim), 
                            pgen_sim[l, ]))
                        }
                        psex_sim <- c(psex_sim, recup)
                      }
                    }
                    psex_recup <- c(psex_recup, psex_sim)
                  }
                  if (bar) {
                    setTxtProgressBar(pb, s)
                  }
                }
                psexFR_p <- cbind(psexFR, as.data.frame(matrix(NA, 
                  ncol = 1, nrow = nrow(data1))))
                for (m in 1:length(list_genet[which(sapply(list_genet, 
                  length) > 1)])) {
                  if (MLGsim) {
                    for (l in list_genet[which(sapply(list_genet, 
                      length) > 1)][[m]]) {
                      psexFR_p[l, 3] <- mean(psexFR_p[l, 2] > 
                        psex_recup)
                    }
                  }
                  else {
                    for (l in list_genet[which(sapply(list_genet, 
                      length) > 1)][[m]][-1]) {
                      psexFR_p[l, 3] <- mean(psexFR_p[l, 2] > 
                        psex_recup)
                    }
                  }
                }
                colnames(psexFR_p) <- c("genet", "psex", "pvalue")
                if (bar) {
                  close(pb)
                }
                psexFR_p[is.na(psexFR_p)] <- ""
				if (length(psex_recup) == 0) {
                  print("Warning: No clone was found during Simulations.")
                }
                if (length(psex_recup) >= 1 & length(psex_recup) < 100) {
                  print("Warning: Simulated populations contain few repeated genotypes and p-value estimations may be incorrect.")
                }
                list(psexFR_p, psex_recup)
            }
            else {
                psexFR[is.na(psexFR)] <- ""
                psexFR
            }
        }
    }
}

\name{genet_dist}
\alias{genet_dist}
\alias{genet_dist_sim}
\alias{genet_dist_core}
\alias{genet_dist_sim_core}
\alias{graph_genet_dist}

\title{
Genetic distance
}

\description{
Defining MLL (MultiLocus Lineage): ascertaining that each distinct MLG 
(MultiLocus Genotype) belongs to a distinct genet (Halkett et al., 2005a).
}

\usage{
genet_dist(data1, haploid = FALSE, vecpop = NULL, manh = FALSE, manh_w = FALSE, 
graph = FALSE, breaking = NULL, alpha1 = NULL, alpha2 = NULL, export = FALSE)
genet_dist_sim(data1, haploid = FALSE, vecpop = NULL, nbrepeat = 1000, 
genet = FALSE, manh = FALSE, manh_w = FALSE, graph = FALSE, breaking = NULL,
export = FALSE)
}

\arguments{
  \item{data1}{
a \command{Rclone} table with one allele per column.
}
  \item{haploid}{
logical, option, \command{haploid} indicates the ploidy level of \command{data1}.
}
  \item{vecpop}{
vector, option, \command{vecpop} indicates the population name of each unit
of \command{data1}, if \command{data1} contains several populations.\cr
If \command{data1} contains only one population, leave \command{vecpop = NULL}.
}
  \item{manh}{
option, if \command{TRUE}, computes genetic distances among MLG in terms of 
divergence of microsatellites motifs (Rozenfeld et al., 2007).
}
  \item{manh_w}{
option, if \command{TRUE}, computes genetic distances among MLG in terms of
 weighted divergence of microsatellites motifs (Rozenfeld et al., 2007).
}
  \item{graph}{
option, if \command{TRUE}, displays a barplot with \command{breaking} and 
\command{pas} arguments.
}
  \item{breaking}{
numeric, option, if \command{breaking != NULL}, adds \command{breaks} argument 
for barplot as \command{breaks = seq(0, max, X)}, with \command{X}, the numerical value
of \command{breaking}.
}
  \item{alpha1}{
numeric, option, if \command{alpha1} is not NULL, a vertical significativity 
line is added on graph at \command{alpha1}% of the distribution.
}
  \item{alpha2}{
numeric, option, if \command{alpha2} is not NULL, a vertical significativity 
line is added on graph at \command{alpha2}.
}
  \item{nbrepeat}{
numeric, the number of repeats for simulation (i.e. reproduction event).
}
  \item{genet}{
option, if \command{FALSE}, selfing is taking into account in simulation through
 ramets.
}
  \item{export}{
option, if \command{TRUE}, graph is saved as .eps into working directory.
}
}

\details{
\command{genet_dist} and \command{genet_dist_sim} help determining MLL, i.e. if 
slightly different MLG belong or not to the same lineage.


\command{genet_dist} computes genetic distances between pairs of units in terms 
of number of alleles (Chakraborty and Jin, 1993) by default.


If \command{manh = TRUE} or \command{manh_w = TRUE}, divergence of SSR motifs 
(Rozenfeld et al., 2007) is used as genetic distance.


These distance distributions help defining MLL with significativity of \command{alpha}: 
every pair under alpha could be ramets of a genet.


\command{genet_dist_sim} computes genetic distances but after a reproduction 
event between the units.


The simulated distance distribution allows to distinguish slightly differences 
due to somatic mutation or scoring errors by stacking the two distributions.
}

\value{
\command{genet_dist} returns:
\itemize{
\item \command{distance_matrix}, a \command{dist} object with genetic distances 
by pair of units.
\item \command{potential_clones}, a table containing names and genetic distances of 
pairs of units under \command{alpha1} distribution or of maximal genetic distance 
of \command{alpha2}.
\item \command{all_pairs}, a table containing names and genetic distances of every
pairs of units.
\item \command{sign}, the numeric value of \command{alpha1} or \command{alpha2}.
}


If \command{vecpop != NULL}, a list for every population.


\command{genet_dist_sim} returns a \command{dist} object of genetic distances 
by pair of units after a sexual reproduction event.
}


\references{
Chakraborty & Jin, 1993, Determination of relatedness between individuals using 
DNA-fingerprinting.


Arnaud-Haond et al., 2007, Standardizing methods to address clonality in 
population studies.


Rozenfeld et al., 2007, Spectrum of genetic diversity and networks of clonal 
populations.
}

\author{
Creator/Author: Diane Bailleul <diane.bailleul.pro@gmail.com> \cr
Author: Sophie Arnaud-Haond <sophie.arnaud@ifremer.fr> \cr
Contributor: Solenn Stoeckel


The R implementation of \command{RClone} was written by Diane Bailleul.


The design was inspired by GenClone program described in Arnaud-Haond & Belkhir (2007).
}

\examples{
data(posidonia)

res <- genet_dist(posidonia, manh = TRUE, graph = TRUE, alpha1 = 0.05)

#Combining functions:
res1 <- genet_dist(posidonia, manh = TRUE)$distance_matrix
res2 <- genet_dist_sim_core(posidonia, nbrepeat = 100, manh = TRUE, genet = TRUE)$distance_matrix

p1 <- hist(res1, freq = FALSE, col = rgb(0,0.4,1,1), breaks = seq(0, max(res1), 2))
p2 <- hist(res2, freq = FALSE, col = rgb(0.7,0.9,1,0.5), breaks = seq(0, max(res2), 2))

limx <- max(max(res1), max(res2))
plot(p1, col = rgb(0,0.4,1,1), freq = FALSE, xlim = c(0,limx))
plot(p2, col = rgb(0.7,0.9,1,0.5), freq = FALSE, add = TRUE)

#Other way:
p1 <- as.data.frame(table(res1))
p2 <- as.data.frame(table(res2))
barplot(p1$Freq/sum(p1$Freq), col=rgb(0,0.4,1,1), axis.lty = 1, 
names.arg = as.numeric(as.character(p1[,1])))
barplot(p2$Freq/sum(p2$Freq), col=rgb(0.7,0.9,1,0.5), add = TRUE)
title("Genetic distances between pairs of MLG")

#Adding a legend:
leg.txt <- c("original data","simulated data")
col <- c(rgb(0,0.4,1,1), rgb(0.7,0.9,1,0.5))
legend("topright", fill = col, leg.txt, plot = TRUE, bty = "o", box.lwd = 1.5, 
bg = "white")
}

\keyword{documentation}

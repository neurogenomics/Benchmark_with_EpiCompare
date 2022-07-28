#H3K36me3
library(EpiCompare)
data(hg38_blacklist)

H3K36me3_K562_E1_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF901ACN/@@download/ENCFF901ACN.bed.gz", format = "narrowPeak")
H3K36me3_K562_E1_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF889HMI/@@download/ENCFF889HMI.bed.gz", format = "narrowPeak")
H3K36me3_K562_E1_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF596DEJ/@@download/ENCFF596DEJ.bed.gz", format = "narrowPeak")
H3K36me3_K562_E1_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF561OUZ/@@download/ENCFF561OUZ.bed.gz", format = "narrowPeak")

H3K36me3_K562_E2_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF035WTT/@@download/ENCFF035WTT.bed.gz", format = "narrowPeak")
H3K36me3_K562_E2_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF973LQI/@@download/ENCFF973LQI.bed.gz", format = "narrowPeak")
H3K36me3_K562_E2_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF903ZMQ/@@download/ENCFF903ZMQ.bed.gz", format = "narrowPeak")
H3K36me3_K562_E2_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF520LHY/@@download/ENCFF520LHY.bed.gz", format = "narrowPeak")

H3K36me3_A549_E1_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF584FSY/@@download/ENCFF584FSY.bed.gz", format = "narrowPeak")
H3K36me3_A549_E1_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF689OPD/@@download/ENCFF689OPD.bed.gz", format = "narrowPeak")
H3K36me3_A549_E1_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF403TUX/@@download/ENCFF403TUX.bed.gz", format = "narrowPeak")
H3K36me3_A549_E1_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF944TFP/@@download/ENCFF944TFP.bed.gz", format = "narrowPeak")

H3K36me3_A549_E2_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF127LEC/@@download/ENCFF127LEC.bed.gz", format = "narrowPeak")
H3K36me3_A549_E2_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF529HOM/@@download/ENCFF529HOM.bed.gz", format = "narrowPeak")
H3K36me3_A549_E2_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF676LWH/@@download/ENCFF676LWH.bed.gz", format = "narrowPeak")
H3K36me3_A549_E2_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF479OUD/@@download/ENCFF479OUD.bed.gz", format = "narrowPeak")

H3K36me3_H9_E1_MINT_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF267AKB/@@download/ENCFF267AKB.bed.gz", format = "narrowPeak")
H3K36me3_H9_E1_MINT_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF103GJI/@@download/ENCFF103GJI.bed.gz", format = "narrowPeak")
H3K36me3_H9_E1_MINT_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF071OLJ/@@download/ENCFF071OLJ.bed.gz", format = "narrowPeak")
H3K36me3_H9_E1_MINT_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF325CGN/@@download/ENCFF325CGN.bed.gz", format = "narrowPeak")

peaklist <- list(H3K36me3_K562_E1_IRpseudo12,H3K36me3_K562_E1_IRpseudo1,H3K36me3_K562_E1_IRpseudo2,H3K36me3_K562_E1_IR12,H3K36me3_K562_E2_IRpseudo12,H3K36me3_K562_E2_IRpseudo1,H3K36me3_K562_E2_IRpseudo2,H3K36me3_K562_E2_IR12,H3K36me3_A549_E1_IRpseudo12,H3K36me3_A549_E1_IRpseudo1,H3K36me3_A549_E1_IR12,H3K36me3_A549_E2_IRpseudo12,H3K36me3_A549_E2_IRpseudo1,H3K36me3_A549_E2_IR12,H3K36me3_H9_E1_MINT_IRpseudo12,H3K36me3_H9_E1_MINT_IRpseudo1,H3K36me3_H9_E1_MINT_IRpseudo2)

names(peaklist) <- c("H3K36me3_K562_E1_IRpseudo12","H3K36me3_K562_E1_IRpseudo1","H3K36me3_K562_E1_IRpseudo2","H3K36me3_K562_E1_IR12","H3K36me3_K562_E2_IRpseudo12","H3K36me3_K562_E2_IRpseudo1","H3K36me3_K562_E2_IRpseudo2","H3K36me3_K562_E2_IR12","H3K36me3_A549_E1_IRpseudo12","H3K36me3_A549_E1_IRpseudo1","H3K36me3_A549_E1_IR12","H3K36me3_A549_E2_IRpseudo12","H3K36me3_A549_E2_IRpseudo1","H3K36me3_A549_E2_IR12","H3K36me3_H9_E1_MINT_IRpseudo12","H3K36me3_H9_E1_MINT_IRpseudo1","H3K36me3_H9_E1_MINT_IRpseudo2")

#H3K36me3_A549_E1_IRpseudo2,H3K36me3_A549_E2_IRpseudo2 deleted due to low quality

ENCODE <- list("H3K36me3_H9_E1_MINT_IR12" = H3K36me3_H9_E1_MINT_IR12)
gc()
data(hg38_blacklist)

EpiCompare(peakfiles = peaklist,
           genome_build = "hg38",
           blacklist = hg38_blacklist,
           picard_files = list(),
           reference = ENCODE,
           upset_plot = FALSE,
           stat_plot = FALSE,
           chromHMM_plot = FALSE,
           chromHMM_annotation = "K562",
           chipseeker_plot = FALSE,
           enrichment_plot = FALSE,
           tss_plot = FALSE,
           interact = TRUE,
           save_output = TRUE,
           output_dir = "/Users/xindong/Downloads/H3K36me3")






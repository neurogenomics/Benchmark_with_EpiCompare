library(EpiCompare)
data(hg38_blacklist)

H3K4me1_A549_E1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF594YDK/@@download/ENCFF594YDK.bed.gz", format = "narrowPeak")
H3K4me1_A549_E2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF116HIQ/@@download/ENCFF116HIQ.bed.gz", format = "narrowPeak")

H3K4me3_A549_E1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF535EYL/@@download/ENCFF535EYL.bed.gz", format = "narrowPeak")
H3K4me3_A549_E2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF361TGO/@@download/ENCFF361TGO.bed.gz", format = "narrowPeak")

H3K9ac_A549_E1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF350BNS/@@download/ENCFF350BNS.bed.gz", format = "narrowPeak")

H3K27ac_A549_E1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF402QHS/@@download/ENCFF402QHS.bed.gz", format = "narrowPeak")
H3K27ac_A549_E2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF035VXU/@@download/ENCFF035VXU.bed.gz", format = "narrowPeak")

H3K27me3_A549_E1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF522WJJ/@@download/ENCFF522WJJ.bed.gz", format = "narrowPeak")
H3K27me3_A549_E2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF684ZZH/@@download/ENCFF684ZZH.bed.gz", format = "narrowPeak")

H3K36me3_A549_E1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF584FSY/@@download/ENCFF584FSY.bed.gz", format = "narrowPeak")
H3K36me3_A549_E2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF127LEC/@@download/ENCFF127LEC.bed.gz", format = "narrowPeak")



peaklist <- list(H3K4me1_A549_E1,H3K4me1_A549_E2,H3K4me3_A549_E1,H3K4me3_A549_E2,H3K9ac_A549_E1,H3K27ac_A549_E1,H3K27ac_A549_E2,H3K27me3_A549_E1,H3K27me3_A549_E2,H3K36me3_A549_E1)

names(peaklist) <- c("H3K4me1_A549_E1","H3K4me1_A549_E2","H3K4me3_A549_E1","H3K4me3_A549_E2","H3K9ac_A549_E1","H3K27ac_A549_E1","H3K27ac_A549_E2","H3K27me3_A549_E1","H3K27me3_A549_E2","H3K36me3_A549_E1")

ENCODE <- list("H3K36me3_A549_E2" = H3K36me3_A549_E2)
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
           output_dir = "/Users/xindong/Downloads/ENCODE_A549")


#H3K9ac
library(EpiCompare)
data(hg38_blacklist)

H3K9ac_K562_E1_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF148UQI/@@download/ENCFF148UQI.bed.gz", format = "narrowPeak")
H3K9ac_K562_E1_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF568DJI/@@download/ENCFF568DJI.bed.gz", format = "narrowPeak")
H3K9ac_K562_E1_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF882KNK/@@download/ENCFF882KNK.bed.gz", format = "narrowPeak")
H3K9ac_K562_E1_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF451CEN/@@download/ENCFF451CEN.bed.gz", format = "narrowPeak")

H3K9ac_K562_E2_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF891CHI/@@download/ENCFF891CHI.bed.gz", format = "narrowPeak")
H3K9ac_K562_E2_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF789NDS/@@download/ENCFF789NDS.bed.gz", format = "narrowPeak")
H3K9ac_K562_E2_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF485EUA/@@download/ENCFF485EUA.bed.gz", format = "narrowPeak")
H3K9ac_K562_E2_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF666PTK/@@download/ENCFF666PTK.bed.gz", format = "narrowPeak")


H3K9ac_A549_E1_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF350BNS/@@download/ENCFF350BNS.bed.gz", format = "narrowPeak")
H3K9ac_A549_E1_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF985ZTF/@@download/ENCFF985ZTF.bed.gz", format = "narrowPeak")
H3K9ac_A549_E1_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF984PPY/@@download/ENCFF984PPY.bed.gz", format = "narrowPeak")
H3K9ac_A549_E1_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF948TJU/@@download/ENCFF948TJU.bed.gz", format = "narrowPeak")


H3K9ac_H9_E1_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF501NMW/@@download/ENCFF501NMW.bed.gz", format = "narrowPeak")
H3K9ac_H9_E1_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF609FOK/@@download/ENCFF609FOK.bed.gz", format = "narrowPeak")
H3K9ac_H9_E1_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF415LVC/@@download/ENCFF415LVC.bed.gz", format = "narrowPeak")
H3K9ac_H9_E1_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF876GVK/@@download/ENCFF876GVK.bed.gz", format = "narrowPeak")

#H3K9ac_H9_E1_IRpseudo2 extremely low quality

peaklist <- list(H3K9ac_K562_E1_IRpseudo12,H3K9ac_K562_E1_IRpseudo1,H3K9ac_K562_E1_IRpseudo2,H3K9ac_K562_E1_IR12,H3K9ac_K562_E2_IRpseudo12,H3K9ac_K562_E2_IRpseudo1,H3K9ac_K562_E2_IRpseudo2,H3K9ac_K562_E2_IR12,H3K9ac_A549_E1_IRpseudo12,H3K9ac_A549_E1_IRpseudo1,H3K9ac_A549_E1_IRpseudo2,H3K9ac_A549_E1_IR12,H3K9ac_H9_E1_IRpseudo12,H3K9ac_H9_E1_IRpseudo1)

names(peaklist) <- c("H3K9ac_K562_E1_IRpseudo12","H3K9ac_K562_E1_IRpseudo1","H3K9ac_K562_E1_IRpseudo2","H3K9ac_K562_E1_IR12","H3K9ac_K562_E2_IRpseudo12","H3K9ac_K562_E2_IRpseudo1","H3K9ac_K562_E2_IRpseudo2","H3K9ac_K562_E2_IR12","H3K9ac_A549_E1_IRpseudo12","H3K9ac_A549_E1_IRpseudo1","H3K9ac_A549_E1_IRpseudo2","H3K9ac_A549_E1_IR12","H3K9ac_H9_E1_IRpseudo12","H3K9ac_H9_E1_IRpseudo1")



ENCODE <- list("H3K9ac_H9_E1_IR12" = H3K9ac_H9_E1_IR12)
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
           output_dir = "/Users/xindong/Downloads/H3K9ac")





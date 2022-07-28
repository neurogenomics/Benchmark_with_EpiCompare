library(EpiCompare)
data(hg38_blacklist)

H3K4me1_K562_E1_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF540NGG/@@download/ENCFF540NGG.bed.gz", format = "narrowPeak")
H3K4me1_K562_E1_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF236GZL/@@download/ENCFF236GZL.bed.gz", format = "narrowPeak")
H3K4me1_K562_E1_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF247KOA/@@download/ENCFF247KOA.bed.gz", format = "narrowPeak")
H3K4me1_K562_E1_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF965TUI/@@download/ENCFF965TUI.bed.gz", format = "narrowPeak")


H3K4me1_K562_E2_IRpseudo123 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF617BGN/@@download/ENCFF617BGN.bed.gz", format = "narrowPeak")
H3K4me1_K562_E2_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF573AQP/@@download/ENCFF573AQP.bed.gz", format = "narrowPeak")
H3K4me1_K562_E2_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF553IZN/@@download/ENCFF553IZN.bed.gz", format = "narrowPeak")
H3K4me1_K562_E2_IRpseudo3 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF324RWP/@@download/ENCFF324RWP.bed.gz", format = "narrowPeak")
H3K4me1_K562_E2_IR123 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF135ZLM/@@download/ENCFF135ZLM.bed.gz", format = "narrowPeak")


H3K4me1_A549_E1_IRpseudo123 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF594YDK/@@download/ENCFF594YDK.bed.gz", format = "narrowPeak")
H3K4me1_A549_E1_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF527VIE/@@download/ENCFF527VIE.bed.gz", format = "narrowPeak")
H3K4me1_A549_E1_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF934RSS/@@download/ENCFF934RSS.bed.gz", format = "narrowPeak")
H3K4me1_A549_E1_IRpseudo3 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF899JLY/@@download/ENCFF899JLY.bed.gz", format = "narrowPeak")
H3K4me1_A549_E1_IR123 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF966DXR/@@download/ENCFF966DXR.bed.gz", format = "narrowPeak")


H3K4me1_A549_E2_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF116HIQ/@@download/ENCFF116HIQ.bed.gz", format = "narrowPeak")
H3K4me1_A549_E2_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF470ZPR/@@download/ENCFF470ZPR.bed.gz", format = "narrowPeak")
H3K4me1_A549_E2_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF099UFX/@@download/ENCFF099UFX.bed.gz", format = "narrowPeak")
H3K4me1_A549_E2_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF537NQH/@@download/ENCFF537NQH.bed.gz", format = "narrowPeak")

H3K4me1_H9_E1_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF731UCU/@@download/ENCFF731UCU.bed.gz", format = "narrowPeak")
H3K4me1_H9_E1_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF299RUB/@@download/ENCFF299RUB.bed.gz", format = "narrowPeak")
H3K4me1_H9_E1_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF780VJW/@@download/ENCFF780VJW.bed.gz", format = "narrowPeak")
H3K4me1_H9_E1_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF128YAJ/@@download/ENCFF128YAJ.bed.gz", format = "narrowPeak")


H3K4me1_H9_E2_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF188TGA/@@download/ENCFF188TGA.bed.gz", format = "narrowPeak")
H3K4me1_H9_E2_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF285QHC/@@download/ENCFF285QHC.bed.gz", format = "narrowPeak")
H3K4me1_H9_E2_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF422TOY/@@download/ENCFF422TOY.bed.gz", format = "narrowPeak")
H3K4me1_H9_E2_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF672ICV/@@download/ENCFF672ICV.bed.gz", format = "narrowPeak")


peaklist <- list(H3K4me1_K562_E1_IRpseudo12,H3K4me1_K562_E1_IRpseudo1,H3K4me1_K562_E1_IRpseudo2,H3K4me1_K562_E1_IR12,H3K4me1_K562_E2_IRpseudo123,H3K4me1_K562_E2_IRpseudo1,H3K4me1_K562_E2_IRpseudo2,H3K4me1_K562_E2_IRpseudo3,H3K4me1_K562_E2_IR123,H3K4me1_A549_E1_IRpseudo123,H3K4me1_A549_E1_IRpseudo1,H3K4me1_A549_E1_IRpseudo2,H3K4me1_A549_E1_IRpseudo3,H3K4me1_A549_E1_IR123,H3K4me1_A549_E2_IRpseudo12,H3K4me1_A549_E2_IRpseudo1,H3K4me1_A549_E2_IRpseudo2,H3K4me1_A549_E2_IR12,H3K4me1_H9_E1_IRpseudo12,H3K4me1_H9_E1_IRpseudo1,H3K4me1_H9_E1_IRpseudo2,H3K4me1_H9_E1_IR12,H3K4me1_H9_E2_IRpseudo12,H3K4me1_H9_E2_IRpseudo1,H3K4me1_H9_E2_IRpseudo2)

names(peaklist) <- c("H3K4me1_K562_E1_IRpseudo12","H3K4me1_K562_E1_IRpseudo1","H3K4me1_K562_E1_IRpseudo2","H3K4me1_K562_E1_IR12","H3K4me1_K562_E2_IRpseudo123","H3K4me1_K562_E2_IRpseudo1","H3K4me1_K562_E2_IRpseudo2","H3K4me1_K562_E2_IRpseudo3","H3K4me1_K562_E2_IR123","H3K4me1_A549_E1_IRpseudo123","H3K4me1_A549_E1_IRpseudo1","H3K4me1_A549_E1_IRpseudo2","H3K4me1_A549_E1_IRpseudo3","H3K4me1_A549_E1_IR123","H3K4me1_A549_E2_IRpseudo12","H3K4me1_A549_E2_IRpseudo1","H3K4me1_A549_E2_IRpseudo2","H3K4me1_A549_E2_IR12","H3K4me1_H9_E1_IRpseudo12","H3K4me1_H9_E1_IRpseudo1","H3K4me1_H9_E1_IRpseudo2","H3K4me1_H9_E1_IR12","H3K4me1_H9_E2_IRpseudo12","H3K4me1_H9_E2_IRpseudo1","H3K4me1_H9_E2_IRpseudo2")

ENCODE <- list("H3K4me1_H9_E2_IR12" = H3K4me1_H9_E2_IR12)
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
           output_dir = "/Users/xindong/Downloads/H3K4me1")





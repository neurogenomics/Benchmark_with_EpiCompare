library(EpiCompare)
data(hg38_blacklist)

H3K27me3_K562_E1_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF801AHF/@@download/ENCFF801AHF.bed.gz", format = "narrowPeak")
H3K27me3_K562_E1_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF716IFT/@@download/ENCFF716IFT.bed.gz", format = "narrowPeak")
H3K27me3_K562_E1_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF040TWS/@@download/ENCFF040TWS.bed.gz", format = "narrowPeak")
H3K27me3_K562_E1_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF795ZOS/@@download/ENCFF795ZOS.bed.gz", format = "narrowPeak")

H3K27me3_K562_E2_IRpseudo123 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF323WOT/@@download/ENCFF323WOT.bed.gz", format = "narrowPeak")
H3K27me3_K562_E2_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF824BSZ/@@download/ENCFF824BSZ.bed.gz", format = "narrowPeak")
H3K27me3_K562_E2_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF694VLF/@@download/ENCFF694VLF.bed.gz", format = "narrowPeak")
H3K27me3_K562_E2_IRpseudo3 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF664ERS/@@download/ENCFF664ERS.bed.gz", format = "narrowPeak")
H3K27me3_K562_E2_IR123 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF509EWI/@@download/ENCFF509EWI.bed.gz", format = "narrowPeak")

H3K27me3_A549_E1_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF522WJJ/@@download/ENCFF522WJJ.bed.gz", format = "narrowPeak")
H3K27me3_A549_E1_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF993CTS/@@download/ENCFF993CTS.bed.gz", format = "narrowPeak")
H3K27me3_A549_E1_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF600KIO/@@download/ENCFF600KIO.bed.gz", format = "narrowPeak")
H3K27me3_A549_E1_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF218OLP/@@download/ENCFF218OLP.bed.gz", format = "narrowPeak")

H3K27me3_A549_E2_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF684ZZH/@@download/ENCFF684ZZH.bed.gz", format = "narrowPeak")
H3K27me3_A549_E2_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF149TSI/@@download/ENCFF149TSI.bed.gz", format = "narrowPeak")
H3K27me3_A549_E2_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF170IUX/@@download/ENCFF170IUX.bed.gz", format = "narrowPeak")
H3K27me3_A549_E2_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF103IZD/@@download/ENCFF103IZD.bed.gz", format = "narrowPeak")

H3K27me3_H9_E1_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF851PCG/@@download/ENCFF851PCG.bed.gz", format = "narrowPeak")
H3K27me3_H9_E1_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF173TSI/@@download/ENCFF173TSI.bed.gz", format = "narrowPeak")
H3K27me3_H9_E1_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF604KTQ/@@download/ENCFF604KTQ.bed.gz", format = "narrowPeak")
H3K27me3_H9_E1_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF529DRN/@@download/ENCFF529DRN.bed.gz", format = "narrowPeak")

H3K27me3_H9_E2_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF680AKW/@@download/ENCFF680AKW.bed.gz", format = "narrowPeak")
H3K27me3_H9_E2_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF099LOX/@@download/ENCFF099LOX.bed.gz", format = "narrowPeak")
H3K27me3_H9_E2_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF873SQA/@@download/ENCFF873SQA.bed.gz", format = "narrowPeak")
H3K27me3_H9_E2_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF123SLB/@@download/ENCFF123SLB.bed.gz", format = "narrowPeak")




peaklist <- list(H3K27me3_K562_E1_IRpseudo12,H3K27me3_K562_E1_IRpseudo1,H3K27me3_K562_E1_IRpseudo2,H3K27me3_K562_E1_IR12,H3K27me3_K562_E2_IRpseudo123,H3K27me3_K562_E2_IRpseudo1,H3K27me3_K562_E2_IRpseudo2,H3K27me3_K562_E2_IRpseudo3,H3K27me3_K562_E2_IR123,H3K27me3_A549_E1_IRpseudo12,H3K27me3_A549_E1_IRpseudo1,H3K27me3_A549_E1_IRpseudo2,H3K27me3_A549_E1_IR12, H3K27me3_A549_E2_IRpseudo12,H3K27me3_A549_E2_IRpseudo1,H3K27me3_A549_E2_IRpseudo2,H3K27me3_A549_E2_IR12,H3K27me3_H9_E1_IRpseudo12,H3K27me3_H9_E1_IRpseudo1,H3K27me3_H9_E1_IRpseudo2,H3K27me3_H9_E1_IR12,H3K27me3_H9_E2_IRpseudo12,H3K27me3_H9_E2_IRpseudo1,H3K27me3_H9_E2_IRpseudo2)
names(peaklist) <- c("H3K27me3_K562_E1_IRpseudo12","H3K27me3_K562_E1_IRpseudo1","H3K27me3_K562_E1_IRpseudo2","H3K27me3_K562_E1_IR12","H3K27me3_K562_E2_IRpseudo123","H3K27me3_K562_E2_IRpseudo1","H3K27me3_K562_E2_IRpseudo2","H3K27me3_K562_E2_IRpseudo3","H3K27me3_K562_E2_IR123","H3K27me3_A549_E1_IRpseudo12","H3K27me3_A549_E1_IRpseudo1","H3K27me3_A549_E1_IRpseudo2","H3K27me3_A549_E1_IR12", "H3K27me3_A549_E2_IRpseudo12","H3K27me3_A549_E2_IRpseudo1","H3K27me3_A549_E2_IRpseudo2","H3K27me3_A549_E2_IR12","H3K27me3_H9_E1_IRpseudo12","H3K27me3_H9_E1_IRpseudo1","H3K27me3_H9_E1_IRpseudo2","H3K27me3_H9_E1_IR12","H3K27me3_H9_E2_IRpseudo12","H3K27me3_H9_E2_IRpseudo1","H3K27me3_H9_E2_IRpseudo2")

ENCODE <- list("H3K27me3_H9_E2_IR12" = H3K27me3_H9_E2_IR12)
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
           output_dir = "/Users/xindong/Downloads/H3K27me3")
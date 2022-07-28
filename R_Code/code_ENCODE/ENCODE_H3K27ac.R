library(EpiCompare)
data(hg38_blacklist)

H3K27ac_K562_E1_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF864OSZ/@@download/ENCFF864OSZ.bed.gz", format = "narrowPeak")
H3K27ac_K562_E1_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF169ZQQ/@@download/ENCFF169ZQQ.bed.gz", format = "narrowPeak")
H3K27ac_K562_E1_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF878ECB/@@download/ENCFF878ECB.bed.gz", format = "narrowPeak")
H3K27ac_K562_E1_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF439SDV/@@download/ENCFF439SDV.bed.gz", format = "narrowPeak")

H3K27ac_A549_E1_IRpseudo123 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF402QHS/@@download/ENCFF402QHS.bed.gz", format = "narrowPeak")
H3K27ac_A549_E1_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF504PMO/@@download/ENCFF504PMO.bed.gz", format = "narrowPeak")
H3K27ac_A549_E1_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF433AUD/@@download/ENCFF433AUD.bed.gz", format = "narrowPeak")
H3K27ac_A549_E1_IRpseudo3 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF800VRR/@@download/ENCFF800VRR.bed.gz", format = "narrowPeak")
H3K27ac_A549_E1_IR123 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF233AEF/@@download/ENCFF233AEF.bed.gz", format = "narrowPeak")

H3K27ac_A549_E2_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF035VXU/@@download/ENCFF035VXU.bed.gz", format = "narrowPeak")
H3K27ac_A549_E2_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF673GIV/@@download/ENCFF673GIV.bed.gz", format = "narrowPeak")

H3K27ac_H9_E1_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF317ITN/@@download/ENCFF317ITN.bed.gz", format = "narrowPeak")
H3K27ac_H9_E1_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF974QNC/@@download/ENCFF974QNC.bed.gz", format = "narrowPeak")
H3K27ac_H9_E1_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF205TKS/@@download/ENCFF205TKS.bed.gz", format = "narrowPeak")

H3K27ac_H9_E2_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF876GPI/@@download/ENCFF876GPI.bed.gz", format = "narrowPeak")
H3K27ac_H9_E2_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF491KPV/@@download/ENCFF491KPV.bed.gz", format = "narrowPeak")



peaklist <- list(H3K27ac_K562_E1_IRpseudo12,H3K27ac_K562_E1_IRpseudo1,H3K27ac_K562_E1_IRpseudo2,H3K27ac_K562_E1_IR12,H3K27ac_A549_E1_IRpseudo123,H3K27ac_A549_E1_IRpseudo1,H3K27ac_A549_E1_IRpseudo2,H3K27ac_A549_E1_IRpseudo3,H3K27ac_A549_E1_IR123,H3K27ac_A549_E2_IRpseudo12,H3K27ac_A549_E2_IR12,H3K27ac_H9_E1_IRpseudo12,H3K27ac_H9_E1_IRpseudo1,H3K27ac_H9_E1_IRpseudo2,H3K27ac_H9_E2_IRpseudo12)
names(peaklist) <- c("H3K27ac_K562_E1_IRpseudo12","H3K27ac_K562_E1_IRpseudo1","H3K27ac_K562_E1_IRpseudo2","H3K27ac_K562_E1_IR12","H3K27ac_A549_E1_IRpseudo123","H3K27ac_A549_E1_IRpseudo1","H3K27ac_A549_E1_IRpseudo2","H3K27ac_A549_E1_IRpseudo3","H3K27ac_A549_E1_IR123","H3K27ac_A549_E2_IRpseudo12","H3K27ac_A549_E2_IR12","H3K27ac_H9_E1_IRpseudo12","H3K27ac_H9_E1_IRpseudo1","H3K27ac_H9_E1_IRpseudo2","H3K27ac_H9_E2_IRpseudo12")

ENCODE <- list("H3K27ac_H9_E2_IR12" = H3K27ac_H9_E2_IR12)
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
           output_dir = "/Users/xindong/Downloads/H3K27ac")


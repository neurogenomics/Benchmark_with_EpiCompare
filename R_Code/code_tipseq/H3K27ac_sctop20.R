library(EpiCompare)

ENCODE_H3K27ac_Broad <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27ac/ENCODE_H3K27ac_Broad_ENCFF544LXB.bed", as = "GRanges")

cutandrun <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27ac/cutandrun.seacr.peaks.bed.stringent.bed", as = "GRanges")

cutandtag_dedup <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27ac/cutandtag_Diagenode_C15410196_1_50_SEACR.bed", as = "GRanges")
cutandtag_withdup <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27ac/cutandtag_Diagenode_C15410196_1_50_SEACR_withDup.bed", as = "GRanges")

S_1_R1_Abcam_pA_Tn5_F6_P9 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27ac/S_1_R1_Abcam_pA_Tn5_F6_P9.peaks.bed.stringent.bed", as = "GRanges")
S_1_R2_Abcam_pA_Tn5_F6_P9 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27ac/S_1_R2_Abcam_pA_Tn5_F6_P9.peaks.bed.stringent.bed", as = "GRanges")
S_2_R1_Diagenode_pA_Tn5_F10_P9 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27ac/S_2_R1_Diagenode_pA_Tn5_F10_P9.peaks.bed.stringent.bed", as = "GRanges")
S_4_R1_Abcam_pA_Tn5_F10_P6 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27ac/S_4_R1_Abcam_pA_Tn5_F10_P6.peaks.bed.stringent.bed", as = "GRanges")
S_4_R1_Abcam_pA_Tn5_F10_P9 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27ac/S_4_R1_Abcam_pA_Tn5_F10_P9.peaks.bed.stringent.bed", as = "GRanges")
S_6_R1_Abcam_pA_Tn5_F10_P9 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27ac/S_6_R1_Abcam_pA_Tn5_F10_P9.peaks.bed.stringent.bed", as = "GRanges")
S_9_R1_Abcam_Tn5_F6_P7 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27ac/S_9_R1_Abcam_Tn5_F6_P7.peaks.bed.stringent.bed", as = "GRanges")
S_11_R1_Abcam_Tn5_F10_P7 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27ac/S_11_R1_Abcam_Tn5_F10_P7..peaks.bed.stringent.bed", as = "GRanges")

scTS_1_20_R1 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/sc/top20_reads/scTS_1_20_R1.seacr.peaks.bed.stringent.bed", as = "GRanges")
scTS_1_28_R1 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/sc/top20_reads/scTS_1_28_R1.seacr.peaks.bed.stringent.bed", as = "GRanges")
scTS_1_45_R1 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/sc/top20_reads/scTS_1_45_R1.seacr.peaks.bed.stringent.bed", as = "GRanges")
scTS_1_51_R1 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/sc/top20_reads/scTS_1_51_R1.seacr.peaks.bed.stringent.bed", as = "GRanges")
scTS_1_56_R1 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/sc/top20_reads/scTS_1_56_R1.seacr.peaks.bed.stringent.bed", as = "GRanges")
scTS_1_59_R1 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/sc/top20_reads/scTS_1_59_R1.seacr.peaks.bed.stringent.bed", as = "GRanges")
scTS_1_65_R1 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/sc/top20_reads/scTS_1_65_R1.seacr.peaks.bed.stringent.bed", as = "GRanges")
scTS_1_67_R1 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/sc/top20_reads/scTS_1_67_R1.seacr.peaks.bed.stringent.bed", as = "GRanges")
scTS_1_70_R1 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/sc/top20_reads/scTS_1_70_R1.seacr.peaks.bed.stringent.bed", as = "GRanges")
scTS_1_75_R1 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/sc/top20_reads/scTS_1_75_R1.seacr.peaks.bed.stringent.bed", as = "GRanges")

ENCODE_Broad <- list("ENCODE_H3K27ac_Broad" = ENCODE_H3K27ac_Broad)

peaklist <- list(scTS_1_75_R1,scTS_1_70_R1,scTS_1_67_R1,scTS_1_65_R1,scTS_1_59_R1,scTS_1_56_R1,scTS_1_51_R1,scTS_1_45_R1,scTS_1_28_R1,scTS_1_20_R1,
                 S_11_R1_Abcam_Tn5_F10_P7,S_9_R1_Abcam_Tn5_F6_P7,S_6_R1_Abcam_pA_Tn5_F10_P9,S_4_R1_Abcam_pA_Tn5_F10_P9,S_4_R1_Abcam_pA_Tn5_F10_P6,S_2_R1_Diagenode_pA_Tn5_F10_P9,S_1_R2_Abcam_pA_Tn5_F6_P9,S_1_R1_Abcam_pA_Tn5_F6_P9)

names(peaklist) <- c("scTS_1_75_R1","scTS_1_70_R1","scTS_1_67_R1","scTS_1_65_R1","scTS_1_59_R1","scTS_1_56_R1","scTS_1_51_R1","scTS_1_45_R1","scTS_1_28_R1","scTS_1_20_R1",
                     "S_11_R1_Abcam_Tn5_F10_P7","S_9_R1_Abcam_Tn5_F6_P7","S_6_R1_Abcam_pA_Tn5_F10_P9","S_4_R1_Abcam_pA_Tn5_F10_P9","S_4_R1_Abcam_pA_Tn5_F10_P6","S_2_R1_Diagenode_pA_Tn5_F10_P9","S_1_R2_Abcam_pA_Tn5_F6_P9","S_1_R1_Abcam_pA_Tn5_F6_P9")



gc()
data(hg38_blacklist)
EpiCompare(peakfiles = peaklist,
           genome_build = list(peakfiles="hg38",
                               reference="hg38",
                               blacklist="hg38"),
           genome_build_output = "hg38",
           blacklist = hg38_blacklist,
           # picard_files = picard_files,
           reference = ENCODE_Broad,
           upset_plot = TRUE,
           stat_plot = TRUE,
           chromHMM_plot = TRUE,
           chromHMM_annotation = "K562",
           chipseeker_plot = TRUE,
           enrichment_plot = TRUE,
           tss_plot = TRUE,
           interact = TRUE,
           save_output = TRUE,
           output_dir = "/Users/xindong/Downloads/H3K27ac_sc_20")

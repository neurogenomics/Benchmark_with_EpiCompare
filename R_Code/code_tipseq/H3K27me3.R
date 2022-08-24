library(EpiCompare)

ENCODE_H3K27me3_USC <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27me3/ENCODE_H3K27me3_USC_ENCFF801AHF.bed", as = "GRanges")
ENCODE_Broad <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27me3/ENCODE_H3K27me3_Broad_ENCFF881ONN.bed", as = "GRanges")

cutandrun <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27me3/cutandrun.seacr.peaks.bed.stringent.bed", as = "GRanges")

cutandtag_dedup <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27me3/cutandtag_CST9733_1_100_H3K27me3_SEACR.bed", as = "GRanges")
cutandtag_withdup <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27me3/cutandtag_CST9733_1_100_H3K27me3_SEACR_withDup.bed", as = "GRanges")

S_3_R1_Cell_Signaling_pA_Tn5_F10_P9 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27me3/S_3_R1_Cell_Signaling_pA_Tn5_F10_P9.peaks.bed.stringent.bed", as = "GRanges")
S_5_R1_Cell_Signaling_pA_Tn5_F10_P6 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27me3/S_5_R1_Cell_Signaling_pA_Tn5_F10_P6.peaks.bed.stringent.bed", as = "GRanges")
S_8_R1_Cell_Signaling_Tn5_F6_P7 <- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27me3/S_8_R1_Cell_Signaling_Tn5_F6_P7.peaks.bed.stringent.bed", as = "GRanges")
S_10_R1_Cell_Signaling_Tn5_F10_P7<- ChIPseeker::readPeakFile("/Users/xindong/Downloads/peakfiles/H3K27me3/S_10_R1_Cell_Signaling_Tn5_F10_P7.peaks.bed.stringent.bed", as = "GRanges")

ENCODE_USC <- list("ENCODE_H3K27me3_USC" = ENCODE_H3K27me3_USC)

peaklist <- list(S_8_R1_Cell_Signaling_Tn5_F6_P7,
                 S_10_R1_Cell_Signaling_Tn5_F10_P7,
                 S_3_R1_Cell_Signaling_pA_Tn5_F10_P9,
                 S_5_R1_Cell_Signaling_pA_Tn5_F10_P6,
                 cutandtag_withdup,
                 cutandtag_dedup,
                 cutandrun,
                 ENCODE_Broad)

names(peaklist) <- c("H3K27me3_Cell_Signaling_Tn5_F6_P7_R1",
                     "H3K27me3_Cell_Signaling_Tn5_F10_P7_R1",
                     "H3K27me3_Cell_Signaling_pA_Tn5_F10_P9_R1",
                     "H3K27me3_Cell_Signaling_pA_Tn5_F10_P6_R1",
                     "cutandtag_withdup",
                     "cutandtag_dedup",
                     "cutandrun",
                     "ENCODE_Broad")


gc()
data(hg38_blacklist)

EpiCompare(peakfiles = peaklist,
           genome_build = list(peakfiles="hg38",
                               reference="hg38",
                               blacklist="hg38"),
           genome_build_output = "hg38",
           blacklist = hg38_blacklist,
           # picard_files = picard_files,
           reference = ENCODE_USC,
           upset_plot = TRUE,
           stat_plot = TRUE,
           chromHMM_plot = TRUE,
           chromHMM_annotation = "K562",
           chipseeker_plot = TRUE,
           enrichment_plot = TRUE,
           tss_plot = TRUE,
           interact = TRUE,
           save_output = TRUE,
           output_dir = "/Users/xindong/Downloads/H3K27me3_bulk")



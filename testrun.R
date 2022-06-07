library(EpiCompare)


# From local
# E1
H3K4me3_EN4G38_E1_IRpseudo123 <- ChIPseeker::readPeakFile("/Users/apple/Downloads/cutandrun/ENCODE_A549_H3K4me3/ENCFF573MUH.bed", as = "GRanges")
H3K4me3_EN4G38_E1_IRpseudo1 <- ChIPseeker::readPeakFile("/Users/apple/Downloads/cutandrun/ENCODE_A549_H3K4me3/ENCFF810EWT.bed", as = "GRanges")
H3K4me3_EN4G38_E1_IRpseudo2 <- ChIPseeker::readPeakFile("/Users/apple/Downloads/cutandrun/ENCODE_A549_H3K4me3/ENCFF767JIG.bed", as = "GRanges")
H3K4me3_EN4G38_E1_IRpseudo3 <- ChIPseeker::readPeakFile("/Users/apple/Downloads/cutandrun/ENCODE_A549_H3K4me3/ENCFF243UCU.bed", as = "GRanges")
H3K4me3_EN4G38_E1_IR123 <- ChIPseeker::readPeakFile("/Users/apple/Downloads/cutandrun/ENCODE_A549_H3K4me3/ENCFF901AFI.bed", as = "GRanges")

#E2
H3K4me3_EN4G38_E2_IR123 <- ChIPseeker::readPeakFile("/Users/apple/Downloads/cutandrun/ENCODE_A549_H3K4me3/ENCFF046DTX.bed", as = "GRanges")
H3K4me3_EN4G38_E2_IR123_R <- ChIPseeker::readPeakFile("/Users/apple/Downloads/cutandrun/ENCODE_A549_H3K4me3/ENCFF199HJP.bed", as = "GRanges")

#E3
H3K4me3_EN4G38_E3_IRpseudo12 <- ChIPseeker::readPeakFile("/Users/apple/Downloads/cutandrun/ENCODE_A549_H3K4me3/ENCFF941JPZ.bed", as = "GRanges")
H3K4me3_EN4G38_E3_IR12 <- ChIPseeker::readPeakFile("/Users/apple/Downloads/cutandrun/ENCODE_A549_H3K4me3/ENCFF638HVG.bed", as = "GRanges")

#E4
H3K4me3_EN4G38_E4_IRpseudo123 <- ChIPseeker::readPeakFile("/Users/apple/Downloads/cutandrun/ENCODE_A549_H3K4me3/ENCFF922TPS.bed", as = "GRanges")
H3K4me3_EN4G38_E4_IRpseudo1 <- ChIPseeker::readPeakFile("/Users/apple/Downloads/cutandrun/ENCODE_A549_H3K4me3/ENCFF156LPO.bed", as = "GRanges")
H3K4me3_EN4G38_E4_IRpseudo2 <- ChIPseeker::readPeakFile("/Users/apple/Downloads/cutandrun/ENCODE_A549_H3K4me3/ENCFF525IKC.bed", as = "GRanges")
H3K4me3_EN4G38_E4_IRpseudo3 <- ChIPseeker::readPeakFile("/Users/apple/Downloads/cutandrun/ENCODE_A549_H3K4me3/ENCFF217TKM.bed", as = "GRanges")
H3K4me3_EN4G38_E4_IR123 <- ChIPseeker::readPeakFile("/Users/apple/Downloads/cutandrun/ENCODE_A549_H3K4me3/ENCFF003JDF.bed", as = "GRanges")


# make peakfile

# peakfiles <- list(H3K4me3_EN4G38_E1_IRpseudo123,H3K4me3_EN4G38_E1_IRpseudo1,H3K4me3_EN4G38_E1_IRpseudo2,H3K4me3_EN4G38_E1_IRpseudo3, H3K4me3_EN4G38_E1_IR123, H3K4me3_EN4G38_E2_IR123, H3K4me3_EN4G38_E2_IR123_R, H3K4me3_EN4G38_E3_IRpseudo12, H3K4me3_EN4G38_E3_IR12, H3K4me3_EN4G38_E4_IRpseudo123,H3K4me3_EN4G38_E4_IRpseudo1,H3K4me3_EN4G38_E4_IRpseudo2,H3K4me3_EN4G38_E4_IRpseudo3, H3K4me3_EN4G38_E4_IR123)
# 
# names(peakfiles) <- c("H3K4me3_EN4G38_E1_IRpseudo123","H3K4me3_EN4G38_E1_IRpseudo1","H3K4me3_EN4G38_E1_IRpseudo2","H3K4me3_EN4G38_E1_IRpseudo3", "H3K4me3_EN4G38_E1_IR123", "H3K4me3_EN4G38_E2_IR123", "H3K4me3_EN4G38_E2_IR123_R", "H3K4me3_EN4G38_E3_IRpseudo12", "H3K4me3_EN4G38_E3_IR12", "H3K4me3_EN4G38_E4_IRpseudo123","H3K4me3_EN4G38_E4_IRpseudo1","H3K4me3_EN4G38_E4_IRpseudo2","H3K4me3_EN4G38_E4_IRpseudo3")


peakfiles <- list(H3K4me3_EN4G38_E1_IRpseudo123,H3K4me3_EN4G38_E1_IRpseudo1, H3K4me3_EN4G38_E1_IR123, H3K4me3_EN4G38_E2_IR123)

names(peakfiles) <- c("H3K4me3_EN4G38_E1_IRpseudo123","H3K4me3_EN4G38_E1_IRpseudo1", "H3K4me3_EN4G38_E1_IR123","H3K4me3_EN4G38_E2_IR123")

ENCODE_ref <- list("H3K4me3_EN4G38_E1_IRpseudo123" = H3K4me3_EN4G38_E1_IRpseudo123)

gc()
data(hg38_blacklist)

EpiCompare(peakfiles = peakfiles,
           genome_build = "hg38",
           blacklist = hg38_blacklist,
           picard_files = list(),
           reference = ENCODE_ref,
           upset_plot = TRUE,
           stat_plot = TRUE,
           chromHMM_plot = TRUE,
           chromHMM_annotation = "Nhlf",
           chipseeker_plot = TRUE,
           enrichment_plot = TRUE,
           tss_plot = TRUE,
           interact = TRUE,
           save_output = TRUE,
           output_dir = "/Users/apple/Downloads/cutandrun/ENCODE_correlation/A549_H3K4me3")


# /Users/apple/Downloads/cutandrun/ENCODE_correlation/A549_H3K4me3

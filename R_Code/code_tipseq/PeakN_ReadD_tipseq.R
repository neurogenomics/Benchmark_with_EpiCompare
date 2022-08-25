### Run ###

pl_tiqseq <- list(S_2_R1_Diagenode_pA_Tn5_F10_P9,
                 S_9_R1_Abcam_Tn5_F6_P7,
                 S_11_R1_Abcam_Tn5_F10_P7,
                 S_1_R2_Abcam_pA_Tn5_F6_P9,
                 S_1_R1_Abcam_pA_Tn5_F6_P9,
                 S_4_R1_Abcam_pA_Tn5_F10_P9,
                 S_4_R1_Abcam_pA_Tn5_F10_P6,
                 S_8_R1_Cell_Signaling_Tn5_F6_P7,
                 S_10_R1_Cell_Signaling_Tn5_F10_P7,
                 S_3_R1_Cell_Signaling_pA_Tn5_F10_P9,
                 S_5_R1_Cell_Signaling_pA_Tn5_F10_P6,
                 scTS_1_39_R1,
                 scTS_1_57_R1,
                 scTS_1_2_R1,
                 scTS_1_60_R1,
                 scTS_1_63_R1,
                 scTS_1_43_R1,
                 scTS_1_61_R1,
                 scTS_1_42_R1,
                 scTS_1_77_R1,
                 scTS_1_5_R1
                 )

names(pl_tiqseq) <- c("H3K27ac_Diagenode_pA_Tn5_F10_P9_R1",
                     "H3K27ac_Abcam_Tn5_F6_P7_R1",
                     "H3K27ac_Abcam_Tn5_F10_P7_R1",
                     "H3K27ac_Abcam_pA_Tn5_F6_P9_R2",
                     "H3K27ac_Abcam_pA_Tn5_F6_P9_R1",
                     "H3K27ac_Abcam_pA_Tn5_F10_P9_R1",
                     "H3K27ac_Abcam_pA_Tn5_F10_P6_R1",
                     "H3K27me3_Cell_Signaling_Tn5_F6_P7_R1",
                     "H3K27me3_Cell_Signaling_Tn5_F10_P7_R1",
                     "H3K27me3_Cell_Signaling_pA_Tn5_F10_P9_R1",
                     "H3K27me3_Cell_Signaling_pA_Tn5_F10_P6_R1",
                     "scTIP_Top01",
                     "scTIP_Top02",
                     "scTIP_Top03",
                     "scTIP_Top04",
                     "scTIP_Top05",
                     "scTIP_Top06",
                     "scTIP_Top07",
                     "scTIP_Top08",
                     "scTIP_Top09",
                     "scTIP_Top10"
                     )

peakinfo_tipseq <- EpiCompare::peak_info(peaklist = pl_tiqseq, blacklist = hg38_blacklist)

# write.csv(peakinfo_tipseq,"/Users/xindong/Downloads/tip_seq/peakinfo_tipseq.csv")


remove(peakinfo_tipseq)
peakinfo_tipseq <- read.csv("/Users/xindong/Downloads/tip_seq/info_tip_seq/peakinfo_tipseq.csv", header = TRUE)


for (i in 1:nrow(peakinfo_tipseq)){
    tech <- strsplit(peakinfo_tipseq$Sample[i],"_")[[1]][1]
    if (tech == "scTIP") {
        peakinfo_tipseq$Category[i] <- "H3K27ac Single Cell" 
    } else if (tech == "H3K27ac") {
        peakinfo_tipseq$Category[i] <- "H3K27ac Bulk"
    } else if (tech == "H3K27me3") {
        peakinfo_tipseq$Category[i] <- "H3K27me3 Bulk"
    }
}

peakinfo_tipseq$PeakN_After_Tidy <- peakinfo_tipseq$PeakN_After_Tidy / 1000
peakinfo_tipseq$Read_Depth <- peakinfo_tipseq$Read_Depth / 1000000
peakinfo_tipseq$Category <- factor(peakinfo_tipseq$Category, levels = c("H3K27ac Bulk","H3K27me3 Bulk","H3K27ac Single Cell"))
# write.csv(peakinfo_tipseq,"/Users/xindong/Downloads/tip_seq/info_tip_seq/peakinfo_tipseq.csv")

P_tipseq_PeakN_ReadD <- ggplot(peakinfo_tipseq, aes(x = Read_Depth, y = PeakN_After_Tidy, fill = Category))+
    geom_point(aes(color = Category), size = 3, alpha = 0.8) +
    geom_smooth(mapping = aes(x = Read_Depth, y = PeakN_After_Tidy, fill = NULL), method="lm", color="red", linetype=2, show.legend = FALSE) + 
    theme_light() +
    facet_wrap(~Category, scales = "free_x") +
    labs(
        # title = "Peak Number & Read Depth Correlation",
        # subtitle = "A549 & K562",
        #tag = "",
        #caption = "",
        x = "Read Depth (million)",
        y = "Peak Number (thousand)"
    )
show(P_tipseq_PeakN_ReadD)  





















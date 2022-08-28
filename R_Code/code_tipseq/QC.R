peaklist <- list(S_2_R1_Diagenode_pA_Tn5_F10_P9,
                 S_9_R1_Abcam_Tn5_F6_P7,
                 S_11_R1_Abcam_Tn5_F10_P7,
                 S_1_R2_Abcam_pA_Tn5_F6_P9,
                 S_1_R1_Abcam_pA_Tn5_F6_P9,
                 S_4_R1_Abcam_pA_Tn5_F10_P9,
                 S_4_R1_Abcam_pA_Tn5_F10_P6,
                 cutandtag_withdup,
                 cutandtag_dedup,
                 cutandrun,
                 ENCODE_H3K27ac_Broad)

names(peaklist) <- c("H3K27ac_Diagenode_pA_Tn5_F10_P9_R1",
                     "H3K27ac_Abcam_Tn5_F6_P7_R1",
                     "H3K27ac_Abcam_Tn5_F10_P7_R1",
                     "H3K27ac_Abcam_pA_Tn5_F6_P9_R2",
                     "H3K27ac_Abcam_pA_Tn5_F6_P9_R1",
                     "H3K27ac_Abcam_pA_Tn5_F10_P9_R1",
                     "H3K27ac_Abcam_pA_Tn5_F10_P6_R1",
                     "cutandtag_withdup",
                     "cutandtag_dedup",
                     "cutandrun",
                     "ENCODE_Broad")


tip_seq_list <- c("H3K27ac_Diagenode_pA_Tn5_F10_P9_R1",
                  "H3K27ac_Abcam_Tn5_F6_P7_R1",
                  "H3K27ac_Abcam_Tn5_F10_P7_R1",
                  "H3K27ac_Abcam_pA_Tn5_F6_P9_R2",
                  "H3K27ac_Abcam_pA_Tn5_F6_P9_R1",
                  "H3K27ac_Abcam_pA_Tn5_F10_P9_R1",
                  "H3K27ac_Abcam_pA_Tn5_F10_P6_R1")
cutandrun_list <- c("cutandrun")
cutandtag_list <- c("cutandtag_withdup",
                    "cutandtag_dedup")
encode_list <- c("ENCODE_Broad")



df <- NULL
for (i in seq_len(length(peaklist))){
    sample <- names(peaklist)[i]
    if (sample %in% tip_seq_list) {
        tech <- "TIP-seq"
    } else if (sample %in% cutandrun_list) {
        tech <- "CUT&RUN"
    } else if (sample %in% cutandtag_list) {
        tech <- "CUT&Tag"
    } else if (sample %in% encode_list) {
        tech <- "ENCODE"
    }
    width <- GenomicRanges::width(peaklist[[i]])
    width_df <- data.frame(sample, tech, width)
    df <- rbind(df, width_df)
}
df$sample <- factor(df$sample, levels = rev(c("H3K27ac_Diagenode_pA_Tn5_F10_P9_R1",
                                              "H3K27ac_Abcam_Tn5_F6_P7_R1",
                                              "H3K27ac_Abcam_Tn5_F10_P7_R1",
                                              "H3K27ac_Abcam_pA_Tn5_F6_P9_R2",
                                              "H3K27ac_Abcam_pA_Tn5_F6_P9_R1",
                                              "H3K27ac_Abcam_pA_Tn5_F10_P9_R1",
                                              "H3K27ac_Abcam_pA_Tn5_F10_P6_R1",
                                              "cutandtag_withdup",
                                              "cutandtag_dedup",
                                              "cutandrun",
                                              "ENCODE_Broad")))
df$tech <- factor(df$tech, levels = c("ENCODE", "CUT&RUN", "CUT&Tag", "TIP-seq"))

### Create Boxplot ###
remove(P)
P <- 
    ggplot(df, aes(x = sample, y = width)) + 
    geom_boxplot(aes(color=tech), outlier.shape = NA) +
    scale_y_continuous(
        limits = quantile(df$width, c(0, 0.9))
    ) +
    # geom_violin(aes(color=sample)) +
    theme_light() + 
    theme(legend.title = element_blank()) +
    # geom_point(aes(color=Category),size=0.01) +
    # facet_grid(Histone_Mark~Fragmentation_Enzyme,margins=TRUE) +
    theme(axis.text.x = element_text(angle = 60, hjust = 1,vjust = 1)) +
    theme(axis.text = element_text(size = 15)) +
    theme(axis.title = element_text(size = 15)) +
    theme(plot.title = element_text(size = 20)) +
    theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") + 
    labs(
        # title = "Fragments size distribution",
        # subtitle = "Bulk TIP-seq",
        #tag = "",
        #caption = "",
        x = "",
        y = "Peak Width (bp)"
    )


show(P)
# 1000 800












peaklist <- list(S_8_R1_Cell_Signaling_Tn5_F6_P7,
                 S_10_R1_Cell_Signaling_Tn5_F10_P7,
                 S_3_R1_Cell_Signaling_pA_Tn5_F10_P9,
                 S_5_R1_Cell_Signaling_pA_Tn5_F10_P6,
                 cutandtag_withdup,
                 cutandtag_dedup,
                 cutandrun,
                 ENCODE_Broad,
                 ENCODE_H3K27me3_USC)

names(peaklist) <- c("H3K27me3_Cell_Signaling_Tn5_F6_P7_R1",
                     "H3K27me3_Cell_Signaling_Tn5_F10_P7_R1",
                     "H3K27me3_Cell_Signaling_pA_Tn5_F10_P9_R1",
                     "H3K27me3_Cell_Signaling_pA_Tn5_F10_P6_R1",
                     "cutandtag_withdup",
                     "cutandtag_dedup",
                     "cutandrun",
                     "ENCODE_Broad",
                     "ENCODE_USC")



tip_seq_list <- c("H3K27me3_Cell_Signaling_Tn5_F6_P7_R1",
                  "H3K27me3_Cell_Signaling_Tn5_F10_P7_R1",
                  "H3K27me3_Cell_Signaling_pA_Tn5_F10_P9_R1",
                  "H3K27me3_Cell_Signaling_pA_Tn5_F10_P6_R1")


cutandrun_list <- c("cutandrun")
cutandtag_list <- c("cutandtag_withdup",
                    "cutandtag_dedup")
encode_list <- c("ENCODE_Broad",
                 "ENCODE_USC")



df <- NULL
for (i in seq_len(length(peaklist))){
    sample <- names(peaklist)[i]
    if (sample %in% tip_seq_list) {
        tech <- "TIP-seq"
    } else if (sample %in% cutandrun_list) {
        tech <- "CUT&RUN"
    } else if (sample %in% cutandtag_list) {
        tech <- "CUT&Tag"
    } else if (sample %in% encode_list) {
        tech <- "ENCODE"
    }
    width <- GenomicRanges::width(peaklist[[i]])
    width_df <- data.frame(sample, tech, width)
    df <- rbind(df, width_df)
}
df$sample <- factor(df$sample, levels = rev(c("H3K27me3_Cell_Signaling_Tn5_F6_P7_R1",
                                              "H3K27me3_Cell_Signaling_Tn5_F10_P7_R1",
                                              "H3K27me3_Cell_Signaling_pA_Tn5_F10_P9_R1",
                                              "H3K27me3_Cell_Signaling_pA_Tn5_F10_P6_R1",
                                              "cutandtag_withdup",
                                              "cutandtag_dedup",
                                              "cutandrun",
                                              "ENCODE_Broad",
                                              "ENCODE_USC")))
df$tech <- factor(df$tech, levels = c("ENCODE", "CUT&RUN", "CUT&Tag", "TIP-seq"))

### Create Boxplot ###
remove(P)
P <- ggplot(df, aes(x = sample, y = width)) + 
    geom_boxplot(aes(color=tech), outlier.shape = NA) +
    scale_y_continuous(
        limits = quantile(df$width, c(0, 0.9))
    ) +
    # geom_violin(aes(color=sample)) +
    theme_light() + 
    theme(axis.text.x = element_text(angle = 60, hjust = 1,vjust = 1)) +
    theme(axis.text = element_text(size = 15)) +
    theme(axis.title = element_text(size = 15)) +
    theme(plot.title = element_text(size = 20)) +
    theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") + 
    # geom_point(aes(color=Category),size=0.01) +
    theme(axis.text.x = element_text(angle = 60, hjust = 1, vjust = 1)) +
    # facet_grid(Histone_Mark~Fragmentation_Enzyme,margins=TRUE) +
    labs(
        # title = "Fragments size distribution",
        # subtitle = "Bulk TIP-seq",
        #tag = "",
        #caption = "",
        x = "",
        y = "Peak Width (bp)"
    )


show(P)
# 1000 800


# single cell

peaklist <- list(scTS_1_39_R1,
                 scTS_1_57_R1,
                 scTS_1_2_R1,
                 scTS_1_60_R1,
                 scTS_1_63_R1,
                 scTS_1_43_R1,
                 scTS_1_61_R1,
                 scTS_1_42_R1,
                 scTS_1_77_R1,
                 scTS_1_5_R1)

names(peaklist) <- c("H3K27ac_scTIP_Top01",
                     "H3K27ac_scTIP_Top02",
                     "H3K27ac_scTIP_Top03",
                     "H3K27ac_scTIP_Top04",
                     "H3K27ac_scTIP_Top05",
                     "H3K27ac_scTIP_Top06",
                     "H3K27ac_scTIP_Top07",
                     "H3K27ac_scTIP_Top08",
                     "H3K27ac_scTIP_Top09",
                     "H3K27ac_scTIP_Top10")

df <- NULL
for (i in seq_len(length(peaklist))){
    sample <- names(peaklist)[i]
    width <- GenomicRanges::width(peaklist[[i]])
    width_df <- data.frame(sample, width)
    df <- rbind(df, width_df)
}

### Create Boxplot ###
remove(P)
P <- ggplot(df, aes(x = sample, y = width)) + 
    geom_boxplot(fill="steelblue", outlier.shape = NA) +
    scale_y_continuous(
        limits = quantile(df$width, c(0, 0.9))
    ) +
    # geom_violin(aes(color=sample)) +
    theme_light() + 
    theme(legend.title = element_blank()) +
    # geom_point(aes(color=Category),size=0.01) +
    theme(axis.text.x = element_text(angle = 60, hjust = 1,vjust = 1)) +
    theme(axis.text = element_text(size = 15)) +
    theme(axis.title = element_text(size = 15)) +
    theme(plot.title = element_text(size = 20)) +
    theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") + 
    scale_y_continuous(
        limits=c(-50,450),
        breaks = seq(0,400,100),
        expand = c(0,10)
    ) + 
    # facet_grid(Histone_Mark~Fragmentation_Enzyme,margins=TRUE) +
    labs(
        # title = "Fragments size distribution",
        # subtitle = "Bulk TIP-seq",
        #tag = "",
        #caption = "",
        x = "",
        y = "Peak Width (bp)"
    )


show(P)
# 1000 800






# FRiP

filtered_info_dup_bulk <- info_duplication_bulk[,c("Sample", "histone_mark", "FRiP")]
filtered_info_dup_bulk$FRiP_Percent <- round(filtered_info_dup_bulk$FRiP * 100,2)
filtered_info_dup_bulk <- filtered_info_dup_bulk[-c(1,5,9),]

P_frip <- ggplot(filtered_info_dup_bulk, aes(x=Sample, y=FRiP_Percent, fill=histone_mark)) +
    geom_bar(stat="identity", width = 0.6) +
    # geom_text(aes(label=FRiP_Percent), vjust=-1, size=3.5) +
    scale_y_continuous(
        limits=c(0,100),
        breaks = seq(0,100,20),
        expand = c(0,10)) + 
    theme_light() + 
    theme(axis.text.x = element_text(angle = 70, hjust = 1,vjust = 1)) +
    theme(axis.text = element_text(size = 15)) +
    theme(axis.title = element_text(size = 15)) +
    theme(plot.title = element_text(size = 20)) +
    theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") + 
    # facet_grid(Histone_Mark~Fragmentation_Enzyme,margins=TRUE) +
    labs(
        # title = "Fragments size distribution",
        # subtitle = "Bulk TIP-seq",
        #tag = "",
        #caption = "",
        x = "",
        y = "Fraction of reads in peaks (FRiP) (%)"
    )

show(P_frip)




# duplication 

# NFR 
info_duplication_bulk$NRF <- info_duplication_bulk$NRF * 100

P_NRF <- 
    ggplot(info_duplication_bulk, aes(x = Sample, y = NRF, fill = histone_mark)) + 
    geom_bar(stat="identity", width = 0.6) + 
    theme_light() + 
    # geom_point(aes(color=Category),size=0.01) +
    # geom_text(aes(label=NRF), vjust=-1, size=3.5) + 
    theme(axis.text.x = element_text(angle = 70, hjust = 1,vjust = 1)) +
    theme(axis.text = element_text(size = 15)) +
    theme(axis.title = element_text(size = 15)) +
    theme(plot.title = element_text(size = 20)) +
    theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") + 
    scale_y_continuous(
        limits=c(0,100),
        breaks = seq(0,100,20),
        expand = c(0,10)) + 
    # facet_grid(Histone_Mark~Fragmentation_Enzyme,margins=TRUE) +
    labs(
        # title = "Fragments size distribution",
        # subtitle = "Bulk TIP-seq",
        #tag = "",
        #caption = "",
        x = "",
        y = "Non-Redundant Fraction (NRF) (%)"
    )

show(P_NRF)

info_duplication_bulk <- read.csv("/Users/xindong/Downloads/TIP_git/info_TIP_seq/duplication_bulk.csv", header = TRUE)
library(ggplot2)
# dup rate
info_duplication_bulk$Duplication_rate <- round(info_duplication_bulk$Duplication_rate * 100, 2)
info_duplication_bulk$fragmentation_time <- factor(info_duplication_bulk$fragmentation_time, levels = c("6 min", "10 min"))

P_duprate_bulk <- 
    ggplot(info_duplication_bulk, aes(x = Sample, y = Duplication_rate, fill = histone_mark)) +
    geom_bar(stat = 'identity', position = 'dodge') +
    facet_grid(PCR_cycles~fragmentation_time,margins=FALSE) +
    theme(strip.text.x = element_text(size = 20)) + 
    theme(strip.text.y = element_text(size = 20)) + 
    theme_light() + 
    theme(axis.text.x = element_blank()) +
    theme(axis.text = element_text(size = 15)) +
    theme(axis.title = element_text(size = 15)) +
    theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") + 
    labs(
        # title = "Peak Number",
        # subtitle = "A549 & K562",
        #tag = "",
        #caption = "",
        x = "",
        y = "Duplication Rate (%)"
    )

show(P_duprate_bulk)



P_dup_bulk_enzyme <- 
    ggplot(info_duplication_bulk, aes(x = Sample, y = Duplication_rate, fill = fragmentation_enzyme)) +
    geom_bar(stat = 'identity', position = 'dodge', width = 0.6) +
    scale_fill_manual(values=c("bisque1","cornsilk3")) +
    # facet_wrap(~fragmentation_enzyme) +
    theme_light() + 
    theme(axis.text.x = element_text(angle = 70, hjust = 1,vjust = 1)) +
    theme(axis.text = element_text(size = 15)) +
    theme(axis.title = element_text(size = 15)) +
    theme(plot.title = element_text(size = 20)) +
    theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") + 
    labs(
        # title = "Peak Number",
        # subtitle = "A549 & K562",
        #tag = "",
        #caption = "",
        x = "",
        y = "Duplication Rate (%)"
    )

show(P_dup_bulk_enzyme)


# duplication distribute

longinfo_fragment_dup_bulk <- melt(info_duplication_bulk, id.vars=c("Sample","histone_mark","antibody_company","fragmentation_enzyme","fragmentation_time","PCR_cycles"), measure.vars=c("Unique_Pairs","Duplicate_Pairs_Optical","Duplicate_Pairs_Nonoptical","Unmapped"), variable.name="Duplication_Type", value.name="Numbers")

longinfo_fragment_dup_bulk$Duplication_Type <- factor(longinfo_fragment_dup_bulk$Duplication_Type, levels = c("Unmapped","Duplicate_Pairs_Nonoptical","Duplicate_Pairs_Optical","Unique_Pairs"))

longinfo_fragment_dup_bulk$Dup_Numbers <- longinfo_fragment_dup_bulk$Numbers / 1000000

P_duplication_bulk <- 
    ggplot(longinfo_fragment_dup_bulk, aes(x = Sample, y = Dup_Numbers, group = Duplication_Type)) + 
    geom_col(aes(fill=Duplication_Type)) + 
    facet_grid(PCR_cycles~fragmentation_time,margins=FALSE) + 
    theme(strip.text.x = element_text(size = 10)) + 
    theme(strip.text.y = element_text(size = 10)) + 
    theme_light() + 
    theme(axis.text.x = element_text(angle = 80, hjust = 1,vjust = 1)) +
    theme(axis.text = element_text(size = 12)) +
    theme(axis.title = element_text(size = 15)) +
    theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") + 
    labs(
        # title = "Duplication",
        # subtitle = "Bulk TIP-seq",
        #tag = "",
        #caption = "",
        x = "",
        y = "Duplication Numbers (million)"
    )
# facet_grid(fragmentation_time~PCR_cycles,margins=FALSE)


show(P_duplication_bulk)



# single cell
info_duplication_sc <- read.csv("/Users/xindong/Downloads/tip_seq/info_tip_seq/duplication_sc_top10.csv", header = TRUE)

# NFR 
info_duplication_sc$NRF <- round(info_duplication_sc$NRF * 100, 2)

P_NRF <- ggplot(info_duplication_sc, aes(x = Sample, y = NRF)) + 
    geom_bar(stat="identity", width = 0.6, fill = "steelblue") + 
    theme_light() + 
    # geom_point(aes(color=Category),size=0.01) +
    # geom_text(aes(label=NRF), vjust=-1, size=3.5) + 
    theme(axis.text.x = element_text(angle = 60, hjust = 1,vjust = 1)) +
    theme(axis.text = element_text(size = 15)) +
    theme(axis.title = element_text(size = 15)) +
    theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    scale_y_continuous(
        limits=c(0,100),
        breaks = seq(0,100,20),
        expand = c(0,10)
    ) + 
    # facet_grid(Histone_Mark~Fragmentation_Enzyme,margins=TRUE) +
    labs(
        # title = "Fragments size distribution",
        # subtitle = "Bulk TIP-seq",
        #tag = "",
        #caption = "",
        x = "",
        y = "Non-Redundant Fraction (NRF) (%)"
    )

show(P_NRF)

# dup rate
info_duplication_sc$Duplication_rate <- info_duplication_sc$Duplication_rate * 100

P_duprate_sc <- 
    ggplot(info_duplication_sc, aes(x = Sample, y = Duplication_rate)) +
    geom_bar(stat = 'identity', position = 'dodge', fill = "steelblue", width = 0.6) +
    theme(legend.position='none') + 
    theme_light() + 
    theme(axis.text.x = element_text(angle = 60, hjust = 1,vjust = 1)) +
    theme(axis.text = element_text(size = 15)) +
    theme(axis.title = element_text(size = 15)) +
    theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    scale_y_continuous(
        limits=c(0,20),
        breaks = seq(0,20,5)
    ) + 
    labs(
        # title = "Peak Number",
        # subtitle = "A549 & K562",
        #tag = "",
        #caption = "",
        x = "",
        y = "Duplication Rate (%)"
    )

show(P_duprate_sc)

# duplication distribute

longinfo_fragment_dup_sc <- melt(info_duplication_sc, id.vars=c("Sample","Category"), measure.vars=c("Unique_pairs_reads","optical_duplicates_reads","non_optical_duplicates_reads","dedup_unmapped_reads"), variable.name="Duplication", value.name="Numbers")
longinfo_fragment_dup_sc$Numbers <- longinfo_fragment_dup_sc$Numbers / 2

for (i in 1:nrow(longinfo_fragment_dup_sc)){
    if (longinfo_fragment_dup_sc$Duplication[i] == "Unique_pairs_reads"){
        longinfo_fragment_dup_sc$Duplication_Type[i] <- "Unique_Pairs"
    } else if (longinfo_fragment_dup_sc$Duplication[i] == "optical_duplicates_reads"){
        longinfo_fragment_dup_sc$Duplication_Type[i] <- "Duplicate_Pairs_Optical"
    } else if (longinfo_fragment_dup_sc$Duplication[i] == "non_optical_duplicates_reads"){
        longinfo_fragment_dup_sc$Duplication_Type[i] <- "Duplicate_Pairs_Nonoptical"
    } else if (longinfo_fragment_dup_sc$Duplication[i] == "dedup_unmapped_reads"){
        longinfo_fragment_dup_sc$Duplication_Type[i] <- "Unmapped"
    }
}
     
longinfo_fragment_dup_sc$Duplication_Type <- factor(longinfo_fragment_dup_sc$Duplication_Type, levels = c("Unmapped","Duplicate_Pairs_Nonoptical","Duplicate_Pairs_Optical","Unique_Pairs"))

longinfo_fragment_dup_sc$Dup_Numbers <- longinfo_fragment_dup_sc$Numbers / 1000000

P_duplication_sc <- ggplot(longinfo_fragment_dup_sc, aes(x = Sample, y = Dup_Numbers, group = Duplication_Type)) + 
    geom_col(aes(fill=Duplication_Type), width = 0.6) + 
    # facet_grid(PCR_cycles~fragmentation_time,margins=FALSE) + 
    theme_light() + 
    theme(axis.text.x = element_text(angle = 60, hjust = 1,vjust = 1)) +
    theme(axis.text = element_text(size = 15)) +
    theme(axis.title = element_text(size = 15)) +
    theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    labs(
        # title = "Duplication",
        # subtitle = "Bulk TIP-seq",
        #tag = "",
        #caption = "",
        x = "",
        y = "Duplication Numbers (million)"
    )
# facet_grid(fragmentation_time~PCR_cycles,margins=FALSE)


show(P_duplication_sc)







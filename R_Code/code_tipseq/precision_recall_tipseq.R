library(EpiCompare)
library(ggplot2)
library(reshape2)
library(viridis)

calculate_overlap_func <- function(peaklist,
                              interact=TRUE){
    
    ### Calculate Overlap Percentage ###
    overlap_list <- list() # empty list
    for(mainfile in peaklist){
        percent_list <- c()
        for(subfile in peaklist){
            # overlapping peaks
            overlap <- IRanges::subsetByOverlaps(x = subfile, ranges = mainfile)
            # calculate percentage overlap
            percent <- length(overlap)/length(subfile)*100
            percent_list <- c(percent_list, percent)
        }
        percent_list <- list(percent_list)
        overlap_list <- c(overlap_list, percent_list)
    }
    
    ### Create Matrix ###
    overlap_matrix <- matrix(unlist(overlap_list),
                             ncol = max(lengths(overlap_list)),
                             byrow = FALSE)
    colnames(overlap_matrix) <- names(peaklist) # set colnames as sample names
    rownames(overlap_matrix) <- names(peaklist) # set rownames as sample names
    
    return(overlap_matrix)
}



# H3K27ac

peaklist_ac <- list(ENCODE_H3K27ac_Broad,
                    cutandtag_withdup,
                    cutandtag_dedup,
                    cutandrun,
                    S_2_R1_Diagenode_pA_Tn5_F10_P9,
                    S_9_R1_Abcam_Tn5_F6_P7,
                    S_11_R1_Abcam_Tn5_F10_P7,
                    S_1_R2_Abcam_pA_Tn5_F6_P9,
                    S_1_R1_Abcam_pA_Tn5_F6_P9,
                    S_4_R1_Abcam_pA_Tn5_F10_P9,
                    S_4_R1_Abcam_pA_Tn5_F10_P6,
                    scTS_1_39_R1,
                    scTS_1_57_R1,
                    scTS_1_2_R1,
                    scTS_1_60_R1,
                    scTS_1_63_R1,
                    scTS_1_43_R1,
                    scTS_1_61_R1,
                    scTS_1_42_R1,
                    scTS_1_77_R1,
                    scTS_1_5_R1)

names(peaklist_ac) <- c("ENCODE_Broad",
                        "cutandtag_withdup",
                        "cutandtag_dedup",
                        "cutandrun",
                        "H3K27ac_Diagenode_pA_Tn5_F10_P9_R1",
                        "H3K27ac_Abcam_Tn5_F6_P7_R1",
                        "H3K27ac_Abcam_Tn5_F10_P7_R1",
                        "H3K27ac_Abcam_pA_Tn5_F6_P9_R2",
                        "H3K27ac_Abcam_pA_Tn5_F6_P9_R1",
                        "H3K27ac_Abcam_pA_Tn5_F10_P9_R1",
                        "H3K27ac_Abcam_pA_Tn5_F10_P6_R1",
                        "H3K27ac_scTIP_Top01",
                        "H3K27ac_scTIP_Top02",
                        "H3K27ac_scTIP_Top03",
                        "H3K27ac_scTIP_Top04",
                        "H3K27ac_scTIP_Top05",
                        "H3K27ac_scTIP_Top06",
                        "H3K27ac_scTIP_Top07",
                        "H3K27ac_scTIP_Top08",
                        "H3K27ac_scTIP_Top09",
                        "H3K27ac_scTIP_Top10")

ac_overlap <- calculate_overlap_func(peaklist_ac)
# heatmap <- EpiCompare::overlap_heatmap(peaklist_ac)
# show(heatmap)
# write.csv(ac_overlap,"/Users/xindong/Downloads/tip_seq/info_tip_seq/overlap_H3K27ac.csv", row.names = TRUE)

## compare with reference 
# bulk

ac_bulkinref <- as.data.frame(matrix(nrow=0,ncol=3))
names(ac_bulkinref) <- c("Sample","Precision","Recall")

for (i in 2:11){
    index <- i-1
    ac_bulkinref[index,"Sample"] <- rownames(ac_overlap)[i]
    ac_bulkinref[index, "Recall"] <- ac_overlap[1,i]
    ac_bulkinref[index, "Precision"] <- ac_overlap[i,1]
}

ac_bulkinref$F1_Score <- 2 * ac_bulkinref$Precision * ac_bulkinref$Recall / (ac_bulkinref$Precision + ac_bulkinref$Recall)

# between tip seq samples
ac_inter_tipseq <- as.data.frame(matrix(nrow=0,ncol=3))
names(ac_inter_tipseq) <- c("Sample","Precision","Recall")

remove(rg)
rg <- c(5,11)
for (index_col in (rg[1]+1):rg[2]){
    for (index_row in rg[1]:(index_col - 1)){
        comparison_names <- paste(colnames(ac_overlap)[index_col],rownames(ac_overlap)[index_row],sep = "_in_")
        ac_inter_tipseq[comparison_names,"Sample"] <- comparison_names
        ac_inter_tipseq[comparison_names,"Recall"] <- ac_overlap[index_row,index_col]
        ac_inter_tipseq[comparison_names,"Precision"] <- ac_overlap[index_col,index_row]
    }
}
ac_inter_tipseq$F1_Score <- 2 * ac_inter_tipseq$Precision * ac_inter_tipseq$Recall / (ac_inter_tipseq$Precision + ac_inter_tipseq$Recall)

# between tip seq and cut
ac_tipincut <- as.data.frame(matrix(nrow=0,ncol=3))
names(ac_tipincut) <- c("Sample","Precision","Recall")
rg <- c(5,11,2,4)
for (index_col in (rg[1]):rg[2]){
    for (index_row in rg[3]:rg[4]){
        comparison_names <- paste(colnames(ac_overlap)[index_col],rownames(ac_overlap)[index_row],sep = "_in_")
        ac_tipincut[comparison_names,"Sample"] <- comparison_names
        ac_tipincut[comparison_names,"Recall"] <- ac_overlap[index_row,index_col]
        ac_tipincut[comparison_names,"Precision"] <- ac_overlap[index_col,index_row]
    }
}
ac_tipincut$F1_Score <- 2 * ac_tipincut$Precision * ac_tipincut$Recall / (ac_tipincut$Precision + ac_tipincut$Recall)

# sc in ref

ac_scinref <- as.data.frame(matrix(nrow=0,ncol=3))
names(ac_scinref) <- c("Sample","Precision","Recall")

for (i in 12:21){
    index <- i-11
    ac_scinref[index,"Sample"] <- rownames(ac_overlap)[i]
    ac_scinref[index, "Recall"] <- ac_overlap[1,i]
    ac_scinref[index, "Precision"] <- ac_overlap[i,1]
}

ac_scinref$F1_Score <- 2 * ac_scinref$Precision * ac_scinref$Recall / (ac_scinref$Precision + ac_scinref$Recall)

# H3K27ac bulk in ref
long_ac_bulkinref <- melt(ac_bulkinref, id.vars=c("Sample"), measure.vars=c("Precision","Recall","F1_Score"), variable.name="Type", value.name="Percentage")

# inter single cell
ac_inter_sc <- as.data.frame(matrix(nrow=0,ncol=3))
names(ac_inter_sc) <- c("Sample","Precision","Recall")
remove(rg)
rg <- c(12,21)
for (index_col in (rg[1]+1):rg[2]){
    for (index_row in rg[1]:(index_col - 1)){
        comparison_names <- paste(colnames(ac_overlap)[index_col],rownames(ac_overlap)[index_row],sep = "_in_")
        ac_inter_sc[comparison_names,"Sample"] <- comparison_names
        ac_inter_sc[comparison_names,"Recall"] <- ac_overlap[index_row,index_col]
        ac_inter_sc[comparison_names,"Precision"] <- ac_overlap[index_col,index_row]
    }
}
ac_inter_sc$F1_Score <- 2 * ac_inter_sc$Precision * ac_inter_sc$Recall / (ac_inter_sc$Precision + ac_inter_sc$Recall)


# inter bulk and single tip seq
ac_scinbulk <- as.data.frame(matrix(nrow=0,ncol=3))
names(ac_scinbulk) <- c("Sample","Precision","Recall")
remove(rg)
rg <- c(12,21,5,11)
for (index_col in (rg[1]):rg[2]){
    for (index_row in rg[3]:rg[4]){
        comparison_names <- paste(colnames(ac_overlap)[index_col],rownames(ac_overlap)[index_row],sep = "_in_")
        ac_scinbulk[comparison_names,"Sample"] <- comparison_names
        ac_scinbulk[comparison_names,"Recall"] <- ac_overlap[index_row,index_col]
        ac_scinbulk[comparison_names,"Precision"] <- ac_overlap[index_col,index_row]
    }
}
ac_scinbulk$F1_Score <- 2 * ac_scinbulk$Precision * ac_scinbulk$Recall / (ac_scinbulk$Precision + ac_scinbulk$Recall)





# H3K27me3

peaklist_me3 <- list(ENCODE_H3K27me3_USC,
                     ENCODE_Broad,
                     cutandrun,
                     cutandtag_withdup,
                     cutandtag_dedup,
                     S_8_R1_Cell_Signaling_Tn5_F6_P7,
                     S_10_R1_Cell_Signaling_Tn5_F10_P7,
                     S_3_R1_Cell_Signaling_pA_Tn5_F10_P9,
                     S_5_R1_Cell_Signaling_pA_Tn5_F10_P6
                     )

names(peaklist_me3) <- c("ENCODE_USC",
                         "ENCODE_Broad",
                         "cutandrun",
                         "cutandtag_withdup",
                         "cutandtag_dedup",
                         "H3K27me3_Cell_Signaling_Tn5_F6_P7_R1",
                         "H3K27me3_Cell_Signaling_Tn5_F10_P7_R1",
                         "H3K27me3_Cell_Signaling_pA_Tn5_F10_P9_R1",
                         "H3K27me3_Cell_Signaling_pA_Tn5_F10_P6_R1"
                         )

me3_overlap <- calculate_overlap_func(peaklist_me3)
# heatmap <- EpiCompare::overlap_heatmap(peaklist_me3)
# show(heatmap)
# write.csv(ac_overlap,"/Users/xindong/Downloads/tip_seq/info_tip_seq/overlap_H3K27me3.csv", row.names = TRUE)

## compare with reference 
# bulk

me3_bulkinref <- as.data.frame(matrix(nrow=0,ncol=3))
names(me3_bulkinref) <- c("Sample","Precision","Recall")

for (i in 2:9){
    index <- i-1
    me3_bulkinref[index,"Sample"] <- rownames(me3_overlap)[i]
    me3_bulkinref[index, "Recall"] <- me3_overlap[1,i]
    me3_bulkinref[index, "Precision"] <- me3_overlap[i,1]
}

me3_bulkinref$F1_Score <- 2 * me3_bulkinref$Precision * me3_bulkinref$Recall / (me3_bulkinref$Precision + me3_bulkinref$Recall)

# between tip seq samples
me3_inter_tipseq <- as.data.frame(matrix(nrow=0,ncol=3))
names(me3_inter_tipseq) <- c("Sample","Precision","Recall")
remove(rg)
rg <- c(6,9)
for (index_col in (rg[1]+1):rg[2]){
    for (index_row in rg[1]:(index_col - 1)){
        comparison_names <- paste(colnames(me3_overlap)[index_col],rownames(me3_overlap)[index_row],sep = "_in_")
        me3_inter_tipseq[comparison_names,"Sample"] <- comparison_names
        me3_inter_tipseq[comparison_names,"Recall"] <- me3_overlap[index_row,index_col]
        me3_inter_tipseq[comparison_names,"Precision"] <- me3_overlap[index_col,index_row]
    }
}

me3_inter_tipseq$F1_Score <- 2 * me3_inter_tipseq$Precision * me3_inter_tipseq$Recall / (me3_inter_tipseq$Precision + me3_inter_tipseq$Recall)

# between tip seq and cut
me3_tipincut <- as.data.frame(matrix(nrow=0,ncol=3))
names(me3_tipincut) <- c("Sample","Precision","Recall")
rg <- c(6,9,3,5)
for (index_col in (rg[1]):rg[2]){
    for (index_row in rg[3]:rg[4]){
        comparison_names <- paste(colnames(me3_overlap)[index_col],rownames(me3_overlap)[index_row],sep = "_in_")
        me3_tipincut[comparison_names,"Sample"] <- comparison_names
        me3_tipincut[comparison_names,"Recall"] <- me3_overlap[index_row,index_col]
        me3_tipincut[comparison_names,"Precision"] <- me3_overlap[index_col,index_row]
    }
}
me3_tipincut$F1_Score <- 2 * me3_tipincut$Precision * me3_tipincut$Recall / (me3_tipincut$Precision + me3_tipincut$Recall)


# Plot

# H3K27ac bulk in ref
long_ac_bulkinref <- melt(ac_bulkinref, id.vars=c("Sample"), measure.vars=c("Precision","Recall","F1_Score"), variable.name="Type", value.name="Percentage")

P_ac_bulkinref <- 
    ggplot(long_ac_bulkinref, aes(Sample, Percentage)) +
    geom_bar(aes(fill = Type), width = 0.7, position = position_dodge(width = 0.75), stat = "identity") +
    scale_fill_viridis(labels = c("Precision", "Recall", "F1_Score"), discrete = TRUE, begin = 0.15, end = 0.7, alpha = 0.7) +
    theme_light() + 
    ggtitle("") +
    # xlab("") +
    ylab("Percentage") +
    scale_y_continuous(
        limits=c(0,100),
        breaks = seq(0,100,20),
        expand = c(0,10)
    ) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1,vjust = 1)) +
    theme(axis.text = element_text(size = 15)) +
    theme(axis.title = element_text(size = 15)) +
    theme(plot.title = element_text(size = 20)) +
    theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") 


P_ac_bulkinref


# H3K27ac single cell in bulk

long_ac_scinref <- melt(ac_scinref, id.vars=c("Sample"), measure.vars=c("Precision","Recall","F1_Score"), variable.name="Type", value.name="Percentage")

P_ac_scinref <- 
    ggplot(long_ac_scinref, aes(Sample, Percentage)) +
    geom_bar(aes(fill = Type), width = 0.7, position = position_dodge(width = 0.75), stat = "identity") +
    scale_fill_viridis(labels = c("Precision", "Recall", "F1_Score"), discrete = TRUE, begin = 0.15, end = 0.7, alpha = 0.7) +
    theme_light() + 
    ggtitle("") +
    # xlab("") +
    ylab("Percentage") +
    scale_y_continuous(
        limits=c(0,100),
        breaks = seq(0,100,20),
        expand = c(0,10)
    ) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1,vjust = 1)) +
    theme(axis.text = element_text(size = 15)) +
    theme(axis.title = element_text(size = 15)) +
    theme(plot.title = element_text(size = 20)) +
    theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") 


P_ac_scinref


# H3K27me3 bulk in ref
me3_bulkinref$Sample <- factor(me3_bulkinref$Sample,me3_bulkinref$Sample)

long_me3_bulkinref <- melt(me3_bulkinref, id.vars=c("Sample"), measure.vars=c("Precision","Recall","F1_Score"), variable.name="Type", value.name="Percentage")

P_me3_bulkinref <- 
    ggplot(long_me3_bulkinref, aes(Sample, Percentage)) +
    geom_bar(aes(fill = Type), width = 0.7, position = position_dodge(width = 0.75), stat = "identity") +
    scale_fill_viridis(labels = c("Precision", "Recall", "F1_Score"), discrete = TRUE, begin = 0.15, end = 0.7, alpha = 0.7) +
    theme_light() + 
    ggtitle("") +
    # xlab("") +
    ylab("Percentage") +
    scale_y_continuous(
        limits=c(0,100),
        breaks = seq(0,100,20),
        expand = c(0,10)
    ) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1,vjust = 1)) +
    theme(axis.text = element_text(size = 15)) +
    theme(axis.title = element_text(size = 15)) +
    theme(plot.title = element_text(size = 20)) +
    theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") 


P_me3_bulkinref



# H3K27ac single cell and bulk
long_ac_scinbulk <- melt(ac_scinbulk, id.vars=c("Sample"), measure.vars=c("Precision","Recall","F1_Score"), variable.name="Type", value.name="Percentage")

P_ac_scinbulk <- 
    ggplot(long_ac_scinbulk, aes(Sample, Percentage)) +
    geom_bar(aes(fill = Type), width = 0.7, position = position_dodge(width = 0.75), stat = "identity") +
    scale_fill_viridis(labels = c("Precision", "Recall", "F1_Score"), discrete = TRUE, begin = 0.15, end = 0.7, alpha = 0.7) +
    theme_light() + 
    ggtitle("") +
    # xlab("") +
    ylab("Percentage") +
    scale_y_continuous(
        limits=c(0,100),
        breaks = seq(0,100,20),
        expand = c(0,10)
    ) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1,vjust = 1)) +
    # theme(axis.text = element_text(size = 15)) +
    # theme(axis.title = element_text(size = 15)) +
    # theme(plot.title = element_text(size = 20)) +
    # theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") 


P_ac_scinbulk

# H3K27ac inter bulk tip seq

long_ac_inter_tipseq <- melt(ac_inter_tipseq, id.vars=c("Sample"), measure.vars=c("Precision","Recall","F1_Score"), variable.name="Type", value.name="Percentage")

P_ac_inter_tipseq <- 
    ggplot(long_ac_inter_tipseq, aes(Sample, Percentage)) +
    geom_bar(aes(fill = Type), width = 0.7, position = position_dodge(width = 0.75), stat = "identity") +
    scale_fill_viridis(labels = c("Precision", "Recall", "F1_Score"), discrete = TRUE, begin = 0.15, end = 0.7, alpha = 0.7) +
    theme_light() + 
    ggtitle("") +
    # xlab("") +
    ylab("Percentage") +
    scale_y_continuous(
        limits=c(0,100),
        breaks = seq(0,100,20),
        expand = c(0,10)
    ) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1,vjust = 1)) +
    # theme(axis.text = element_text(size = 15)) +
    # theme(axis.title = element_text(size = 15)) +
    # theme(plot.title = element_text(size = 20)) +
    # theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") 


P_ac_inter_tipseq

# ac tip in cut
long_ac_tipincut <- melt(ac_tipincut, id.vars=c("Sample"), measure.vars=c("Precision","Recall","F1_Score"), variable.name="Type", value.name="Percentage")

P_ac_tipincut <- 
    ggplot(long_ac_tipincut, aes(Sample, Percentage)) +
    geom_bar(aes(fill = Type), width = 0.7, position = position_dodge(width = 0.75), stat = "identity") +
    scale_fill_viridis(labels = c("Precision", "Recall", "F1_Score"), discrete = TRUE, begin = 0.15, end = 0.7, alpha = 0.7) +
    theme_light() + 
    ggtitle("") +
    # xlab("") +
    ylab("Percentage") +
    scale_y_continuous(
        limits=c(0,100),
        breaks = seq(0,100,20),
        expand = c(0,10)
    ) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1,vjust = 1)) +
    # theme(axis.text = element_text(size = 15)) +
    # theme(axis.title = element_text(size = 15)) +
    # theme(plot.title = element_text(size = 20)) +
    # theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") 


P_ac_tipincut

# ac inter sc

long_ac_inter_sc <- melt(ac_inter_sc, id.vars=c("Sample"), measure.vars=c("Precision","Recall","F1_Score"), variable.name="Type", value.name="Percentage")

P_ac_inter_sc <- 
    ggplot(long_ac_inter_sc, aes(Sample, Percentage)) +
    geom_bar(aes(fill = Type), width = 0.7, position = position_dodge(width = 0.75), stat = "identity") +
    scale_fill_viridis(labels = c("Precision", "Recall", "F1_Score"), discrete = TRUE, begin = 0.15, end = 0.7, alpha = 0.7) +
    theme_light() + 
    ggtitle("") +
    # xlab("") +
    ylab("Percentage") +
    scale_y_continuous(
        limits=c(0,100),
        breaks = seq(0,100,20),
        expand = c(0,10)
    ) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1,vjust = 1)) +
    # theme(axis.text = element_text(size = 15)) +
    # theme(axis.title = element_text(size = 15)) +
    # theme(plot.title = element_text(size = 20)) +
    # theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") 


P_ac_inter_sc

# me3 inter tip

long_me3_inter_tipseq <- melt(me3_inter_tipseq, id.vars=c("Sample"), measure.vars=c("Precision","Recall","F1_Score"), variable.name="Type", value.name="Percentage")

P_me3_inter_tipseq <- 
    ggplot(long_me3_inter_tipseq, aes(Sample, Percentage)) +
    geom_bar(aes(fill = Type), width = 0.7, position = position_dodge(width = 0.75), stat = "identity") +
    scale_fill_viridis(labels = c("Precision", "Recall", "F1_Score"), discrete = TRUE, begin = 0.15, end = 0.7, alpha = 0.7) +
    theme_light() + 
    ggtitle("") +
    # xlab("") +
    ylab("Percentage") +
    scale_y_continuous(
        limits=c(0,100),
        breaks = seq(0,100,20),
        expand = c(0,10)
    ) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1,vjust = 1)) +
    # theme(axis.text = element_text(size = 15)) +
    # theme(axis.title = element_text(size = 15)) +
    # theme(plot.title = element_text(size = 20)) +
    # theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") 


P_me3_inter_tipseq


# me3 tip in cut


long_me3_tipincut <- melt(me3_tipincut, id.vars=c("Sample"), measure.vars=c("Precision","Recall","F1_Score"), variable.name="Type", value.name="Percentage")

P_me3_tipincut <- 
    ggplot(long_me3_tipincut, aes(Sample, Percentage)) +
    geom_bar(aes(fill = Type), width = 0.7, position = position_dodge(width = 0.75), stat = "identity") +
    scale_fill_viridis(labels = c("Precision", "Recall", "F1_Score"), discrete = TRUE, begin = 0.15, end = 0.7, alpha = 0.7) +
    theme_light() + 
    ggtitle("") +
    # xlab("") +
    ylab("Percentage") +
    scale_y_continuous(
        limits=c(0,100),
        breaks = seq(0,100,20),
        expand = c(0,10)
    ) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1,vjust = 1)) +
    # theme(axis.text = element_text(size = 15)) +
    # theme(axis.title = element_text(size = 15)) +
    # theme(plot.title = element_text(size = 20)) +
    # theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") 


P_me3_tipincut



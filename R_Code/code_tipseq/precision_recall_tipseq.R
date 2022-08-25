library(EpiCompare)
library(ggplot2)

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

ac_bulk_ref <- as.data.frame(matrix(nrow=0,ncol=3))
names(ac_bulk_ref) <- c("Sample","Precision","Recall")

for (i in 2:11){
    index <- i-1
    ac_bulk_ref[index,"Sample"] <- rownames(ac_overlap)[i]
    ac_bulk_ref[index, "Recall"] <- round(ac_overlap[1,i],2)
    ac_bulk_ref[index, "Precision"] <- round(ac_overlap[i,1],2)
}

ac_bulk_ref$F1_Score <- round(2 * ac_bulk_ref$Precision * ac_bulk_ref$Recall / (ac_bulk_ref$Precision + ac_bulk_ref$Recall),2)

# between tip seq samples
inter_tipseq <- as.data.frame(matrix(nrow=0,ncol=3))
names(inter_tipseq) <- c("Sample","Precision","Recall")

remove(rg)
rg <- c(5,11)
for (index_col in (rg[1]+1):rg[2]){
    for (index_row in rg[1]:(index_col - 1)){
        comparison_names <- paste(colnames(ac_overlap)[index_col],rownames(ac_overlap)[index_row],sep = "_in_")
        inter_tipseq[comparison_names,"Sample"] <- comparison_names
        inter_tipseq[comparison_names,"Recall"] <- ac_overlap[index_row,index_col]
        inter_tipseq[comparison_names,"Precision"] <- ac_overlap[index_col,index_row]
    }
}

# between tip seq and cut
inter_cut_tip <- as.data.frame(matrix(nrow=0,ncol=3))
names(inter_cut_tip) <- c("Sample","Precision","Recall")
rg <- c(5,11,2,4)
for (index_col in (rg[1]):rg[2]){
    for (index_row in rg[3]:rg[4]){
        comparison_names <- paste(colnames(ac_overlap)[index_col],rownames(ac_overlap)[index_row],sep = "_in_")
        inter_cut_tip[comparison_names,"Sample"] <- comparison_names
        inter_cut_tip[comparison_names,"Recall"] <- ac_overlap[index_row,index_col]
        inter_cut_tip[comparison_names,"Precision"] <- ac_overlap[index_col,index_row]
    }
}

# inter single cell
inter_tipseq_sc <- as.data.frame(matrix(nrow=0,ncol=3))
names(inter_tipseq_sc) <- c("Sample","Precision","Recall")
remove(rg)
rg <- c(12,21)
for (index_col in (rg[1]+1):rg[2]){
    for (index_row in rg[1]:(index_col - 1)){
        comparison_names <- paste(colnames(ac_overlap)[index_col],rownames(ac_overlap)[index_row],sep = "_in_")
        inter_tipseq_sc[comparison_names,"Sample"] <- comparison_names
        inter_tipseq_sc[comparison_names,"Recall"] <- ac_overlap[index_row,index_col]
        inter_tipseq_sc[comparison_names,"Precision"] <- ac_overlap[index_col,index_row]
    }
}


# inter bulk and single tip seq
inter_bulk_sc <- as.data.frame(matrix(nrow=0,ncol=3))
names(inter_bulk_sc) <- c("Sample","Precision","Recall")
remove(rg)
rg <- c(12,21,5,11)
for (index_col in (rg[1]):rg[2]){
    for (index_row in rg[3]:rg[4]){
        comparison_names <- paste(colnames(ac_overlap)[index_col],rownames(ac_overlap)[index_row],sep = "_in_")
        inter_bulk_sc[comparison_names,"Sample"] <- comparison_names
        inter_bulk_sc[comparison_names,"Recall"] <- ac_overlap[index_row,index_col]
        inter_bulk_sc[comparison_names,"Precision"] <- ac_overlap[index_col,index_row]
    }
}








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

me3_bulk_ref <- as.data.frame(matrix(nrow=0,ncol=3))
names(me3_bulk_ref) <- c("Sample","Precision","Recall")

for (i in 6:9){
    index <- i-5
    me3_bulk_ref[index,"Sample"] <- rownames(ac_overlap)[i]
    me3_bulk_ref[index, "Recall"] <- round(ac_overlap[1,i],2)
    me3_bulk_ref[index, "Precision"] <- round(ac_overlap[i,1],2)
}

me3_bulk_ref$F1_Score <- round(2 * me3_bulk_ref$Precision * me3_bulk_ref$Recall / (me3_bulk_ref$Precision + me3_bulk_ref$Recall),2)

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

# between tip seq and cut
me3_inter_cut_tip <- as.data.frame(matrix(nrow=0,ncol=3))
names(me3_inter_cut_tip) <- c("Sample","Precision","Recall")
rg <- c(6,9,3,5)
for (index_col in (rg[1]):rg[2]){
    for (index_row in rg[3]:rg[4]){
        comparison_names <- paste(colnames(me3_overlap)[index_col],rownames(me3_overlap)[index_row],sep = "_in_")
        me3_inter_cut_tip[comparison_names,"Sample"] <- comparison_names
        me3_inter_cut_tip[comparison_names,"Recall"] <- me3_overlap[index_row,index_col]
        me3_inter_cut_tip[comparison_names,"Precision"] <- me3_overlap[index_col,index_row]
    }
}




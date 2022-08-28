library(EpiCompare)
library(reshape2)
library(ggplot2)
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

# H3K27ac peak file

H3K27ac_A549_E1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF747IZX/@@download/ENCFF747IZX.bed.gz", format = "narrowPeak")
H3K27ac_A549_E2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF918FET/@@download/ENCFF918FET.bed.gz", format = "narrowPeak")
H3K27ac_A549_E3 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF443MVY/@@download/ENCFF443MVY.bed.gz", format = "narrowPeak")
H3K27ac_A549_E4 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF035VXU/@@download/ENCFF035VXU.bed.gz", format = "narrowPeak")

ENCODE_ac_overlap <- calculate_overlap_func(list("E1" = H3K27ac_A549_E1, "E2" = H3K27ac_A549_E2,"E3" = H3K27ac_A549_E3, "E4" = H3K27ac_A549_E4))
heatmap <- EpiCompare::overlap_heatmap(list("E1" = H3K27ac_A549_E1, "E2" = H3K27ac_A549_E2,"E3" = H3K27ac_A549_E3, "E4" = H3K27ac_A549_E4))
show(heatmap)

ENCODE_ac_inter <- as.data.frame(matrix(nrow=0,ncol=3))
names(ENCODE_ac_inter) <- c("Sample","Precision","Recall")

remove(rg)
rg <- c(1,4)
for (index_col in (rg[1]+1):rg[2]){
    for (index_row in rg[1]:(index_col - 1)){
        comparison_names <- paste(colnames(ENCODE_ac_overlap)[index_col],rownames(ENCODE_ac_overlap)[index_row],sep = "_in_")
        ENCODE_ac_inter[comparison_names,"Sample"] <- comparison_names
        ENCODE_ac_inter[comparison_names,"Recall"] <- ENCODE_ac_overlap[index_row,index_col]
        ENCODE_ac_inter[comparison_names,"Precision"] <- ENCODE_ac_overlap[index_col,index_row]
    }
}
ENCODE_ac_inter$F1_Score <- 2 * ENCODE_ac_inter$Precision * ENCODE_ac_inter$Recall / (ENCODE_ac_inter$Precision + ENCODE_ac_inter$Recall)

# H3K27ac ENCODE
long_ENCODE_ac <- melt(ENCODE_ac_inter, id.vars=c("Sample"), measure.vars=c("Precision","Recall","F1_Score"), variable.name="Type", value.name="Percentage")

for (i in 1:nrow(long_ENCODE_ac)){
    long_ENCODE_ac$Sample[i] <- paste("A549",long_ENCODE_ac$Sample[i],sep = "_")
}

P_ENCODE_ac <- 
    ggplot(long_ENCODE_ac, aes(Sample, Percentage)) +
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
    theme(axis.text.x = element_text(angle = 45, hjust = 1,vjust = 1)) +
    theme(axis.text = element_text(size = 15)) +
    theme(axis.title = element_text(size = 15)) +
    theme(plot.title = element_text(size = 20)) +
    theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") 

show(P_ENCODE_ac)

# ENCODE H3K27me3 
H3K27me3_K562_E1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF801AHF/@@download/ENCFF801AHF.bed.gz", format = "narrowPeak")
H3K27me3_K562_E2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF323WOT/@@download/ENCFF323WOT.bed.gz", format = "narrowPeak")
H3K27me3_A549_E1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF522WJJ/@@download/ENCFF522WJJ.bed.gz", format = "narrowPeak")
H3K27me3_A549_E2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF684ZZH/@@download/ENCFF684ZZH.bed.gz", format = "narrowPeak")

ENCODE_me3_overlap <- calculate_overlap_func(list("K562_E1" = H3K27me3_K562_E1, "K562_E2" = H3K27me3_K562_E2,"A549_E1" = H3K27me3_A549_E1, "A549_E2" = H3K27me3_A549_E2))
# heatmap <- EpiCompare::overlap_heatmap(list("K562_E1" = H3K27me3_K562_E1, "K562_E2" = H3K27me3_K562_E2,"A549_E1" = H3K27me3_A549_E1, "A549_E2" = H3K27me3_A549_E2))
# show(heatmap)

ENCODE_me3_inter <- as.data.frame(matrix(nrow=0,ncol=3))
names(ENCODE_me3_inter) <- c("Sample","Precision","Recall")

remove(rg)
rg <- c(1,2)
for (index_col in (rg[1]+1):rg[2]){
    for (index_row in rg[1]:(index_col - 1)){
        comparison_names <- paste(colnames(ENCODE_me3_overlap)[index_col],rownames(ENCODE_me3_overlap)[index_row],sep = "_in_")
        ENCODE_me3_inter[comparison_names,"Sample"] <- comparison_names
        ENCODE_me3_inter[comparison_names,"Recall"] <- ENCODE_me3_overlap[index_row,index_col]
        ENCODE_me3_inter[comparison_names,"Precision"] <- ENCODE_me3_overlap[index_col,index_row]
    }
}

remove(rg)
rg <- c(3,4)
for (index_col in (rg[1]+1):rg[2]){
    for (index_row in rg[1]:(index_col - 1)){
        comparison_names <- paste(colnames(ENCODE_me3_overlap)[index_col],rownames(ENCODE_me3_overlap)[index_row],sep = "_in_")
        ENCODE_me3_inter[comparison_names,"Sample"] <- comparison_names
        ENCODE_me3_inter[comparison_names,"Recall"] <- ENCODE_me3_overlap[index_row,index_col]
        ENCODE_me3_inter[comparison_names,"Precision"] <- ENCODE_me3_overlap[index_col,index_row]
    }
}

ENCODE_me3_inter$F1_Score <- 2 * ENCODE_me3_inter$Precision * ENCODE_me3_inter$Recall / (ENCODE_me3_inter$Precision + ENCODE_me3_inter$Recall)

ENCODE_me3_inter$Sample <- c("K562_E2_in_E1","A549_E2_in_E1")


# H3K27ac ENCODE
long_ENCODE_me3 <- melt(ENCODE_me3_inter, id.vars=c("Sample"), measure.vars=c("Precision","Recall","F1_Score"), variable.name="Type", value.name="Percentage")

P_ENCODE_me3 <- 
    ggplot(long_ENCODE_me3, aes(Sample, Percentage)) +
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
    theme(axis.text.x = element_text(angle = 45, hjust = 1,vjust = 1)) +
    theme(axis.text = element_text(size = 15)) +
    theme(axis.title = element_text(size = 15)) +
    theme(plot.title = element_text(size = 20)) +
    theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") 

P_ENCODE_me3





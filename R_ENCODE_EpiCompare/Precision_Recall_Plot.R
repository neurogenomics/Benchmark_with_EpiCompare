library(ggrepel)


Precision_Recall_info <- read.csv("/Users/xindong/Downloads/Data_Analysis/cutandrun/ENCODE_info_Precision_Recall.csv", sep = ",", header = TRUE) 

Precision_Recall_info$F1_Score <- (2 * Precision_Recall_info$Precision * Precision_Recall_info$Recall) / (Precision_Recall_info$Precision + Precision_Recall_info$Recall)


P1 <- ggplot(Precision_Recall_info, aes(x = Recall, y = Precision, fill = CellLine)) +
    geom_point(size = 2,colour="black",shape=21,alpha=0.8) +
    geom_text_repel(aes(Recall, Precision, label = CellLine_Modif_Exp)) +
    #geom_text_repel(aes(Recall, Precision, label = F1_Score)) +
    theme_classic()


P1 + 
    scale_x_continuous(
        name = 'Recall (%)',
        limits=c(-5,105),
        breaks = seq(0,100,20),
        expand = c(0,0.5),
        position = 'bottom'  
    ) +
    scale_y_continuous(
        name = 'Precision (%)',
        limits=c(-5,105),
        breaks = seq(100,0,-20),
        expand = c(0,0.5),
        position = 'left' 
    )


#read peak number (after tidy)
K562_PeakN <- read.table("/Users/xindong/Downloads/Data_Analysis/cutandrun/ENCODE_correlation/ENCODE_K562/EpiCompare_file/peak_info")
    
write.xlsx(K562_PeakN, file = "K562_PeakN.xlsx", row.names = FALSE)
    
    
A549_PeakN <- read.table("/Users/xindong/Downloads/Data_Analysis/cutandrun/ENCODE_correlation/ENCODE_A549/EpiCompare_file/peak_info")

write.xlsx(A549_PeakN, file = "A549_PeakN.xlsx", row.names = FALSE)



remove(P2)
P2 <- ggplot(Precision_Recall_info, aes(x = PeakN_Ratio, y = Recall, fill = CellLine)) +
    geom_point(size = 2,colour="black",shape=21,alpha=0.8) +
    geom_text_repel(aes(PeakN_Ratio, Recall, label = CellLine_Modif_Exp)) +
    theme_classic()


P2 + 
    scale_x_continuous(
        name = 'Peak Number Ratio (%)',
        limits=c(-0.5,3.5),
        breaks = seq(0,3.25,0.25),
        expand = c(0,0.5),
        position = 'bottom'  
    ) +
    scale_y_continuous(
        name = 'Recall (%)',
        limits=c(-5,105),
        breaks = seq(0,100,20),
        expand = c(0,0.5),
        position = 'left' 
    )



remove(P3)
P3 <- ggplot(Precision_Recall_info, aes(x = CellLine_Modif_Exp, y = F1_Score, fill = CellLine)) +
    geom_bar(stat = 'identity', position = 'dodge') +
    theme_classic()

P3

P3 + 
    scale_x_discrete(labels=c("H3K4me1_E1_E2","H3K4me1_E1_E2", "H3K4me3_E1_E2", "H3K4me3_E1_E3", "H3K4me3_E2_E3", "H3K4me3_E1_E2", "H3K9ac_E1_E2", "H3K27ac_E1_E2", "H3K27me3_E1_E2", "H3K27me3_E1_E2", "H3K36me3_E1_E2", "H3K36me3_E1_E2")) + 
    theme(axis.text.x = element_text(hjust = 1, size = 7, face = "bold", angle = 45)) + 
    scale_y_continuous(
        name = 'F1 Score',
        limits=c(-5,105),
        breaks = seq(0,100,20),
        expand = c(0,0.5),
        position = 'left' 
    )

# p + theme(axis.text.x = element_text(size = 15, family = "myFont", color = "green", face = "bold", vjust = 0.5, hjust = 0.5, angle = 45))

Precision_Recall_info$CellLine_Modif_Exp <- factor(Precision_Recall_info$CellLine_Modif_Exp, levels = c("K562_H3K4me1_E1_E2","A549_H3K4me1_E1_E2", "K562_H3K4me3_E1_E2", "K562_H3K4me3_E1_E3", "K562_H3K4me3_E2_E3", "A549_H3K4me3_E1_E2", "K562_H3K9ac_E1_E2", "A549_H3K27ac_E1_E2", "K562_H3K27me3_E1_E2", "A549_H3K27me3_E1_E2", "K562_H3K36me3_E1_E2", "A549_H3K36me3_E1_E2"))





    
   
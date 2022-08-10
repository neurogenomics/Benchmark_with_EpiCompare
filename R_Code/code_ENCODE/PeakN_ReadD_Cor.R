
# # merge peak info and ENCODE info
# 
# Peak_info <- read.csv("/Users/xindong/Downloads/Data_Analysis/cutandrun/K562_A549_PeakN_0726.csv", header = TRUE, sep = ",")
# ENCODE_info <- read.csv("/Users/xindong/Downloads/Data_Analysis/cutandrun/ENCODE_info_0726.csv", header = TRUE, sep = ",")
# 
# for (index in ENCODE_info$Index){
#     ENCODE_info$Peak_Number[ENCODE_info$Index == index] <- Peak_info$Peak_Number[Peak_info$Exp_Name == index]
#     ENCODE_info$Histone_Modification[ENCODE_info$Index == index] <- strsplit(index,split='_')[[1]][1]
#     ENCODE_info$Cell_Line[ENCODE_info$Index == index] <- strsplit(index,split='_')[[1]][2]
#     ENCODE_info$Experiment[ENCODE_info$Index == index] <- strsplit(index,split='_')[[1]][3]
# }
# 
# ENCODE_info$Read_Depth <- ENCODE_info$Read_Depth/1000000
# ENCODE_info$Peak_Number <- ENCODE_info$Peak_Number/1000
# 
# write.csv(ENCODE_info, file = "/Users/xindong/Downloads/Data_Analysis/cutandrun/ENCODE_info_ALL_0726.csv")

library(ggplot2)
library(ggrepel)
# remove(P1)
ENCODE_info <- read.csv("/Users/xindong/Downloads/Data_Analysis/cutandrun/info_ENCODE/ENCODE_info_ALL_0728.csv", header = TRUE, sep = ",")

p_peakN_readD <- ggplot(ENCODE_info, aes(x = Read_Depth, y = Peak_Number, fill = Histone_Modification)) +
    geom_point(size = 2,colour="black",shape=21,alpha=0.8) +
    # theme_classic() +
    facet_grid(Histone_Modification~Cell_Line,margins=TRUE) +
    labs(
        title = "Peak Number & Read Depth Correlation",
        subtitle = "A549 & K562",
        #tag = "",
        #caption = "",
        x = "Read Depth (million)",
        y = "Peak Number & Read Depth Correlation"
        )

show(p_peakN_readD)   
 
remove(p_peakN_readD_all)
p_peakN_readD_all <- ggplot(ENCODE_info, aes(x = Read_Depth, y = Peak_Number, fill = Histone_Modification)) +
    geom_point(size = 4,colour="black",shape=21,alpha=0.8) +
    # theme_classic() +
    facet_wrap(~Cell_Line) +
    labs(
        title = "Peak Number & Read Depth Correlation",
        subtitle = "A549 & K562",
        #tag = "",
        #caption = "",
        x = "Read Depth (million)",
        y = "Peak Number (thousand)"
    )

p_peakN_readD_all <- p_peakN_readD_all + geom_smooth(mapping = aes(x = Read_Depth, y = Peak_Number, fill = NULL), method="lm", color="red", linetype=2, show.legend = FALSE)

show(p_peakN_readD_all)   



p_peakN <- ggplot(ENCODE_info, aes(x = Experiment, y = Peak_Number, fill = Histone_Modification)) +
    geom_bar(stat = 'identity', position = 'dodge') +
    facet_grid(Histone_Modification~Cell_Line,margins=FALSE) +
    labs(
        title = "Peak Number",
        subtitle = "A549 & K562",
        #tag = "",
        #caption = "",
        x = "Experiment",
        y = "Peak Number (thousand)"
    )


show(p_peakN) 







# P1 + 
#     scale_x_continuous(
#         name = 'Read Depth (million)',
#         # limits=c(-5,70),
#         # breaks = seq(0,60,20),
#         # expand = c(0,0.5),
#         position = 'bottom'  
#     ) +
#     scale_y_continuous(
#         name = 'Peak Number (thousand)',
#         # limits=c(-5,180),
#         # breaks = seq(0,175,25),
#         # expand = c(0,0.5),
#         position = 'left' 
#     )

# show(P1)
# 
# P1 + 
#     geom_smooth(mapping = aes(x = Read_Depth, y = Peak_Number, fill = Read_Depth), method="lm", color="red", linetype=2, show.legend = FALSE) +     #geom_text_repel(aes(Read_Depth, Peak_Number, label = Index)) +
#     #geom_text_repel(aes(Recall, Precision, label = F1_Score)) +
#     












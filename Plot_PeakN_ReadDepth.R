library(ggplot2)
library(gtable)
library(grid)

ENCODE_info <- read.csv("/Users/xindong/Downloads/Data_Analysis/cutandrun/ENCODE_info.csv", sep = ",", stringsAsFactors = FALSE)
for (i in 1:length(ENCODE_info$Histone_modifications)){
    ENCODE_info$Histone_PTMs[i] <- strsplit(ENCODE_info$Histone_modifications[i],split='_')[[1]][1]
}

#names(ENCODE_info)

ENCODE_info_short <- ENCODE_info[,c("Histone_PTMs", "Read_depth", "Histone_modifications")]
ENCODE_info_H3K36me3 <- ENCODE_info_short[ENCODE_info_short$Histone_PTMs == "H3K36me3",]

#read peak number (after tidy)
H3K36me3_PeakN <- read.table("/Users/xindong/Downloads/Data_Analysis/cutandrun/ENCODE_correlation/H3K36me3/EpiCompare_file/peak_info")

#extract experiment name
for (i in 1:length(H3K36me3_PeakN$Sample)){
    H3K36me3_PeakN$Mod_Cell_Exp[i] <- gsub(paste("_",tail(strsplit(H3K36me3_PeakN$Sample[i],"_")[[1]],1),sep = ""), '', H3K36me3_PeakN$Sample[i])
}

#extract sample name, peak number and experiment name
H3K36me3_PeakN <- H3K36me3_PeakN[,c(1,5,6)]

for (i in 1:length(H3K36me3_PeakN$Sample)){
    H3K36me3_PeakN$Read_depth[i] <- ENCODE_info_H3K36me3$Read_depth[ENCODE_info_H3K36me3$Histone_modifications == H3K36me3_PeakN$Mod_Cell_Exp[i]]
}
H3K36me3_PeakN$Mod_Cell_Exp <- factor(H3K36me3_PeakN$Mod_Cell_Exp, levels = c(unique(H3K36me3_PeakN$Mod_Cell_Exp)))

ENCODE_info_H3K36me3$Histone_modifications <- factor(ENCODE_info_H3K36me3$Histone_modifications, levels = c(ENCODE_info_H3K36me3$Histone_modifications))

#Plot peak number along with read depth

grid.newpage()

# two plots
p2 <- ggplot(ENCODE_info_H3K36me3, aes(x = Histone_modifications,y = Read_depth)) + 
    expand_limits(y = 0) +
    geom_point(shape = 15, size = 4) +
    theme_bw() +
    theme(legend.position=c(0,0),
          panel.background = element_rect(fill = NA),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank()) +
    ylab("Read Depth (Average Number of Total Aligned Reads Passing QC)")

show(p2)

p1 <- ggplot(H3K36me3_PeakN,aes(x=Mod_Cell_Exp,y=PeakN.after.tidy))+ 
    stat_boxplot()+ 
    geom_boxplot(size=0.5,fill="white",outlier.fill="white",outlier.color="white")+ 
    geom_jitter(aes(),width = 0,size=1.5)+ 
    ggtitle("Peak Number & Read Depth - H3K36me3")+ 
    expand_limits(y = 0)+
    theme_bw()+
    theme(legend.position="none", 
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank())+
    xlab("Modificatoin - Cell Line - Experiment") +
    ylab("Peak Number") 

show(p1)


# extract gtable
g1 <- ggplot_gtable(ggplot_build(p1))
g2 <- ggplot_gtable(ggplot_build(p2))

# overlap the panel of 2nd plot on that of 1st plot
pp <- c(subset(g1$layout, name == "panel", se = t:r))
g <- gtable_add_grob(g1, g2$grobs[[which(g2$layout$name == "panel")]], pp$t, 
                     pp$l, pp$b, pp$l)

# axis tweaks
ia <- which(g2$layout$name == "axis-l")
ga <- g2$grobs[[ia]]
ax <- ga$children[[2]]
ax$widths <- rev(ax$widths)
ax$grobs <- rev(ax$grobs)
ax$grobs[[1]]$x <- ax$grobs[[1]]$x - unit(1, "npc") + unit(0.15, "cm")
g <- gtable_add_cols(g, g2$widths[g2$layout[ia, ]$l], length(g$widths) - 1)
g <- gtable_add_grob(g, ax, pp$t, length(g$widths) - 1, pp$b)

# draw it
grid.draw(g)

#PeakN_ReadDepth_H3K36me3




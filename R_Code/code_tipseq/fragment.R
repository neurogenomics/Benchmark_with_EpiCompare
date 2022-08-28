library(ggplot2)
library(reshape2)
library(grid)


info_duplication_bulk <- read.csv("/Users/xindong/Downloads/TIP_git/info_TIP_seq/duplication_bulk.csv", header = TRUE)
info_fragment_bulk <- read.csv("/Users/xindong/Downloads/TIP_git/info_TIP_seq/fragment_bulk.csv", header = TRUE)

longinfo_fragment_bulk <- melt(info_fragment_bulk,id.vars = c("Length"))
colnames(longinfo_fragment_bulk) <- c("Length","Sample","Read_Numbers")

for (i in 1:nrow(longinfo_fragment_bulk)){
    longinfo_fragment_bulk$Histone_Mark[i] <- info_duplication_bulk$histone_mark[longinfo_fragment_bulk$Sample[i] == info_duplication_bulk$Sample]
    longinfo_fragment_bulk$Fragmentation_Enzyme[i] <- info_duplication_bulk$fragmentation_enzyme[longinfo_fragment_bulk$Sample[i] == info_duplication_bulk$Sample]
}


# write.csv(longinfo_fragment_bulk, "/Users/xindong/Downloads/tip_seq/info_tip_seq/long_info_fragment_bulk.csv")





## fragment distribution
P_fragment_bulk <- 
    ggplot(data = longinfo_fragment_bulk, mapping = aes(x = Length, y = Read_Numbers, group = Sample)) + 
    geom_line(aes(color=Sample)) +
    labs(colour = NULL) + 
    theme_light() + 
    # geom_point(aes(color=Category),size=0.01) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1,vjust = 1)) +
    theme(axis.text = element_text(size = 15)) +
    theme(axis.title = element_text(size = 15)) +
    theme(plot.title = element_text(size = 20)) +
    theme(legend.text = element_text(size = 15)) +
    theme(legend.title = element_blank()) +
    theme(legend.position = "right") + 
    facet_grid(Histone_Mark~Fragmentation_Enzyme,margins=TRUE) +
    theme(strip.text.x = element_text(size = 15)) + 
    theme(strip.text.y = element_text(size = 15)) + 
    labs(
        # title = "Fragments size distribution",
        # subtitle = "Bulk TIP-seq",
        #tag = "",
        #caption = "",
        x = "Fragment Size (bp)",
        y = "Fragment Number"
    )
show(P_fragment_bulk)

legend <- cowplot::get_legend(P_fragment_bulk)

grid.newpage()
grid.draw(legend)



P_fragment_bulk_violin <- 
    ggplot(longinfo_fragment_bulk, aes(x = Sample, y = Length, weight = Read_Numbers, fill = Sample)) + 
    geom_violin() +
    geom_boxplot(outlier.shape = NA, width = 0.1) + 
    theme_light() + 
    # geom_point(aes(color=Category),size=0.01) +
    scale_y_continuous(
        limits=c(-50,750),
        breaks = seq(0,700,100),
        expand = c(0,10)
    ) + 
    theme(axis.text.x = element_text(angle = 70, hjust = 1,vjust = 1)) +
    theme(axis.text = element_text(size = 15)) +
    theme(axis.title = element_text(size = 15)) +
    theme(plot.title = element_text(size = 20)) +
    theme(legend.position = "right") + 
    labs(
        # title = "Fragments size distribution",
        # subtitle = "Bulk TIP-seq",
        #tag = "",
        #caption = "",
        x = "",
        y = "Fragment Size (bp)"
    )

show(P_fragment_bulk_violin)





ggplot(aes(x = Sample, y = fragLen, weight = Weight, fill = Sample)) +
    geom_violin(bw = 5) +
    scale_y_continuous(breaks = seq(0, 800, 50)) +
    scale_fill_viridis(discrete = TRUE, begin = 0.1, end = 0.9, option = "magma", alpha = 0.8, labels = labels_list) +
    scale_color_viridis(discrete = TRUE, begin = 0.1, end = 0.9) +
    scale_x_discrete(labels = labels_list_reordered) +
    theme_bw(base_size = 20) +
    ggpubr::rotate_x_text(angle = 20) +
    ylab("Fragment Length") +
    xlab("") +
    theme(plot.margin = unit(c(0.5,0,0,2), "cm"))






















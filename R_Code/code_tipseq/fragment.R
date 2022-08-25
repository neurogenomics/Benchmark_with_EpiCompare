library(ggplot2)
library(reshape2)



info_duplication_bulk <- read.csv("/Users/xindong/Downloads/tip_seq/info_tip_seq/duplication_bulk.csv", header = TRUE)
info_fragment_bulk <- read.csv("/Users/xindong/Downloads/tip_seq/info_tip_seq/fragment_bulk.csv", header = TRUE)

longinfo_fragment_bulk <- melt(info_fragment_bulk,id.vars = c("Length"))
colnames(longinfo_fragment_bulk) <- c("Length","Sample","Read_Numbers")

for (i in 1:nrow(longinfo_fragment_bulk)){
    longinfo_fragment_bulk$Histone_Mark[i] <- info_duplication_bulk$histone_mark[longinfo_fragment_bulk$Sample[i] == info_duplication_bulk$Sample]
    longinfo_fragment_bulk$Fragmentation_Enzyme[i] <- info_duplication_bulk$fragmentation_enzyme[longinfo_fragment_bulk$Sample[i] == info_duplication_bulk$Sample]
}


# write.csv(longinfo_fragment_bulk, "/Users/xindong/Downloads/tip_seq/info_tip_seq/long_info_fragment_bulk.csv")





## fragment distribution
P_fragment_bulk <- ggplot(data = longinfo_fragment_bulk, mapping = aes(x = Length, y = Read_Numbers, group = Sample)) + 
    geom_line(aes(color=Sample)) +
    theme_light() + 
    # geom_point(aes(color=Category),size=0.01) +
    facet_grid(Histone_Mark~Fragmentation_Enzyme,margins=TRUE) +
    labs(
        # title = "Fragments size distribution",
        # subtitle = "Bulk TIP-seq",
        #tag = "",
        #caption = "",
        x = "Fragment Number",
        y = "Fragment Size (bp)"
    )
show(P_fragment_bulk)

P_fragment_bulk_violin <- ggplot(longinfo_fragment_bulk, aes(x = Sample, y = Length, weight = Read_Numbers)) + 
    geom_violin(aes(color=Histone_Mark)) +
    geom_boxplot(aes(color=Histone_Mark), outlier.shape = NA, width = 0.1) + 
    theme_light() + 
    # geom_point(aes(color=Category),size=0.01) +
    theme(axis.text.x = element_text(angle = 60, hjust = 1, vjust = 1)) +
    scale_y_continuous(
        limits=c(-50,750),
        breaks = seq(0,700,100),
        expand = c(0,10)
    ) + 
    # facet_grid(Histone_Mark~Fragmentation_Enzyme,margins=TRUE) +
    labs(
        # title = "Fragments size distribution",
        # subtitle = "Bulk TIP-seq",
        #tag = "",
        #caption = "",
        x = "",
        y = "Fragment Size (bp)"
    )

show(P_fragment_bulk_violin)




























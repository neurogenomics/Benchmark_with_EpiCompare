library(ggplot2)

info_read_depth <- read.csv("/Users/xindong/Downloads/TIP_git/info_TIP_seq/read_depth_all.csv", header = TRUE)
info_read_depth$Method <- factor(info_read_depth$Method, c("ENCODE","Bulk TIP-seq","Single Cell TIP-seq"))
info_read_depth$Sample <- factor(info_read_depth$Sample,info_read_depth$Sample)



P_Read_Depth <- 
    ggplot(info_read_depth, aes(x = Sample, y = Unique_Pairs, fill = Method)) +
    geom_bar(stat = 'identity', position = 'dodge', width = 0.6) +
    facet_wrap(~Histone_Mark) +
    theme_light() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 1)) +
    labs(
        # title = "Peak Number",
        # subtitle = "A549 & K562",
        #tag = "",
        #caption = "",
        x = "",
        y = "Read Depth (million)"
    )


show(P_Read_Depth) 
library(ggplot2)

info_read_depth <- read.csv("/Users/xindong/Downloads/TIP_git/info_TIP_seq/read_depth_all.csv", header = TRUE)
info_read_depth$Method <- factor(info_read_depth$Method, c("ENCODE","Bulk TIP-seq","Single Cell TIP-seq"))
info_read_depth$Sample <- factor(info_read_depth$Sample,info_read_depth$Sample)

P_Read_Depth <- 
    ggplot(info_read_depth, aes(x = Sample, y = Unique_Pairs, fill = Method)) +
    geom_bar(stat = 'identity', position = 'dodge', width = 0.6) +
    facet_wrap(~Histone_Mark) +
    theme_light() +
    theme(axis.text.x = element_text(angle = 80, hjust = 1,vjust = 1)) +
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
        y = "Read Depth (million)"
    )


show(P_Read_Depth) 

sc_info_read_depth <- info_read_depth[info_read_depth$Method == "Single Cell TIP-seq",]

P_sc_Read_Depth <- 
    ggplot(sc_info_read_depth, aes(x = Sample, y = Unique_Pairs, fill = Method)) +
    geom_bar(stat = 'identity', position = 'dodge', width = 0.6) +
    theme_light() +
    theme(axis.text.x = element_text(angle = 80, hjust = 1,vjust = 1)) +
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
        y = "Read Depth (million)"
    )


show(P_sc_Read_Depth) 


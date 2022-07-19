H3K36me3_data <- rbind(H3K36me3_replicates_data,H3K36me3_experiments_data)
H3K36me3_data <- rbind(H3K36me3_data,H3K36me3_K562_A549_data)
H3K36me3_data <- rbind(H3K36me3_data,H3K36me3_K562_H9_data)
H3K36me3_data <- rbind(H3K36me3_data,H3K36me3_A549_H9_data)

H3K36me3_data$type <- factor(H3K36me3_data$type, levels = c("H3K36me3_replicates", "H3K36me3_experiments","H3K36me3_K562_A549", "H3K36me3_K562_H9", "H3K36me3_A549_H9"))

my_comparisons <- list(c("H3K36me3_replicates", "H3K36me3_experiments"), 
                       c("H3K36me3_experiments","H3K36me3_K562_A549"),
                       c("H3K36me3_experiments", "H3K36me3_K562_H9"), 
                       c("H3K36me3_experiments", "H3K36me3_A549_H9"))


figure <- ggplot(H3K36me3_data, aes(x = type , y = overlap , fill = type)) +
    geom_violin(alpha = 0.7,aes(linetype=NA)) +
    geom_jitter(shape=21,aes(fill=type),position = position_jitter(width = 0.2),size = 0.6)+
    xlab("Type of Overlap")+ylab("Percentage")+
    theme_bw()+theme(legend.position = "none")+
    stat_summary(fun.data = "mean_cl_boot", geom = "pointrange",
                 colour = "black")


figure + 
    stat_compare_means(comparisons = my_comparisons, label.y=c(100, 108, 116, 124)) + 
    stat_compare_means(method = "anova", label.y = 130) +
    scale_y_continuous(breaks = seq(0,100,25))




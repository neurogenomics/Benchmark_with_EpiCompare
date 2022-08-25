
info_fragment_bulk <- read.xlsx("/Users/xindong/Downloads/tip_seq/info_tip_seq/fragment_bulk.xlsx", sheetName = "Sheet1", header = TRUE)
info_duplication_bulk <- read.xlsx("/Users/xindong/Downloads/tip_seq/info_tip_seq/duplication_bulk.xlsx", sheetName = "Sheet1", header = TRUE)


longinfo_fragment_bulk <- melt(info_fragment_bulk,id.vars = c("Length"))
colnames(longinfo_fragment_bulk) <- c("Length","Category","Numbers")
for (i in 1:nrow(longinfo_fragment_bulk)){
    longinfo_fragment_bulk$Histone_Mark[i] <- info_duplication_bulk$histone_mark[longinfo_fragment_bulk$Category[i] == info_duplication_bulk$Category]
    longinfo_fragment_bulk$Fragmentation_Enzyme[i] <- info_duplication_bulk$fragmentation_enzyme[longinfo_fragment_bulk$Category[i] == info_duplication_bulk$Category]
    }


# write.csv(longinfo_fragment_bulk, "/Users/xindong/Downloads/tip_seq/info_tip_seq/long_info_fragment_bulk.csv")

## fragment distribution
P_fragment_bulk <- ggplot(data = longinfo_fragment_bulk, mapping = aes(x = Length, y = Numbers, group = Category)) + 
    geom_line(aes(color=Category)) +
    # geom_point(aes(color=Category),size=0.01) +
    facet_grid(Histone_Mark~Fragmentation_Enzyme,margins=TRUE) +
    labs(
        title = "Fragments size distribution",
        subtitle = "Bulk TIP-seq",
        #tag = "",
        #caption = "",
        x = "Fragment Number",
        y = "Fragment Size (bp)"
    )
show(P_fragment_bulk)


## duplicates
longinfo_fragment_bulk <- melt(info_duplication_bulk, id.vars=c("Category","histone_mark","antibody_company","fragmentation_enzyme","fragmentation_time","PCR_cycles"), measure.vars=c("Unique_Pairs","Duplicate_Pairs_Optical","Duplicate_Pairs_Nonoptical","Unmapped"),
           variable.name="Type", value.name="Numbers")

longinfo_fragment_bulk$Type= factor(longinfo_fragment_bulk$Type, levels = c("Unmapped","Duplicate_Pairs_Nonoptical","Duplicate_Pairs_Optical","Unique_Pairs"))

P_duplication_bulk <- ggplot(longinfo_fragment_bulk, aes(x = Category, y = Numbers, group = Type)) + 
    geom_col(aes(fill=Type)) + 
    facet_grid(fragmentation_time~PCR_cycles,margins=TRUE) + 
    theme_light() + 
    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.25)) + 
    labs(
        title = "Duplication",
        subtitle = "Bulk TIP-seq",
        #tag = "",
        #caption = "",
        x = "Category",
        y = "Reads Number"
    )
    # facet_grid(fragmentation_time~PCR_cycles,margins=FALSE)
    

show(P_duplication_bulk)


## Duplication rate 

P_dup_bulk <- ggplot(info_duplication_bulk, aes(x = Category, y = Duplication_rate, fill = histone_mark)) +
    geom_bar(stat = 'identity', position = 'dodge') +
    facet_grid(fragmentation_time~PCR_cycles,margins=TRUE) +
    theme_light() + 
    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.25)) +
    labs(
        title = "Peak Number",
        subtitle = "A549 & K562",
        #tag = "",
        #caption = "",
        x = "Experiment",
        y = "Peak Number (thousand)"
    )

show(P_dup_bulk)

## FRiP




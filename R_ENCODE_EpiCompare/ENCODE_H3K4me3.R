library(EpiCompare)
data(hg38_blacklist)

H3K4me3_K562_E1_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF885FQN/@@download/ENCFF885FQN.bed.gz", format = "narrowPeak")
H3K4me3_K562_E1_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF218ZFJ/@@download/ENCFF218ZFJ.bed.gz", format = "narrowPeak")
H3K4me3_K562_E1_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF934IIU/@@download/ENCFF934IIU.bed.gz", format = "narrowPeak")
H3K4me3_K562_E1_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF403DTU/@@download/ENCFF403DTU.bed.gz", format = "narrowPeak")

H3K4me3_K562_E2_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF122CSI/@@download/ENCFF122CSI.bed.gz", format = "narrowPeak")
H3K4me3_K562_E2_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF284TAL/@@download/ENCFF284TAL.bed.gz", format = "narrowPeak")
H3K4me3_K562_E2_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF115HDF/@@download/ENCFF115HDF.bed.gz", format = "narrowPeak")
H3K4me3_K562_E2_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF246IEW/@@download/ENCFF246IEW.bed.gz", format = "narrowPeak")

H3K4me3_K562_E3_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF313FYW/@@download/ENCFF313FYW.bed.gz", format = "narrowPeak")
H3K4me3_K562_E3_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF653UPW/@@download/ENCFF653UPW.bed.gz", format = "narrowPeak")
H3K4me3_K562_E3_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF106GOL/@@download/ENCFF106GOL.bed.gz", format = "narrowPeak")
H3K4me3_K562_E3_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF706WUF/@@download/ENCFF706WUF.bed.gz", format = "narrowPeak")

H3K4me3_A549_E1_IRpseudo123 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF535EYL/@@download/ENCFF535EYL.bed.gz", format = "narrowPeak")
H3K4me3_A549_E1_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF104OXS/@@download/ENCFF104OXS.bed.gz", format = "narrowPeak")
H3K4me3_A549_E1_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF601EJL/@@download/ENCFF601EJL.bed.gz", format = "narrowPeak")
H3K4me3_A549_E1_IRpseudo3 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF556EIF/@@download/ENCFF556EIF.bed.gz", format = "narrowPeak")
H3K4me3_A549_E1_IR123 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF933ONG/@@download/ENCFF933ONG.bed.gz", format = "narrowPeak")

H3K4me3_A549_E2_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF361TGO/@@download/ENCFF361TGO.bed.gz", format = "narrowPeak")
H3K4me3_A549_E2_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF809PKT/@@download/ENCFF809PKT.bed.gz", format = "narrowPeak")
H3K4me3_A549_E2_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF544DKM/@@download/ENCFF544DKM.bed.gz", format = "narrowPeak")
H3K4me3_A549_E2_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF048XCK/@@download/ENCFF048XCK.bed.gz", format = "narrowPeak")



if(FALSE) {
    H3K4me3_HCT116_E1_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF711MPL/@@download/ENCFF711MPL.bed.gz", format = "narrowPeak")
    H3K4me3_HCT116_E1_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF396AOO/@@download/ENCFF396AOO.bed.gz", format = "narrowPeak")
    H3K4me3_HCT116_E1_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF663KQO/@@download/ENCFF663KQO.bed.gz", format = "narrowPeak")
    H3K4me3_HCT116_E1_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF698BEK/@@download/ENCFF698BEK.bed.gz", format = "narrowPeak")
    
    H3K4me3_HCT116_E2_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF943XCO/@@download/ENCFF943XCO.bed.gz", format = "narrowPeak")
    H3K4me3_HCT116_E2_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF050SGK/@@download/ENCFF050SGK.bed.gz", format = "narrowPeak")
    H3K4me3_HCT116_E2_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF273WMZ/@@download/ENCFF273WMZ.bed.gz", format = "narrowPeak")
    H3K4me3_HCT116_E2_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF187LLD/@@download/ENCFF187LLD.bed.gz", format = "narrowPeak")
}

H3K4me3_H9_E1_MINT_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF464FFZ/@@download/ENCFF464FFZ.bed.gz", format = "narrowPeak")
H3K4me3_H9_E1_MINT_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF065SHV/@@download/ENCFF065SHV.bed.gz", format = "narrowPeak")
H3K4me3_H9_E1_MINT_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF136OUL/@@download/ENCFF136OUL.bed.gz", format = "narrowPeak")
H3K4me3_H9_E1_MINT_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF275BFW/@@download/ENCFF275BFW.bed.gz", format = "narrowPeak")

H3K4me3_H9_E2_IRpseudo12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF473AUA/@@download/ENCFF473AUA.bed.gz", format = "narrowPeak")
H3K4me3_H9_E2_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF620DVO/@@download/ENCFF620DVO.bed.gz", format = "narrowPeak")
H3K4me3_H9_E2_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF176PLK/@@download/ENCFF176PLK.bed.gz", format = "narrowPeak")
H3K4me3_H9_E2_IR12 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF980BDO/@@download/ENCFF980BDO.bed.gz", format = "narrowPeak")



peaklist <- list(H3K4me3_K562_E1_IRpseudo12,H3K4me3_K562_E1_IRpseudo1,H3K4me3_K562_E1_IRpseudo2,H3K4me3_K562_E1_IR12,H3K4me3_K562_E2_IRpseudo12,H3K4me3_K562_E2_IRpseudo1,H3K4me3_K562_E2_IRpseudo2,H3K4me3_K562_E2_IR12,H3K4me3_K562_E3_IRpseudo12,H3K4me3_K562_E3_IRpseudo1,H3K4me3_K562_E3_IRpseudo2,H3K4me3_K562_E3_IR12,H3K4me3_A549_E1_IRpseudo123,H3K4me3_A549_E1_IRpseudo1,H3K4me3_A549_E1_IRpseudo2,H3K4me3_A549_E1_IRpseudo3,H3K4me3_A549_E1_IR123,H3K4me3_A549_E2_IRpseudo12,H3K4me3_A549_E2_IRpseudo1,H3K4me3_A549_E2_IRpseudo2,H3K4me3_A549_E2_IR12,H3K4me3_H9_E1_MINT_IRpseudo12,H3K4me3_H9_E1_MINT_IRpseudo1,H3K4me3_H9_E1_MINT_IRpseudo2,H3K4me3_H9_E1_MINT_IR12,H3K4me3_H9_E2_IRpseudo12,H3K4me3_H9_E2_IRpseudo1,H3K4me3_H9_E2_IRpseudo2)

names(peaklist) <- c("H3K4me3_K562_E1_IRpseudo12","H3K4me3_K562_E1_IRpseudo1","H3K4me3_K562_E1_IRpseudo2","H3K4me3_K562_E1_IR12","H3K4me3_K562_E2_IRpseudo12","H3K4me3_K562_E2_IRpseudo1","H3K4me3_K562_E2_IRpseudo2","H3K4me3_K562_E2_IR12","H3K4me3_K562_E3_IRpseudo12","H3K4me3_K562_E3_IRpseudo1","H3K4me3_K562_E3_IRpseudo2","H3K4me3_K562_E3_IR12","H3K4me3_A549_E1_IRpseudo123","H3K4me3_A549_E1_IRpseudo1","H3K4me3_A549_E1_IRpseudo2","H3K4me3_A549_E1_IRpseudo3","H3K4me3_A549_E1_IR123","H3K4me3_A549_E2_IRpseudo12","H3K4me3_A549_E2_IRpseudo1","H3K4me3_A549_E2_IRpseudo2","H3K4me3_A549_E2_IR12","H3K4me3_H9_E1_MINT_IRpseudo12","H3K4me3_H9_E1_MINT_IRpseudo1","H3K4me3_H9_E1_MINT_IRpseudo2","H3K4me3_H9_E1_MINT_IR12","H3K4me3_H9_E2_IRpseudo12","H3K4me3_H9_E2_IRpseudo1","H3K4me3_H9_E2_IRpseudo2")

ENCODE <- list("H3K4me3_H9_E2_IR12" = H3K4me3_H9_E2_IR12)
gc()
data(hg38_blacklist)

EpiCompare(peakfiles = peaklist,
           genome_build = "hg38",
           blacklist = hg38_blacklist,
           picard_files = list(),
           reference = ENCODE,
           upset_plot = FALSE,
           stat_plot = FALSE,
           chromHMM_plot = FALSE,
           chromHMM_annotation = "K562",
           chipseeker_plot = FALSE,
           enrichment_plot = FALSE,
           tss_plot = FALSE,
           interact = TRUE,
           save_output = TRUE,
           output_dir = "/Users/xindong/Downloads/H3K4me3")


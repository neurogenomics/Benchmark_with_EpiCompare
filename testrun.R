remotes::install_github("neurogenomics/EpiCompare")
library(EpiCompare)

## Experiment 1 
H3K4me3_EN4G38_E1_IRpseudo123 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF573MUH/@@download/ENCFF573MUH.bed.gz", format = "narrowPeak")
H3K4me3_EN4G38_E1_IRpseudo1 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF810EWT/@@download/ENCFF810EWT.bed.gz", format = "narrowPeak")
H3K4me3_EN4G38_E1_IRpseudo2 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF767JIG/@@download/ENCFF767JIG.bed.gz", format = "narrowPeak")
H3K4me3_EN4G38_E1_IRpseudo3 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF243UCU/@@download/ENCFF243UCU.bed.gz", format = "narrowPeak")
H3K4me3_EN4G38_E1_IR123 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF901AFI/@@download/ENCFF901AFI.bed.gz", format = "narrowPeak")


H3K4me3_EN4G38_E2_IR123 <- rtracklayer::import("https://www.encodeproject.org/files/ENCFF046DTX/@@download/ENCFF046DTX.bed.gz", format = "narrowPeak")

aaa <- EpiCompare::import_narrowPeak("https://www.encodeproject.org/files/ENCFF046DTX/@@download/ENCFF046DTX.bed.gz", format = "narrowPeak")








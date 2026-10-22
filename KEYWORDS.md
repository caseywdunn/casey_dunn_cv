# Keywords

Controlled vocabulary for the `keywords` field in `publications.bib`. Use only
these terms, comma-separated, lowercase. The CV styles do not print keywords;
they are for finding papers (e.g. all entries with both `siphonophora` and
`sequence-analysis`).

Terms are hierarchical: when a narrower term applies, also add the broader
terms it implies (shown as "implies"). Assign terms for what a paper actually
studies or does, judged from its text (abstract, methods, data availability),
not just its title.

Rules for consistent judgment calls:

- Reviews, commentaries, and popular pieces get data and method terms for
  the methods they are mainly about, which also brings in implied terms such
  as `sequence-analysis`. To find only primary analyses, exclude `review`,
  `commentary`, and `popular`.
- Finding genes in an existing transcriptome only to make probes (e.g. for in
  situ hybridization) is not `sequence-analysis`. If the paper deposits the new
  sequences, it is `new-sequence-data`.
- `new-sequence-data` means the paper deposited new sequences (in SRA,
  GenBank, etc.). Reanalyses of published data get `sequence-analysis`
  without `new-sequence-data`.
- A taxon term applies when the taxon is a focus of the paper or a major part
  of the data analyzed, e.g. siphonophore test data in a software paper.
  Taxa sampled as one lineage among many in a broad phylogeny do not count;
  use `metazoa` or the broader clade.

## Taxon

The organisms a paper studies directly. Not taxa that are only mentioned or
sampled incidentally within a broad comparison.

| term | use for | implies |
|---|---|---|
| `siphonophora` | siphonophores | `cnidaria` |
| `cnidaria` | any cnidarian, including siphonophores | |
| `ctenophora` | comb jellies | |
| `porifera` | sponges | |
| `mollusca` | molluscs | |
| `echinodermata` | echinoderms | |
| `hemichordata` | acorn worms and relatives | |
| `spiralia` | broad sampling within Spiralia/Lophotrochozoa, or protostome placement (e.g. chaetognaths) | |
| `metazoa` | analyses sampling broadly across animals (animal phylogeny, animal genome evolution) | |
| `insects` | insects, e.g. *Drosophila* | |
| `vertebrates` | vertebrates, including humans as study organisms (not as HIV hosts) | |
| `fungi` | fungi | |
| `hiv` | HIV | |

## Data and methods

| term | use for | implies |
|---|---|---|
| `sequence-analysis` | the paper analyzes nucleotide or protein sequence data, new or previously published | |
| `new-sequence-data` | the paper generated and released new sequence data | `sequence-analysis` |
| `genomics` | genome sequencing, assembly, or genome structure | `sequence-analysis` |
| `transcriptomics` | RNA-seq, transcriptome assembly, differential expression | `sequence-analysis` |
| `molecular-phylogenetics` | phylogenetic inference from molecular sequences, any number of genes | `sequence-analysis` |
| `phylogenomics` | molecular phylogenetics with many genes (genome or transcriptome scale) | `molecular-phylogenetics` |
| `mitogenomics` | mitochondrial genome sequencing or analysis | `sequence-analysis` |
| `population-genomics` | genetic variation within species, population structure | `sequence-analysis` |
| `single-cell` | single-cell sequencing | `transcriptomics` |
| `metabarcoding` | amplicon-based identification of mixed samples (e.g. diet) | `sequence-analysis` |
| `molecular-epidemiology` | viral sequence clusters and transmission networks | `sequence-analysis` |
| `phylogenetic-comparative-methods` | trait or character evolution analyzed on phylogenies | |
| `morphology` | anatomy and form, including descriptions of characters | |
| `microscopy` | histology, immunohistochemistry, confocal or electron microscopy | |
| `development` | embryonic, larval, or colony development | |
| `behavior` | behavior of organisms | |
| `ecology` | ecological interactions, distribution, food webs, oceanography | |
| `bioluminescence` | bioluminescence and fluorescence | |
| `taxonomy` | species descriptions, revisions, terminology | |
| `deep-sea` | deep-sea organisms or ROV/submersible observation | |
| `software` | the paper presents a software tool or pipeline | |
| `statistics` | statistical or mathematical methods development | |
| `reproducibility` | reproducible research practice, workflows, LLM-assisted analysis | |

## Themes

| term | use for |
|---|---|
| `animal-phylogeny` | relationships among major animal clades |
| `coloniality` | colonial organisms, zooids |
| `functional-specialization` | division of labor among zooids, cells, or genes |
| `cell-types` | cell type identity and evolution |
| `gene-expression-evolution` | comparative analysis of gene expression across species |
| `genome-evolution` | evolution of genome content or structure |
| `public-health` | public health practice and policy |
| `teaching` | education and training resources |

## Article type

Only where the entry type and `note` field do not already say it.

| term | use for |
|---|---|
| `review` | reviews and syntheses |
| `commentary` | news & views, dispatches, primers, opinion pieces |
| `popular` | writing for a general audience |
| `protocol` | study protocols |

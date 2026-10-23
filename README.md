# casey_dunn_cv

Curriculum Vitae for Casey Dunn, built with LaTeX and BibLaTeX.

## Source of truth for publications

**This repository is the source of truth for all information about Casey Dunn's publications.** Other repositories are consumers: they read from here and must not keep their own edited copies of publication data. To correct or add anything about a paper, change it here and regenerate the consumers.

What lives here:

- [`publications.bib`](publications.bib): one entry per publication. Besides citation data, entries carry `keywords`, `code_repo`, `data_repo`, `bioproject`, `file`, and other fields described under [Custom bib fields](#custom-bib-fields).
- [`KEYWORDS.md`](KEYWORDS.md): the controlled vocabulary for `keywords`, with rules for applying it.
- [`accessions.tsv`](accessions.tsv): sequence accessions per paper; see [Sequence accessions](#sequence-accessions).

Bib keys follow `FirstauthorYearTopic` (e.g. `Manko2026Bargmannia`): first author's surname without accents or hyphens, year, and one topic word (CamelCase if the topic is inherently two words). Keys are used as file names and join keys in every consumer, so avoid renaming them; see [Renaming a key](#renaming-a-key).

| Repository | Visibility | Role | Reads | Writes back here |
|---|---|---|---|---|
| [casey_dunn_pubs](https://github.com/caseywdunn/casey_dunn_pubs) | private | Archive of each paper's PDF (`library/<key>.pdf`), markdown text for LLMs and scripts (`text/<key>.md`), and supplementary files (`supplements/<key>/`). Its scripts harvest information from these files. | `publications.bib` | `file` and `bioproject` fields, `accessions.tsv` |
| [caseywdunn.github.io](https://github.com/caseywdunn/caseywdunn.github.io) | public | Lab website (dunnlab.org). `bib_to_html.py` renders the publications page. | `publications.bib` | nothing |
| [specimen_tracking](https://github.com/caseywdunn/specimen_tracking) | private | Reconciles lab specimens across sequence data, NCBI, MBARI and the Peabody. | `publications.bib`, `accessions.tsv` | nothing |

The PDFs are in a separate private repository because most are publisher versions that cannot be redistributed. Everything in this repository is public.

## Adding a paper

The repositories are expected as sibling checkouts (`../casey_dunn_pubs`, `../caseywdunn.github.io`). Commands for `casey_dunn_pubs` run in its conda environment (`conda activate casey_dunn_pubs`).

1. **Add the bib entry** to `publications.bib` here, with a `FirstauthorYearTopic` key. Include the DOI. Add `note = {Not peer reviewed}` for non-refereed pieces, and `preprint` and `cover_article` where they apply.
2. **Add keywords** from [`KEYWORDS.md`](KEYWORDS.md), including the broader terms that narrower terms imply. Read the paper's abstract and methods, not just the title. The rules there settle the common judgment calls.
3. **Build the CV** with `make` and check the new entry.
4. **Add the PDF to casey_dunn_pubs.** In `../casey_dunn_pubs`:
   ```sh
   python scripts/pubs.py add <key> ~/Downloads/paper.pdf   # checks the PDF's DOI/title against the entry
   mkdir -p supplements/<key> && cp ~/Downloads/<supplementary files> supplements/<key>/
   python scripts/pubs.py refresh --no-spotlight            # converts to text/<key>.md, sets file = {<key>.pdf} here, updates STATUS.md
   ```
   Downloads can also be dropped in `casey_dunn_pubs/tmp/` and matched to their entries by content. Use the final published version, not a proof or preprint.
5. **Harvest the remaining fields from the paper's text.**
   - `code_repo`: the git repositories holding this paper's own code or data, main analysis repository first. Look in the data availability statement of `text/<key>.md`, e.g. `grep -oE "(github|bitbucket)\.(com|org)/[^ )]+" text/<key>.md`. Leave out third-party tools the paper only used.
   - `data_repo`: the paper's own Zenodo, Dryad or figshare DOIs, as `https://doi.org/...` URLs.
6. **Harvest sequence accessions.** In `../casey_dunn_pubs`:
   ```sh
   python scripts/accessions.py --keys <key>
   ```
   This updates this repository's `accessions.tsv` rows for the paper and its `bioproject` field. Check that the `deposited` rows match what the data availability statement says, and review any `unresolved` rows. Record corrections in `accessions_overrides.tsv` and rerun. Accession tables in supplements or data deposits that could not be fetched automatically (e.g. Dryad files, which need a login) can be downloaded into `casey_dunn_pubs/supplements/<key>/` before running.
7. **Commit both repositories**: `casey_dunn_pubs` (PDF, text, supplements, `sources.tsv`, `STATUS.md`) and this one (`publications.bib`, `accessions.tsv`).
8. **Update the website.** In `../caseywdunn.github.io`:
   ```sh
   python bib_to_html.py ../casey_dunn_cv/publications.bib _includes/publications.html
   ```
   Check the diff, then commit and push. Pushing publishes the site.
9. **Update specimen_tracking** if the paper has sequence data: `git pull` in the `casey_dunn_cv` and `casey_dunn_pubs` checkouts it reads from (siblings of `specimen_tracking`, including on McCleary), then rerun its reconciliation scripts. It reads these repositories directly through its `specimens.pubs` module and keeps no copies.

### Renaming a key

Avoid it, but if a key must change:

- In `casey_dunn_pubs`, `git mv` `library/<old>.pdf`, `text/<old>.md` and `supplements/<old>/` to the new key, and rename the key in `sources.tsv`. `python scripts/pubs.py status` lists PDFs whose key is no longer in the bib.
- Rename the key in `accessions.tsv`, or rerun `scripts/accessions.py --keys <new>`.
- Rerun `scripts/pubs.py link-bib` to fix the `file` field.
- Rerun the specimen_tracking scripts that use the paper.

## Variants

- **Casey_Dunn_CV.pdf** — Full CV
- **Casey_Dunn_CV_short.pdf** — Short CV (excludes Research Grants)

Both variants share a common preamble (`cv_packages.tex`) and section files. The short variant sets a `shortcv` toggle that controls which sections are included.

## Building

Requires `latexmk`, `biber`, and a TeX distribution (e.g., TeX Live).

```sh
make        # build both PDFs
make clean  # remove build artifacts
```

To build a single variant:

```sh
make Casey_Dunn_CV.pdf
make Casey_Dunn_CV_short.pdf
```

## Custom bib fields

`publications.bib` uses some fields beyond standard BibLaTeX. The CV styles ignore them.

- `keywords`: comma-separated terms from the controlled vocabulary in [KEYWORDS.md](KEYWORDS.md).
- `code_repo`: comma-separated URLs of git repositories (GitHub, Bitbucket) holding the paper's own code and/or data, main analysis repository first. Do not list third-party tools the paper used.
- `data_repo`: comma-separated DOI URLs of the paper's own deposits in data archives (Zenodo, Dryad, figshare).
- `bioproject`: comma-separated NCBI BioProjects deposited by the paper. Written by `scripts/accessions.py` in `casey_dunn_pubs`.
- `file`: `<key>.pdf`, the PDF in the private `casey_dunn_pubs` repository. Maintained by that repo's `scripts/pubs.py link-bib`.
- `preprint`: DOI URL of the preprint.
- `cover_article`: `true` if the paper was featured on the journal cover.

## Sequence accessions

[`accessions.tsv`](accessions.tsv) lists sequence accessions reported by or linked to each paper, one row per paper and accession, keyed by bib key. It is generated by `scripts/accessions.py` in the private `casey_dunn_pubs` repository, which searches each paper's text, supplements, code and data repositories, and NCBI's PubMed links, then checks every accession at NCBI.

| column | contents |
|---|---|
| key | bib key |
| accession, type | accession and its kind: `bioproject`, `biosample`, `sra_study`, `sra_experiment`, `sra_sample`, `sra_run`, `assembly`, `wgs_tsa`, `nucleotide` |
| role | `deposited` (submitted by this paper), `cited` (reused or mentioned), or `unresolved` (needs review) |
| ncbi_status | `verified` or `not_found` |
| organism, taxid, lineage | from NCBI |
| bioproject | the record's BioProject, when NCBI gives one |
| source | where it was found: `text`, `supplement`, `repo`, `data_repo`, `ncbi_link` |
| location | file or URL (up to three) where it was found |
| evidence | why the role was assigned |
| context | text around the first mention |

BioSamples and runs that belong to a listed BioProject but are not mentioned by the paper are not listed. Get them from NCBI by BioProject.

Hand corrections go in [`accessions_overrides.tsv`](accessions_overrides.tsv) (columns `key`, `accession`, `role`, `note`), never in `accessions.tsv` itself, which is regenerated. The harvester applies the overrides on every run and records the note as the row's evidence.

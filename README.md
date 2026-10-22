# casey_dunn_cv

Curriculum Vitae for Casey Dunn, built with LaTeX and BibLaTeX.

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
- `file`: `<key>.pdf`, the PDF in the private `casey_dunn_pubs` repository. Maintained by that repo's `scripts/pubs.py link-bib`.
- `preprint`: DOI URL of the preprint.
- `cover_article`: `true` if the paper was featured on the journal cover.

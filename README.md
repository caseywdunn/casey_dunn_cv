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

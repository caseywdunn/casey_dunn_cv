# Notes for agents

## This repository is the source of truth for publication data

"Source of truth" is meant here in the narrow data-management sense: this
repository holds the one authoritative copy of the *records about* Casey
Dunn's publications (citation data, keywords, code and data repositories,
BioProjects, sequence accessions). It makes no claim about the papers'
scientific content.

Other repositories (`casey_dunn_pubs`, `caseywdunn.github.io`,
`specimen_tracking`; see the table in [README.md](README.md)) are consumers.
They read from here and must not keep their own edited copies of this data.
To correct or add anything about a paper, change it here and regenerate the
consumers. The only fields written back from elsewhere are those listed in the
README table (`file`, `bioproject`, `accessions.tsv`), and they are generated
by scripts, not edited by hand.

Follow the README's "Adding a paper" steps when adding a paper.

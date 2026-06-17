# rec-ont

This repository contains a Quarto book website for reviewing the **USACE Recreation Ontology** and related artifacts.

## Contents

The site brings together:

- ontology review pages written in Quarto (`.qmd`)
- Turtle source files under `data/`
- interactive visualization content for ontology structure review
- supporting spatial and crosswalk review pages

## Repository structure

- `_quarto.yaml` — Quarto book configuration
- `index.qmd` — landing page
- `intro.qmd` — review context and guidance
- `ontology-overview.qmd` — high-level ontology summary
- `rec-vis.qmd` — interactive ontology visualization
- `data/` — Turtle source files used by the review pages
- `styles.css` — custom site styling
- `docs/` — rendered output for publishing

## Data files

Ontology and supporting RDF/Turtle files are stored in:

- `data/01-recreation-vocabulary.ttl`
- `data/02-recreation-ontology.ttl`
- `data/06-recreation-spatial.ttl`
- `data/12-recreation-sdsfie-crosswalk.ttl`

## Rendering the site

To render the Quarto book locally:

```bash
quarto render
```

To preview the site locally during editing:

```bash
quarto preview
```

## Output

Rendered site output is written to:

```text
docs/
```

This makes the repository compatible with GitHub Pages if `docs/` is used as the publishing source.

## Notes

- Quarto pages should reference Turtle files from the `data/` directory.
- Avoid linking directly to generated `.html` files inside source pages; prefer linking to `.qmd` files or using Quarto cross-references.
- This repository is intended as a review and collaboration workspace for ontology development.

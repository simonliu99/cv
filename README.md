markdown-cv
===========

Based on [markdown-cv](https://github.com/elipapa/markdown-cv) by
[Eliseo Papa](https://elipapa.github.io/) with styles based on
[David Whipp](https://davewhipp.github.io) and
[Benjamin L. Moore](https://github.com/blmoore/md-cv).

To run locally, install Jekyll and Bundler with `gem install bundler jekyll` then run `jekyll serve`. The page will be rendered at http://localhost:4000.

## Attachments

CV attachments belong in `files/` in this repository. Link to them from `index.md` with relative paths such as `files/liu_residual_sedative_burden.pdf`. In LaTeX, use the corresponding public URL, `https://simonliu.dev/cv/files/liu_residual_sedative_burden.pdf`.

Name attachments by topic, not by their number in the CV, so renumbering does not change a URL. Keep published filenames stable. Copies under the personal website's older `/files/cv/` path remain available for previously published links; new attachments and updates belong here.

## PDF

Install [Tectonic](https://tectonic-typesetting.github.io/) with `brew install tectonic`, then build the print PDF with:

```sh
make pdf
```

The local PDF is written to `build/liu_cv.pdf`. To also copy it to `liu_cv.pdf` for GitHub Pages/Jekyll hosting, run:

```sh
make public-pdf
```

## Checks

Before committing, run:

```sh
make check
```

It builds the PDF and the site, and fails on LaTeX overfull boxes or undefined references, a `files/` link with no file, a file in `files/` that nothing links, or different update dates in `index.md` and `latex/liu_cv.tex`.

## Workflow

- Track each update cycle in one issue titled `<mon yyyy> update`, for example `oct 2026 update`. The body is a `- [ ]` checklist with one short lowercase item per new entry, larger change or fix to the content since the last update. An item that adds a work includes its full citation.
- Small fixes and wording changes need no issue item.
- List ideas not yet planned under `considerations:` in the current issue, and carry unfinished ones into the next cycle's issue.
- Tick each item when its commit lands. Close an issue only when every item is ticked or moved to the next cycle.
- Run `make check` before every commit. A commit that changes `latex/liu_cv.tex` also runs `make public-pdf` and includes the rebuilt `liu_cv.pdf`.
- Change "Last updated" in `index.md` and "Updated" in `latex/liu_cv.tex` in the same commit.

### Commit messages

One line in the form `type(scope): description`, with the description lowercase and imperative. End it with `, #N` while issue `#N` is in progress, or `, closes #N` in the commit that completes it. A commit with no issue item has no suffix.

| Type | Use for | Example |
|---|---|---|
| `feat(<section>)` | new entries or sections | `feat(presentations): add ASA 2026 posters` |
| `fix(<section>)` | corrections to existing content | `fix(citations): add volume and issue numbers` |
| `feat(web)`, `fix(web)` | site layout, CSS and templates | `feat(web): add mobile layout` |
| `feat(pdf)`, `fix(pdf)` | LaTeX layout and PDF-only changes | `fix(pdf): keep date column from wrapping` |
| `build` | `Makefile`, `make check` and Tectonic | `build: add make check` |
| `chore(files)` | adding or renaming attachments | `chore(files): host attachments without list numbers` |
| `docs` | README only | `docs: add workflow rules` |

Section scopes use the CV's section names: `header`, `summary`, `education`, `experience`, `grants`, `honors`, `publications`, `citations`, `presentations`, `press` and `about`.

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

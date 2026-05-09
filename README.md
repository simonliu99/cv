markdown-cv
===========

Based on [markdown-cv](https://github.com/elipapa/markdown-cv) by
[Eliseo Papa](https://elipapa.github.io/) with styles based on
[David Whipp](https://davewhipp.github.io) and
[Benjamin L. Moore](https://github.com/blmoore/md-cv).

To run locally, install Jekyll and Bundler with `gem install bundler jekyll` then run `jekyll serve`. The page will be rendered at http://localhost:4000.

## PDF

Install [Tectonic](https://tectonic-typesetting.github.io/) with `brew install tectonic`, then build the print PDF with:

```sh
make pdf
```

The local PDF is written to `build/liu_cv.pdf`. To also copy it to `liu_cv.pdf` for GitHub Pages/Jekyll hosting, run:

```sh
make public-pdf
```

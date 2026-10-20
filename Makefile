PDF=build/liu_cv.pdf
PUBLIC_PDF=liu_cv.pdf
TEX=latex/liu_cv.tex

.PHONY: pdf public-pdf check clean

pdf:
	mkdir -p build
	tectonic -o build $(TEX)

public-pdf: pdf
	cp $(PDF) $(PUBLIC_PDF)

check:
	sh _scripts/check.sh

clean:
	rm -rf build

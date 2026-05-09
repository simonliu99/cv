PDF=build/liu_cv.pdf
PUBLIC_PDF=liu_cv.pdf
TEX=latex/liu_cv.tex

.PHONY: pdf public-pdf clean

pdf:
	mkdir -p build
	tectonic -o build $(TEX)

public-pdf: pdf
	cp $(PDF) $(PUBLIC_PDF)

clean:
	rm -rf build

#!/bin/sh
# Builds the PDF and the site, then checks attachment links and update dates.
# Run with `make check` from the repository root.
set -u
cd "$(dirname "$0")/.." || exit 1
status=0
mkdir -p build

if ! tectonic -o build latex/liu_cv.tex > build/check-tectonic.log 2>&1; then
	cat build/check-tectonic.log
	echo "check: PDF build failed"
	exit 1
fi
if grep -E 'Overfull|undefined' build/check-tectonic.log; then
	echo "check: LaTeX warnings above"
	status=1
fi

if ! jekyll build --config _config.yml,_scripts/check_config.yml -d build/check-site > build/check-jekyll.log 2>&1; then
	cat build/check-jekyll.log
	echo "check: site build failed"
	exit 1
fi

links=$(grep -ohE 'files/[A-Za-z0-9_.\\-]+\.(pdf|jpg|png)' index.md latex/liu_cv.tex | sed 's/\\//g' | sort -u)
for f in $links; do
	if [ ! -f "$f" ]; then
		echo "check: linked but missing: $f"
		status=1
	fi
done
for f in files/*; do
	[ -e "$f" ] || continue
	if ! printf '%s\n' "$links" | grep -qxF "$f"; then
		echo "check: in files/ but not linked: $f"
		status=1
	fi
done

web_date=$(sed -n 's/.*Last updated: \([A-Z][a-z]* [0-9]*, [0-9]*\).*/\1/p' index.md)
pdf_date=$(sed -n 's/.*Updated \([A-Z][a-z]* [0-9]*, [0-9]*\).*/\1/p' latex/liu_cv.tex)
if [ -z "$web_date" ] || [ "$web_date" != "$pdf_date" ]; then
	echo "check: update dates differ: web '$web_date', PDF '$pdf_date'"
	status=1
fi

if [ "$status" -eq 0 ]; then
	echo "check: passed ($(printf '%s\n' "$links" | grep -c .) attachment links, updated $web_date)"
fi
exit "$status"

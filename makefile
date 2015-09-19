all: doc test

doc: doc/manual.six

doc/manual.six: makedoc.g \
		PackageInfo.g \
		doc/Doc.autodoc \
		doc/IntrinsicCategories.bib \
		gap/*.gd gap/*.gi examples/*.g examples/doc/*.g
	        gap makedoc.g

clean:
	(cd doc ; ./clean)

test:	doc
	gap maketest.g

archive: test
	(mkdir -p ../tar; cd ..; tar czvf tar/IntrinsicCategories.tar.gz --exclude ".DS_Store" --exclude "*~" IntrinsicCategories/doc/*.* IntrinsicCategories/doc/clean IntrinsicCategories/gap/*.{gi,gd} IntrinsicCategories/{PackageInfo.g,README,COPYING,VERSION,init.g,read.g,makedoc.g,makefile,maketest.g} IntrinsicCategories/examples/*.g IntrinsicCategories/examples/doc/*.g)

WEBPOS=public_html
WEBPOS_FINAL=~/Sites/homalg-project/IntrinsicCategories

towww: archive
	echo '<?xml version="1.0" encoding="UTF-8"?>' >${WEBPOS}.version
	echo '<mixer>' >>${WEBPOS}.version
	cat VERSION >>${WEBPOS}.version
	echo '</mixer>' >>${WEBPOS}.version
	cp PackageInfo.g ${WEBPOS}
	cp README ${WEBPOS}/README.IntrinsicCategories
	cp doc/manual.pdf ${WEBPOS}/IntrinsicCategories.pdf
	cp doc/*.{css,html} ${WEBPOS}
	rm -f ${WEBPOS}/*.tar.gz
	mv ../tar/IntrinsicCategories.tar.gz ${WEBPOS}/IntrinsicCategories-`cat VERSION`.tar.gz
	rm -f ${WEBPOS_FINAL}/*.tar.gz
	cp ${WEBPOS}/* ${WEBPOS_FINAL}
	ln -s IntrinsicCategories-`cat VERSION`.tar.gz ${WEBPOS_FINAL}/IntrinsicCategories.tar.gz


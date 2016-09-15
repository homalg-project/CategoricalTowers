all: doc test

doc: doc/manual.six

doc/manual.six: makedoc.g \
		PackageInfo.g \
		doc/Doc.autodoc \
		doc/CategoriesWithAmbientObjects.bib \
		gap/*.gd gap/*.gi examples/*.g examples/doc/*.g
	        gap makedoc.g

clean:
	(cd doc ; ./clean)

test:	doc
	gap maketest.g

archive: test
	(mkdir -p ../tar; cd ..; tar czvf tar/CategoriesWithAmbientObjects.tar.gz --exclude ".DS_Store" --exclude "*~" CategoriesWithAmbientObjects/doc/*.* CategoriesWithAmbientObjects/doc/clean CategoriesWithAmbientObjects/gap/*.{gi,gd} CategoriesWithAmbientObjects/{PackageInfo.g,README,COPYING,VERSION,init.g,read.g,makedoc.g,makefile,maketest.g} CategoriesWithAmbientObjects/examples/*.g CategoriesWithAmbientObjects/examples/doc/*.g)

WEBPOS=public_html
WEBPOS_FINAL=~/Sites/homalg-project/CategoriesWithAmbientObjects

towww: archive
	echo '<?xml version="1.0" encoding="UTF-8"?>' >${WEBPOS}.version
	echo '<mixer>' >>${WEBPOS}.version
	cat VERSION >>${WEBPOS}.version
	echo '</mixer>' >>${WEBPOS}.version
	cp PackageInfo.g ${WEBPOS}
	cp README ${WEBPOS}/README.CategoriesWithAmbientObjects
	cp doc/manual.pdf ${WEBPOS}/CategoriesWithAmbientObjects.pdf
	cp doc/*.{css,html} ${WEBPOS}
	rm -f ${WEBPOS}/*.tar.gz
	mv ../tar/CategoriesWithAmbientObjects.tar.gz ${WEBPOS}/CategoriesWithAmbientObjects-`cat VERSION`.tar.gz
	rm -f ${WEBPOS_FINAL}/*.tar.gz
	cp ${WEBPOS}/* ${WEBPOS_FINAL}
	ln -s CategoriesWithAmbientObjects-`cat VERSION`.tar.gz ${WEBPOS_FINAL}/CategoriesWithAmbientObjects.tar.gz


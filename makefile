all: doc test

doc: doc/manual.six

doc/manual.six: makedoc.g \
		PackageInfo.g \
		doc/Doc.autodoc \
		gap/*.gd gap/*.gi examples/*.g examples/doc/*.g
	        gap makedoc.g

clean:
	(cd doc ; ./clean)

test:	doc
	gap tst/testall.g

test-tabs:
	! grep -RP "\t" examples/*.g examples/doc/*.g gap/*.gi gap/*.gd

test-with-coverage: doc
	#gap --cover stats maketest.g | perl -pe 'END { exit $$status } $$status=1 if /Expected output/;'
	gap --cover stats tst/testall.g
	echo 'LoadPackage("profiling"); OutputJsonCoverage("stats", "coverage.json");' | gap

test-spacing:
	for filename in gap/*; do \
		echo $$filename; \
		grep -E '[^ ] +$$' $$filename && echo "Trailing whitespace found" && exit 1; \
		echo "LoadPackage(\"Algebroids\"); SizeScreen([4096]); func := ReadAsFunction(\"$$filename\"); FileString(\"gap_spacing\", PrintString(func));" | gap; \
		cat "gap_spacing" | sed 's/^function ( ) //g' | sed 's/ return; end$$//g' | sed 's/;/;\n/g' > modified_gap_spacing; \
		cat "$$filename" | grep -v "^ *[#]" | sed 's/^ *//' | grep -v "^$$" | tr "\n" " " | sed "s/;/;\n/g" | head -c -1 > modified_custom_spacing; \
		diff modified_gap_spacing modified_custom_spacing > spacing_diff; \
		diff modified_gap_spacing modified_custom_spacing --ignore-all-space --ignore-space-change --ignore-trailing-space --ignore-blank-lines > spacing_diff_no_blanks; \
		diff spacing_diff_no_blanks spacing_diff || exit; \
	done
	rm gap_spacing
	rm modified_gap_spacing
	rm modified_custom_spacing
	rm spacing_diff
	rm spacing_diff_no_blanks

ci-test: test-tabs test-with-coverage


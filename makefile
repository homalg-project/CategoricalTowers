all: doc test

.PHONY: test

# BEGIN PACKAGE JANITOR
doc: doc_FiniteCocompletion doc_PreSheaves

doc_FiniteCocompletion:
	$(MAKE) -C FiniteCocompletion doc

doc_PreSheaves:
	$(MAKE) -C PreSheaves doc

# END PACKAGE JANITOR

########################################
test: doc test_FiniteCocompletion test_PreSheaves

test_FiniteCocompletion:
	$(MAKE) -C FiniteCocompletion test

test_PreSheaves:
	$(MAKE) -C PreSheaves test

########################################
ci-test: doc ci-test_FiniteCocompletion ci-test_PreSheaves

ci-test_FiniteCocompletion:
	$(MAKE) -C FiniteCocompletion ci-test

ci-test_PreSheaves:
	$(MAKE) -C PreSheaves ci-test

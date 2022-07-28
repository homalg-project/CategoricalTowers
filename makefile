all: doc test

.PHONY: test

# BEGIN PACKAGE JANITOR
doc: doc_FiniteCocompletion

doc_FiniteCocompletion:
	$(MAKE) -C FiniteCocompletion doc

# END PACKAGE JANITOR

########################################
test: doc test_FiniteCocompletion

test_FiniteCocompletion:
	$(MAKE) -C FiniteCocompletion test

########################################
ci-test: doc ci-test_FiniteCocompletion

ci-test_FiniteCocompletion:
	$(MAKE) -C FiniteCocompletion ci-test

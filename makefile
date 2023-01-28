all: doc test

.PHONY: test

# BEGIN PACKAGE JANITOR
doc: doc_FiniteCocompletion doc_PreSheaves doc_CategoryConstructor doc_Toposes doc_Locales

doc_FiniteCocompletion:
	$(MAKE) -C FiniteCocompletion doc

doc_PreSheaves:
	$(MAKE) -C PreSheaves doc

doc_CategoryConstructor:
	$(MAKE) -C CategoryConstructor doc

doc_Toposes:
	$(MAKE) -C Toposes doc

doc_Locales:
	$(MAKE) -C Locales doc

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

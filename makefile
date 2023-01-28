all: doc test

.PHONY: test

# BEGIN PACKAGE JANITOR
doc: doc_FiniteCocompletion doc_PreSheaves doc_CategoryConstructor doc_Toposes doc_Locales doc_SubcategoriesForCAP doc_LazyCategories doc_ZariskiFrames doc_IntrinsicCategories doc_CategoriesWithAmbientObjects doc_IntrinsicModules doc_ExteriorPowersCategories

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

doc_SubcategoriesForCAP:
	$(MAKE) -C SubcategoriesForCAP doc

doc_LazyCategories:
	$(MAKE) -C LazyCategories doc

doc_ZariskiFrames:
	$(MAKE) -C ZariskiFrames doc

doc_IntrinsicCategories:
	$(MAKE) -C IntrinsicCategories doc

doc_CategoriesWithAmbientObjects:
	$(MAKE) -C CategoriesWithAmbientObjects doc

doc_IntrinsicModules:
	$(MAKE) -C IntrinsicModules doc

doc_ExteriorPowersCategories:
	$(MAKE) -C ExteriorPowersCategories doc

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

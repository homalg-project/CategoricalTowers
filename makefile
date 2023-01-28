all: doc test

.PHONY: test

# BEGIN PACKAGE JANITOR
doc: doc_Algebroids doc_CategoriesWithAmbientObjects doc_CategoryConstructor doc_CatReps doc_ExteriorPowersCategories doc_FiniteCocompletion doc_FunctorCategories doc_IntrinsicCategories doc_IntrinsicGradedModules doc_IntrinsicModules doc_LazyCategories doc_Locales doc_PreSheaves doc_SubcategoriesForCAP doc_Toposes doc_ZariskiFrames

doc_Algebroids:
	$(MAKE) -C Algebroids doc

doc_CategoriesWithAmbientObjects:
	$(MAKE) -C CategoriesWithAmbientObjects doc

doc_CategoryConstructor:
	$(MAKE) -C CategoryConstructor doc

doc_CatReps:
	$(MAKE) -C CatReps doc

doc_ExteriorPowersCategories:
	$(MAKE) -C ExteriorPowersCategories doc

doc_FiniteCocompletion:
	$(MAKE) -C FiniteCocompletion doc

doc_FunctorCategories:
	$(MAKE) -C FunctorCategories doc

doc_IntrinsicCategories:
	$(MAKE) -C IntrinsicCategories doc

doc_IntrinsicGradedModules:
	$(MAKE) -C IntrinsicGradedModules doc

doc_IntrinsicModules:
	$(MAKE) -C IntrinsicModules doc

doc_LazyCategories:
	$(MAKE) -C LazyCategories doc

doc_Locales:
	$(MAKE) -C Locales doc

doc_PreSheaves:
	$(MAKE) -C PreSheaves doc

doc_SubcategoriesForCAP:
	$(MAKE) -C SubcategoriesForCAP doc

doc_Toposes:
	$(MAKE) -C Toposes doc

doc_ZariskiFrames:
	$(MAKE) -C ZariskiFrames doc

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

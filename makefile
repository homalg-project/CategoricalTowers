all: doc test

ci-test: doc ci-test_all_packages

# BEGIN PACKAGE JANITOR
################################
doc: doc_Algebroids doc_CategoriesWithAmbientObjects doc_CategoryConstructor doc_CatReps doc_ExteriorPowersCategories doc_FiniteCocompletions doc_FunctorCategories doc_GradedCategories doc_InternalModules doc_IntrinsicCategories doc_IntrinsicGradedModules doc_IntrinsicModules doc_LazyCategories doc_Locales doc_PreSheaves doc_QuotientCategories doc_SubcategoriesForCAP doc_Toposes doc_ZariskiFrames

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

doc_FiniteCocompletions:
	$(MAKE) -C FiniteCocompletions doc

doc_FunctorCategories:
	$(MAKE) -C FunctorCategories doc

doc_GradedCategories:
	$(MAKE) -C GradedCategories doc

doc_InternalModules:
	$(MAKE) -C InternalModules doc

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

doc_QuotientCategories:
	$(MAKE) -C QuotientCategories doc

doc_SubcategoriesForCAP:
	$(MAKE) -C SubcategoriesForCAP doc

doc_Toposes:
	$(MAKE) -C Toposes doc

doc_ZariskiFrames:
	$(MAKE) -C ZariskiFrames doc

################################
test: doc test_Algebroids test_CategoriesWithAmbientObjects test_CategoryConstructor test_CatReps test_ExteriorPowersCategories test_FiniteCocompletions test_FunctorCategories test_GradedCategories test_InternalModules test_IntrinsicCategories test_IntrinsicGradedModules test_IntrinsicModules test_LazyCategories test_Locales test_PreSheaves test_QuotientCategories test_SubcategoriesForCAP test_Toposes test_ZariskiFrames

test_Algebroids:
	$(MAKE) -C Algebroids test

test_CategoriesWithAmbientObjects:
	$(MAKE) -C CategoriesWithAmbientObjects test

test_CategoryConstructor:
	$(MAKE) -C CategoryConstructor test

test_CatReps:
	$(MAKE) -C CatReps test

test_ExteriorPowersCategories:
	$(MAKE) -C ExteriorPowersCategories test

test_FiniteCocompletions:
	$(MAKE) -C FiniteCocompletions test

test_FunctorCategories:
	$(MAKE) -C FunctorCategories test

test_GradedCategories:
	$(MAKE) -C GradedCategories test

test_InternalModules:
	$(MAKE) -C InternalModules test

test_IntrinsicCategories:
	$(MAKE) -C IntrinsicCategories test

test_IntrinsicGradedModules:
	$(MAKE) -C IntrinsicGradedModules test

test_IntrinsicModules:
	$(MAKE) -C IntrinsicModules test

test_LazyCategories:
	$(MAKE) -C LazyCategories test

test_Locales:
	$(MAKE) -C Locales test

test_PreSheaves:
	$(MAKE) -C PreSheaves test

test_QuotientCategories:
	$(MAKE) -C QuotientCategories test

test_SubcategoriesForCAP:
	$(MAKE) -C SubcategoriesForCAP test

test_Toposes:
	$(MAKE) -C Toposes test

test_ZariskiFrames:
	$(MAKE) -C ZariskiFrames test

################################
ci-test_all_packages: ci-test_Algebroids ci-test_CategoriesWithAmbientObjects ci-test_CategoryConstructor ci-test_CatReps ci-test_ExteriorPowersCategories ci-test_FiniteCocompletions ci-test_FunctorCategories ci-test_GradedCategories ci-test_InternalModules ci-test_IntrinsicCategories ci-test_IntrinsicGradedModules ci-test_IntrinsicModules ci-test_LazyCategories ci-test_Locales ci-test_PreSheaves ci-test_QuotientCategories ci-test_SubcategoriesForCAP ci-test_Toposes ci-test_ZariskiFrames

ci-test_Algebroids:
	$(MAKE) -C Algebroids ci-test

ci-test_CategoriesWithAmbientObjects:
	$(MAKE) -C CategoriesWithAmbientObjects ci-test

ci-test_CategoryConstructor:
	$(MAKE) -C CategoryConstructor ci-test

ci-test_CatReps:
	$(MAKE) -C CatReps ci-test

ci-test_ExteriorPowersCategories:
	$(MAKE) -C ExteriorPowersCategories ci-test

ci-test_FiniteCocompletions:
	$(MAKE) -C FiniteCocompletions ci-test

ci-test_FunctorCategories:
	$(MAKE) -C FunctorCategories ci-test

ci-test_GradedCategories:
	$(MAKE) -C GradedCategories ci-test

ci-test_InternalModules:
	$(MAKE) -C InternalModules ci-test

ci-test_IntrinsicCategories:
	$(MAKE) -C IntrinsicCategories ci-test

ci-test_IntrinsicGradedModules:
	$(MAKE) -C IntrinsicGradedModules ci-test

ci-test_IntrinsicModules:
	$(MAKE) -C IntrinsicModules ci-test

ci-test_LazyCategories:
	$(MAKE) -C LazyCategories ci-test

ci-test_Locales:
	$(MAKE) -C Locales ci-test

ci-test_PreSheaves:
	$(MAKE) -C PreSheaves ci-test

ci-test_QuotientCategories:
	$(MAKE) -C QuotientCategories ci-test

ci-test_SubcategoriesForCAP:
	$(MAKE) -C SubcategoriesForCAP ci-test

ci-test_Toposes:
	$(MAKE) -C Toposes ci-test

ci-test_ZariskiFrames:
	$(MAKE) -C ZariskiFrames ci-test

# END PACKAGE JANITOR

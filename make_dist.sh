#!/bin/bash

set -e

packages="FiniteCocompletion PreSheaves CategoryConstructor Toposes Locales SubcategoriesForCAP LazyCategories ZariskiFrames IntrinsicCategories CategoriesWithAmbientObjects IntrinsicModules ExteriorPowersCategories IntrinsicGradedModules "

base_dir="$PWD"

for pkg in ${packages}; do
  ./release-gap-package --skip-existing-release --srcdir ${base_dir}/${pkg} --webdir ${base_dir}/gh-pages/${pkg} --update-script ${base_dir}/gh-pages/update.g $@
done

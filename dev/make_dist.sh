#!/bin/bash

set -e

# Algebroids
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/Algebroids" --webdir "$PWD/gh-pages/Algebroids" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=Algebroids -b Algebroids-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/Algebroids Algebroids-split:master

# CategoriesWithAmbientObjects
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/CategoriesWithAmbientObjects" --webdir "$PWD/gh-pages/CategoriesWithAmbientObjects" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=CategoriesWithAmbientObjects -b CategoriesWithAmbientObjects-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/CategoriesWithAmbientObjects CategoriesWithAmbientObjects-split:master

# CategoryConstructor
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/CategoryConstructor" --webdir "$PWD/gh-pages/CategoryConstructor" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=CategoryConstructor -b CategoryConstructor-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/CategoryConstructor CategoryConstructor-split:master

# CatReps
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/CatReps" --webdir "$PWD/gh-pages/CatReps" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=CatReps -b CatReps-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/CatReps CatReps-split:master

# ExteriorPowersCategories
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/ExteriorPowersCategories" --webdir "$PWD/gh-pages/ExteriorPowersCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=ExteriorPowersCategories -b ExteriorPowersCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/ExteriorPowersCategories ExteriorPowersCategories-split:master

# FiniteCocompletion
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/FiniteCocompletion" --webdir "$PWD/gh-pages/FiniteCocompletion" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=FiniteCocompletion -b FiniteCocompletion-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/FiniteCocompletion FiniteCocompletion-split:master

# FunctorCategories
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/FunctorCategories" --webdir "$PWD/gh-pages/FunctorCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=FunctorCategories -b FunctorCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/FunctorCategories FunctorCategories-split:master

# GradedCategories
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/GradedCategories" --webdir "$PWD/gh-pages/GradedCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=GradedCategories -b GradedCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/GradedCategories GradedCategories-split:master

# InternalModules
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/InternalModules" --webdir "$PWD/gh-pages/InternalModules" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=InternalModules -b InternalModules-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/InternalModules InternalModules-split:master

# IntrinsicCategories
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/IntrinsicCategories" --webdir "$PWD/gh-pages/IntrinsicCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=IntrinsicCategories -b IntrinsicCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/IntrinsicCategories IntrinsicCategories-split:master

# IntrinsicGradedModules
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/IntrinsicGradedModules" --webdir "$PWD/gh-pages/IntrinsicGradedModules" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=IntrinsicGradedModules -b IntrinsicGradedModules-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/IntrinsicGradedModules IntrinsicGradedModules-split:master

# IntrinsicModules
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/IntrinsicModules" --webdir "$PWD/gh-pages/IntrinsicModules" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=IntrinsicModules -b IntrinsicModules-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/IntrinsicModules IntrinsicModules-split:master

# LazyCategories
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/LazyCategories" --webdir "$PWD/gh-pages/LazyCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=LazyCategories -b LazyCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/LazyCategories LazyCategories-split:master

# Locales
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/Locales" --webdir "$PWD/gh-pages/Locales" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=Locales -b Locales-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/Locales Locales-split:master

# PreSheaves
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/PreSheaves" --webdir "$PWD/gh-pages/PreSheaves" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=PreSheaves -b PreSheaves-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/PreSheaves PreSheaves-split:master

# SubcategoriesForCAP
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/SubcategoriesForCAP" --webdir "$PWD/gh-pages/SubcategoriesForCAP" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=SubcategoriesForCAP -b SubcategoriesForCAP-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/SubcategoriesForCAP SubcategoriesForCAP-split:master

# Toposes
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/Toposes" --webdir "$PWD/gh-pages/Toposes" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=Toposes -b Toposes-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/Toposes Toposes-split:master

# ZariskiFrames
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/ZariskiFrames" --webdir "$PWD/gh-pages/ZariskiFrames" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=ZariskiFrames -b ZariskiFrames-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/ZariskiFrames ZariskiFrames-split:master

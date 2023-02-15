#!/bin/bash

set -e

# Algebroids
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/Algebroids" --webdir "$PWD/gh-pages/Algebroids" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"  --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=Algebroids -b Algebroids-split

# CategoriesWithAmbientObjects
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/CategoriesWithAmbientObjects" --webdir "$PWD/gh-pages/CategoriesWithAmbientObjects" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"  --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=CategoriesWithAmbientObjects -b CategoriesWithAmbientObjects-split

# CategoryConstructor
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/CategoryConstructor" --webdir "$PWD/gh-pages/CategoryConstructor" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"  --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=CategoryConstructor -b CategoryConstructor-split

# CatReps
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/CatReps" --webdir "$PWD/gh-pages/CatReps" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"  --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=CatReps -b CatReps-split

# ExteriorPowersCategories
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/ExteriorPowersCategories" --webdir "$PWD/gh-pages/ExteriorPowersCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"  --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=ExteriorPowersCategories -b ExteriorPowersCategories-split

# FiniteCocompletion
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/FiniteCocompletion" --webdir "$PWD/gh-pages/FiniteCocompletion" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"  --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=FiniteCocompletion -b FiniteCocompletion-split

# FunctorCategories
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/FunctorCategories" --webdir "$PWD/gh-pages/FunctorCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"  --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=FunctorCategories -b FunctorCategories-split

# GradedCategories
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/GradedCategories" --webdir "$PWD/gh-pages/GradedCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"  --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=GradedCategories -b GradedCategories-split

# InternalModules
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/InternalModules" --webdir "$PWD/gh-pages/InternalModules" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"  --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=InternalModules -b InternalModules-split

# IntrinsicCategories
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/IntrinsicCategories" --webdir "$PWD/gh-pages/IntrinsicCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"  --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=IntrinsicCategories -b IntrinsicCategories-split

# IntrinsicGradedModules
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/IntrinsicGradedModules" --webdir "$PWD/gh-pages/IntrinsicGradedModules" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"  --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=IntrinsicGradedModules -b IntrinsicGradedModules-split

# IntrinsicModules
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/IntrinsicModules" --webdir "$PWD/gh-pages/IntrinsicModules" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"  --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=IntrinsicModules -b IntrinsicModules-split

# LazyCategories
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/LazyCategories" --webdir "$PWD/gh-pages/LazyCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"  --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=LazyCategories -b LazyCategories-split

# Locales
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/Locales" --webdir "$PWD/gh-pages/Locales" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"  --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=Locales -b Locales-split

# PreSheaves
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/PreSheaves" --webdir "$PWD/gh-pages/PreSheaves" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"  --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=PreSheaves -b PreSheaves-split

# SubcategoriesForCAP
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/SubcategoriesForCAP" --webdir "$PWD/gh-pages/SubcategoriesForCAP" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"  --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=SubcategoriesForCAP -b SubcategoriesForCAP-split

# Toposes
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/Toposes" --webdir "$PWD/gh-pages/Toposes" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"  --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=Toposes -b Toposes-split

# ZariskiFrames
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/ZariskiFrames" --webdir "$PWD/gh-pages/ZariskiFrames" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"  --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=ZariskiFrames -b ZariskiFrames-split

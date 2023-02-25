#!/bin/bash

set -e

# Algebroids
echo "Simulate release of Algebroids"
./dev/release-gap-package --srcdir "$PWD/Algebroids" --webdir "$PWD/gh-pages/Algebroids" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=Algebroids -b Algebroids-split
echo ""

# CategoriesWithAmbientObjects
echo "Simulate release of CategoriesWithAmbientObjects"
./dev/release-gap-package --srcdir "$PWD/CategoriesWithAmbientObjects" --webdir "$PWD/gh-pages/CategoriesWithAmbientObjects" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=CategoriesWithAmbientObjects -b CategoriesWithAmbientObjects-split
echo ""

# CategoryConstructor
echo "Simulate release of CategoryConstructor"
./dev/release-gap-package --srcdir "$PWD/CategoryConstructor" --webdir "$PWD/gh-pages/CategoryConstructor" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=CategoryConstructor -b CategoryConstructor-split
echo ""

# CatReps
echo "Simulate release of CatReps"
./dev/release-gap-package --srcdir "$PWD/CatReps" --webdir "$PWD/gh-pages/CatReps" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=CatReps -b CatReps-split
echo ""

# DiscreteCategories
echo "Simulate release of DiscreteCategories"
./dev/release-gap-package --srcdir "$PWD/DiscreteCategories" --webdir "$PWD/gh-pages/DiscreteCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=DiscreteCategories -b DiscreteCategories-split
echo ""

# ExteriorPowersCategories
echo "Simulate release of ExteriorPowersCategories"
./dev/release-gap-package --srcdir "$PWD/ExteriorPowersCategories" --webdir "$PWD/gh-pages/ExteriorPowersCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=ExteriorPowersCategories -b ExteriorPowersCategories-split
echo ""

# FiniteCocompletion
echo "Simulate release of FiniteCocompletion"
./dev/release-gap-package --srcdir "$PWD/FiniteCocompletion" --webdir "$PWD/gh-pages/FiniteCocompletion" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=FiniteCocompletion -b FiniteCocompletion-split
echo ""

# FunctorCategories
echo "Simulate release of FunctorCategories"
./dev/release-gap-package --srcdir "$PWD/FunctorCategories" --webdir "$PWD/gh-pages/FunctorCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=FunctorCategories -b FunctorCategories-split
echo ""

# GradedCategories
echo "Simulate release of GradedCategories"
./dev/release-gap-package --srcdir "$PWD/GradedCategories" --webdir "$PWD/gh-pages/GradedCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=GradedCategories -b GradedCategories-split
echo ""

# InternalModules
echo "Simulate release of InternalModules"
./dev/release-gap-package --srcdir "$PWD/InternalModules" --webdir "$PWD/gh-pages/InternalModules" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=InternalModules -b InternalModules-split
echo ""

# IntrinsicCategories
echo "Simulate release of IntrinsicCategories"
./dev/release-gap-package --srcdir "$PWD/IntrinsicCategories" --webdir "$PWD/gh-pages/IntrinsicCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=IntrinsicCategories -b IntrinsicCategories-split
echo ""

# IntrinsicGradedModules
echo "Simulate release of IntrinsicGradedModules"
./dev/release-gap-package --srcdir "$PWD/IntrinsicGradedModules" --webdir "$PWD/gh-pages/IntrinsicGradedModules" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=IntrinsicGradedModules -b IntrinsicGradedModules-split
echo ""

# IntrinsicModules
echo "Simulate release of IntrinsicModules"
./dev/release-gap-package --srcdir "$PWD/IntrinsicModules" --webdir "$PWD/gh-pages/IntrinsicModules" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=IntrinsicModules -b IntrinsicModules-split
echo ""

# LazyCategories
echo "Simulate release of LazyCategories"
./dev/release-gap-package --srcdir "$PWD/LazyCategories" --webdir "$PWD/gh-pages/LazyCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=LazyCategories -b LazyCategories-split
echo ""

# Locales
echo "Simulate release of Locales"
./dev/release-gap-package --srcdir "$PWD/Locales" --webdir "$PWD/gh-pages/Locales" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=Locales -b Locales-split
echo ""

# PreSheaves
echo "Simulate release of PreSheaves"
./dev/release-gap-package --srcdir "$PWD/PreSheaves" --webdir "$PWD/gh-pages/PreSheaves" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=PreSheaves -b PreSheaves-split
echo ""

# SubcategoriesForCAP
echo "Simulate release of SubcategoriesForCAP"
./dev/release-gap-package --srcdir "$PWD/SubcategoriesForCAP" --webdir "$PWD/gh-pages/SubcategoriesForCAP" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=SubcategoriesForCAP -b SubcategoriesForCAP-split
echo ""

# Toposes
echo "Simulate release of Toposes"
./dev/release-gap-package --srcdir "$PWD/Toposes" --webdir "$PWD/gh-pages/Toposes" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=Toposes -b Toposes-split
echo ""

# ZariskiFrames
echo "Simulate release of ZariskiFrames"
./dev/release-gap-package --srcdir "$PWD/ZariskiFrames" --webdir "$PWD/gh-pages/ZariskiFrames" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=ZariskiFrames -b ZariskiFrames-split
echo ""

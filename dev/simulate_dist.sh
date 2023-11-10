#!/bin/bash

set -e

# Algebroids
echo "Simulate release of Algebroids"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/Algebroids" --webdir "$PWD/gh-pages/Algebroids" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=Algebroids -b Algebroids-split
echo ""

# CategoriesWithAmbientObjects
echo "Simulate release of CategoriesWithAmbientObjects"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/CategoriesWithAmbientObjects" --webdir "$PWD/gh-pages/CategoriesWithAmbientObjects" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=CategoriesWithAmbientObjects -b CategoriesWithAmbientObjects-split
echo ""

# ToolsForCategoricalTowers
echo "Simulate release of ToolsForCategoricalTowers"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/ToolsForCategoricalTowers" --webdir "$PWD/gh-pages/ToolsForCategoricalTowers" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=ToolsForCategoricalTowers -b ToolsForCategoricalTowers-split
echo ""

# CatReps
echo "Simulate release of CatReps"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/CatReps" --webdir "$PWD/gh-pages/CatReps" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=CatReps -b CatReps-split
echo ""

# ExteriorPowersCategories
echo "Simulate release of ExteriorPowersCategories"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/ExteriorPowersCategories" --webdir "$PWD/gh-pages/ExteriorPowersCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=ExteriorPowersCategories -b ExteriorPowersCategories-split
echo ""

# FiniteCocompletions
echo "Simulate release of FiniteCocompletions"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/FiniteCocompletions" --webdir "$PWD/gh-pages/FiniteCocompletions" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=FiniteCocompletions -b FiniteCocompletions-split
echo ""

# FunctorCategories
echo "Simulate release of FunctorCategories"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/FunctorCategories" --webdir "$PWD/gh-pages/FunctorCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=FunctorCategories -b FunctorCategories-split
echo ""

# GradedCategories
echo "Simulate release of GradedCategories"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/GradedCategories" --webdir "$PWD/gh-pages/GradedCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=GradedCategories -b GradedCategories-split
echo ""

# InternalModules
echo "Simulate release of InternalModules"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/InternalModules" --webdir "$PWD/gh-pages/InternalModules" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=InternalModules -b InternalModules-split
echo ""

# IntrinsicCategories
echo "Simulate release of IntrinsicCategories"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/IntrinsicCategories" --webdir "$PWD/gh-pages/IntrinsicCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=IntrinsicCategories -b IntrinsicCategories-split
echo ""

# IntrinsicGradedModules
echo "Simulate release of IntrinsicGradedModules"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/IntrinsicGradedModules" --webdir "$PWD/gh-pages/IntrinsicGradedModules" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=IntrinsicGradedModules -b IntrinsicGradedModules-split
echo ""

# IntrinsicModules
echo "Simulate release of IntrinsicModules"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/IntrinsicModules" --webdir "$PWD/gh-pages/IntrinsicModules" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=IntrinsicModules -b IntrinsicModules-split
echo ""

# LazyCategories
echo "Simulate release of LazyCategories"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/LazyCategories" --webdir "$PWD/gh-pages/LazyCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=LazyCategories -b LazyCategories-split
echo ""

# Locales
echo "Simulate release of Locales"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/Locales" --webdir "$PWD/gh-pages/Locales" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=Locales -b Locales-split
echo ""

# PreSheaves
echo "Simulate release of PreSheaves"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/PreSheaves" --webdir "$PWD/gh-pages/PreSheaves" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=PreSheaves -b PreSheaves-split
echo ""

# QuotientCategories
echo "Simulate release of QuotientCategories"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/QuotientCategories" --webdir "$PWD/gh-pages/QuotientCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=QuotientCategories -b QuotientCategories-split
echo ""

# SubcategoriesForCAP
echo "Simulate release of SubcategoriesForCAP"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/SubcategoriesForCAP" --webdir "$PWD/gh-pages/SubcategoriesForCAP" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=SubcategoriesForCAP -b SubcategoriesForCAP-split
echo ""

# Toposes
echo "Simulate release of Toposes"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/Toposes" --webdir "$PWD/gh-pages/Toposes" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=Toposes -b Toposes-split
echo ""

# ZariskiFrames
echo "Simulate release of ZariskiFrames"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --srcdir "$PWD/ZariskiFrames" --webdir "$PWD/gh-pages/ZariskiFrames" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release" --only-tarball
# creating subsplits is slow and should only rarely result in errors -> do not simulate to keep testing PRs as fast as possible
#git subtree split --prefix=ZariskiFrames -b ZariskiFrames-split
echo ""

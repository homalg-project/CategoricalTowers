#!/bin/bash

set -e

# Algebroids
echo "Release Algebroids"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/Algebroids" --webdir "$PWD/gh-pages/Algebroids" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=Algebroids -b Algebroids-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/Algebroids Algebroids-split:master
echo ""

# CategoriesWithAmbientObjects
echo "Release CategoriesWithAmbientObjects"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/CategoriesWithAmbientObjects" --webdir "$PWD/gh-pages/CategoriesWithAmbientObjects" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=CategoriesWithAmbientObjects -b CategoriesWithAmbientObjects-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/CategoriesWithAmbientObjects CategoriesWithAmbientObjects-split:master
echo ""

# CatReps
echo "Release CatReps"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/CatReps" --webdir "$PWD/gh-pages/CatReps" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=CatReps -b CatReps-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/CatReps CatReps-split:master
echo ""

# ExteriorPowersCategories
echo "Release ExteriorPowersCategories"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/ExteriorPowersCategories" --webdir "$PWD/gh-pages/ExteriorPowersCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=ExteriorPowersCategories -b ExteriorPowersCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/ExteriorPowersCategories ExteriorPowersCategories-split:master
echo ""

# FiniteCocompletions
echo "Release FiniteCocompletions"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/FiniteCocompletions" --webdir "$PWD/gh-pages/FiniteCocompletions" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=FiniteCocompletions -b FiniteCocompletions-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/FiniteCocompletions FiniteCocompletions-split:master
echo ""

# FpCategories
echo "Release FpCategories"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/FpCategories" --webdir "$PWD/gh-pages/FpCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=FpCategories -b FpCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/FpCategories FpCategories-split:master
echo ""

# FpLinearCategories
echo "Release FpLinearCategories"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/FpLinearCategories" --webdir "$PWD/gh-pages/FpLinearCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=FpLinearCategories -b FpLinearCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/FpLinearCategories FpLinearCategories-split:master
echo ""

# FunctorCategories
echo "Release FunctorCategories"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/FunctorCategories" --webdir "$PWD/gh-pages/FunctorCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=FunctorCategories -b FunctorCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/FunctorCategories FunctorCategories-split:master
echo ""

# GradedCategories
echo "Release GradedCategories"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/GradedCategories" --webdir "$PWD/gh-pages/GradedCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=GradedCategories -b GradedCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/GradedCategories GradedCategories-split:master
echo ""

# InternalModules
echo "Release InternalModules"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/InternalModules" --webdir "$PWD/gh-pages/InternalModules" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=InternalModules -b InternalModules-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/InternalModules InternalModules-split:master
echo ""

# IntrinsicCategories
echo "Release IntrinsicCategories"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/IntrinsicCategories" --webdir "$PWD/gh-pages/IntrinsicCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=IntrinsicCategories -b IntrinsicCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/IntrinsicCategories IntrinsicCategories-split:master
echo ""

# IntrinsicGradedModules
echo "Release IntrinsicGradedModules"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/IntrinsicGradedModules" --webdir "$PWD/gh-pages/IntrinsicGradedModules" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=IntrinsicGradedModules -b IntrinsicGradedModules-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/IntrinsicGradedModules IntrinsicGradedModules-split:master
echo ""

# IntrinsicModules
echo "Release IntrinsicModules"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/IntrinsicModules" --webdir "$PWD/gh-pages/IntrinsicModules" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=IntrinsicModules -b IntrinsicModules-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/IntrinsicModules IntrinsicModules-split:master
echo ""

# LazyCategories
echo "Release LazyCategories"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/LazyCategories" --webdir "$PWD/gh-pages/LazyCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=LazyCategories -b LazyCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/LazyCategories LazyCategories-split:master
echo ""

# Locales
echo "Release Locales"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/Locales" --webdir "$PWD/gh-pages/Locales" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=Locales -b Locales-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/Locales Locales-split:master
echo ""

# PreSheaves
echo "Release PreSheaves"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/PreSheaves" --webdir "$PWD/gh-pages/PreSheaves" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=PreSheaves -b PreSheaves-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/PreSheaves PreSheaves-split:master
echo ""

# QuotientCategories
echo "Release QuotientCategories"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/QuotientCategories" --webdir "$PWD/gh-pages/QuotientCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=QuotientCategories -b QuotientCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/QuotientCategories QuotientCategories-split:master
echo ""

# SubcategoriesForCAP
echo "Release SubcategoriesForCAP"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/SubcategoriesForCAP" --webdir "$PWD/gh-pages/SubcategoriesForCAP" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=SubcategoriesForCAP -b SubcategoriesForCAP-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/SubcategoriesForCAP SubcategoriesForCAP-split:master
echo ""

# ToolsForCategoricalTowers
echo "Release ToolsForCategoricalTowers"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/ToolsForCategoricalTowers" --webdir "$PWD/gh-pages/ToolsForCategoricalTowers" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=ToolsForCategoricalTowers -b ToolsForCategoricalTowers-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/ToolsForCategoricalTowers ToolsForCategoricalTowers-split:master
echo ""

# Toposes
echo "Release Toposes"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/Toposes" --webdir "$PWD/gh-pages/Toposes" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=Toposes -b Toposes-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/Toposes Toposes-split:master
echo ""

# ZariskiFrames
echo "Release ZariskiFrames"
GAP_PKG_RELEASE_DATE=$(date -I) ./dev/release-gap-package --skip-existing-release --srcdir "$PWD/ZariskiFrames" --webdir "$PWD/gh-pages/ZariskiFrames" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=ZariskiFrames -b ZariskiFrames-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/ZariskiFrames ZariskiFrames-split:master
echo ""

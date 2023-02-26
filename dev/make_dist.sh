#!/bin/bash

set -e

# Algebroids
echo "Release Algebroids"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/Algebroids" --webdir "$PWD/gh-pages/Algebroids" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=Algebroids -b Algebroids-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/Algebroids Algebroids-split:master
echo ""

# CategoriesWithAmbientObjects
echo "Release CategoriesWithAmbientObjects"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/CategoriesWithAmbientObjects" --webdir "$PWD/gh-pages/CategoriesWithAmbientObjects" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=CategoriesWithAmbientObjects -b CategoriesWithAmbientObjects-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/CategoriesWithAmbientObjects CategoriesWithAmbientObjects-split:master
echo ""

# CategoryConstructor
echo "Release CategoryConstructor"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/CategoryConstructor" --webdir "$PWD/gh-pages/CategoryConstructor" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=CategoryConstructor -b CategoryConstructor-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/CategoryConstructor CategoryConstructor-split:master
echo ""

# CatReps
echo "Release CatReps"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/CatReps" --webdir "$PWD/gh-pages/CatReps" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=CatReps -b CatReps-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/CatReps CatReps-split:master
echo ""

# DiscreteCategories
echo "Release DiscreteCategories"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/DiscreteCategories" --webdir "$PWD/gh-pages/DiscreteCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=DiscreteCategories -b DiscreteCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/DiscreteCategories DiscreteCategories-split:master
echo ""

# ExteriorPowersCategories
echo "Release ExteriorPowersCategories"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/ExteriorPowersCategories" --webdir "$PWD/gh-pages/ExteriorPowersCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=ExteriorPowersCategories -b ExteriorPowersCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/ExteriorPowersCategories ExteriorPowersCategories-split:master
echo ""

# FiniteCocompletion
echo "Release FiniteCocompletion"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/FiniteCocompletion" --webdir "$PWD/gh-pages/FiniteCocompletion" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=FiniteCocompletion -b FiniteCocompletion-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/FiniteCocompletion FiniteCocompletion-split:master
echo ""

# FunctorCategories
echo "Release FunctorCategories"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/FunctorCategories" --webdir "$PWD/gh-pages/FunctorCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=FunctorCategories -b FunctorCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/FunctorCategories FunctorCategories-split:master
echo ""

# GradedCategories
echo "Release GradedCategories"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/GradedCategories" --webdir "$PWD/gh-pages/GradedCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=GradedCategories -b GradedCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/GradedCategories GradedCategories-split:master
echo ""

# InternalModules
echo "Release InternalModules"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/InternalModules" --webdir "$PWD/gh-pages/InternalModules" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=InternalModules -b InternalModules-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/InternalModules InternalModules-split:master
echo ""

# IntrinsicCategories
echo "Release IntrinsicCategories"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/IntrinsicCategories" --webdir "$PWD/gh-pages/IntrinsicCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=IntrinsicCategories -b IntrinsicCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/IntrinsicCategories IntrinsicCategories-split:master
echo ""

# IntrinsicGradedModules
echo "Release IntrinsicGradedModules"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/IntrinsicGradedModules" --webdir "$PWD/gh-pages/IntrinsicGradedModules" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=IntrinsicGradedModules -b IntrinsicGradedModules-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/IntrinsicGradedModules IntrinsicGradedModules-split:master
echo ""

# IntrinsicModules
echo "Release IntrinsicModules"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/IntrinsicModules" --webdir "$PWD/gh-pages/IntrinsicModules" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=IntrinsicModules -b IntrinsicModules-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/IntrinsicModules IntrinsicModules-split:master
echo ""

# LazyCategories
echo "Release LazyCategories"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/LazyCategories" --webdir "$PWD/gh-pages/LazyCategories" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=LazyCategories -b LazyCategories-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/LazyCategories LazyCategories-split:master
echo ""

# Locales
echo "Release Locales"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/Locales" --webdir "$PWD/gh-pages/Locales" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=Locales -b Locales-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/Locales Locales-split:master
echo ""

# PreSheaves
echo "Release PreSheaves"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/PreSheaves" --webdir "$PWD/gh-pages/PreSheaves" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=PreSheaves -b PreSheaves-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/PreSheaves PreSheaves-split:master
echo ""

# SubcategoriesForCAP
echo "Release SubcategoriesForCAP"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/SubcategoriesForCAP" --webdir "$PWD/gh-pages/SubcategoriesForCAP" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=SubcategoriesForCAP -b SubcategoriesForCAP-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/SubcategoriesForCAP SubcategoriesForCAP-split:master
echo ""

# Toposes
echo "Release Toposes"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/Toposes" --webdir "$PWD/gh-pages/Toposes" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=Toposes -b Toposes-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/Toposes Toposes-split:master
echo ""

# ZariskiFrames
echo "Release ZariskiFrames"
./dev/release-gap-package --skip-existing-release --srcdir "$PWD/ZariskiFrames" --webdir "$PWD/gh-pages/ZariskiFrames" --update-script "$PWD/gh-pages/update.g" --release-script "$PWD/dev/.release"
git subtree split --prefix=ZariskiFrames -b ZariskiFrames-split
git push https://homalg-project:$SUBSPLIT_PUSH_SECRET@github.com/homalg-project/ZariskiFrames ZariskiFrames-split:master
echo ""

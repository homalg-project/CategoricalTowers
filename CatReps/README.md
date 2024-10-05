<!-- BEGIN HEADER -->
# CatReps&ensp;<sup><sup>[![View code][code-img]][code-url]</sup></sup>

### Representations and cohomology of finite categories

| Documentation | Latest Release | Build Status of [CategoricalTowers](/../../) | Code Coverage |
| ------------- | -------------- | ------------ | ------------- |
| [![HTML stable documentation][html-img]][html-url] [![PDF stable documentation][pdf-img]][pdf-url] | [![version][version-img]][version-url] [![date][date-img]][date-url] | [![Build Status][tests-img]][tests-url] | [![Code Coverage][codecov-img]][codecov-url] |

<!-- END HEADER -->

The package `CatReps` provides a constructor for *finite concrete categories* (i.e., finite subcategories of the category of finite sets) by generating morphisms:

```gap
gap> LoadPackage( "CatReps" );
true
gap> c3c3 := ConcreteCategoryForCAP( [ [2,3,1], [4,5,6], [,,,5,6,4] ] );
A finite concrete category
gap> mors := SetOfGeneratingMorphisms( c3c3 );
[ A morphism in subcategory given by: <A morphism in FinSets>,
  A morphism in subcategory given by: <A morphism in FinSets>,
  A morphism in subcategory given by: <A morphism in FinSets> ]
gap> Perform( mors, Display );
A morphism in subcategory given by: [ [ 1, 2, 3 ], [ [ 1, 2 ], [ 2, 3 ], [ 3, 1 ] ], [ 1, 2, 3 ] ]
A morphism in subcategory given by: [ [ 1, 2, 3 ], [ [ 1, 4 ], [ 2, 5 ], [ 3, 6 ] ], [ 4, 5, 6 ] ]
A morphism in subcategory given by: [ [ 4, 5, 6 ], [ [ 4, 5 ], [ 5, 6 ], [ 6, 4 ] ], [ 4, 5, 6 ] ]
```

Using the procedure `Algebroid` one can then construct a finite presentation of the k-linear closure of the given concrete category. The current preliminary implementation only works when the endomorphism monoids of the concrete category are explicitly cyclic:

```gap
gap> Q := HomalgFieldOfRationals( );
Q
gap> A := Q[c3c3];
Algebroid( Q, FreeCategory( RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations
gap> RelationsOfAlgebroid( A );
[ (1)-[1*(a*a*a) - 1*(1)]->(1), (2)-[1*(c*c*c) - 1*(2)]->(2), (1)-[1*(b*c) - 1*(a*b)]->(2) ]
gap> IsLinearClosureOfACategory( A );
true
```

Finally, using the constructor `Hom` from the package [`FunctorCategories`](https://github.com/homalg-project/FunctorCategories) one can construct the category of finite dimensional k-linear representations of the finite concrete category:

```gap
gap> CatReps := FunctorCategory( A );
FunctorCategory( Algebroid( Q, FreeCategory(
RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
Category of matrices over Q )
```

The supported categorical doctrine of the category of representations is

* k-linear,
* symmetric monoidal,
* Abelian category
* with enough projectives, and
* (possibly incomplete) direct sum decomposition.

```gap
gap> Display( CatReps );
107 primitive operations were used to derive 360 operations for this category
which constructively
* IsCategoryWithDecidableColifts
* IsCategoryWithDecidableLifts
* IsEquippedWithHomomorphismStructure
* IsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms
* IsSymmetricMonoidalCategory
* IsAbelianCategoryWithEnoughProjectives
gap> CommutativeRingOfLinearCategory( CatReps );
Q
```

### `FunctorCategories`

`CatReps` heavily relies on the package [`FunctorCategories`](https://github.com/homalg-project/FunctorCategories), which itself depends on [various other packages](https://github.com/homalg-project/CatReps/blob/master/.github/workflows/Tests.yml#L25).

### History of this package

`CatReps` was originally meant to wrap [Peter Webb](https://www-users.math.umn.edu/~webb/)'s pre-package [`catreps`](https://www-users.math.umn.edu/~webb/GAPfiles/catreps) into the categorical framework offered by [`CAP`](https://homalg-project.github.io/docs/CAP_project/). The only dependency left can be found in the file [gap/catreps.g](https://codecov.io/gh/homalg-project/CatReps/src/master/gap/catreps.g). The entire functionality of [`catreps`](https://www-users.math.umn.edu/~webb/GAPfiles/catreps) is now available through [`FunctorCategories`](https://homalg-project.github.io/pkg/FunctorCategories).

In March 2020 [Peter Webb](https://www-users.math.umn.edu/~webb/)' and his coauthors made a major new release of the former packages `reps` and `catreps` in which they are combined as one. The code of these former packages is still available at [`groupreps`](https://www-users.math.umn.edu/~webb/GAPfiles/groupreps) ([tutorial](https://www-users.math.umn.edu/~webb/GAPfiles/grouprepstutorial.html)) (the new name for the former reps) and [`catreps`](https://www-users.math.umn.edu/~webb/GAPfiles/catreps) ([tutorial](https://www-users.math.umn.edu/~webb/GAPfiles/catrepstutorial.html)), but it will no longer be supported. The new package [`reps`](https://www-users.math.umn.edu/~webb/GAPfiles/reps) combines the functionality of both former packages.

<!-- BEGIN FOOTER -->
---

### Dependencies

To obtain current versions of all dependencies, `git clone` (or `git pull` to update) the following repositories:

|    | Repository | git URL |
|--- | ---------- | ------- |
| 1. | [**homalg_project**](https://github.com/homalg-project/homalg_project#readme) | https://github.com/homalg-project/homalg_project.git |
| 2. | [**CAP_project**](https://github.com/homalg-project/CAP_project#readme) | https://github.com/homalg-project/CAP_project.git |
| 3. | [**HigherHomologicalAlgebra**](https://github.com/homalg-project/HigherHomologicalAlgebra#readme) | https://github.com/homalg-project/HigherHomologicalAlgebra.git |
| 4. | [**QPA2**](https://github.com/homalg-project/QPA2#readme) | https://github.com/homalg-project/QPA2.git |
| 5. | [**FinSetsForCAP**](https://github.com/homalg-project/FinSetsForCAP#readme) | https://github.com/homalg-project/FinSetsForCAP.git |

[html-img]: https://img.shields.io/badge/🔗%20HTML-stable-blue.svg
[html-url]: https://homalg-project.github.io/CategoricalTowers/CatReps/doc/chap0_mj.html

[pdf-img]: https://img.shields.io/badge/🔗%20PDF-stable-blue.svg
[pdf-url]: https://homalg-project.github.io/CategoricalTowers/CatReps/download_pdf.html

[version-img]: https://img.shields.io/endpoint?url=https://homalg-project.github.io/CategoricalTowers/CatReps/badge_version.json&label=🔗%20version&color=yellow
[version-url]: https://homalg-project.github.io/CategoricalTowers/CatReps/view_release.html

[date-img]: https://img.shields.io/endpoint?url=https://homalg-project.github.io/CategoricalTowers/CatReps/badge_date.json&label=🔗%20released%20on&color=yellow
[date-url]: https://homalg-project.github.io/CategoricalTowers/CatReps/view_release.html

[tests-img]: https://github.com/homalg-project/CategoricalTowers/actions/workflows/Tests.yml/badge.svg?branch=master
[tests-url]: https://github.com/homalg-project/CategoricalTowers/actions/workflows/Tests.yml?query=branch%3Amaster

[codecov-img]: https://codecov.io/gh/homalg-project/CategoricalTowers/branch/master/graph/badge.svg?flag=CatReps
[codecov-url]: https://app.codecov.io/gh/homalg-project/CategoricalTowers/tree/master/CatReps

[code-img]: https://img.shields.io/badge/-View%20code-blue?logo=github
[code-url]: https://github.com/homalg-project/CategoricalTowers/tree/master/CatReps#top
<!-- END FOOTER -->

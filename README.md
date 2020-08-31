# CatReps

| **Documentation**                                                 | **Build Status**                                                                                |
|:-----------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------:|
| [![][docs-stable-img]][docs-stable-url]                           | [![][tests-img]][tests-url] [![][codecov-img]][codecov-url] |

The package `CatReps` constructs the category of finite dimensional k-linear representations of a finite (concrete) category.
The supported categorical doctrine is "symmetric monoidal Abelian category with enough projectives and (possibly incomplete) direct sum decomposition".

This package wraps [Peter Webb](https://www-users.math.umn.edu/~webb/)'s pre-package [`catreps`](https://www-users.math.umn.edu/~webb/GAPfiles/catreps) into the categorical framework offered by [`CAP`](https://homalg-project.github.io/CAP_project/).
It also depends on [various other packages](https://github.com/homalg-project/CatReps/blob/master/.circleci/config.yml#L12), all of which can be cloned from the [homalg project repositories page](https://github.com/homalg-project).

`CatReps` [uses code](https://codecov.io/gh/homalg-project/CatReps/src/master/gap/catreps.g) from [Peter Webb](https://www-users.math.umn.edu/~webb/)'s pre-package [`catreps`](https://www-users.math.umn.edu/~webb/GAPfiles/catreps) in order to do the specific categorical operations (direct sum decomposition of representations) which are not supported by the [`CAP`](https://homalg-project.github.io/CAP_project/) based packages it relies on.

In March 2020 [Peter Webb](https://www-users.math.umn.edu/~webb/)' and his coauthors made a major new release of the former packages `reps` and `catreps` in which they are combined as one. The code of these former packages is still available at [`groupreps`](https://www-users.math.umn.edu/~webb/GAPfiles/groupreps) ([manual](https://www-users.math.umn.edu/~webb/GAPfiles/grouprepstutorial.html)) (the new name for the former reps) and [`catreps`](https://www-users.math.umn.edu/~webb/GAPfiles/catreps) ([manual](https://www-users.math.umn.edu/~webb/GAPfiles/catrepstutorial.html)), but it will no longer be supported. The new package [`reps`](https://www-users.math.umn.edu/~webb/GAPfiles/reps) combines the functions of both of these, and it is recommended to use this new reps from now on.

Future versions of `CatReps` will rely on [`reps`](https://www-users.math.umn.edu/~webb/GAPfiles/reps).

[docs-stable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docs-stable-url]: https://homalg-project.github.io/CatReps/doc/chap0.html

[tests-img]: https://github.com/homalg-project/CatReps/workflows/Tests/badge.svg
[tests-url]: https://github.com/homalg-project/CatReps/actions?query=workflow%3ATests

[codecov-img]: https://codecov.io/gh/homalg-project/CatReps/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/homalg-project/CatReps

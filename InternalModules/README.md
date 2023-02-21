<!-- BEGIN HEADER -->
# InternalModules&ensp;<sup><sup>[![View code][code-img]][code-url]</sup></sup>

### Modules over internal algebras

| Documentation | Latest Release | Build Status of [CategoricalTowers](/../../) | Code Coverage |
| ------------- | -------------- | ------------ | ------------- |
| [![HTML stable documentation][html-img]][html-url] [![PDF stable documentation][pdf-img]][pdf-url] | [![version][version-img]][version-url] [![date][date-img]][date-url] | [![Build Status][tests-img]][tests-url] | [![Code Coverage][codecov-img]][codecov-url] |

<!-- END HEADER -->

### About

This package allows to internalize classes of algebras and their modules in a (constructive) braided monoidal category. For this, the algebra should admit a categorical description (like the symmetric or the exterior algebra).

[This Jupyter notebook](https://nbviewer.jupyter.org/github/homalg-project/InternalModules/blob/master/examples/julia/notebooks/SymmetricAlgebraInternalToS4rep.ipynb) shows an example of explicit computations in the symmetric algebra S*W* internal to the so-called positively graded closure srep<sub>*k*</sub>(*G*)<sub>+</sub> of the tensor category srep<sub>*k*</sub>(*G*) of finite dimensional *k*-linear representations of *G*, where *G*=S<sub>4</sub> is the symmetric group on four points and *k*=ℚ, its minimal splitting field.

<!-- BEGIN FOOTER -->
---

### Dependencies

To obtain current versions of all dependencies, `git clone` (or `git pull` to update) the following repositories:

|    | Repository | git URL |
|--- | ---------- | ------- |
| 1. | [**homalg_project**](https://github.com/homalg-project/homalg_project#readme) | https://github.com/homalg-project/homalg_project.git |
| 2. | [**CAP_project**](https://github.com/homalg-project/CAP_project#readme) | https://github.com/homalg-project/CAP_project.git |

[html-img]: https://img.shields.io/badge/🔗%20HTML-stable-blue.svg
[html-url]: https://homalg-project.github.io/CategoricalTowers/InternalModules/doc/chap0_mj.html

[pdf-img]: https://img.shields.io/badge/🔗%20PDF-stable-blue.svg
[pdf-url]: https://homalg-project.github.io/CategoricalTowers/InternalModules/download_pdf.html

[version-img]: https://img.shields.io/endpoint?url=https://homalg-project.github.io/CategoricalTowers/InternalModules/badge_version.json&label=🔗%20version&color=yellow
[version-url]: https://homalg-project.github.io/CategoricalTowers/InternalModules/view_release.html

[date-img]: https://img.shields.io/endpoint?url=https://homalg-project.github.io/CategoricalTowers/InternalModules/badge_date.json&label=🔗%20released%20on&color=yellow
[date-url]: https://homalg-project.github.io/CategoricalTowers/InternalModules/view_release.html

[tests-img]: https://github.com/homalg-project/CategoricalTowers/actions/workflows/Tests.yml/badge.svg?branch=master
[tests-url]: https://github.com/homalg-project/CategoricalTowers/actions/workflows/Tests.yml?query=branch%3Amaster

[codecov-img]: https://codecov.io/gh/homalg-project/CategoricalTowers/branch/master/graph/badge.svg?flag=InternalModules
[codecov-url]: https://codecov.io/gh/homalg-project/CategoricalTowers/tree/master/InternalModules

[code-img]: https://img.shields.io/badge/-View%20code-blue?logo=github
[code-url]: https://github.com/homalg-project/CategoricalTowers/tree/master/InternalModules#top
<!-- END FOOTER -->

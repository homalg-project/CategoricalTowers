# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Declarations
#
# THIS FILE IS AUTOMATICALLY GENERATED, SEE CAP_project/CAP/gap/MethodRecord.gi

#! @Chapter Cartesian Categories

#! @Section Add-methods

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CartesianBraiding`.
#! $F: ( a, b ) \mapsto \mathtt{CartesianBraiding}(a, b)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCartesianBraiding",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddCartesianBraiding",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddCartesianBraiding",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddCartesianBraiding",
                  [ IsCapCategory, IsList ] );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CartesianBraidingInverse`.
#! $F: ( a, b ) \mapsto \mathtt{CartesianBraidingInverse}(a, b)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCartesianBraidingInverse",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddCartesianBraidingInverse",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddCartesianBraidingInverse",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddCartesianBraidingInverse",
                  [ IsCapCategory, IsList ] );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CartesianBraidingInverseWithGivenDirectProducts`.
#! $F: ( s, a, b, r ) \mapsto \mathtt{CartesianBraidingInverseWithGivenDirectProducts}(s, a, b, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCartesianBraidingInverseWithGivenDirectProducts",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddCartesianBraidingInverseWithGivenDirectProducts",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddCartesianBraidingInverseWithGivenDirectProducts",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddCartesianBraidingInverseWithGivenDirectProducts",
                  [ IsCapCategory, IsList ] );

#! @Description
#! The arguments are a category $C$ and a function $F$.
#! This operation adds the given function $F$
#! to the category for the basic operation `CartesianBraidingWithGivenDirectProducts`.
#! $F: ( s, a, b, r ) \mapsto \mathtt{CartesianBraidingWithGivenDirectProducts}(s, a, b, r)$.
#! @Returns nothing
#! @Arguments C, F
DeclareOperation( "AddCartesianBraidingWithGivenDirectProducts",
                  [ IsCapCategory, IsFunction ] );

DeclareOperation( "AddCartesianBraidingWithGivenDirectProducts",
                  [ IsCapCategory, IsFunction, IsInt ] );

DeclareOperation( "AddCartesianBraidingWithGivenDirectProducts",
                  [ IsCapCategory, IsList, IsInt ] );

DeclareOperation( "AddCartesianBraidingWithGivenDirectProducts",
                  [ IsCapCategory, IsList ] );

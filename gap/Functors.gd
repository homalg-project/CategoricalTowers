# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

####################################
#
#! @Chapter Categories of functors
#! @Section Attributes
#
####################################

DeclareAttribute( "ConvertToCellInHomCategory", IsQuiverRepresentation );
DeclareAttribute( "ConvertToCellInHomCategory", IsQuiverRepresentationHomomorphism );
DeclareAttribute( "ConvertToCellInCategoryOfQuiverRepresentations", IsCapCategoryObjectInHomCategory );
DeclareAttribute( "ConvertToCellInCategoryOfQuiverRepresentations", IsCapCategoryMorphismInHomCategory );

#! @Description
#! The input is a Hom-category <A>H</A><C>:=Hom(B,C)</C> where <C>B</C> is an algebroid defined by some quiver algebra <C>A</C> and
#! <C>C</C> is a matrix category over some homalg field <C>K</C>.
#! The output is the isomorphism from <A>H</A> into <C>CategoryOfQuiverRepresentations(A)</C>.
#! @Arguments H
#! @Returns a &CAP; functor
DeclareAttribute( "IsomorphismOntoCategoryOfQuiverRepresentations", IsFunctorCategory );


#! @Description
#! The input is a Hom-category <A>H</A><C>:=Hom(B,C)</C> where <C>B</C> is an algebroid defined by some quiver algebra <C>A</C> and
#! <C>C</C> is a matrix category over some homalg field <C>K</C>.
#! The output is the isomorphism from  <C>CategoryOfQuiverRepresentations(A)</C> into <A>H</A>.
#! @Arguments H
#! @Returns a &CAP; functor
DeclareAttribute( "IsomorphismFromCategoryOfQuiverRepresentations", IsFunctorCategory );

#! @Description
#!  The input is a finitely presented category <A>B</A>. The output is the Yoneda embedding functor from
#!  <A>B</A> into the functors category <C>Hom</C>( <C>OppositeAlgebroid</C>(<A>B</A>),$H$), where
#!  $H$=<C>RangeCategoryOfHomomorphismStructure</C>(<A>B</A>).
#! @Arguments B
#! @Returns a &CAP; functor
DeclareAttribute( "YonedaEmbedding", IsCapCategory );

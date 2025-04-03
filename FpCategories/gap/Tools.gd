# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Declarations
#

#! @Chapter Tools

####################################
#
#! @Section Properties
#
####################################

#! @Description
#!  The (evil) property of <A>C</A> being a finitely presented.
#! @Arguments C
DeclareProperty( "IsFinitelyPresentedCategory",
        IsCapCategory );

AddCategoricalProperty( [ "IsFinitelyPresentedCategory", "IsFinitelyPresentedCategory" ] );

CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsFinitelyPresentedCategory :=
  DuplicateFreeList(
          Concatenation(
                  ListOfDefiningOperations( "IsObjectFiniteCategory" ),
                  [ "SetOfGeneratingMorphismsOfCategory" ] ) );

####################################
##
#! @Section Attributes
##
####################################

#! @Description
#!  Return a list of generating morphisms of the finitely generated category <A>C</A>.
#! @Arguments C
#! @Returns a list of a &CAP; category morphisms
DeclareAttribute( "SetOfGeneratingMorphismsOfCategory",
        IsCapCategory );

#! @Description
#!  Return a list of generating morphisms of the finitely generated category <A>C</A>.
#!  The corresponding &CAP; operation is <C>SetOfGeneratingMorphismsOfCategory</C>.
#! @Arguments C
#! @Returns a list of a &CAP; category morphisms
DeclareAttribute( "SetOfGeneratingMorphisms", IsCapCategory );

CapJitAddTypeSignature( "SetOfGeneratingMorphisms", [ IsCapCategory ],
  function ( input_types )

    return CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( input_types[1].category ) );

end );

DeclareAttribute( "SetOfGeneratingMorphismsAsUnresolvableAttribute", IsCapCategory );

CapJitAddTypeSignature( "SetOfGeneratingMorphismsAsUnresolvableAttribute", [ IsCapCategory ],
  function ( input_types )

    return CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( input_types[1].category ) );

end );

####################################
#
#! @Section Attributes
#
####################################

if false then
#! @Description
#!  Return the number of morphisms in the finite category <A>C</A>.
#! @Arguments C
#! @Returns a nonnegative integer
DeclareAttribute( "Size",
        IsCapCategory );
fi;

####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  The defining triple of the quiver underlying the finitely presented category <A>C</A>.
#! @Arguments C
#! @Returns a pair
DeclareAttribute( "DefiningTripleOfUnderlyingQuiver",
        IsCapCategory );

CapJitAddTypeSignature( "DefiningTripleOfUnderlyingQuiver", [ IsCapCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfNTupleOf( 3,
                   IsInt,
                   IsInt,
                   CapJitDataTypeOfListOf(
                           CapJitDataTypeOfNTupleOf( 2,
                                   IsInt,
                                   IsInt ) ) );
    
end );

#! @Description
#!  The data tables of the category <A>C</A>.
#! @Arguments C
#! @Returns a pair of lists
DeclareAttribute( "DataTablesOfCategory",
        IsCapCategory );

#! @Description
#!  The nerve data of the category <A>C</A>.
#! @Arguments C
#! @Returns a pair consisting of a triple and an 8-tuple
DeclareAttribute( "NerveTruncatedInDegree2Data",
        IsCapCategory );

#! @Description
#!  The input is a finitely presented category <A>C</A> equipped with a homomorphism structure
#!  with values in the skeletal category <C>SkeletalFinSets</C> of finite sets.
#!  The output is the nerve of <A>B</A> truncated in degree $2$,
#!  as a presheaf on <C>SimplicialCategoryTruncatedInDegree</C>($2$)
#!  with values in <C>SkeletalFinSets</C>.
#! @Arguments C
#! @Returns a &CAP; functor
DeclareAttribute( "NerveTruncatedInDegree2AsFunctor",
        IsCapCategory );
#! @InsertChunk NerveTruncatedInDegree2AsFunctor

#! @Description
#!  The normalized indices of the generating morphisms of the finite category <A>C</A>.
#! @Arguments C
#! @Returns a list of integers
DeclareAttribute( "IndicesOfGeneratingMorphismsFromHomStructure",
        IsCapCategory );

#! @Description
#!  The opposite category of a finite category <A>C</A>.
#! @Arguments C
#! @Returns a &CAP; category
DeclareAttribute( "OppositeFiniteCategory",
        IsCapCategory );

DeclareAttribute( "YonedaNaturalEpimorphisms",
        IsCapCategory );

#! @Description
#!  The input is a finitely presented category <A>B</A>. The output is a natural morphism.
#!  Its source is the functor $B \to H, c \mapsto \sqcup_{a\in B} \mathrm{Hom}(a,c),
#!  \psi \mapsto \sqcup_{a\in B} \mathrm{Hom}(a,\psi)$.
#!  Its targe is the constant functor of $0$-cells
#!  $B \to H, c \mapsto B_0, \psi \mapsto \mathrm{id}_{B_0}$.
#! @Arguments B
#! @Returns a &CAP; natural transformation
DeclareAttribute( "YonedaFibrationAsNaturalTransformation", IsCapCategory );

#! @Description
#!  The input is a finitely presented category <A>B</A>. The output is a natural epimorphism.
#!  Its source is the functor
#!  $B \to H, c \mapsto \sqcup_{a,b\in B} \mathrm{Hom}(a,b) \times \mathrm{Hom}(b,c),
#!  \psi \mapsto \sqcup_{a,b\in B} \mathrm{Hom}(1_a,1_b) \times \mathrm{Hom}(b,\psi)$.
#!  Its target is the functor $B \to H, c \mapsto \sqcup_{a\in B} \mathrm{Hom}(a,c),
#!  \psi \mapsto \sqcup_{a\in B} \mathrm{Hom}(a,\psi)$.
#! @Arguments B
#! @Returns a &CAP; natural transformation
DeclareAttribute( "YonedaProjectionAsNaturalEpimorphism", IsCapCategory );

#! @Description
#!  The input is a finitely presented category <A>B</A>. The output is a natural epimorphism.
#!  Its source is the functor
#!  $B \to H, c \mapsto \sqcup_{a,b\in B} \mathrm{Hom}(a,b) \times \mathrm{Hom}(b,c),
#!  \psi \mapsto \sqcup_{a,b\in B} \mathrm{Hom}(1_a,1_b) \times \mathrm{Hom}(b,\psi)$.
#!  Its target is the functor $B \to H, c \mapsto \sqcup_{a\in B} \mathrm{Hom}(a,c),
#!  \psi \mapsto \sqcup_{a\in B} \mathrm{Hom}(a,\psi)$.
#! @Arguments B
#! @Returns a &CAP; natural transformation
DeclareAttribute( "YonedaCompositionAsNaturalEpimorphism", IsCapCategory );
#! @InsertChunk YonedaCompositionAsNaturalEpimorphism

DeclareAttribute( "TruthMorphismOfTrueToSieveFunctorAndEmbedding",
        IsCapCategory );

#! @Description
#!  Construct, using the record (or list) of images <A>eta</A>, a natural transformation
#!  from the functor <A>F</A> to the parallel functor <A>G</A>.
#! @Arguments eta, F, G
#! @Returns a &CAP; natural transformation
#! @Group NaturalTransformation
DeclareOperation( "NaturalTransformation",
        [ IsRecord, IsCapFunctor, IsCapFunctor ] );

#! @Arguments F, eta, G
#! @Group NaturalTransformation
DeclareOperation( "NaturalTransformation",
        [ IsCapFunctor, IsList, IsCapFunctor ] );

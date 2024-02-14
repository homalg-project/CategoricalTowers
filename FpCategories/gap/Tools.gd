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
  DuplicateFreeList( Concatenation( [
          "SetOfGeneratingMorphismsOfCategory",
          ],
          CAP_INTERNAL_CONSTRUCTIVE_CATEGORIES_RECORD.IsObjectFiniteCategory ) );

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

if IsPackageMarkedForLoading( "Digraphs", ">= 1.3.1" ) then

#! @Description
#!  Return a string encoding the underlying quiver of the digraph <A>D</A>.
#!  The string <A>name_of_quiver</A> will be the name of the underlying quiver.
#!  The string <A>prefix_of_name_of_morphisms</A> will be the prefix of the name all morphisms.
#! @Arguments D, name_of_quiver, prefix_of_name_of_morphisms
#! @Returns a string
DeclareOperation( "QuiverStringOfDigraph",
        [ IsDigraph, IsString, IsString ] );
#! @InsertChunk QuiverStringOfDigraph

fi;

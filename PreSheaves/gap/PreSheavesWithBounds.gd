# SPDX-License-Identifier: GPL-2.0-or-later
# PreSheaves: Categories of (co)presheaves
#
# Declarations
#

#! @Chapter Category of presheaves (with bounds) of a (linear) category

#! Here we assume that the object set of the source category carries a discrete total order.
#! This code is temporary and should at some point in the future be replaced by something like "presheaves with bounded support".

####################################
#
#! @Section &GAP; categories
#
####################################

#! @Description
#!  The &GAP; category of a presheaf category.
#! @Arguments category
DeclareCategory( "IsPreSheafWithBoundsCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a presheaf category.
#! @Arguments cell
DeclareCategory( "IsCellInPreSheafWithBoundsCategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a presheaf category.
#! @Arguments obj
DeclareCategory( "IsObjectInPreSheafWithBoundsCategory",
        IsCellInPreSheafWithBoundsCategory and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a presheaf category.
#! @Arguments mor
DeclareCategory( "IsMorphismInPreSheafWithBoundsCategory",
        IsCellInPreSheafWithBoundsCategory and
        IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

DeclareAttribute( "AmbientCategory",
        IsPreSheafWithBoundsCategory );

CapJitAddTypeSignature( "AmbientCategory", [ IsPreSheafWithBoundsCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( AmbientCategory( input_types[1].category ) );
    
end );

#! @Description
#!  The source category $C$ of the presheaf category <A>PSh</A>=<C>PSh</C>($C,V$).
#! @Arguments PSh
#! @Returns a &CAP; category
DeclareAttribute( "Source",
        IsPreSheafWithBoundsCategory );

CapJitAddTypeSignature( "Source", [ IsPreSheafWithBoundsCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( Source( input_types[1].category ) );
    
end );

#! @Description
#!  The target category $V$ of the presheaf category <A>PSh</A>=<C>PSh</C>($C,V$).
#! @Arguments PSh
#! @Returns a &CAP; category
DeclareAttribute( "Target",
        IsPreSheafWithBoundsCategory );

CapJitAddTypeSignature( "Target", [ IsPreSheafWithBoundsCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( Target( input_types[1].category ) );
    
end );

#! @Description
#!  The opposite $C^\mathrm{op}$ of the source category $C$ of the presheaf category <A>PSh</A>=<C>PSh</C>($C,V$).
#! @Arguments Hom
#! @Returns a &CAP; category
DeclareAttribute( "OppositeOfSource",
        IsPreSheafWithBoundsCategory );

#CapJitAddTypeSignature( "OppositeOfSource", [ IsPreSheafWithBoundsCategory ],
#  function ( input_types )
#    
#    return CapJitDataTypeOfCategory( Opposite( Source( input_types[1].category ) ) );
#    
#end );

#! @Description
#!  The source of the presheaf <A>F</A>.
#! @Arguments F
#! @Returns a &CAP; category
DeclareAttribute( "Source",
        IsObjectInPreSheafWithBoundsCategory );

#CapJitAddTypeSignature( "Source", [ IsObjectInPreSheafWithBoundsCategory ],
#  function ( input_types )
#    
#    return CapJitDataTypeOfCategory( Source( input_types[1].category ) );
#    
#end );

#! @Description
#!  The target of the presheaf <A>F</A>.
#! @Arguments F
#! @Returns a &CAP; category
DeclareAttribute( "Target",
        IsObjectInPreSheafWithBoundsCategory );

#CapJitAddTypeSignature( "Target", [ IsObjectInPreSheafWithBoundsCategory ],
#  function ( input_types )
#    
#    return CapJitDataTypeOfCategory( Target( input_types[1].category ) );
#    
#end );

##
DeclareAttribute( "PairOfFunctionsOfPreSheaf",
        IsObjectInPreSheafWithBoundsCategory );

#CapJitAddTypeSignature( "PairOfFunctionsOfPreSheaf", [ IsObjectInPreSheafWithBoundsCategory ],
#  function ( input_types )
#    
#    Assert( 0, IsPreSheafWithBoundsCategory( input_types[1].category ) );
#    
#    return CapJitDataTypeOfNTupleOf( 2,
#              CapJitDataTypeOfObjectOfCategory( AmbientCategory( input_types[1].category ) ),
#              CapJitDataTypeOfNTupleOf( 2, IsInt, IsInt ) );
#    
#end );

##
DeclareAttribute( "FunctionOfPreSheafMorphism",
        IsMorphismInPreSheafWithBoundsCategory );

#CapJitAddTypeSignature( "FunctionOfPreSheafMorphism", [ IsMorphismInPreSheafWithBoundsCategory ],
#  function ( input_types )
#    
#    Assert( 0, IsPreSheafWithBoundsCategory( input_types[1].category ) );
#    
#    return rec( filter := IsFunction,
#                signature :=
#                [ [ CapJitDataTypeOfObjectOfCategory( Target( input_types[1].category ) ),
#                    CapJitDataTypeOfObjectOfCategory( Source( input_types[1].category ) ),
#                    CapJitDataTypeOfObjectOfCategory( Target( input_types[1].category ) ) ],
#                  CapJitDataTypeOfMorphismOfCategory( Target( input_types[1].category ) ) ] );
#    
#end );

##
DeclareAttribute( "YonedaEmbeddingFunctionalDataOfSourceCategory",
        IsPreSheafWithBoundsCategory );

#! @Arguments B
#! @Returns a &CAP; functor
DeclareAttribute( "YonedaEmbedding",
        IsCapCategory );

#! @Arguments PSh
#! @Returns a &CAP; functor
DeclareAttribute( "YonedaEmbeddingOfSourceCategory",
        IsPreSheafWithBoundsCategory );

#! @Arguments F
DeclareAttribute( "CoYonedaLemmaOnObjects",
        IsObjectInPreSheafWithBoundsCategory );

#! @Arguments phi
DeclareAttribute( "CoYonedaLemmaOnMorphisms",
        IsMorphismInPreSheafWithBoundsCategory );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the category <C>Hom( <A>B</A>^op, <A>C</A> )</C> of
#!  functors from the opposite of the small category <A>B</A> to the category <A>C</A> as objects
#!  and their natural transformations as morphisms.
#! @Arguments B, C
#! @Returns a &CAP; category
#! @Group PreSheavesWithBounds
DeclareOperationWithCache( "PreSheavesWithBounds",
        [ IsCapCategory, IsCapCategory, IsStringRep ] );

CapJitAddTypeSignature( "PreSheavesWithBounds", [ IsCapCategory, IsCapCategory ], IsPreSheafWithBoundsCategory );

#! @Arguments B
#! @Group PreSheavesWithBounds
DeclareOperationWithCache( "PreSheavesWithBounds",
        [ IsCapCategory ] );

CapJitAddTypeSignature( "PreSheavesWithBounds", [ IsCapCategory ], IsPreSheafWithBoundsCategory );

####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  Apply the presheaf <A>F</A> to the object <A>obj</A>.
#!  The shorthand is <A>F</A>(<A>obj</A>).
#! @Arguments F, obj
#! @Returns a &CAP; object
DeclareOperation( "ApplyObjectInPreSheafCategoryToObject",
        [ IsPreSheafWithBoundsCategory, IsObjectInPreSheafWithBoundsCategory, IsCapCategoryObject ] );

#! @Description
#!  Apply the presheaf <A>F</A> to the morphism <A>mor</A>.
#!  The shorthand is <A>F</A>(<A>mor</A>).
#! @Arguments F, mor
#! @Returns a &CAP; morphism
DeclareOperation( "ApplyObjectInPreSheafCategoryToMorphism",
        [ IsPreSheafWithBoundsCategory, IsObjectInPreSheafWithBoundsCategory, IsCapCategoryMorphism ] );

#! @Description
#!  Apply the presheaf morphism <A>eta</A> to the object <A>obj</A>.
#!  The shorthand is <A>eta</A>(<A>o</A>).
#! @Arguments eta, obj
#! @Returns a &CAP; morphism
DeclareOperation( "ApplyMorphismInPreSheafCategoryToObject",
        [ IsPreSheafWithBoundsCategory, IsMorphismInPreSheafWithBoundsCategory, IsCapCategoryObject ] );


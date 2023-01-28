# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

#! @Chapter Tools

DeclareGlobalVariable( "FUNCTOR_CATEGORIES_METHOD_NAME_RECORD" );

#! @Section Tools for quivers

CapJitAddTypeSignature( "Source", [ IsCapNaturalTransformation ],
  function ( input_types )
    return rec( filter := IsCapFunctor,
                source_category := input_types[1].source_category,
                range_category := input_types[1].range_category );
end );

CapJitAddTypeSignature( "Range", [ IsCapNaturalTransformation ],
  function ( input_types )
    return rec( filter := IsCapFunctor,
                source_category := input_types[1].source_category,
                range_category := input_types[1].range_category );
end );

CapJitAddTypeSignature( "FunctorObjectOperation", [ IsCapFunctor ],
  function ( input_types )
    
    return rec( filter := IsFunction,
                signature :=
                [ [ CapJitDataTypeOfObjectOfCategory( input_types[1].source_category ) ],
                  CapJitDataTypeOfObjectOfCategory( input_types[1].range_category ) ] );
end );

CapJitAddTypeSignature( "FunctorMorphismOperation", [ IsCapFunctor ],
  function ( input_types )
    
    return rec( filter := IsFunction,
                signature :=
                [ [ CapJitDataTypeOfObjectOfCategory( input_types[1].range_category ),
                    CapJitDataTypeOfMorphismOfCategory( input_types[1].source_category ),
                    CapJitDataTypeOfObjectOfCategory( input_types[1].range_category ) ],
                  CapJitDataTypeOfMorphismOfCategory( input_types[1].range_category ) ] );
end );
        
CapJitAddTypeSignature( "NaturalTransformationOperation", [ IsCapNaturalTransformation ],
  function ( input_types )
    
    Assert( 0, IsFunctorCategory( input_types[1].category ) );
    
    return rec( filter := IsFunction,
                signature :=
                [ [ CapJitDataTypeOfObjectOfCategory( input_types[1].range_category ),
                    CapJitDataTypeOfObjectOfCategory( input_types[1].source_category ),
                    CapJitDataTypeOfObjectOfCategory( input_types[1].range_category ) ],
                  CapJitDataTypeOfMorphismOfCategory( input_types[1].range_category ) ] );
end );

###################################
##
#! @Section Properties
##
###################################

#! @Description
#!  The argument is a (co)presheaf <A>F</A>.
#!  The output is <C>true</C> if <A>F</A> is reflexive,
#!  i.e., the <A>F</A>-component of the (co)unit of the Isbell adjunction monad is an isomorphism,
#!  otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments F
DeclareProperty( "IsReflexive",
        IsCapCategoryObject );

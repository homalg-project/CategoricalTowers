# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

#! @Chapter Tools

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

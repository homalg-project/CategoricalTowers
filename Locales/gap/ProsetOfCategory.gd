# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Declarations
#

#! @Chapter The (stable) proset/poset of a category

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of a proset or poset of a CAP category.
DeclareCategory( "IsProsetOrPosetOfCapCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a proset or poset of a CAP category.
DeclareCategory( "IsCellInProsetOrPosetOfCategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of cells in a stable proset or poset of a CAP category.
DeclareCategory( "IsCellInStableProsetOrPosetOfCategory",
        IsCellInProsetOrPosetOfCategory );

#! @Description
#!  The &GAP; category of objects in a proset or poset of a CAP category.
DeclareCategory( "IsObjectInProsetOrPosetOfCategory",
        IsCellInProsetOrPosetOfCategory and IsObjectInThinCategory );

#! @Description
#!  The &GAP; category of a proset of a CAP category.
DeclareCategory( "IsProsetOfCapCategory",
        IsProsetOrPosetOfCapCategory );

#! @Description
#!  The &GAP; category of cells in a proset of a CAP category.
DeclareCategory( "IsCellInProsetOfCategory",
        IsCellInProsetOrPosetOfCategory );

#! @Description
#!  The &GAP; category of objects in a proset of a CAP category.
DeclareCategory( "IsObjectInProsetOfCategory",
        IsCellInProsetOfCategory and IsObjectInProsetOrPosetOfCategory );

#! @Description
#!  The &GAP; category of morphisms in a proset of a CAP category.
DeclareCategory( "IsMorphismInProsetOfCategory",
        IsCellInProsetOfCategory and IsMorphismInThinCategory );

#! @Description
#!  The &GAP; category of a poset of a CAP category.
DeclareCategory( "IsPosetOfCapCategory",
        IsProsetOrPosetOfCapCategory );

#! @Description
#!  The &GAP; category of cells in a poset of a CAP category.
DeclareCategory( "IsCellInPosetOfCategory",
        IsCellInProsetOrPosetOfCategory );

#! @Description
#!  The &GAP; category of objects in a poset of a CAP category.
DeclareCategory( "IsObjectInPosetOfCategory",
        IsCellInPosetOfCategory and IsObjectInProsetOrPosetOfCategory );

#! @Description
#!  The &GAP; category of morphisms in a poset of a CAP category.
DeclareCategory( "IsMorphismInPosetOfCategory",
        IsCellInPosetOfCategory and IsMorphismInThinCategory );

DeclareProperty( "IsStableProset",
        IsCapCategory );

AddCategoricalProperty( [ "IsStableProset", fail ] );

####################################
#
#! @Section Global variables
#
####################################

#!
DeclareGlobalVariable( "CAP_INTERNAL_METHOD_NAME_LIST_FOR_PREORDERED_SET_OF_CATEGORY" );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The ambient category of the proset <A>P</A>.
#! @Arguments P
#! @Returns a list
DeclareAttribute( "AmbientCategory",
        IsProsetOrPosetOfCapCategory );

CapJitAddTypeSignature( "AmbientCategory", [ IsProsetOrPosetOfCapCategory ], function ( input_types )
    
    return CapJitDataTypeOfCategory( AmbientCategory( input_types[1].category ) );
    
end );

#! @Description
#!  The object in the ambient category underlying <A>obj</A>.
#! @Arguments obj
#! @Returns a &CAP; category object
DeclareAttribute( "UnderlyingGapObject",
        IsObjectInProsetOfCategory );

CapJitAddTypeSignature( "UnderlyingGapObject", [ IsObjectInPosetOfCategory ], function ( input_types )
    
    Assert( 0, IsProsetOrPosetOfCapCategory( input_types[1].category ) );
    
    return CapJitDataTypeOfObjectOfCategory( AmbientCategory( input_types[1].category ) );
    
end );

#! @Description
#!  The morphism in the ambient category underlying <A>mor</A>.
#! @Arguments mor
#! @Returns a &CAP; category morphism
DeclareAttribute( "UnderlyingMorphism",
        IsMorphismInPosetOfCategory );

CapJitAddTypeSignature( "UnderlyingMorphism", [ IsMorphismInPosetOfCategory ], function ( input_types )
    
    Assert( 0, IsProsetOrPosetOfCapCategory( input_types[1].category ) );
    
    return CapJitDataTypeOfMorphismOfCategory( AmbientCategory( input_types[1].category ) );
    
end );

####################################
#
#! @Section Constructors
#
####################################

#! @Arguments C
DeclareOperation( "CreateProsetOrPosetOfCategory",
        [ IsCapCategory ] );

#! @Arguments C
DeclareAttribute( "ProsetOfCategory",
        IsCapCategory );
#! @InsertChunk ProsetOfCategory

#! @Arguments C
DeclareAttribute( "StableProsetOfCategory",
        IsCapCategory );

#! @Arguments C
DeclareAttribute( "PosetOfCategory",
        IsCapCategory );
#! @InsertChunk PosetOfCategory

#! @Arguments C
DeclareAttribute( "StablePosetOfCategory",
        IsCapCategory );

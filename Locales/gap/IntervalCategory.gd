# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Declarations
#

#! @Chapter The interval category

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of an interval category.
DeclareCategory( "IsIntervalCategory",
        IsCapCategory );

#!  The &GAP; category of cells in an interval category.
DeclareCategory( "IsCellInIntervalCategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in an interval category.
DeclareCategory( "IsObjectInIntervalCategory",
        IsCellInIntervalCategory and IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in an interval category.
DeclareCategory( "IsMorphismInIntervalCategory",
        IsCellInIntervalCategory and IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The truth value of the object <A>a</A> in the interval category.
#! @Arguments a
#! @Returns a boolean
DeclareAttribute( "ClassicalTruthValue",
        IsObjectInIntervalCategory );

CapJitAddTypeSignature( "ClassicalTruthValue", [ IsIntervalCategory ],
  function ( input_types )
    
    return rec( filter := IsBool );

end );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Return the interval category on two objects.
#! @Arguments
#! @Returns a &CAP; category
DeclareGlobalFunction( "CreateIntervalCategory" );

if false then
#! @Description
#!  The interval category on two objects.
#! @Returns a &CAP; category
DeclareGlobalVariable( "IntervalCategory" );
fi;

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_ENRICHMENT_OVER_INTERVAL_CATEGORY" );

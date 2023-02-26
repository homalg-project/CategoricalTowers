# SPDX-License-Identifier: GPL-2.0-or-later
# DiscreteCategories: Discrete categories
#
# Declarations
#

#! @Chapter Discrete categories

####################################
#
#! @Section GAP Categories
#
####################################

#! @Description
#!  The &GAP; category of discrete categories.
#! @Arguments object
DeclareCategory( "IsDiscreteCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a discrete category.
#! @Arguments object
DeclareCategory( "IsCellInDiscreteCategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a discrete category.
#! @Arguments object
DeclareCategory( "IsObjectInDiscreteCategory",
        IsCellInDiscreteCategory and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a discrete category.
#! @Arguments morphism
DeclareCategory( "IsMorphismInDiscreteCategory",
        IsCellInDiscreteCategory and
        IsCapCategoryMorphism );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  Return the filter used to define the discrete category <A>C</A>.
#! @Arguments C
DeclareAttribute( "UnderlyingFilter",
        IsDiscreteCategory );

CapJitAddTypeSignature( "UnderlyingFilter", [  ], IsFilter );

#!
DeclareAttribute( "UnderlyingGapObject",
        IsObjectInDiscreteCategory );

CapJitAddTypeSignature( "UnderlyingGapObject", [ IsObjectInDiscreteCategory ],
 function ( input_types )
    
    Assert( 0, IsDiscreteCategory( input_types[1].category ) );
    
    return UnderlyingFilter( input_types[1].category );
    
end );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct a discrete category out of the &GAP;-filter <C>ValueGlobal</C>(<A>filt</A>).
#! @Arguments filt
#! @Returns a &CAP; category
DeclareOperation( "DiscreteCategory",
        [ IsString ] );
#! @InsertChunk DiscreteCategory

#! @Description
#!  Construct an object in the discrete category <A>D</A> using the GAP-object <A>o</A>.
#! @Arguments D, o
#! @Returns a &CAP; object
DeclareOperation( "ObjectInDiscreteCategory",
        [ IsDiscreteCategory, IsObject ] );

#! @Description
#!  Construct a morphism <A>S</A>$\to$<A>T</A> in a discrete category.
#! @Arguments S, T
#! @Returns a &CAP; morphism
DeclareOperation( "MorphismInDiscreteCategory",
        [ IsObjectInDiscreteCategory, IsObjectInDiscreteCategory ] );

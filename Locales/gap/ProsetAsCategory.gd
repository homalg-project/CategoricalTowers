# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Declarations
#

#! @Chapter Preordered sets viewed as categories

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of preordered sets viewed as categories.
#! @Arguments object
DeclareCategory( "IsProsetAsCategory",
        IsCategoryWithoutMorphismData );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The object-membership function used to define the thin category <A>C</A>.
#! @Arguments C
DeclareAttribute( "UnderlyingGapObjectFilter",
        IsProsetAsCategory );

#! @Description
#!  The underlying-object-membership function used to define the thin category <A>C</A>.
#!  This function accepts two arguments in the &GAP;-filter
#!  <C>ValueGlobal</C>(<C>UnderlyingGapObjectFilter</C>(<A>C</A>))
#!  and returns <A>true</A> if the underlying objects are equal  <A>false</A>.
#! @Arguments C
DeclareAttribute( "UnderlyingGapObjectMembershipFunction",
        IsProsetAsCategory );

CapJitAddTypeSignature( "UnderlyingGapObjectMembershipFunction", [ IsProsetAsCategory ],
  function ( input_types )
    
    return rec( filter := IsFunction,
                signature :=
                [ [ rec( filter := UnderlyingGapObjectFilter( input_types[1].source_category ) ) ],
                  rec( filter := IsBool ) ] );
    
end );

#! @Description
#!  The underlying-object-equality function used to define the thin category <A>C</A>.
#!  This function accepts two arguments in the &GAP;-filter
#!  <C>ValueGlobal</C>(<C>UnderlyingGapObjectFilter</C>(<A>C</A>))
#!  and returns <A>true</A> if the underlying objects are equal  <A>false</A>.
#! @Arguments C
DeclareAttribute( "UnderlyingGapObjectEqualityFunction",
        IsProsetAsCategory );

CapJitAddTypeSignature( "UnderlyingGapObjectEqualityFunction", [ IsProsetAsCategory ],
  function ( input_types )
    
    return rec( filter := IsFunction,
                signature :=
                [ [ rec( filter := UnderlyingGapObjectFilter( input_types[1].source_category ) ),
                    rec( filter := UnderlyingGapObjectFilter( input_types[1].source_category ) ) ],
                  rec( filter := IsBool ) ] );
    
end );

#! @Description
#!  The preorder function used to define the thin category <A>C</A>.
#!  This function accepts two arguments in the &GAP;-filter
#!  <C>ValueGlobal</C>(<C>UnderlyingGapObjectFilter</C>(<A>C</A>))
#!  and returns <A>true</A> or <A>false</A>.
#! @Arguments C
DeclareAttribute( "UnderlyingPreorderFunction",
        IsProsetAsCategory );

CapJitAddTypeSignature( "UnderlyingPreorderFunction", [ IsProsetAsCategory ],
  function ( input_types )
    
    return rec( filter := IsFunction,
                signature :=
                [ [ rec( filter := UnderlyingGapObjectFilter( input_types[1].source_category ) ),
                    rec( filter := UnderlyingGapObjectFilter( input_types[1].source_category ) ) ],
                  rec( filter := IsBool ) ] );
    
end );

#!
DeclareAttribute( "UnderlyingDatum",
        IsObjectInThinCategory );

CapJitAddTypeSignature( "UnderlyingDatum", [ IsObjectInThinCategory ],
 function ( input_types )
    
    Assert( 0, IsProsetAsCategory( input_types[1].category ) );
    
    return rec( filter := UnderlyingGapObjectFilter( input_types[1].category ) );
    
end );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct a thin category out of the <A>input_record</A>
#!  consisting of values to the keys:
#!  * <A>name</A>: the string defining the name of the category,
#!  * <A>object_datum_filter_string</A>: a string such that <C>ValueGlobal</C>( <A>object_datum_filter_string</A> ) is the &GAP;-filter of the underlying objects,
#!  * <A>object_datum_membership_func</A>: the underlying-object-membership function,
#!  * <A>object_datum_equality_func</A>: the underlying-object-equality function,
#!  * <A>object_datum_preorder_func</A>: the preorder function on the underlying objects, and
#!  * <A>properties</A>: a list of categorical properties, additional to <C>IsThinCategory</C>.
#!  
#!  * If <A>name</A> is missing it defaults to <A>object_datum_filter_string</A>.
#!  * If <A>object_datum_membership_func</A> is missing it defaults to <C>ValueGlobal</C>( <A>object_datum_filter_string</A> ).
#!  * If <A>object_datum_equality_func</A> is missing it defaults to <C>EQ</C>.
#!  * If <A>object_datum_preorder_func</A> is missing it defaults to <A>object_datum_equality_func</A>.
#!  * If <A>properties</A> is missing it defaults to the empty list.
#! @Arguments input_record
#! @Returns a &CAP; category
DeclareOperation( "ProsetAsCategory",
        [ IsRecord ] );

#! @Description
#!  Construct a discrete category out of
#!  * the &GAP;-filter <C>ValueGlobal</C>( <A>object_datum_filter_string</A> ) of the underlying objects.
#! @Arguments object_datum_filter_string
#! @Returns a &CAP; category
DeclareOperation( "SkeletalDiscreteCategory",
        [ IsString ] );
#! @InsertChunk SkeletalDiscreteCategory

#! @Description
#!  Construct a totol order category out of
#!  * the &GAP;-filter <C>ValueGlobal</C>( <A>object_datum_filter_string</A> ) of the underlying objects, and
#!  * the total order function on the underlying objects.
#! @Arguments object_datum_filter_string, object_datum_total_order_func
#! @Returns a &CAP; category
DeclareOperation( "TotalOrderAsCategory",
        [ IsString, IsFunction ] );
#! @InsertChunk TotalOrderAsCategory

# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Declarations
#

####################################
##
#! @Chapter Tools
##
####################################

####################################
##
#! @Section General methods
##
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
                   rec( filter := IsInt ),
                   rec( filter := IsInt ),
                   CapJitDataTypeOfListOf(
                           CapJitDataTypeOfNTupleOf( 2,
                                   rec( filter := IsInt ),
                                   rec( filter := IsInt ) ) ) );
    
end );

####################################
##
#! @Section Visualizing posets of subobjects
##
####################################

#! @Description
#! The argument is an object <A>A</A>.
#! The output is the reflexive transitive reduction of the poset of all subobjects of <A>A</A>.
#! @Returns a digraph
#! @Arguments A
DeclareOperation( "DigraphOfSubobjects",
                  [ IsCapCategoryObject ] );

DeclareFilter( "IsDigraphOfSubobjects" );

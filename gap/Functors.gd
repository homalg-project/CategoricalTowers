# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

# our info class:
DeclareInfoClass( "InfoFunctorCategories" );
SetInfoLevel( InfoFunctorCategories, 1 );

#! @Chapter Functors between the various categories

####################################
#
#! @Section Attributes
#
####################################

##
DeclareAttribute( "NakayamaLeftAdjointData",
        IsAlgebroid );

#! @Description
#!  Returns the Nakayama left adjoint functor from <C>PreSheaves</C>( <A>B</A> ) $\to$ <C>CoPreSheaves</C>( <A>B</A> ).
#! @Arguments B
#! @Returns a &CAP; functor
DeclareAttribute( "NakayamaLeftAdjoint",
        IsAlgebroid );

##
DeclareAttribute( "NakayamaRightAdjointData",
        IsAlgebroid );

#! @Description
#!  Returns the Nakayama right adjoint functor from <C>CoPreSheaves</C>( <A>B</A> ) $\to$ <C>PreSheaves</C>( <A>B</A> ).
#! @Arguments B
#! @Returns a &CAP; functor
DeclareAttribute( "NakayamaRightAdjoint",
        IsAlgebroid );

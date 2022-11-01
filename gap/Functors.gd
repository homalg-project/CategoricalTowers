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

##
DeclareAttribute( "IsbellLeftAdjointData",
        IsCapCategory );

#! @Description
#!  Returns the Isbell left adjoint functor from <C>PreSheaves</C>( <A>B</A> ) $\to$ <C>CoPreSheaves</C>( <A>B</A> ).
#! @Arguments B
#! @Returns a &CAP; functor
DeclareAttribute( "IsbellLeftAdjoint",
        IsCapCategory );

##
DeclareAttribute( "IsbellRightAdjointData",
        IsCapCategory );

#! @Description
#!  Returns the Isbell right adjoint functor from <C>CoPreSheaves</C>( <A>B</A> ) $\to$ <C>PreSheaves</C>( <A>B</A> ).
#! @Arguments B
#! @Returns a &CAP; functor
DeclareAttribute( "IsbellRightAdjoint",
        IsCapCategory );

#! @Description
#!  Returns the Isbell adjunction monad on <C>PreSheaves</C>( <A>B</A> ).
#! @Arguments B
#! @Returns a &CAP; functor
DeclareAttribute( "IsbellAdjunctionMonad",
        IsCapCategory );

DeclareAttribute( "UnitOfIsbellAdjunctionData",
        IsCapCategory );

#! @Description
#!  Returns the unit of the Isbell adjunction on <C>PreSheaves</C>( <A>B</A> ).
#! @Arguments B
#! @Returns a &CAP; functor
DeclareAttribute( "UnitOfIsbellAdjunction",
        IsCapCategory );

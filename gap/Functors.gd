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
        IsCoPreSheafCategory );

#! @Description
#!  Returns the Nakayama left adjoint functor from <A>PSh</A> = <C>PreSheaves</C>( <A>B</A> ) $\to$ <A>coPSh</A> = <C>CoPreSheaves</C>( <A>B</A> ).
#! @Arguments PSh, coPSh
#! @Returns a &CAP; functor
#! @Group NakayamaLeftAdjoint
DeclareOperation( "NakayamaLeftAdjoint",
        [ IsPreSheafCategory, IsCoPreSheafCategory ] );

#! @Arguments B
#! @Group NakayamaLeftAdjoint
DeclareAttribute( "NakayamaLeftAdjoint",
        IsAlgebroid );

##
DeclareAttribute( "NakayamaRightAdjointData",
        IsPreSheafCategory );

#! @Description
#!  Returns the Nakayama right adjoint functor from <A>coPSh</A> = <C>CoPreSheaves</C>( <A>B</A> ) $\to$ <A>PSh</A> = <C>PreSheaves</C>( <A>B</A> ).
#! @Arguments coPSh, PSh
#! @Returns a &CAP; functor
#! @Group NakayamaRightAdjoint
DeclareOperation( "NakayamaRightAdjoint",
        [ IsCoPreSheafCategory, IsPreSheafCategory ] );

#! @Arguments B
#! @Group NakayamaRightAdjoint
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

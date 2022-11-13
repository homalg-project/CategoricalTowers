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
DeclareOperation( "IsbellLeftAdjointData",
        [ IsPreSheafCategory, IsCoPreSheafCategory ] );

#! @Description
#!  Returns the Isbell left adjoint functor from <A>PSh</A> = <C>PreSheaves</C>( <A>B</A> ) $\to$ <A>coPSh</A> = <C>CoPreSheaves</C>( <A>B</A> ).
#! @Arguments PSh, coPSh
#! @Returns a &CAP; functor
#! @Group IsbellLeftAdjoint
DeclareOperation( "IsbellLeftAdjoint",
        [ IsPreSheafCategory, IsCoPreSheafCategory ] );

#! @Arguments B
#! @Group IsbellLeftAdjoint
DeclareAttribute( "IsbellLeftAdjoint",
        IsCapCategory );

##
DeclareOperation( "IsbellRightAdjointData",
        [ IsCoPreSheafCategory, IsPreSheafCategory ] );

#! @Description
#!  Returns the Isbell right adjoint functor from <A>coPSh</A> = <C>CoPreSheaves</C>( <A>B</A> ) $\to$ <A>PSh</A> = <C>PreSheaves</C>( <A>B</A> ).
#! @Arguments coPSh, PSh
#! @Returns a &CAP; functor
#! @Group IsbellRightAdjoint
DeclareOperation( "IsbellRightAdjoint",
        [ IsCoPreSheafCategory, IsPreSheafCategory ] );

#! @Arguments B
#! @Group IsbellRightAdjoint
DeclareAttribute( "IsbellRightAdjoint",
        IsCapCategory );

#! @Description
#!  Returns the Isbell adjunction monad on the presheaf category <A>PSh</A>.
#! @Arguments PSh, coPSh
#! @Returns a &CAP; functor
#! @Group IsbellAdjunctionMonad
DeclareOperation( "IsbellAdjunctionMonad",
        [ IsPreSheafCategory, IsCoPreSheafCategory ] );

#! @Arguments B
#! @Group IsbellAdjunctionMonad
DeclareAttribute( "IsbellAdjunctionMonad",
        IsCapCategory );

DeclareOperation( "UnitOfIsbellAdjunctionData",
        [ IsPreSheafCategory, IsCoPreSheafCategory ] );

#! @Description
#!  Returns the unit of the Isbell adjunction on the presheaf category <A>PSh</A>.
#! @Arguments PSh
#! @Returns a &CAP; functor
DeclareAttribute( "UnitOfIsbellAdjunction",
        IsPreSheafCategory );

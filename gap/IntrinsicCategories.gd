#############################################################################
##
##  IntrinsicCategories.gd                       IntrinsicCategories package
##
##  Copyright 2015,      Mohamed Barakat, RWTH Aachen University
##
##  Declaration stuff for intrinsic categories.
##
#############################################################################

#! @Chapter Intrinsic Categories

# our info class:
DeclareInfoClass( "InfoIntrinsicCategories" );
SetInfoLevel( InfoIntrinsicCategories, 1 );

####################################
#
#! @Section Categories
#
####################################

#! @Description
#!  The &GAP; category of intrinsic cells in an intrinsic &CAP; category.
DeclareCategory( "IsCapCategoryIntrinsicCell",
        IsCapCategoryCell and
        IsAttributeStoringRep );

#! @Description
#!  The &GAP; category of intrinsic objects in an intrinsic &CAP; category.
DeclareCategory( "IsCapCategoryIntrinsicObject",
        IsCapCategoryIntrinsicCell and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of intrinsic morphisms in an intrinsic &CAP; category.
DeclareCategory( "IsCapCategoryIntrinsicMorphism",
        IsCapCategoryIntrinsicCell and
        IsCapCategoryMorphism );

####################################
#
#! @Section Technical stuff
#
####################################

# a central place for configurations:
DeclareGlobalVariable( "INTRINSIC_CATEGORIES" );

DeclareGlobalVariable( "PROPAGATION_LIST_FOR_INTRINSIFIED_MORPHISMS" );

DeclareGlobalFunction( "INSTALL_TODO_LIST_FOR_INTRINSIFIED_MORPHISMS" );

#! @Description
#!  
DeclareFilter( "CanonicalizeIfZero" );

#! @Description
#!  
DeclareProperty( "CanonicalizedToZero",
        IsCapCategoryIntrinsicCell );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  In the one argument version create an intrinsic cell out of the cell <A>c</A>.
#!  If <A>c</A> is a morphism then its source and object are intrinsified.
#! @Group Intrinsify
#! @Arguments c
DeclareOperation( "Intrinsify",
        [ IsCapCategoryCell ] );

#! @Description
#!  In the two argument version the intrinsified cell <A>c</A> is subsequently added to the category <A>C</A>.
#! @Arguments C, c
#! @Group Intrinsify
DeclareOperation( "Intrinsify",
        [ IsCapCategory, IsCapCategoryCell ] );

#! @Description
#!  In the five argument version create an intrinsic morphism out of the morphism <A>m</A>,
#!  with source <C>CertainCell</C>(<A>s</A>,<A>i</A>) and target <C>CertainCell</C>(<A>t</A>,<A>j</A>).
#! @Arguments m, s, i, t, j
#! @Group Intrinsify
DeclareOperation( "Intrinsify",
        [ IsCapCategoryMorphism, IsCapCategoryIntrinsicObject, IsInt, IsCapCategoryIntrinsicObject, IsInt ] );

#! @Description
#!  Intrinsify a functor ...
#! @Arguments F, name, A, B
#! @Group Intrinsify
DeclareOperation( "Intrinsify",
        [ IsCapFunctor, IsString, IsCapCategory, IsCapCategory ] );

#! @Description
#!  Intrinsify a functor ...
#! @Arguments F, A, B
#! @Group Intrinsify
DeclareOperation( "Intrinsify",
        [ IsCapFunctor, IsCapCategory, IsCapCategory ] );

#! @Description
#!  Intrinsify an endofunctor ...
#! @Arguments F, name, A
#! @Group Intrinsify
DeclareOperation( "Intrinsify",
        [ IsCapFunctor, IsString, IsCapCategory ] );

#! @Description
#!  Intrinsify an endofunctor ...
#! @Arguments F, A
#! @Group Intrinsify
DeclareOperation( "Intrinsify",
        [ IsCapFunctor, IsCapCategory ] );

#! @Description
#!  Intrinsify a natural transformation
#! @Arguments eta, name, A, B
#! @Group Intrinsify
DeclareOperation( "Intrinsify",
        [ IsCapNaturalTransformation, IsString, IsCapFunctor, IsCapFunctor ] );

#! @Description
#!  Intrinsify a natural transformation
#! @Arguments eta, A, B
#! @Group Intrinsify
DeclareOperation( "Intrinsify",
        [ IsCapNaturalTransformation, IsCapFunctor, IsCapFunctor ] );

#! @Description
#!  Turn the range of the natural isomorphism <A>eta</A> into the identity functor
#!  and turn <A>eta</A> into the identity natural transformation.
#! @Arguments eta
#! @Returns a functor
DeclareOperation( "TurnAutoequivalenceIntoIdentityFunctor",
        [ IsCapNaturalTransformation ] );

#! @Description
#!  Turn <C>FunctorCanonicalizeZeroObjects</C>(<A>category</A>) into
#!  the identity functor.
#! @Arguments category
#! @Returns a functor
DeclareAttribute( "TurnCanonicalizeZeroObjectsIntoIdentityFunctor",
        IsCapCategory );

#! @Description
#!  Turn <C>FunctorCanonicalizeZeroMorphisms</C>(<A>category</A>) into
#!  the identity functor.
#! @Arguments category
#! @Returns a &CAP; functor
DeclareAttribute( "TurnCanonicalizeZeroMorphismsIntoIdentityFunctor",
        IsCapCategory );

#! @Description
#!  Create an intrinsic category out of <A>C</A>.
#!  If <A>strict</A>=<C>true</C> then a potential congruence relation
#!  on the <M>Hom</M>-sets is divided out, else <A>strict</A>=<C>false</C>
#!  and the <M>Hom</M>-sets are in fact setoids.
#! @Arguments C, strict
#! @Returns a &CAP; category
DeclareOperation( "IntrinsicCategory",
        [ IsCapCategory, IsBool ] );

#! @Description
#!  Create an intrinsic category out of <A>C</A>.
#! @Arguments C
#! @Returns a &CAP; category
DeclareOperation( "IntrinsicCategory",
        [ IsCapCategory ] );

####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  Return the position of the last stored cell underlying the intrinsic cell <A>c</A>.
#! @Arguments c
DeclareOperation( "PositionOfLastStoredCell",
        [ IsCapCategoryIntrinsicObject ] );

#! @Description
#!  Return the  <A>i</A>-th object underlying the intrinsic object <A>o</A>.
#! @Arguments o, i
DeclareOperation( "CertainCell",
        [ IsCapCategoryIntrinsicObject, IsInt ] );

#! @Description
#!  Return the  <A>(i,j,k)</A>-th morphism underlying the intrinsic cell <A>m</A>.
#! @Arguments m, i, j, k
DeclareOperation( "CertainCell",
        [ IsCapCategoryIntrinsicMorphism, IsInt, IsInt, IsInt ] );

#! @Description
#!  Return the  <A>(i,j)</A>-th morphism underlying the intrinsic cell <A>m</A>.
#! @Arguments m, i, j
DeclareOperation( "CertainCell",
        [ IsCapCategoryIntrinsicMorphism, IsInt, IsInt ] );

#! @Description
#!  Return the position of the active cell underlying the intrinsic cell <A>c</A>.
#! @Arguments c
DeclareOperation( "PositionOfActiveCell",
        [ IsObject ] );

#! @Description
#!  Set the position of the active cell underlying the intrinsic cell <A>c</A> using <A>p</A>.
#! @Arguments c, p
DeclareOperation( "SetPositionOfActiveCell",
        [ IsObject, IsObject ] );

#! @Description
#!  Return the active cell underlying the intrinsic cell <A>c</A>.
#! @Arguments c
DeclareOperation( "ActiveCell",
        [ IsObject ] );

#! @Description
#!  Add the isomorphism <A>eta</A> to the record of transition isomorphisms.
#!  <C>Source</C>( <A>eta</A> ) must be equal to <C>CertainCell</C>( <A>o</A>, <A>s</A> ).
#! @Arguments o, s, eta
DeclareOperation( "AddTransitionIsomorphism",
        [ IsCapCategoryIntrinsicObject, IsInt, IsCapCategoryMorphism ] );

#! @Description
#!  In the second version the
#!  <C>Range</C>( <A>eta</A> ) must be equal to <C>CertainCell</C>( <A>o</A>, <A>t</A> ).
#! @Arguments o, eta, t
#! @Group AddTransitionIsomorphism
DeclareOperation( "AddTransitionIsomorphism",
        [ IsCapCategoryIntrinsicObject, IsCapCategoryMorphism, IsInt ] );

#! @Description
#!  In the third version the <C>Range</C>( <A>eta</A> ) must be equal to <C>CertainCell</C>( <A>o</A>, <A>t</A> )
#!  and the <C>Source</C>( <A>eta</A> ) must be equal to <C>CertainCell</C>( <A>o</A>, <A>s</A> ).
#! @Arguments o, s, eta, t
#! @Group AddTransitionIsomorphism
DeclareOperation( "AddTransitionIsomorphism",
        [ IsCapCategoryIntrinsicObject, IsInt, IsCapCategoryMorphism, IsInt ] );

#! @Description
#!  Return the transition isomorphism of the intrinsic object <A>o</A>
#!  at position (<A>s</A>,<A>t</A>).
#! @Arguments o, s, t
DeclareOperation( "TransitionIsomorphism",
        [ IsCapCategoryIntrinsicObject, IsInt, IsInt ] );

#! @Description
#!  Add the morphism <A>m</A> to the intrinsic morphism <A>mor</A> at position [ <A>s</A>, <A>t</A>, ? ].
#! @Arguments mor, m, s, t
DeclareOperation( "AddToIntrinsicMorphism",
        [ IsCapCategoryIntrinsicMorphism, IsCapCategoryMorphism, IsInt, IsInt ] );

# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicCategories: Intrinsic categories for CAP
#
# Declarations
#

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
#!  The &GAP; category of an intrinsic CAP category.
DeclareCategory( "IsIntrinsicCategory",
        IsCapCategory );

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
DeclareProperty( "IsSafeForSideEffects",
        IsCapCategoryCell );

DeclareGlobalFunction( "CanonicalizedToZero_for_objects" );
DeclareGlobalFunction( "CanonicalizedToZero_for_morphisms" );

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
#!  Create an intrinsic object out of the object <A>o</A>.
#! @Arguments C, o
#! @Returns an object in a CAP-category
DeclareOperation( "IntrinsifyObject",
        [ IsCapCategory, IsCapCategoryObject ] );

#! @Description
#!  The default method is <C>IntrinsifyObject</C>.
#!  This is the method to overload depending on the context.
#! @Arguments C, o
#! @Returns an object in a CAP-category
DeclareOperation( "Intrinsify",
        [ IsCapCategory, IsCapCategoryObject ] );

#! @Description
#!  Create out of the morphism <A>m</A> an intrinsic morphism with source <C>CertainCell</C>(<A>s</A>,<A>i</A>) and
#!  target <C>CertainCell</C>(<A>t</A>,<A>j</A>).
#! @Arguments m, s, i, t, j
#! @Returns a morphism in a CAP-category
#! @Group Intrinsify_mor
DeclareOperation( "IntrinsifyMorphism",
        [ IsCapCategoryIntrinsicObject, IsCapCategoryMorphism, IsCapCategoryIntrinsicObject ] );

#! @Description
#!  Create out of the morphism <A>m</A> an intrinsic morphism with source <C>CertainCell</C>(<A>s</A>,<A>i</A>) and
#!  target <C>CertainCell</C>(<A>t</A>,<A>j</A>).
#! @Arguments m, s, i, t, j
#! @Returns a morphism in a CAP-category
#! @Group Intrinsify_mor
DeclareOperation( "Intrinsify",
        [ IsCapCategoryMorphism, IsCapCategoryIntrinsicObject, IsInt, IsCapCategoryIntrinsicObject, IsInt ] );

#! @Description
#!  In the two argument version create an intrinsic morphism out of the morphism <A>m</A>
#!  after intrinsifying its source and target.
#! @Arguments C, m
#! @Group Intrinsify_mor
DeclareOperation( "Intrinsify",
        [ IsCapCategory, IsCapCategoryMorphism ] );

#! @Description
#!  Intrinsify a functor ...
#! @Arguments F, name, A, B
#! @Group Intrinsify_fun
DeclareOperation( "Intrinsify",
        [ IsCapFunctor, IsString, IsCapCategory, IsCapCategory ] );

#! @Description
#!  Intrinsify a functor ...
#! @Arguments F, A, B
#! @Group Intrinsify_fun
DeclareOperation( "Intrinsify",
        [ IsCapFunctor, IsCapCategory, IsCapCategory ] );

#! @Description
#!  Intrinsify an endofunctor ...
#! @Arguments F, name, A
#! @Group Intrinsify_fun
DeclareOperation( "Intrinsify",
        [ IsCapFunctor, IsString, IsCapCategory ] );

#! @Description
#!  Intrinsify an endofunctor ...
#! @Arguments F, A
#! @Group Intrinsify_fun
DeclareOperation( "Intrinsify",
        [ IsCapFunctor, IsCapCategory ] );

#! @Description
#!  Intrinsify a natural transformation
#! @Arguments eta, name, A, B
#! @Group Intrinsify_ntr
DeclareOperation( "Intrinsify",
        [ IsCapNaturalTransformation, IsString, IsCapFunctor, IsCapFunctor ] );

#! @Description
#!  Intrinsify a natural transformation
#! @Arguments eta, A, B
#! @Group Intrinsify_ntr
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
DeclareAttribute( "CanonicalizeZeroObjectsAsIdentityFunctor",
        IsCapCategory );

#! @Description
#!  Turn <C>FunctorCanonicalizeZeroMorphisms</C>(<A>category</A>) into
#!  the identity functor.
#! @Arguments category
#! @Returns a &CAP; functor
DeclareAttribute( "CanonicalizeZeroMorphismsAsIdentityFunctor",
        IsCapCategory );

#! @Description
#!  Create in the sense explained below an <Q>intrinsic</Q> category out of the category <A>C</A>.
#!  The procedure understands five options:
#!  * <C>strict</C> (<C>true</C> or <C>false</C>);
#!  * <C>filter_obj</C> (a filter used to define the type of intrinsified objects);
#!  * <C>filter_mor</C> (a filter used to define the type of intrinsified morphisms);
#!  * <C>filter_end</C> (a filter used to define the type of intrinsified endomorphisms);
#!  * <C>todo_func</C> (a function which does not need to return anything).
#!  
#!  If <C>strict</C>=<C>true</C> then the &CAP;'s congruence relation
#!  on the <M>Hom</M>-setoids is divided out.
#!  The argument <C>todo_func</C> is a function which will be applied in all
#!  &CAP; constructions <C>CAP_oper</C> producing a morphism
#!  to the argument list of <C>CAP_oper</C> (as first argument) and
#!  the output of <C>CAP_oper</C> (as second argument).
#!  If the option <C>strict</C> is not specified it defaults to <C>true</C>.
#!  If <A>filter_obj</A> is not specified it defaults to <C>IsCapCategoryIntrinsicObject</C>.
#!  If <A>filter_mor</A> is not specified it defaults to <C>IsCapCategoryIntrinsicMorphism</C>.
#!  If <A>filter_end</A> is not specified it defaults to <C>IsCapCategoryIntrinsicMorphism</C>.
#!  If <A>todo</A> is not specified it defaults to <C>ReturnNothing</C>.
#! @Arguments C
#! @Returns a &CAP; category
#! @Group IntrinsicCategory
DeclareOperation( "IntrinsicCategory",
        [ IsCapCategory ] );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The category underlying the intrinsic category <A>C</A>.
#! @Arguments C
DeclareAttribute( "UnderlyingCategory",
        IsCapCategory );

####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  Check whether the intrinsic object <A>c</A> is locked or not.
#! @Arguments c
DeclareOperation( "IsLockedObject",
        [ IsCapCategoryIntrinsicObject ] );

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

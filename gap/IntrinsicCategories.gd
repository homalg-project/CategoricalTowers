#############################################################################
##
##  Categories.gd                                IntrinsicCategories package
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
#! @Section Constructors
#
####################################

#! @Description
#!  In the one argument version create an intrinsic cell out of the cell <A>c</A>.
#!  If <A>c</A> is a morphism then its source and object are intrinsified.
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
#!  In the six argument version the intrinsified morphism <A>m</A> is subsequently added to the category <A>C</A>.
#! @Arguments C, m, s, i, t, j
#! @Group Intrinsify
DeclareOperation( "Intrinsify",
        [ IsCapCategory, IsCapCategoryMorphism, IsCapCategoryIntrinsicObject, IsInt, IsCapCategoryIntrinsicObject, IsInt ] );

#! @Description
#!  Create an intrinsic category out of <A>C</A>.
#! @Arguments C
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
        [ IsCapCategoryIntrinsicCell, IsInt ] );

#! @Description
#!  Return the  <A>(i,j)</A>-th morphism underlying the intrinsic cell <A>m</A>.
#! @Arguments m, i, j
DeclareOperation( "CertainCell",
        [ IsCapCategoryIntrinsicCell, IsInt, IsInt ] );

#! @Description
#!  Return the position of the active cell underlying the intrinsic cell <A>c</A>.
#! @Arguments c
DeclareOperation( "PositionOfActiveCell",
        [ IsCapCategoryIntrinsicCell ] );

#! @Description
#!  Return the active cell underlying the intrinsic cell <A>c</A>.
#! @Arguments c
DeclareOperation( "ActiveCell",
        [ IsObject ] );

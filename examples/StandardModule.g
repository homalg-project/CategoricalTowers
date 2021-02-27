#! @Chapter Examples and Tests

#! @Section TurnAutoequivalenceIntoIdentityFunctor

LoadPackage( "ModulePresentationsForCAP", ">=2016.09.22" );
LoadPackage( "IntrinsicCategories" );
LoadPackage( "HomologicalAlgebraForCAP" );
LoadPackage( "RingsForHomalg" );

#! @Example
QQ := HomalgFieldOfRationalsInSingular( );;
R := QQ * "x,y";
#! Q[x,y]
category := IntrinsicCategory( LeftPresentations( R ) );
#! intrinsic Category of left presentations of Q[x,y]
M := AsLeftPresentation( HomalgMatrix( "[ 1, x, 0, 1 ]", 2, 2, R ) );
#! <An object in Category of left presentations of Q[x,y]>
phi := CoverByFreeModule( M );
#! <A morphism in Category of left presentations of Q[x,y]>
M := Intrinsify( category, M );
#! <an intrinsic object on active cell: <An object in Category
#!  of left presentations of Q[x,y]>>
F := Intrinsify( category, Source( phi ) );
#! <an intrinsic object on active cell:
#!  <A projective object in Category of left presentations of Q[x,y]>>
phi := Intrinsify( phi, F, 1, M, 1 );
#! <an intrinsic morphism on active cell:
#!  <A morphism in Category of left presentations of Q[x,y]>>
PositionOfActiveCell( phi );
#! [ 1, 1, 1 ]
Id := IdentityFunctor( category );
#! Identity functor of intrinsic Category of left presentations of Q[x,y]
sm := FunctorStandardModuleLeft( R );
#! Standard module for Category of left presentations of Q[x,y]
SM := Intrinsify( sm, category );
#! Intrinsic version of Standard module
#! for Category of left presentations of Q[x,y]
etaSM := Intrinsify(
  NaturalIsomorphismFromIdentityToStandardModuleLeft( R ), Id, SM );
#! Intrinsic version of Natural isomorphism
#! from Id to Standard module for Category of left presentations of Q[x,y]
IdSM := TurnAutoequivalenceIntoIdentityFunctor( etaSM );
#! Intrinsic version of Standard module for
#! Category of left presentations of Q[x,y] as identity functor with side effects
ApplyFunctor( IdSM, phi );
#! <an intrinsic morphism on active cell:
#!  <A morphism in Category of left presentations of Q[x,y]>>
PositionOfActiveCell( phi );
#! [ 1, 2, 1 ]
ApplyFunctor( IdSM, phi );
#! <an intrinsic morphism on active cell:
#!  <A morphism in Category of left presentations of Q[x,y]>>
PositionOfActiveCell( phi );
#! [ 1, 2, 1 ]
#! @EndExample

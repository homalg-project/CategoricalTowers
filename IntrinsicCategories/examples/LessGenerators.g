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
#! IntrinsicCategory( Category of left presentations of Q[x,y] )
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
#! Identity functor of
#! IntrinsicCategory( Category of left presentations of Q[x,y] )
lg := FunctorLessGeneratorsLeft( R );
#! Less generators for Category of left presentations of Q[x,y]
LG := Intrinsify( lg, category );
#! Intrinsic version of Less generators
#! for Category of left presentations of Q[x,y]
etaLG := Intrinsify(
  NaturalIsomorphismFromIdentityToLessGeneratorsLeft( R ), Id, LG );
#! Intrinsic version of Natural isomorphism
#! from Id to Less generators for Category of left presentations of Q[x,y]
IdLG := TurnAutoequivalenceIntoIdentityFunctor( etaLG );
#! Intrinsic version of Less generators for
#! Category of left presentations of Q[x,y] as identity functor with side effects
ApplyFunctor( IdLG, phi );
#! <an intrinsic morphism on active cell:
#!  <A morphism in Category of left presentations of Q[x,y]>>
PositionOfActiveCell( phi );
#! [ 1, 2, 1 ]
ApplyFunctor( IdLG, phi );
#! <an intrinsic morphism on active cell:
#!  <A morphism in Category of left presentations of Q[x,y]>>
PositionOfActiveCell( phi );
#! [ 1, 2, 1 ]
#! @EndExample

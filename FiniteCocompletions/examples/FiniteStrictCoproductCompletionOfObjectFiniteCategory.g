#! @BeginChunk FiniteStrictCoproductCompletionOfObjectFiniteCategory

#! @Example
LoadPackage( "FiniteCocompletions", false );
#! true
q := FinQuiver( "q(a,b,c)[m:a->b,n:b->c]" );
#! FinQuiver( "q(a,b,c)[m:a→b,n:b→c]" )
P := PathCategory( q : skeletal := true );
#! PathCategory( FinQuiver( "q(a,b,c)[m:a→b,n:b→c]" ) )
mUP := FiniteStrictCoproductCompletionOfObjectFiniteCategory( P );
#! FiniteStrictCoproductCompletionOfObjectFiniteCategory(
#! PathCategory( FinQuiver( "q(a,b,c)[m:a→b,n:b→c]" ) ) )
a := mUP.a;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory(
#!  PathCategory( FinQuiver( "q(a,b,c)[m:a→b,n:b→c]" ) ) )>
b := mUP.b;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory(
#!  PathCategory( FinQuiver( "q(a,b,c)[m:a→b,n:b→c]" ) ) )>
c := mUP.c;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory(
#!  PathCategory( FinQuiver( "q(a,b,c)[m:a→b,n:b→c]" ) ) )>
m := mUP.m;
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory(
#!  PathCategory( FinQuiver( "q(a,b,c)[m:a→b,n:b→c]" ) ) )>
n := mUP.n;
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory(
#!  PathCategory( FinQuiver( "q(a,b,c)[m:a→b,n:b→c]" ) ) )>
PreCompose( m, n );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory(
#!  PathCategory( FinQuiver( "q(a,b,c)[m:a→b,n:b→c]" ) ) )>
x := [ 3, [ 1, 2, 0 ] ] / mUP;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory(
#!  PathCategory( FinQuiver( "q(a,b,c)[m:a→b,n:b→c]" ) ) )>
y := [ 6, [ 3, 2, 1 ] ] / mUP;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory(
#!  PathCategory( FinQuiver( "q(a,b,c)[m:a→b,n:b→c]" ) ) )>
ix := InjectionOfCofactorOfCoproduct( [ x, y ], 1 );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory(
#!  PathCategory( FinQuiver( "q(a,b,c)[m:a→b,n:b→c]" ) ) )>
iy := InjectionOfCofactorOfCoproduct( [ x, y ], 2 );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory(
#!  PathCategory( FinQuiver( "q(a,b,c)[m:a→b,n:b→c]" ) ) )>
u := UniversalMorphismFromCoproduct( [ ix, iy ] );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory(
#!  PathCategory( FinQuiver( "q(a,b,c)[m:a→b,n:b→c]" ) ) )>
IsOne( u );
#! true
IsWellDefined( u );
#! true
#! @EndExample
#! @EndChunk

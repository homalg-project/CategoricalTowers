#! @Chunk EmbeddingOfUnderlyingCategory

#! @Example
LoadPackage( "FiniteCocompletions" );
#! true
q := FinQuiver( "Q(SG,SR,TG,TR)[rhoS:SR->SG,rhoT:TR->TG,phi:SG->TG,chi:SR->TR]" );
#! FinQuiver( "Q(SG,SR,TG,TR)[rhoS:SR→SG,rhoT:TR→TG,phi:SG→TG,chi:SR→TR]" )
P := PathCategory( q );
#! PathCategory(
#! FinQuiver( "Q(SG,SR,TG,TR)[rhoS:SR→SG,rhoT:TR→TG,phi:SG→TG,chi:SR→TR]" ) )
C := P / [ [ P.rhoS * P.phi, P.chi * P.rhoT ] ];
#! PathCategory(
#! FinQuiver( "Q(SG,SR,TG,TR)[rhoS:SR→SG,rhoT:TR→TG,phi:SG→TG,chi:SR→TR]" ) )
#! / [ rhoS⋅phi = chi⋅rhoT ]
zz := HomalgRingOfIntegers( );
#! Z
L := LinearClosure( zz, C );
#! Z-LinearClosure( PathCategory(
#! FinQuiver( "Q(SG,SR,TG,TR)[rhoS:SR→SG,rhoT:TR→TG,phi:SG→TG,chi:SR→TR]" ) )
#! / [ rhoS⋅phi = chi⋅rhoT ] )
A := AdditiveClosure( L );
#! AdditiveClosure( Z-LinearClosure( PathCategory(
#! FinQuiver( "Q(SG,SR,TG,TR)[rhoS:SR→SG,rhoT:TR→TG,phi:SG→TG,chi:SR→TR]" ) )
#! / [ rhoS⋅phi = chi⋅rhoT ] ) )
K := CoFreydCategory( A );
#! CoFreyd( AdditiveClosure( Z-LinearClosure( PathCategory(
#! FinQuiver( "Q(SG,SR,TG,TR)[rhoS:SR→SG,rhoT:TR→TG,phi:SG→TG,chi:SR→TR]" ) )
#! / [ rhoS⋅phi = chi⋅rhoT ] ) ) )
F := FreydCategory( K );
#! Freyd( CoFreyd( AdditiveClosure( Z-LinearClosure( PathCategory(
#! FinQuiver( "Q(SG,SR,TG,TR)[rhoS:SR→SG,rhoT:TR→TG,phi:SG→TG,chi:SR→TR]" ) )
#! / [ rhoS⋅phi = chi⋅rhoT ] ) ) ) )
S := CokernelObject( F.rhoS );
#! <An object in Freyd( CoFreyd( AdditiveClosure( Z-LinearClosure( PathCategory(
#!  FinQuiver( "Q(SG,SR,TG,TR)[rhoS:SR→SG,rhoT:TR→TG,phi:SG→TG,chi:SR→TR]" ) )
#!  / [ rhoS⋅phi = chi⋅rhoT ] ) ) ) )>
T := CokernelObject( F.rhoT );
#! <An object in Freyd( CoFreyd( AdditiveClosure( Z-LinearClosure( PathCategory(
#!  FinQuiver( "Q(SG,SR,TG,TR)[rhoS:SR→SG,rhoT:TR→TG,phi:SG→TG,chi:SR→TR]" ) )
#!  / [ rhoS⋅phi = chi⋅rhoT ] ) ) ) )>
psi := MorphismConstructor( S, K.phi, T );
#! <A morphism in Freyd( CoFreyd( AdditiveClosure( Z-LinearClosure( PathCategory(
#!  FinQuiver( "Q(SG,SR,TG,TR)[rhoS:SR→SG,rhoT:TR→TG,phi:SG→TG,chi:SR→TR]" ) )
#!  / [ rhoS⋅phi = chi⋅rhoT ] ) ) ) )>
IsWellDefined( psi );
#! true
CokernelObjectFunctorial( F.rhoS, F.phi, F.rhoT ) = psi;
#! true
psi =
  EvalString( CellAsEvaluatableString( psi, [ "F", "K", "A", "L", "C", "P" ] ) );
#! true
#! @EndExample

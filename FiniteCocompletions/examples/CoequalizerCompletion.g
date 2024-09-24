#! @BeginChunk CoequalizerCompletion

#! @Example
LoadPackage( "FunctorCategories" );
#! true
q := "q(VS,AS,VT,AT)[sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,\
m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]";;
q := RightQuiver( q );
#! q(VS,AS,VT,AT)[sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!                m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]
F := FreeCategory( q );
#! FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#! [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!  m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) )
rel := [ [ F.sS * F.m1, F.w1 * F.sT ],
         [ F.sS * F.m2, F.w2 * F.sT ],
         [ F.sS * F.m3, F.w3 * F.sT ],
         [ F.tS * F.m1, F.w1 * F.tT ],
         [ F.tS * F.m2, F.w2 * F.tT ],
         [ F.tS * F.m3, F.w3 * F.tT ] ];;
C := F / rel;
#! FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#! [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!  m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) )
#! / relations
Q := HomalgFieldOfRationals( );
#! Q
L := Q[C];
#! Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#! [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!  m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) )
#! / relations
UC := AdditiveClosure( L );
#! AdditiveClosure( Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#! [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!  m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) )
#! / relations )
str := CellAsEvaluatableString( UC.sS, [ "L", "UC", "L.AS", "L.VS", "L.sS" ] );
#! "MorphismConstructor( UC,
#!         ObjectConstructor( UC, [ L.AS ] ),
#!         [ [ L.sS ] ],
#!         ObjectConstructor( UC, [ L.VS ] ) )"
EvalString( str ) = UC.sS;
#! true
A := CoequalizerCompletion( UC );
#! CoequalizerCompletion( AdditiveClosure( Algebroid( Q, FreeCategory(
#! RightQuiver( "q(VS,AS,VT,AT)
#! [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!  m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) )
#! / relations ) )
A.sS * A.m1 = A.w1 * A.sT;
#! true
A.sS * A.m2 = A.w2 * A.sT;
#! true
A.sS * A.m3 = A.w3 * A.sT;
#! true
A.tS * A.m1 = A.w1 * A.tT;
#! true
A.tS * A.m2 = A.w2 * A.tT;
#! true
A.tS * A.m3 = A.w3 * A.tT;
#! true
S := ObjectConstructor( A, Pair( Pair( UC.VS, UC.AS ), Pair( UC.sS, UC.tS ) ) );
#! <An object in CoequalizerCompletion( AdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#!  [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,m1:VS->VT,w1:AS->AT,
#!   m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) ) / relations ) )>
T := ObjectConstructor( A, Pair( Pair( UC.VT, UC.AT ), Pair( UC.sT, UC.tT ) ) );
#! <An object in CoequalizerCompletion( AdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#!  [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,m1:VS->VT,w1:AS->AT,
#!   m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) ) / relations ) )>
mor1 := MorphismConstructor( A, S, Pair( UC.m1, UC.w1 ), T );
#! <A morphism in CoequalizerCompletion( AdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#!  [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!   m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) )
#!  / relations ) )>
mor2 := MorphismConstructor( A, S, Pair( UC.m2, UC.w2 ), T );
#! <A morphism in CoequalizerCompletion( AdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#!  [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!   m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) )
#!  / relations ) )>
mor3 := MorphismConstructor( A, S, Pair( UC.m3, UC.w3 ), T );
#! <A morphism in CoequalizerCompletion( AdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#!  [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!   m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) )
#!  / relations ) )>
IsWellDefined( mor1 );
#! true
IsWellDefined( mor2 );
#! true
IsWellDefined( mor3 );
#! true
coeq := Coequalizer( [ mor1, mor2, mor3 ] );
#! <An object in CoequalizerCompletion( AdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#!  [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,m1:VS->VT,w1:AS->AT,
#!   m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) ) / relations ) )>
Display( coeq );
#! Image of <(V)>:
#! A formal direct sum consisting of 2 objects.
#! <(VT)>
#! <(VS)>
#! 
#! Image of <(A)>:
#! A formal direct sum consisting of 4 objects.
#! <(AT)>
#! <(VS)>
#! <(VS)>
#! <(VS)>
#! 
#! Image of (V)-[(s)]->(A):
#! A 4 x 2 matrix with entries in
#! Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#! [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#! m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) ) / relations
#! 
#! [1,1]: (AT)-[{ 1*(sT) }]->(VT)
#! [1,2]: (AT)-[{ 0 }]->(VS)
#! [2,1]: (VS)-[{ 0 }]->(VT)
#! [2,2]: (VS)-[{ 1*(VS) }]->(VS)
#! [3,1]: (VS)-[{ 0 }]->(VT)
#! [3,2]: (VS)-[{ 1*(VS) }]->(VS)
#! [4,1]: (VS)-[{ 0 }]->(VT)
#! [4,2]: (VS)-[{ 1*(VS) }]->(VS)
#! Image of (V)-[(t)]->(A):
#! A 4 x 2 matrix with entries in
#! Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#! [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#! m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) ) / relations
#! 
#! [1,1]: (AT)-[{ 1*(tT) }]->(VT)
#! [1,2]: (AT)-[{ 0 }]->(VS)
#! [2,1]: (VS)-[{ 1*(m1) }]->(VT)
#! [2,2]: (VS)-[{ 0 }]->(VS)
#! [3,1]: (VS)-[{ 1*(m2) }]->(VT)
#! [3,2]: (VS)-[{ 0 }]->(VS)
#! [4,1]: (VS)-[{ 1*(m3) }]->(VT)
#! [4,2]: (VS)-[{ 0 }]->(VS)
#! An object in PreSheaves( PathCategory( FinQuiver( "q(V,A)[s:V-≻A,t:V-≻A]" ) ),
#! AdditiveClosure( Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#! [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!  m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) ) / relations ) )
#!  given by the above data
#! 
#! An object in PairOfParallelArrowsCategory(
#! AdditiveClosure( Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#! [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!  m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) )
#! / relations ) ) given by the above data
#! 
#! An object in QuotientCategory( PairOfParallelArrowsCategory(
#! AdditiveClosure( Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#! [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!  m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) )
#! / relations ) ) ) defined by the congruence function unknown
#! given by the above data
#! 
#! An object in CoequalizerCompletion(
#! AdditiveClosure( Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#! [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!  m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) )
#! / relations ) ) given by the above data
proj := ProjectionOntoCoequalizer( [ mor1, mor2, mor3 ] );
#! <An epimorphism in CoequalizerCompletion( AdditiveClosure(
#!  Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#!  [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!   m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) )
#!  / relations ) )>
Display( proj );
#! Image of <(V)>:
#! A 1 x 2 matrix with entries in
#! Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#! [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!  m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) ) / relations
#! 
#! [1,1]: (VT)-[{ 1*(VT) }]->(VT)
#! [1,2]: (VT)-[{ 0 }]->(VS)
#! Image of <(A)>:
#! A 1 x 4 matrix with entries in
#! Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#! [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!  m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) ) / relations
#! 
#! [1,1]: (AT)-[{ 1*(AT) }]->(AT)
#! [1,2]: (AT)-[{ 0 }]->(VS)
#! [1,3]: (AT)-[{ 0 }]->(VS)
#! [1,4]: (AT)-[{ 0 }]->(VS)
#! A morphism in PreSheaves( PathCategory( FinQuiver( "q(V,A)[s:V-≻A,t:V-≻A]" ) ),
#! AdditiveClosure( Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#! [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!  m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) )
#! / relations ) ) given by the above data
#! 
#! A morphism in PairOfParallelArrowsCategory(
#! AdditiveClosure( Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#! [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!  m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) )
#! / relations ) ) given by the above data
#! 
#! A morphism in QuotientCategory( PairOfParallelArrowsCategory(
#! AdditiveClosure( Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#! [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!  m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) )
#! / relations ) ) ) defined by the congruence function unknown
#! given by the above data
#! 
#! A morphism in CoequalizerCompletion(
#! AdditiveClosure( Algebroid( Q, FreeCategory( RightQuiver( "q(VS,AS,VT,AT)
#! [sS:AS->VS,tS:AS->VS,sT:AT->VT,tT:AT->VT,
#!  m1:VS->VT,w1:AS->AT,m2:VS->VT,w2:AS->AT,m3:VS->VT,w3:AS->AT]" ) ) )
#! / relations ) ) given by the above data
#! @EndExample
#! @EndChunk

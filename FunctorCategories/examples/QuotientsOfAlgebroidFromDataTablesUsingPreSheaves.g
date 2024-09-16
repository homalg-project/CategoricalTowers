#! @BeginChunk QuotientsOfAlgebroidsFromDataTables

#! @Example
LoadPackage( "FunctorCategories", false );
#! true
q := FinQuiver( "q(0,1,2,3)[a:0->1,b:1->3,c:0->2,d:2->3,e:3->3]" );
#! FinQuiver( "q(0,1,2,3)[a:0-≻1,b:1-≻3,c:0-≻2,d:2-≻3,e:3-≻3]" )
k := HomalgFieldOfRationals();
#! Q
C := PathCategory( q );
#! PathCategory( FinQuiver( "q(0,1,2,3)[a:0-≻1,b:1-≻3,c:0-≻2,d:2-≻3,e:3-≻3]" ) )
kC := k[C];
#! Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3)[a:0-≻1,b:1-≻3,c:0-≻2,
#! d:2-≻3,e:3-≻3]" ) ) )
quo_kC := kC / [ kC.e^3 ];
#! Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3)[a:0-≻1,b:1-≻3,c:0-≻2,
#! d:2-≻3,e:3-≻3]" ) ) ) / [ 1*e^3 ]
A := AlgebroidFromDataTables( quo_kC );
#! Q-algebroid( {0,1,2,3}[a:0-≻1,b:1-≻3,c:0-≻2,d:2-≻3,e:3-≻3] ) defined by
#! 4 objects and 5 generating morphisms
e := AssociatedMorphismIntoAlgebroidAsObjectInPreSheavesCategory( A.("e") );;
IsWellDefined( e );
#! true
qA := QuotientCategory( A, [ A.ab - A.cd, 2*A.be ] );
#! QuotientCategory( Q-algebroid( {0,1,2,3}[a:0-≻1,b:1-≻3,c:0-≻2,d:2-≻3,e:3-≻3] )
#! defined by 4 objects and 5 generating morphisms, 2-sided ideal generated
#! by 2 morphisms )
qA.0;
#! <(0)>
RangeCategoryOfHomomorphismStructure( qA );
#! Rows( Q )
IsZero( qA.cde );
#! true
f := RandomMorphism( qA, 20 );;
1/2 * HomStructure( Source( f ), Target( f ), 2 * HomStructure( f ) ) = f;
#! true
qA := QuotientCategory( A, [ A.id_0, A.id_1, A.id_2 ] );
#! QuotientCategory( Q-algebroid( {0,1,2,3}[a:0-≻1,b:1-≻3,c:0-≻2,d:2-≻3,e:3-≻3] )
#! defined by 4 objects and 5 generating morphisms, 2-sided ideal generated
#! by 3 morphisms )
ForAll( [ qA.0, qA.1, qA.2 ], IsZeroForObjects );
#! true
IsZero( qA.3 );
#! false
D := AlgebroidFromDataTables( qA );
#! Q-algebroid( {3}[e:3-≻3] ) defined by 1 object and 1 generating morphism
BasisOfExternalHom( D.3, D.3 );
#! [ <1*id(3):(3) -≻ (3)>, <1*e:(3) -≻ (3)>, <1*e^2:(3) -≻ (3)> ]
data_tables := DataTablesOfCategory( quo_kC );;
data_tables_Z := ShallowCopy( data_tables );;
data_tables_Z[1] := HomalgRingOfIntegers();;
B := AlgebroidFromDataTables( data_tables_Z );
#! Z-algebroid( {0,1,2,3}[a:0-≻1,b:1-≻3,c:0-≻2,d:2-≻3,e:3-≻3] ) defined by
#! 4 objects and 5 generating morphisms
RangeCategoryOfHomomorphismStructure( B );
#! Rows( Z )
qB := QuotientCategory( B, [ B.ab - B.cd, 2*B.be ] );
#! QuotientCategory( Z-algebroid( {0,1,2,3}[a:0-≻1,b:1-≻3,c:0-≻2,d:2-≻3,e:3-≻3] )
#! defined by 4 objects and 5 generating morphisms, 2-sided ideal generated by
#! 2 morphisms )
RangeCategoryOfHomomorphismStructure( qB );
#! Freyd( Rows( Z ) )
IsZero( qB.cde );
#! false
IsZero( 2*qB.cde );
#! true
add_qB := AdditiveClosure( qB );
#! AdditiveClosure( QuotientCategory( Z-algebroid( {0,1,2,3}[a:0-≻1,b:1-≻3,
#! c:0-≻2,d:2-≻3,e:3-≻3] ) defined by 4 objects and 5 generating morphisms,
#! 2-sided ideal generated by 2 morphisms ) )
T := RandomObject( add_qB, [[10],[1]] );;
u := RandomMorphism( T, T, 5 );;
v := RandomMorphism( T, T, 5 );;
w := RandomMorphism( T, T, 5 );;
HomStructure( PreCompose( [ u, v, w ] ) )
      = PreCompose( HomStructure( v ), HomStructure( u, w ) );
#! true
HomStructure( T, T, 2 * HomStructure( u ) ) = 2 * u;
#! true
#! @EndExample
#!
#! @Example
LoadPackage( "FunctorCategories", false );
#! true
q := FinQuiver( "q(0,1,2)[x:0->1,y:1->2,z:0->2]" );
#! FinQuiver( "q(0,1,2)[x:0-≻1,y:1-≻2,z:0-≻2]" )
C := PathCategory( q );
#! PathCategory( FinQuiver( "q(0,1,2)[x:0-≻1,y:1-≻2,z:0-≻2]" ) )
k := HomalgFieldOfRationals( );
#! Q
kC := k[C];
#! Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2)[x:0-≻1,
#! y:1-≻2,z:0-≻2]" ) ) )
A := kC / [ kC.xy - kC.z ];
#! Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2)[x:0-≻1,
#! y:1-≻2,z:0-≻2]" ) ) ) / [ 1*x⋅y - 1*z ]
B := AlgebroidFromDataTables( A );
#! Q-algebroid( {0,1,2}[x:0-≻1,y:1-≻2,z:0-≻2] ) defined by 3 objects
#! and 3 generating morphisms
IsAdmissibleAlgebroid( B );
#! false
q := FinQuiver( "q(o)[x:o->o,y:o->o]" );
#! FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" )
C := PathCategory( q );
#! PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) )
kC := k[C];
#! Q-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) )
A := kC / [ kC.xy - kC.yx, kC.x^3, kC.y^3 ];
#! Q-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) )
#! / [ -1*y⋅x + 1*x⋅y, 1*x^3, 1*y^3 ]
B := AlgebroidFromDataTables( A );
#! Q-algebroid( {o}[x:o-≻o,y:o-≻o] ) defined by 1 object and 2 generating morphisms
IsAdmissibleAlgebroid( B );
#! true
A := kC / [ kC.xy - kC.yx, kC.x^3 - kC.x, kC.y^3 ];
#! Q-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) )
#! / [ -1*y⋅x + 1*x⋅y, 1*x^3 - 1*x, 1*y^3 ]
B := AlgebroidFromDataTables( A );
#! Q-algebroid( {o}[x:o-≻o,y:o-≻o] ) defined by 1 object and 2 generating morphisms
IsAdmissibleAlgebroid( B );
#! false
#! @EndExample
#! @EndChunk

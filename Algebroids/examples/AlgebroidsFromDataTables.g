#! @BeginChunk Functors_Between_QPA_Algebroid_and_AlgebroidFromDataTables
#! @Example
LoadPackage( "Algebroids", false );
#! true
q := RightQuiver( "q(0,1,2,3)[a:0->1,b:1->3,c:0->2,d:2->3,e:3->3]" );
#! q(0,1,2,3)[a:0->1,b:1->3,c:0->2,d:2->3,e:3->3]
F := FreeCategory( q );
#! FreeCategory( RightQuiver( "q(0,1,2,3)[a:0->1,b:1->3,c:0->2,d:2->3,e:3->3]" ) )
k := HomalgFieldOfRationals( );
#! Q
kF := k[F];
#! Algebroid( Q, FreeCategory( RightQuiver( "q(0,1,2,3)[a:0->1,b:1->3,c:0->2,d:2->3,
#! e:3->3]" ) ) )
B := kF / [ kF.e^3 ];
#! Algebroid( Q, FreeCategory( RightQuiver( "q(0,1,2,3)[a:0->1,b:1->3,c:0->2,d:2->3,
#! e:3->3]" ) ) ) / relations
A := AlgebroidFromDataTables( B );
#! Q-algebroid( {0,1,2,3}[a:0→1,b:1→3,c:0→2,d:2→3,e:3→3] ) defined by
#! 4 objects and 5 generating morphisms
U := IsomorphismOntoAlgebroidFromDataTables( B, A );
#! Isomorphism functor onto algebroid from data tables
V := IsomorphismFromAlgebroidFromDataTables( A, B );
#! Isomorphism functor from algebroid from data tables
alpha := RandomMorphism( A, 10 );;
ApplyFunctor( PreCompose( V, U ), alpha ) = alpha;
#! true
#! #@if ValueOption( "no_precompiled_code" ) <> true
V := ExtendFunctorToAdditiveClosures( V );
#! Extension of Isomorphism functor from algebroid from data tables to
#! additive closures
add_A := SourceOfFunctor( V );
#! AdditiveClosure( Q-algebroid( {0,1,2,3}[a:0→1,b:1→3,c:0→2,d:2→3,e:3→3] )
#! defined by 4 objects and 5 generating morphisms )
IsBound( add_A!.precompiled_functions_added );
#! true
add_B := RangeOfFunctor( V );
#! AdditiveClosure( Algebroid( Q, FreeCategory( RightQuiver( "q(0,1,2,3)[a:0->1,
#! b:1->3,c:0->2,d:2->3,e:3->3]" ) ) ) / relations )
IsBound( add_B!.precompiled_functions_added );
#! true
o1 :=  RandomObject( add_A, [ [ 5 ], [ 1 ] ] );;
o2 :=  RandomObject( add_A, [ [ 5 ], [ 1 ] ] );;
V_o1 := V( o1 );;
V_o2 := V( o2 );;
s1 := Sum( BasisOfExternalHom( o1, o2 ) );;
s2 := Sum( BasisOfExternalHom( V_o1, V_o2 ) );;
V( s1 ) = s2;
#! true
f := RandomMorphism( o1, o2, 20 );;
g := RandomMorphism( o1, o2, 20 );;
V_f := V( f );;
V_g := V( g );;
m1 := UnderlyingMatrix( HomStructure( f, g ) );;
m2 := UnderlyingMatrix( HomStructure( V_f, V_g ) );;
m1 = m2;
#! true
#! #@fi
#! @EndExample
#! @EndChunk

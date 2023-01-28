#! @BeginChunk DPO_Quivers

LoadPackage( "FunctorCategories" );

#! We compute the double-pushout rewriting of a quiver $G$,
#! given rewriting span $l, r$ and the matching $m: L \rightarrow G$:

#! @Example
L := CreateQuiver( 3, [ 1,0,  2,0,  2,2 ] );
#! <An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
R := CreateQuiver( 4, [ 0,1,  2,0,  0,3 ] );
#! <An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
l := Subobject( L, [ 0, 1 ], [ ] );
#! <A monomorphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
r := Subobject( R, [ 0, 1 ], [ ] );
#! <A monomorphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
G := CreateQuiver( 4, [ 1,0,  3,0,  3,3,  2,0,  2,1 ] );
#! <An object in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
m := Subobject( G, [ 3, 1, 2 ] );
#! <A monomorphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Source( m ) = L;
#! true
p := DPO( m, l, r );;
p[2];
#! <A monomorphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )>
Display( p[2] );
#! Image of <(V)>:
#! { 0,..., 3 } ⱶ[ 0, 2, 3, 4 ]→ { 0,..., 4 }
#! 
#! Image of <(A)>:
#! { 0, 1, 2 } ⱶ[ 2, 3, 4 ]→ { 0,..., 4 }
#! 
#! A morphism in CategoryOfQuiversEnrichedOver( SkeletalFinSets )
#! given by the above data
#! @EndExample
#! @EndChunk

#! @BeginChunk CategoryFromNerveData

#! @Example
LoadPackage( "Algebroids" );
#! true
Delta1 := SimplicialCategoryTruncatedInDegree( 1 );
#! FreeCategory( RightQuiver( "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) )
#! / [ s*id = C0, t*id = C0 ]
N1 := NerveTruncatedInDegree2Data( Delta1 );;
N1[1];
#! [ |2|, |7|, |26| ]
C := CategoryFromNerveData( Name( Delta1 ), N1 );
#! FreeCategory( RightQuiver( "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) )
#! / [ s*id = C0, t*id = C0 ]
C0 := CreateObject( C, 0 );
#! (0)
IsWellDefined( C0 );
#! true
C1 := 1 / C;
#! (1)
IsWellDefined( C1 );
#! true
IsWellDefined( 2 / C );
#! false
idC0 := CreateMorphism( C0, 0, C0 );
#! (0)-[0]->(0)
CreateMorphism( C, 0 ) = idC0;
#! true
IsOne( idC0 );
#! true
id := CreateMorphism( C, 1 );
#! (1)-[1]->(0)
s := CreateMorphism( C, 2 );
#! (0)-[2]->(1)
t := CreateMorphism( C, 3 );
#! (0)-[3]->(1)
idC1 := CreateMorphism( C, 4 );
#! (1)-[4]->(1)
IsOne( idC1 );
#! true
sigma := CreateMorphism( C, 5 );
#! (1)-[5]->(1)
IsEndomorphism( sigma );
#! true
IsOne( sigma );
#! false
tau := CreateMorphism( C, 6 );
#! (1)-[6]->(1)
IsEndomorphism( tau );
#! true
IsOne( tau );
#! false
IsWellDefined( CreateMorphism( C1, 7, C1 ) );
#! false
IsOne( PreCompose( s, id ) );
#! true
IsOne( PreCompose( t, id ) );
#! true
#! @EndExample
#! @EndChunk

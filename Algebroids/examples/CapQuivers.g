#! @BeginChunk CapQuivers

#    x
#     ⭮
#      0
#     s ⭝   a
#        1 ----🡢 2
#        | ⭝     |
#       c|   ⭝ e |b
#        🡣     ⭝ 🡣
#        3 ----🡢 4
#            d    ⭝ t
#                  5
#                   ⭯
#                    y


#! @Example
LoadPackage( "Algebroids", false );
#! true
str := "q(0,1,2,3,4,5)[x:0->0,s:0->1,a:1->2,c:1->3,e:1->4,b:2->4,d:3->4,t:4->5,y:5->5]";;
q := CreateCapQuiver( str );
#! Quiver( "q(0,1,2,3,4,5)[x:0-≻0,s:0-≻1,a:1-≻2,c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,
#! t:4-≻5,y:5-≻5]" )
QuiverName( q );
#! "q"
NumberOfObjects( q );
#! 6
LabelsOfObjects( q );
#! [ "0", "1", "2", "3", "4", "5" ]
SetOfObjects( q );
#! [ (0), (1), (2), (3), (4), (5) ]
o := q.0;
#! (0)
ObjectIndex( o );
#! 1
IsIdenticalObj( o, ObjectConstructor( q, 1 ) );
#! true
ObjectLabel( o );
#! "0"
LaTeXOutput( o );
#! "0"
NumberOfMorphisms( q );
#! 9
LabelsOfMorphisms( q );
#! [ "x", "s", "a", "c", "e", "b", "d", "t", "y" ]
IndicesOfSources( q );
#! [ 1, 1, 2, 2, 2, 3, 4, 5, 6 ]
IndicesOfTargets( q );
#! [ 1, 2, 3, 4, 5, 5, 5, 6, 6 ]
SetOfMorphisms( q );
#! [ x:(0) -≻ (0), s:(0) -≻ (1), a:(1) -≻ (2), c:(1) -≻ (3), e:(1) -≻ (4),
#!   b:(2) -≻ (4), d:(3) -≻ (4), t:(4) -≻ (5), y:(5) -≻ (5) ]
m := q.y;
#! y:(5) -≻ (5)
MorphismIndex( m );
#! 9
IsIdenticalObj( m, MorphismConstructor( q, q.("5"), 9, q.("5") ) );
#! true
MorphismLabel( m );
#! "y"
LaTeXOutput( m );
#! "{5}-\\left({y}\\right)\\rightarrow{5}"
MorphismsOfExternalHom( q.("0"), q.("0") );
#! [ x:(0) -≻ (0) ]
MorphismsOfExternalHom( q.("0"), q.("1") );
#! [ s:(0) -≻ (1) ]
q_op := OppositeQuiver( q );
#! Quiver( "q_op(0,1,2,3,4,5)[x:0-≻0,s:1-≻0,a:2-≻1,c:3-≻1,e:4-≻1,b:4-≻2,
#! d:4-≻3,t:5-≻4,y:5-≻5]" )
#! @EndExample

#! @Example
q1 := RandomCapQuiver( 2, 4, false );; # without loops
q2 := RandomCapQuiver( 2, 4, true );;  # with loops
Assert( 0, NumberOfObjects( q1 ) = 2 );
Assert( 0, NumberOfMorphisms( q1 ) = 4 );
Assert( 0, Length( Filtered( SetOfMorphisms( q1 ), IsEndomorphism ) ) = 0 );
Assert( 0, Length( Filtered( SetOfMorphisms( q2 ), IsEndomorphism ) ) > 0 );
#! @EndExample


#! @BeginChunk FinQuiver

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
LoadPackage( "FpCategories", false );
#! true
str := "q(0..5)[x:0->0,s:0->1,a:1->2,c:1->3,e:1->4,b:2->4,d:3->4,t:4->5,y:5->5]";;
q := FinQuiver( str );
#! FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,c:1→3,e:1→4,b:2→4,d:3→4,
#! t:4→5,y:5→5]" )
QuiverName( q );
#! "q"
NumberOfObjects( q );
#! 6
Display( LabelsOfObjects( q ) );
#! [ "0", "1", "2", "3", "4", "5" ]
Display( SetOfObjects( q ) );
#! [ (0), (1), (2), (3), (4), (5) ]
o := q.("0");
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
Display( LabelsOfMorphisms( q ) );
#! [ "x", "s", "a", "c", "e", "b", "d", "t", "y" ]
Display( IndicesOfSources( q ) );
#! [ 1, 1, 2, 2, 2, 3, 4, 5, 6 ]
Display( IndicesOfTargets( q ) );
#! [ 1, 2, 3, 4, 5, 5, 5, 6, 6 ]
Display( SetOfMorphisms( q ) );
#! [ x:(0) → (0), s:(0) → (1), a:(1) → (2), c:(1) → (3), e:(1) → (4),
#!   b:(2) → (4), d:(3) → (4), t:(4) → (5), y:(5) → (5) ]
m := q.y;
#! y:(5) → (5)
MorphismIndex( m );
#! 9
IsIdenticalObj( m, MorphismConstructor( q, q.("5"), 9, q.("5") ) );
#! true
MorphismLabel( m );
#! "y"
Display( MorphismsOfExternalHom( q.("0"), q.("0") ) );
#! [ x:(0) → (0) ]
Display( MorphismsOfExternalHom( q.("0"), q.("1") ) );
#! [ s:(0) → (1) ]
q_op := OppositeQuiver( q );
#! FinQuiver( "q_op(0,1,2,3,4,5)[x:0→0,s:1→0,a:2→1,c:3→1,e:4→1,b:4→2,
#! d:4→3,t:5→4,y:5→5]" )
Display( MorphismsOfExternalHom( q_op.("1"), q_op.("0") ) );
#! [ s:(1) → (0) ]
q_op_x_q := TensorProductOfFinQuivers( q_op, q );;
NumberOfObjects( q_op_x_q );
#! 36
NumberOfMorphisms( q_op_x_q );
#! 108
#! @EndExample

#! @Example
q1 := RandomFinQuiver( 2, 4, false );;
q2 := RandomFinQuiver( 2, 4, true );;
Assert( 0, NumberOfObjects( q1 ) = 2 );
Assert( 0, NumberOfMorphisms( q1 ) = 4 );
Assert( 0, Length( Filtered( SetOfMorphisms( q1 ), IsEndomorphism ) ) = 0 );
Assert( 0, Length( Filtered( SetOfMorphisms( q2 ), IsEndomorphism ) ) > 0 );
q3 := FinQuiver( "q(3)[a:1->2,b:2->3]" );
#! FinQuiver( "q(1,2,3)[a:1→2,b:2→3]" )
q4 := FinQuiver( "q(4..6)[a:4->5,b:5->6]" );
#! FinQuiver( "q(4,5,6)[a:4→5,b:5→6]" )
#! @EndExample

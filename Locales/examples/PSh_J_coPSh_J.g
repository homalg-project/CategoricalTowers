#! @Chunk DifferenceCSL

# the assumption si <= mi leads to fewer meets and joins:

#! @Example
LoadPackage( "FunctorCategories", false );
#! true
q := "q(m0,s0,m1,s1,m0_x_s1,s0_u_m1)\
[sm0:s0->m0,sm1:s1->m1,\
p011:m0_x_s1->s1,\
i101:m1->s0_u_m1,\
mc0:m0_x_s1->s0,jc0:m0->s0_u_m1]";;
q := FinQuiver( q );
#! FinQuiver( "q(m0,s0,m1,s1,m0_x_s1,s0_u_m1)
#! [sm0:s0-≻m0,sm1:s1-≻m1,p011:m0_x_s1-≻s1,
#!  i101:m1-≻s0_u_m1,mc0:m0_x_s1-≻s0,jc0:m0-≻s0_u_m1]" )
F := PathCategory( q );
#! PathCategory( FinQuiver( "q(m0,s0,m1,s1,m0_x_s1,s0_u_m1)
#! [sm0:s0-≻m0,sm1:s1-≻m1,p011:m0_x_s1-≻s1,
#!  i101:m1-≻s0_u_m1,mc0:m0_x_s1-≻s0,jc0:m0-≻s0_u_m1]" ) )
Size( F );
#! 18
HomStructure( F.s0, F.s0_u_m1 );
#! |1|
HomStructure( F.m0_x_s1, F.m0 );
#! |1|
C := F /
     [ [ F.p011 * F.sm1 * F.i101, F.mc0 * F.sm0 * F.jc0 ] ];
#! PathCategory( FinQuiver( "q(m0,s0,m1,s1,m2,s2,m0_x_s1,s0_u_m1,m1_x_s2,s1_u_m2)
#! [sm0:s0-≻m0,sm1:s1-≻m1,sm2:s2-≻m2,
#!  p011:m0_x_s1-≻s1,
#!  i101:m1-≻s0_u_m1,
#!  p122:m1_x_s2-≻s2,
#!  i212:m2-≻s1_u_m2,
#!  mc0:m0_x_s1-≻s0,jc0:m0-≻s0_u_m1,
#!  mc1:m1_x_s2-≻s1,jc1:m1-≻s1_u_m2]" ) )
#!  / [ p011⋅sm1⋅i101 = mc0⋅sm0⋅jc0, p122⋅sm2⋅i212 = mc1⋅sm1⋅jc1 ]
Size( C );
#! 17
P := PosetOfCategory( F );;
Size( P );
#! 17
digraphF := DigraphOfPoset( P );;
digraphF!.vertexlabels := List( SetOfObjects( F ), String );
#Splash( DotVertexLabelledDigraph( digraphF ) );
#Splash( DotVertexLabelledDigraph( DigraphOfPoset( P ) ) );
coPSh := CoPreSheaves( P );;
Length( SetOfObjects( coPSh ) );
#! 11
products := [ [ P.m0_x_s1, [ P.m0, P.s1 ] ] ];;
coPSh_J := ClosedCoPreSheavesWRTProducts( P, products );;
coY := CoYonedaEmbeddingOfSourceCategory( coPSh_J );
#! co-Yoneda embedding functor
objs_coPSh_J := SetOfObjects( coPSh_J );
Assert( 0, Length( objs_coPSh_J ) = 9 );
#Splash( DotVertexLabelledDigraph( coPSh_J, [ coY ], [ "darkgreen", "blue" ] ) );
#coproducts := [ [ coPSh_J.s0_u_m1, [ coPSh_J.s0, coPSh_J.m1 ] ] ];;
coproducts := [ [ coPSh_J.s0_u_m1, [ coPSh_J.s0, coPSh_J.m1 ] ],
                [ objs_coPSh_J[1 + 1], [ objs_coPSh_J[1 + 2], objs_coPSh_J[1 + 7] ] ] ];;
PSh_J := ClosedPreSheavesWRTCoproducts( coPSh_J, coproducts );;
Y := YonedaEmbeddingOfSourceCategory( PSh_J );
#! Yoneda embedding functor
Assert( 0, IsHomSetInhabited( PSh_J.m0, PSh_J.s0_u_m1 ) );
Assert( 0, IsHomSetInhabited( PSh_J.m0_x_s1, PSh_J.s0 ) );
Assert( 0, DirectProduct( PSh_J.m0, PSh_J.s1 ) = PSh_J.m0_x_s1 );
Assert( 0, Coproduct( PSh_J.s0, PSh_J.m1 ) = PSh_J.s0_u_m1 );
objs := SetOfObjects( PSh_J );
Assert( 0, Length( objs ) = 14 );
#Splash( DotVertexLabelledDigraph( PSh_J, [ PreCompose( coY, Y ), Y ], [ "red", "blue", "darkgreen" ] : offset := 0 ) );
#PSh := PreSheaves( coPSh_J );
#objs := SetOfObjects( PSh ); ## took 122h 15m to compute
#Length( objs ); ## 728
#! @EndExample

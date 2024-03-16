#! @Chunk DifferenceCSL

# the assumption si <= mi leads to fewer meets and joins:

#! @Example
LoadPackage( "FunctorCategories", false );
#! true
q := "q(m0,s0,m1,s1,m2,s2,m0_x_s1,s0_u_m1,m1_x_s2,s1_u_m2)\
[sm0:s0->m0,sm1:s1->m1,sm2:s2->m2,\
p011:m0_x_s1->s1,\
i101:m1->s0_u_m1,\
p122:m1_x_s2->s2,\
i212:m2->s1_u_m2,\
mc0:m0_x_s1->s0,jc0:m0->s0_u_m1,\
mc1:m1_x_s2->s1,jc1:m1->s1_u_m2]";;
q := FinQuiver( q );
#! FinQuiver( "q(m0,s0,m1,s1,m2,s2,m0_x_s1,s0_u_m1,m1_x_s2,s1_u_m2)
#! [sm0:s0-≻m0,sm1:s1-≻m1,sm2:s2-≻m2,
#!  p011:m0_x_s1-≻s1,
#!  i101:m1-≻s0_u_m1,
#!  p122:m1_x_s2-≻s2,
#!  i212:m2-≻s1_u_m2,
#!  mc0:m0_x_s1-≻s0,jc0:m0-≻s0_u_m1,
#!  mc1:m1_x_s2-≻s1,jc1:m1-≻s1_u_m2]" )
F := PathCategory( q );
#! PathCategory( FinQuiver( "q(m0,s0,m1,s1,m2,s2,m0_x_s1,s0_u_m1,m1_x_s2,s1_u_m2)
#! [sm0:s0-≻m0,sm1:s1-≻m1,sm2:s2-≻m2,
#!  p011:m0_x_s1-≻s1,
#!  i101:m1-≻s0_u_m1,
#!  p122:m1_x_s2-≻s2,
#!  i212:m2-≻s1_u_m2,
#!  mc0:m0_x_s1-≻s0,jc0:m0-≻s0_u_m1,
#!  mc1:m1_x_s2-≻s1,jc1:m1-≻s1_u_m2]" ) )
Size( F );
#! 35
HomStructure( F.s0, F.s0_u_m1 );
#! |1|
HomStructure( F.s1, F.s1_u_m2 );
#! |1|
HomStructure( F.m0_x_s1, F.m0 );
#! |1|
HomStructure( F.m1_x_s2, F.m1 );
#! |1|
C := F /
     [ [ F.p011 * F.sm1 * F.i101, F.mc0 * F.sm0 * F.jc0 ],
       [ F.p122 * F.sm2 * F.i212, F.mc1 * F.sm1 * F.jc1 ] ];
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
#! 33
P := PosetOfCategory( F );;
Size( P );
#! 33
digraphF := DigraphOfPoset( P );;
digraphF!.vertexlabels := List( SetOfObjects( F ), String );
#Splash( DotVertexLabelledDigraph( digraphF ) );
PSh := PreSheaves( P );;
Y := YonedaEmbeddingOfSourceCategory( PSh );
#! Yoneda embedding functor

coprd_cocones := [ [ P.s1_u_m2, [ P.s1, P.m2 ] ],
                   [ P.s0_u_m1, [ P.s0, P.m1 ] ] ];; ## the order is important

is_closed := G -> IsClosedPreSheafWRTCoproducts( PSh, G, coprd_cocones );;
PShJ := FullSubcategoryByObjectMembershipFunction( PSh, is_closed );;
Length( SetOfObjects( PSh ) );
#! 41
Length( SetOfObjects( PShJ ) );
#! 28
#Splash( DotVertexLabelledDigraph( PSh, [ Y, PShJ ], [ "grey", "blue", "red" ] ) );
closed := List( SetOfObjects( PSh ), G -> Target( EmbeddingIntoClosureOfPreSheafWRTCoproducts( G, coprd_cocones ) ) );
Assert( 0, ForAll( closed, is_closed ) );
Assert( 0, Length( SetOfObjects( PShJ ) ) = Length( DuplicateFreeList( closed ) ) );

#coPSh := CoPreSheaves( PShJ );
#objs := SetOfObjects( coPSh ); ## took 122h 15m to compute
#Length( objs ); ## 728
#! @EndExample

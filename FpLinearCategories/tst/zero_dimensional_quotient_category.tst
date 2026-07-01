

gap> START_TEST("zero_dimensional_quotient_category.tst");

gap> LoadPackage( "FpLinearCategories", false );
true
gap> str := "q(0..5)[x:0->0,s:0->1,a:1->2,c:1->3,e:1->4,b:2->4,d:3->4,t:4->5,y:5->5]";;
gap> q := FinQuiver( str );
FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,c:1→3,e:1→4,b:2→4,d:3→4,
t:4→5,y:5→5]" )
gap> k := HomalgFieldOfRationals( );;
gap> C := PathCategory( q : admissible_order := "Dp" );
PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,c:1→3,e:1→4,
b:2→4,d:3→4,t:4→5,y:5→5]" ) )
gap> kC := LinearClosure( k, C );
Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,
c:1→3,e:1→4,b:2→4,d:3→4,t:4→5,y:5→5]" ) ) )
gap> Dimension( kC / [ kC.id_0, kC.id_1, kC.id_2, kC.id_3, kC.id_4, kC.id_5 ] );
0
gap> # @drop_example_in_Julia

#
gap> STOP_TEST("zero_dimensional_quotient_category", 1);

#! @BeginChunk QuotientCategoriesOfLinearClosuresOfPathCategories

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
LoadPackage( "FpLinearCategories", false );
#! true
str := "q(0..5)[x:0->0,s:0->1,a:1->2,c:1->3,e:1->4,b:2->4,d:3->4,t:4->5,y:5->5]";;
q := FinQuiver( str );
#! FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,c:1→3,e:1→4,b:2→4,d:3→4,
#! t:4→5,y:5→5]" )
k := HomalgFieldOfRationals( );;
C := PathCategory( q : admissible_order := "Dp" );
#! PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,c:1→3,e:1→4,
#! b:2→4,d:3→4,t:4→5,y:5→5]" ) )
kC := LinearClosure( k, C );
#! Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,
#! c:1→3,e:1→4,b:2→4,d:3→4,t:4→5,y:5→5]" ) ) )
rels := [ kC.x^10 - kC.x^5, kC.abt - kC.et, kC.y^10 - kC.y^5, kC.x^5, kC.y^5 ];;
Perform( rels, Display );
#! 1*x^10 + (-1)*x^5:(0) → (0)
#! 1*a⋅b⋅t + (-1)*e⋅t:(1) → (5)
#! 1*y^10 + (-1)*y^5:(5) → (5)
#! 1*x^5:(0) → (0)
#! 1*y^5:(5) → (5)
quo_kC := QuotientCategory( kC, rels );
#! Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,
#! c:1→3,e:1→4,b:2→4,d:3→4,t:4→5,y:5→5]" ) ) ) / [ 1*x^10 + (-1)*x^5,
#! 1*a⋅b⋅t + (-1)*e⋅t, 1*y^10 + (-1)*y^5, ... ]
HomStructure( quo_kC.("0"), quo_kC.("5") );
#! <A row module over Q of rank 50>
A := AlgebroidFromDataTables( quo_kC );
#! Q-algebroid( {0,1,2,3,4,5}[x:0→0,s:0→1,a:1→2,c:1→3,e:1→4,b:2→4,d:3→4,
#! t:4→5,y:5→5] ) defined by 6 objects and 9 generating morphisms
HomStructure( A.("0"), A.("5") );
#! <A row module over Q of rank 50>
quo_C := C / [ [ C.x^10, C.x^5 ], [ C.abt, C.et ], [ C.y^10, C.y^5 ] ];
#! PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,c:1→3,e:1→4,
#! b:2→4,d:3→4,t:4→5,y:5→5]" ) ) / [ x^10 = x^5, a⋅b⋅t = e⋅t, y^10 = y^5 ]
k_quo_C := k[quo_C];
#! Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,
#! c:1→3,e:1→4,b:2→4,d:3→4,t:4→5,y:5→5]" ) ) / [ x^10 = x^5, a⋅b⋅t = e⋅t,
#! y^10 = y^5 ] )
quo_k_quo_C := k_quo_C / [ k_quo_C.x^5, k_quo_C.y^5 ];
#! Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,
#! c:1→3, e:1→4,b:2→4,d:3→4,t:4→5,y:5→5]" ) ) / [ x^10 = x^5, a⋅b⋅t = e⋅t,
#! y^10 = y^5 ] ) / [ 1*[x^5], 1*[y^5] ]
HomStructure( quo_k_quo_C.("0"), quo_k_quo_C.("5") );
#! <A row module over Q of rank 50>
Dimension( quo_k_quo_C );
#! 126
ModelingCategory( quo_k_quo_C );
#! Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0→0,s:0→1,a:1→2,
#! c:1→3, e:1→4,b:2→4,d:3→4,t:4→5,y:5→5]" ) ) ) / [ 1*x^10 + (-1)*x^5,
#! 1*a⋅b⋅t + (-1)*e⋅t, 1*y^10 + (-1)*y^5, ... ]
B := AlgebroidFromDataTables( quo_k_quo_C );
#! Q-algebroid( {0,1,2,3,4,5}[x:0→0,s:0→1,a:1→2,c:1→3,e:1→4,b:2→4,d:3→4,
#! t:4→5,y:5→5] ) defined by 6 objects and 9 generating morphisms
HomStructure( B.("0"), B.("5") );
#! <A row module over Q of rank 50>
#! @EndExample

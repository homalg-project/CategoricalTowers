#! @BeginChunk PathCategories

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
str :=
  "q(0..5)[x:0->0,s:0->1,a:1->2,c:1->3,e:1->4,b:2->4,d:3->4,t:4->5,y:5->5]";;
q := FinQuiver( str );
#! FinQuiver( "q(0,1,2,3,4,5)[x:0-≻0,s:0-≻1,a:1-≻2,c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,
#! t:4-≻5,y:5-≻5]" )
C := PathCategory( q : admissible_order := "Dp" );
#! PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0-≻0,s:0-≻1,a:1-≻2,c:1-≻3,e:1-≻4,
#! b:2-≻4,d:3-≻4,t:4-≻5,y:5-≻5]" ) )
Display( C );
#! A CAP category with name PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0-≻0,s:0-≻1,
#! a:1-≻2,c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,t:4-≻5,y:5-≻5]" ) ):
#!
#! 17 primitive operations were used to derive 32 operations for this category
#! which algorithmically
#! * IsFinitelyPresentedCategory
SetOfObjects( C );
#! [ (0), (1), (2), (3), (4), (5) ]
SetOfGeneratingMorphisms( C );
#! [ x:(0) -≻ (0), s:(0) -≻ (1), a:(1) -≻ (2), c:(1) -≻ (3), e:(1) -≻ (4),
#!   b:(2) -≻ (4), d:(3) -≻ (4), t:(4) -≻ (5), y:(5) -≻ (5) ]
C.5;
#! (5)
ObjectIndex( C.5 );
#! 6
C.id_5;
#! id(5):(5) -≻ (5)
C.("id(5)");
#! id(5):(5) -≻ (5)
m := C.("x^2*s*a*b*t*y^2");
#! x^2⋅s⋅a⋅b⋅t⋅y^2:(0) -≻ (5)
m := C.("x^2sabty^2");
#! x^2⋅s⋅a⋅b⋅t⋅y^2:(0) -≻ (5)
IsWellDefined( m );
#! true
MorphismLength( m );
#! 8
MorphismIndices( m );
#! [ 1, 1, 2, 3, 6, 8, 9, 9 ]
MorphismSupport( m );
#! [ x:(0) -≻ (0), x:(0) -≻ (0), s:(0) -≻ (1), a:(1) -≻ (2), b:(2) -≻ (4),
#! t:(4) -≻ (5), y:(5) -≻ (5), y:(5) -≻ (5) ]
relations := [ [ C.x^5, C.x ], [ C.y^5, C.y^2 ] ];;
m = MorphismConstructor( C,
        Source( m ), MorphismLength( m ), MorphismSupport( m ), Target( m ) );
#! true
qC := QuotientCategory( C, relations );
#! PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0-≻0,s:0-≻1,a:1-≻2,c:1-≻3,e:1-≻4,
#! b:2-≻4,d:3-≻4,t:4-≻5,y:5-≻5]" ) ) / [ x^5 = x, y^5 = y^2 ]
Display( qC );
#! A CAP category with name PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0-≻0,s:0-≻1,
#! a:1-≻2,c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,t:4-≻5,y:5-≻5]" ) ) / [ x^5 = x, y^5 = y^2 ]:
#!
#! 27 primitive operations were used to derive 65 operations for this category
#! which algorithmically
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsFiniteCategory
#! * IsEquippedWithHomomorphismStructure
qC.0;
#! (0)
ObjectIndex( qC.0 );
#! 1
qC.x^7;
#! [x^3]:(0) -≻ (0)
CanonicalRepresentative( qC.x^7 );
#! x^3:(0) -≻ (0)
HomomorphismStructureOnObjects( qC.0, qC.5 );
#! |75|
List( SetOfGeneratingMorphisms( qC ), IsMonomorphism );
#! [ false, true, true, true, true, true, true, true, false ]
List( SetOfGeneratingMorphisms( qC ), IsEpimorphism );
#! [ false, true, true, true, true, true, true, true, false ]
LoadPackage( "Algebroids", false );
#! true
k := HomalgFieldOfRationals();
#! Q
kC := k[C]; # or LinearClosure( k, C );
#! Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0-≻0,s:0-≻1,a:1-≻2,
#! c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,t:4-≻5,y:5-≻5]" ) ) )
kC.x + kC.x^2;
#! 1*x^2 + 1*x:(0) -≻ (0)
kqC := k[qC];
#! Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0-≻0,s:0-≻1,a:1-≻2,
#! c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,t:4-≻5,y:5-≻5]" ) ) / [ x^5 = x, y^5 = y^2 ] )
HomomorphismStructureOnObjects( kqC.0, kqC.5 );
#! <A row module over Q of rank 75>
kqC.x + kqC.x^2;
#! 1*[x^2] + 1*[x]:(0) -≻ (0)
List( SetOfGeneratingMorphisms( kqC ), IsMonomorphism );
#! [ false, true, true, true, true, true, true, true, false ]
List( SetOfGeneratingMorphisms( kqC ), IsEpimorphism );
#! [ false, true, true, true, true, true, true, true, false ]
homs := BasisOfExternalHom( kqC.0, kqC.5 );;
mor := 2 * homs[1] - 3 * homs[4] + homs[75];
#! 2*[x^4⋅s⋅a⋅b⋅t⋅y^4] - 3*[x^4⋅s⋅c⋅d⋅t⋅y^3] + 1*[s⋅e⋅t]:(0) -≻ (5)
EvalString( CellAsEvaluatableString( mor, [ "kqC", "qC", "C" ] ) ) = mor;
#! true
A := AlgebroidFromDataTables( kqC );
#! Q-algebroid( {0,1,2,3,4,5}[x:0-≻0,s:0-≻1,a:1-≻2,c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,
#! t:4-≻5,y:5-≻5] ) defined by 6 objects and 9 generating morphisms
HomomorphismStructureOnObjects( A.0, A.5 );
#! <A row module over Q of rank 75>
A.x + A.x^2;
#! <1*x^2 + 1*x:(0) -≻ (0)>
#! @EndExample

#! @Example
LoadPackage( "Algebroids", false );
#! true
str := "q(0,1,2,3,4,5)[s:0->1,a:1->2,c:1->3,e:1->4,b:2->4,d:3->4,t:4->5]";;
quiver := FinQuiver( str );
#! FinQuiver( "q(0,1,2,3,4,5)[s:0-≻1,a:1-≻2,c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,t:4-≻5]" )
P := PathCategory( quiver : admissible_order := "Dp" );
#! PathCategory( FinQuiver( "q(0,1,2,3,4,5)[s:0-≻1,a:1-≻2,c:1-≻3,e:1-≻4,b:2-≻4,
#! d:3-≻4,t:4-≻5]" ) )
Display( P );
#! A CAP category with name PathCategory( FinQuiver( "q(0,1,2,3,4,5)[s:0-≻1,a:1-≻2,
#! c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,t:4-≻5]" ) ):
#!
#! 18 primitive operations were used to derive 65 operations for this category
#! which algorithmically
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsFiniteCategory
#! * IsEquippedWithHomomorphismStructure
HomStructure( P.0, P.5 );
#! |3|
k := HomalgFieldOfRationals( );
#! Q
kP := k[P];
#! Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3,4,5)[s:0-≻1,a:1-≻2,c:1-≻3,
#! e:1-≻4,b:2-≻4,d:3-≻4,t:4-≻5]" ) ) )
HomStructure( kP.0, kP.5 );
#! <A row module over Q of rank 3>
T := AlgebroidFromDataTables( kP );
#! Q-algebroid( {0,1,2,3,4,5}[s:0-≻1,a:1-≻2,c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,t:4-≻5] )
#! defined by 6 objects and 7 generating morphisms
HomStructure( T.0, T.5 );
#! <A row module over Q of rank 3>
#! @EndExample

#! @Example
LoadPackage( "Algebroids", false );
#! true
str := "q(o)[x:o->o,y:o->o,z:o->o]";;
C := PathCategory( FinQuiver( str ) );
#! PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o,z:o-≻o]" ) )
F := FreeCategory( RightQuiver( str ) );
#! FreeCategory( RightQuiver( "q(o)[x:o->o,y:o->o,z:o->o]" ) )
qC := C / [ [C.x^3, C.x], [C.y^3, C.y], [C.z^3, C.z],
            [C.xy, C.yx], [C.xz, C.zx], [C.yz, C.zy] ];
#! PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o,z:o-≻o]" ) ) /
#!            [ x^3 = x, y^3 = y, z^3 = z, ... ]
qF := F / [ [F.x^3, F.x], [F.y^3, F.y], [F.z^3, F.z],
            [F.xy, F.yx], [F.xz, F.zx], [F.yz, F.zy] ];
#! FreeCategory( RightQuiver( "q(o)[x:o->o,y:o->o,z:o->o]" ) ) / relations
MorphismsOfExternalHom( qC.o, qC.o );
#! [ [id(o)]:(o) -≻ (o), [x]:(o) -≻ (o), [y]:(o) -≻ (o), [z]:(o) -≻ (o),
#!   [x^2]:(o) -≻ (o), [x⋅y]:(o) -≻ (o), [x⋅z]:(o) -≻ (o), [y^2]:(o) -≻ (o),
#!   [y⋅z]:(o) -≻ (o), [z^2]:(o) -≻ (o), [x^2⋅y]:(o) -≻ (o), [x^2⋅z]:(o) -≻ (o),
#!   [x⋅y^2]:(o) -≻ (o), [x⋅y⋅z]:(o) -≻ (o), [x⋅z^2]:(o) -≻ (o),
#!   [y^2⋅z]:(o) -≻ (o), [y⋅z^2]:(o) -≻ (o), [x^2⋅y^2]:(o) -≻ (o),
#!   [x^2⋅y⋅z]:(o) -≻ (o), [x^2⋅z^2]:(o) -≻ (o), [x⋅y^2⋅z]:(o) -≻ (o),
#!   [x⋅y⋅z^2]:(o) -≻ (o), [y^2⋅z^2]:(o) -≻ (o), [x^2⋅y^2⋅z]:(o) -≻ (o),
#!   [x^2⋅y⋅z^2]:(o) -≻ (o), [x⋅y^2⋅z^2]:(o) -≻ (o), [x^2⋅y^2⋅z^2]:(o) -≻ (o) ]
MorphismsOfExternalHom( qF.o, qF.o );
#! [ (o)-[(o)]->(o), (o)-[(x)]->(o), (o)-[(y)]->(o), (o)-[(z)]->(o),
#!   (o)-[(x*x)]->(o), (o)-[(x*y)]->(o), (o)-[(x*z)]->(o), (o)-[(y*y)]->(o),
#!   (o)-[(y*z)]->(o), (o)-[(z*z)]->(o), (o)-[(x*x*y)]->(o), (o)-[(x*x*z)]->(o),
#!   (o)-[(x*y*y)]->(o), (o)-[(x*y*z)]->(o), (o)-[(x*z*z)]->(o),
#!   (o)-[(y*y*z)]->(o), (o)-[(y*z*z)]->(o), (o)-[(x*x*y*y)]->(o),
#!   (o)-[(x*x*y*z)]->(o), (o)-[(x*x*z*z)]->(o), (o)-[(x*y*y*z)]->(o),
#!   (o)-[(x*y*z*z)]->(o), (o)-[(y*y*z*z)]->(o), (o)-[(x*x*y*y*z)]->(o),
#!   (o)-[(x*x*y*z*z)]->(o), (o)-[(x*y*y*z*z)]->(o), (o)-[(x*x*y*y*z*z)]->(o) ]
#! @EndExample


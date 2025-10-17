#! @BeginChunk GroebnerBasisForLinearClosuresOfPathCategories

#! @Example
LoadPackage( "FpLinearCategories", false );
#! true
k := HomalgFieldOfRationals( );
#! Q
q := FinQuiver( "q(o)[x:o->o,y:o->o]" );
#! FinQuiver( "q(o)[x:o→o,y:o→o]" )
C := PathCategory( q );
#! PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o]" ) )
kC := k[C];
#! Q-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o→o,y:o→o]" ) ) )
x := kC.x;;
y := kC.y;;
rels := [ x*y-y*x, (x^2+y^2)*(x+x*y), (x^2+y^2)*(y^2+x^3) ];
#! [ (-1)*y⋅x + 1*x⋅y:(o) → (o), 1*x^3⋅y + 1*y^2⋅x⋅y + 1*x^3 + 1*y^2⋅x:(o) → (o),
#!   1*x^5 + 1*y^2⋅x^3 + 1*x^2⋅y^2 + 1*y^4:(o) → (o) ]
gb := ReducedGroebnerBasis( kC, rels );
#! [ (-1)*y⋅x + 1*x⋅y:(o) → (o),
#!   1*x^3⋅y + 1*x⋅y^3 + 1*x^3 + 1*x⋅y^2:(o) → (o),
#!   1*x^5 + (-1)*x⋅y^4 + 1*x^2⋅y^2 + 1*y^4 + 1*x^3 + 1*x⋅y^2:(o) → (o),
#!   1*x^2⋅y^3 + 1*y^5 + 1*x^2⋅y^2 + 1*y^4:(o) → (o) ]
f := Sum( gb );
#! 1*x^5 + 1*x^2⋅y^3 + (-1)*x⋅y^4 + 1*y^5 + 1*x^3⋅y + 2*x^2⋅y^2 + 1*x⋅y^3 +
#! 2*y^4 + 2*x^3 + 2*x⋅y^2 + (-1)*y⋅x + 1*x⋅y:(o) → (o)
ReductionOfMorphism( kC, f, rels );
#! 1*x^2⋅y^3 + 1*y^5 + 1*x^2⋅y^2 + 1*y^4:(o) → (o)
ReductionOfMorphism( kC, f, gb );
#! 0:(o) → (o)
#! @EndExample

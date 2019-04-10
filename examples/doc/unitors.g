#! @BeginChunk unitors

LoadPackage( "Bialgebroid" );

#! @Example
q := LeftQuiver( "ql(u,v,w)[a:u->v,b:v->u,c:v->u,d:v->w]" );;
Q := HomalgFieldOfRationals( );;
B := Algebroid( Q, q );;
B0 := B^0;;
lu := LeftUnitorAsFunctor(B);;
ru := RightUnitorAsFunctor(B);;
lui := LeftUnitorInverseAsFunctor(B);;
rui := RightUnitorInverseAsFunctor(B);;

AsCapCategory(Range(lu)) = B;
#! true
AsCapCategory(Range(ru)) = B;
#! true
AsCapCategory(Source(lu)) = TensorProductOnObjects( B0, B );
#! true
AsCapCategory(Source(ru)) = TensorProductOnObjects( B, B0 );
#! true
AsCapCategory(Source(lui)) = B;
#! true
AsCapCategory(Source(rui)) = B;
#! true
AsCapCategory(Range(lui)) = TensorProductOnObjects( B0, B );
#! true
AsCapCategory(Range(rui)) = TensorProductOnObjects( B, B0 );
#! true
l := Concatenation( [
 List( SetOfObjects(B), o -> ApplyFunctor( PreCompose(lui, lu), o) = o and ApplyFunctor( PreCompose(rui, ru), o) = o ),
 List( SetOfGeneratingMorphisms(B), m -> ApplyFunctor( PreCompose(lui, lu), m) = m and ApplyFunctor( PreCompose(rui, ru), m) = m ),
 List( SetOfObjects(B^0 * B), o -> ApplyFunctor( PreCompose(lu, lui), o) = o ),
 List( SetOfGeneratingMorphisms(B^0 * B), m -> ApplyFunctor( PreCompose(lu, lui), m) = m)
 ] );;
and_function := function(x,y) return x and y; end;;
Iterated( l, and_function );
#! true

#! @EndExample
#! @EndChunk

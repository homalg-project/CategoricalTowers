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

# Consider B as an object in the category of algebroids over Q
BB := CategoryOfAlgebroidsObject(B);;
BB2 := TensorProductOnObjects(BB, BB);;
BB0 := TensorUnit( CapCategory( BB ) );;

ru_as_functor := RightUnitor( BB );;
lu_as_functor := LeftUnitor( BB );;
rui_as_functor := RightUnitorInverse( BB );;
lui_as_functor := LeftUnitorInverse( BB );;

IsCongruentForMorphisms( PreCompose( ru_as_functor, rui_as_functor ), IdentityMorphism( TensorProductOnObjects( BB,  BB0) ) );
#! true
IsCongruentForMorphisms( PreCompose( lu_as_functor, lui_as_functor ), IdentityMorphism( TensorProductOnObjects( BB0,  BB) ) );
#! true
IsCongruentForMorphisms( PreCompose( rui_as_functor, ru_as_functor ), IdentityMorphism( BB ) );
#! true
IsCongruentForMorphisms( PreCompose( lui_as_functor, lu_as_functor ), IdentityMorphism( BB ) );
#! true

#! @EndExample
#! @EndChunk

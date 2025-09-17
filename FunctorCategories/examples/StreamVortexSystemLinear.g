#! @Chunk StreamVortexSystemLinear

#! Stream-vortex-system: Study the linearization of the colimit completion of a cyclic monoid

#! @Example
LoadPackage( "FunctorCategories", false );
#! true
q := RightQuiver( "q(o)[x:o->o]" );
#! q(o)[x:o->o]
F := FreeCategory( q );
#! FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
C := F / [ [ F.x^(3+4), F.x^3 ] ];
#! FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#! / [ x*x*x*x*x*x*x = x*x*x ]
Q := HomalgFieldOfRationals( );
#! Q
QC := Q[C];
#! Algebra( Q, FreeCategory( RightQuiver( "q(o)[x:o->o]" ) ) ) / relations
QC := AlgebroidFromDataTables( QC );
#! Q-algebroid( {o}[x:o→o] ) defined by 1 object and 1 generating morphism
x := QC.x;
#! <1*x:(o) → (o)>
IsMonomorphism( x );
#! false
IsEpimorphism( x );
#! false
PSh := PreSheaves( QC );
#! PreSheaves( Q-algebroid( {o}[x:o→o] )
#! defined by 1 object and 1 generating morphism, Rows( Q ) )
H := Target( PSh );
#! Rows( Q )
Go := 8 / H;
#! <A row module over Q of rank 8>
Gx := [ 5, 0, 3, 1, 1, 4, 3, 2 ];;
Gx := IdentityMat( 8 ){1 + Gx};;
Gx := HomalgMatrix( Gx, 8, 8, Q );;
Gx := MorphismConstructor( Go, Gx, Go );
#! <A morphism in Rows( Q )>
Display( Gx );
#! Source:
#! A row module over Q of rank 8
#! 
#! Matrix:
#! [ [  0,  0,  0,  0,  0,  1,  0,  0 ],
#!   [  1,  0,  0,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  1,  0,  0,  0,  0 ],
#!   [  0,  1,  0,  0,  0,  0,  0,  0 ],
#!   [  0,  1,  0,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  1,  0,  0,  0 ],
#!   [  0,  0,  0,  1,  0,  0,  0,  0 ],
#!   [  0,  0,  1,  0,  0,  0,  0,  0 ] ]
#! 
#! Range:
#! A row module over Q of rank 8
#! 
#! A morphism in Rows( Q )
G :=  CreatePreSheafByValues( PSh, Pair( [ Go ], [ Gx ] ) );
#! <(o)->8; (x)->8x8>
IsWellDefined( G );
#! true
cy := ProjectionOntoCoequalizer( CoYonedaLemmaCoequalizerPair( G )[2] );
#! <(o)->56x8>
pi := EpimorphismFromSomeProjectiveObject( G );
#! <(o)->14x8>
CoimageObject( cy ) = CoimageObject( pi );
#! false
Display( CoimageObject( cy ) );
#! Image of <(o)>:
#! A row module over Q of rank 8
#! 
#! Image of <1*x:(o) → (o)>:
#! Source:
#! A row module over Q of rank 8
#! 
#! Matrix:
#! [ [  0,  1,  0,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  1,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  1,  0,  0,  0,  0 ],
#!   [  1,  0,  0,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  1,  0,  0 ],
#!   [  0,  0,  0,  1,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  1,  0,  0 ],
#!   [  0,  0,  0,  0,  1,  0,  0,  0 ] ]
#! 
#! Range:
#! A row module over Q of rank 8
#! 
#! A morphism in Rows( Q )
#! 
#! An object in PreSheaves( Q-algebroid( {o}[x:o→o] )
#! defined by 1 object and 1 generating morphism, Rows( Q ) )
#! given by the above data
Display( CoimageObject( pi ) );
#! Image of <(o)>:
#! A row module over Q of rank 8
#! 
#! Image of <1*x:(o) → (o)>:
#! Source:
#! A row module over Q of rank 8
#! 
#! Matrix:
#! [ [  0,  1,  0,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  1,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  1,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  1,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  1,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  0,  1,  0 ],
#!   [  0,  0,  0,  1,  0,  0,  0,  0 ],
#!   [  0,  0,  1,  0,  0,  0,  0,  0 ] ]
#! 
#! Range:
#! A row module over Q of rank 8
#! 
#! A morphism in Rows( Q )
#! 
#! An object in PreSheaves( Q-algebroid( {o}[x:o→o] )
#! defined by 1 object and 1 generating morphism, Rows( Q ) )
#! given by the above data
ps := EpimorphismFromSomeProjectiveObjectUsingSplits( G );
#! <(o)->14x8>
nf := CoimageObject( ps );
#! <(o)->8; (x)->8x8>
nf = CoimageObject( cy );
#! false
Display( nf );
#! Image of <(o)>:
#! A row module over Q of rank 8
#! 
#! Image of <1*x:(o) → (o)>:
#! Source:
#! A row module over Q of rank 8
#! 
#! Matrix:
#! [ [  0,  1,  0,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  1,  0,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  1,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  1,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  1,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  0,  1,  0 ],
#!   [  0,  0,  0,  1,  0,  0,  0,  0 ],
#!   [  0,  0,  0,  0,  0,  0,  0,  0 ] ]
#! 
#! Range:
#! A row module over Q of rank 8
#! 
#! A morphism in Rows( Q )
#! 
#! An object in PreSheaves( Q-algebroid( {o}[x:o→o] )
#! defined by 1 object and 1 generating morphism, Rows( Q ) )
#! given by the above data
section := SectionFromOptimizedCoYonedaProjectiveObjectIntoCoYonedaProjectiveObject( G );
#! <A morphism in AdditiveClosure( Q-algebroid( {o}[x:o→o] )
#!  defined by 1 object and 1 generating morphism )
#!  defined by a 2 x 8 matrix of underlying morphisms>
IsWellDefined( section );
#! true
Display( section );
#! A 2 x 8 matrix with entries in Q-algebroid( {o}[x:o→o] )
#! defined by 1 object and 1 generating morphism
#! 
#! [1,1]: <0:(o) → (o)>
#! [1,2]: <0:(o) → (o)>
#! [1,3]: <0:(o) → (o)>
#! [1,4]: <0:(o) → (o)>
#! [1,5]: <0:(o) → (o)>
#! [1,6]: <0:(o) → (o)>
#! [1,7]: <0:(o) → (o)>
#! [1,8]: <1*id(o):(o) → (o)>
#! [2,1]: <0:(o) → (o)>
#! [2,2]: <0:(o) → (o)>
#! [2,3]: <0:(o) → (o)>
#! [2,4]: <0:(o) → (o)>
#! [2,5]: <0:(o) → (o)>
#! [2,6]: <0:(o) → (o)>
#! [2,7]: <1*id(o):(o) → (o)>
#! [2,8]: <0:(o) → (o)>
Emb := EmbeddingFunctorOfFiniteStrictCoproductCompletionIntoPreSheaves( PSh );
#! The embedding functor of the finite coproduct completion into f.p. presheaves
ip := PreCompose( Emb( section ), cy );
#! <(o)->14x8>
IsEqualAsFactorobjects( pi, ip );
#! true
pi = ip;
#! false
CoimageObject( ip ) = CoimageObject( pi );
#! true
retraction := RetractionFromCoYonedaProjectiveObjectOntoOptimizedCoYonedaProjectiveObject( G );
#! <A morphism in AdditiveClosure( Q-algebroid( {o}[x:o→o] )
#!  defined by 1 object and 1 generating morphism )
#!  defined by a 8 x 2 matrix of underlying morphisms>
IsWellDefined( retraction );
#! true
Display( retraction );
#! A 8 x 2 matrix with entries in Q-algebroid( {o}[x:o→o] )
#! defined by 1 object and 1 generating morphism
#! 
#! [1,1]: <0:(o) → (o)>
#! [1,2]: <1*x^3:(o) → (o)>
#! [2,1]: <0:(o) → (o)>
#! [2,2]: <1*x^2:(o) → (o)>
#! [3,1]: <1*x:(o) → (o)>
#! [3,2]: <0:(o) → (o)>
#! [4,1]: <0:(o) → (o)>
#! [4,2]: <1*x:(o) → (o)>
#! [5,1]: <0:(o) → (o)>
#! [5,2]: <1*x^5:(o) → (o)>
#! [6,1]: <0:(o) → (o)>
#! [6,2]: <1*x^4:(o) → (o)>
#! [7,1]: <0:(o) → (o)>
#! [7,2]: <1*id(o):(o) → (o)>
#! [8,1]: <1*id(o):(o) → (o)>
#! [8,2]: <0:(o) → (o)>
IsOne( PreCompose( section, retraction ) );
#! true
co := ProjectionOntoCoequalizer( OptimizedCoYonedaLemmaCoequalizerPair( G )[2] );
#! <(o)->14x8>
IsEqualAsFactorobjects( pi, co );
#! true
pi = co;
#! false
CoimageObject( pi ) = CoimageObject( co );
#! true
#! @EndExample

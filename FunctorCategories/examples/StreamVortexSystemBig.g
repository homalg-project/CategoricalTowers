#! @Chunk StreamVortexSystemBig

#! Stream-vortex-system: Study the colimit completion of a cyclic monoid

#! @Example
LoadPackage( "FunctorCategories", false );
#! true
q := RightQuiver( "q(o)[x:o->o]" );
#! q(o)[x:o->o]
F := FreeCategory( q );
#! FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
C := F / [ [ F.x^(4+12), F.x^4 ] ];
#! FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#! / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ]
x := C.x;
#! (o)-[(x)]->(o)
IsMonomorphism( x );
#! false
IsEpimorphism( x );
#! false
PSh := PreSheaves( C );
#! PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#! / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ], SkeletalFinSets )
Fo := FinSet( 18 );
#! |18|
Display( Fo );
#! { 0,..., 17 }
Fx := [ 5, 0, 1, 2, 3, 4, 0, 2, 5, 6, 6, 7, 7, 8, 8, 9, 9, 16 ];;
Fx := MapOfFinSets( Fo, Fx, Fo );
#! |18| → |18|
Display( Fx );
#! { 0,..., 17 }
#! ⱶ[ 5, 0, 1, 2, 3, 4, 0, 2, 5,
#!    6, 6, 7, 7, 8, 8, 9, 9, 16 ]→ { 0,..., 17 }
G :=  CreatePreSheafByValues( PSh, Pair( [ Fo ], [ Fx ] ) );
#! <An object in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ], SkeletalFinSets )>
IsWellDefined( G );
#! true
coYoG := CoYonedaLemmaOnObjects( G );
#! <An object in CoequalizerCompletion( FiniteStrictCoproductCompletion(
#!  FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ] ) )>
sec := SectionFromOptimizedCoYonedaProjectiveObjectIntoCoYonedaProjectiveObject( G );
#! <A split monomorphism in FiniteStrictCoproductCompletion(
#!  FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ] )>
IsWellDefined( sec );
#! true
Display( sec );
#! { 0,..., 6 } ⱶ[ 17, 15, 10, 11, 12, 13, 14 ]→ { 0,..., 17 }
#! 
#! [ (o)-[(o)]->(o), (o)-[(o)]->(o), (o)-[(o)]->(o), (o)-[(o)]->(o),
#!   (o)-[(o)]->(o), (o)-[(o)]->(o), (o)-[(o)]->(o) ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#! / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ] ) given by the above data
#! @EndExample

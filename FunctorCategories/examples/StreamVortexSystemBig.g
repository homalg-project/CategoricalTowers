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
Go := FinSet( 18 );
#! |18|
Display( Go );
#! { 0,..., 17 }
Gx := [ 5, 0, 1, 2, 3, 4, 0, 2, 5, 6, 6, 7, 7, 8, 8, 9, 9, 16 ];;
Gx := MapOfFinSets( Go, Gx, Go );
#! |18| → |18|
G :=  CreatePreSheafByValues( PSh, Pair( [ Go ], [ Gx ] ) );
#! <An object in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ], SkeletalFinSets )>
IsWellDefined( G );
#! true
Display( G );
#! Image of <(o)>:
#! { 0,..., 17 }
#! 
#! Image of (o)-[(x)]->(o):
#! { 0,..., 17 } ⱶ[ 5, 0, 1, 2, 3, 4, 0, 2, 5,
#!                  6, 6, 7, 7, 8, 8, 9, 9, 16 ]→ { 0,..., 17 }
#! 
#! An object in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#! / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ], SkeletalFinSets )
#! given by the above data
pi := EpimorphismFromSomeProjectiveObject( G );
#! <A morphism in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ], SkeletalFinSets )>
im := ImageObject( pi );
#! <An object in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ], SkeletalFinSets )>
im = G;
#! true
coim := CoimageObject( pi );
#! <An object in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ], SkeletalFinSets )>
Display( coim );
#! Image of <(o)>:
#! { 0,..., 17 }
#! 
#! Image of (o)-[(x)]->(o):
#! { 0,..., 17 } ⱶ[ 1, 2, 3, 4, 5, 6, 7, 8, 9,
#!                  4, 2, 3, 13, 8, 13, 16, 5, 16 ]→ { 0,..., 17 }
#! 
#! An object in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#! / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ], SkeletalFinSets )
#! given by the above data
coim = im;
#! false
iso := MorphismFromCoimageToImage( pi );
#! <A morphism in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ], SkeletalFinSets )>
IsWellDefined( iso );
#! true
IsIsomorphism( iso );
#! true
Display( iso );
#! Image of <(o)>:
#! { 0,..., 17 } ⱶ[ 17, 16, 9, 6, 0, 5, 4, 3, 2,
#!                  1, 15, 10, 11, 7, 12, 13, 8, 14 ]→ { 0,..., 17 }
#! 
#! A morphism in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#! / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ], SkeletalFinSets )
#! given by the above data
inv := InverseOfMorphismFromCoimageToImage( pi );
#! <An isomorphism in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ], SkeletalFinSets )>
Display( inv );
#! Image of <(o)>:
#! { 0,..., 17 } ⱶ[ 4, 9, 8, 7, 6, 5, 3, 13, 16,
#!                  2, 11, 12, 14, 15, 17, 10, 1, 0 ]→ { 0,..., 17 }
#! 
#! A morphism in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#! / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ], SkeletalFinSets )
#! given by the above data
IsOne( PreCompose( iso, inv ) );
#! true
IsOne( PreCompose( inv, iso ) );
#! true
coYoG := CoYonedaLemmaOnObjects( G );
#! <An object in FiniteColimitCompletionWithStrictCoproducts(
#!  FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ] )>
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
pi := EpimorphismFromSomeProjectiveObject( G );
#! <A morphism in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ], SkeletalFinSets )>
ast := AstrictionToCoimage( pi );
#! <A morphism in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ], SkeletalFinSets )>
IsWellDefined( ast );
#! true
Display( ast );
#! Image of <(o)>:
#! { 0,..., 17 } ⱶ[ 17, 16, 9, 6, 0, 5, 4, 3, 2,
#!                  1, 15, 10, 11, 7, 12, 13, 8, 14 ]→ { 0,..., 17 }
#! 
#! A morphism in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#! / [ x*x*x*x*x*x*x*x*x*x*x*x*x*x*x*x = x*x*x*x ], SkeletalFinSets )
#! given by the above data
#! @EndExample

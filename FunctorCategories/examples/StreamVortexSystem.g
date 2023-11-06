#! @Chunk StreamVortexSystem

#! Stream-vortex-system: Study the colimit completion of a cyclic monoid

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
C := CategoryFromDataTables( C );
#! FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#! / [ x*x*x*x*x*x*x = x*x*x ]
x := C.x;
#! (o)-[(x)]->(o)
IsMonomorphism( x );
#! false
IsEpimorphism( x );
#! false
PSh := PreSheaves( C );
#! PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#! / [ x*x*x*x*x*x*x = x*x*x ], SkeletalFinSets )
Fo := FinSet( 8 );
#! |8|
Display( Fo );
#! { 0,..., 7 }
Fx := [ 5, 0, 3, 1, 1, 4, 3, 2 ];;
Fx := MapOfFinSets( Fo, Fx, Fo );
#! |8| → |8|
G :=  CreatePreSheafByValues( PSh, Pair( [ Fo ], [ Fx ] ) );
#! <An object in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x = x*x*x ], SkeletalFinSets )>
IsWellDefined( G );
#! true
Display( G );
#! Image of <(o)>:
#! { 0,..., 7 }
#! 
#! Image of (o)-[(x)]->(o):
#! { 0,..., 7 } ⱶ[ 5, 0, 3, 1, 1, 4, 3, 2 ]→ { 0,..., 7 }
#! 
#! An object in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#! / [ x*x*x*x*x*x*x = x*x*x ], SkeletalFinSets ) given by the above data
pi := EpimorphismFromSomeProjectiveObject( G );
#! <A morphism in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x = x*x*x ], SkeletalFinSets )>
im := ImageObject( pi );
#! <An object in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x = x*x*x ], SkeletalFinSets )>
Display( im );
#! Image of <(o)>:
#! { 0,..., 7 }
#! 
#! Image of (o)-[(x)]->(o):
#! { 0,..., 7 } ⱶ[ 5, 0, 3, 1, 1, 4, 3, 2 ]→ { 0,..., 7 }
#! 
#! An object in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#! / [ x*x*x*x*x*x*x = x*x*x ], SkeletalFinSets ) given by the above data
im = G;
#! true
coim := CoimageObject( pi );
#! <An object in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x = x*x*x ], SkeletalFinSets )>
Display( coim );
#! Image of <(o)>:
#! { 0,..., 7 }
#! 
#! Image of (o)-[(x)]->(o):
#! { 0,..., 7 } ⱶ[ 1, 2, 3, 4, 5, 6, 3, 2 ]→ { 0,..., 7 }
#! 
#! An object in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#! / [ x*x*x*x*x*x*x = x*x*x ], SkeletalFinSets ) given by the above data
coim = im;
#! false
iso := MorphismFromCoimageToImage( pi );
#! <A morphism in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x = x*x*x ], SkeletalFinSets )>
IsWellDefined( iso );
#! true
IsIsomorphism( iso );
#! true
Display( iso );
#! Image of <(o)>:
#! { 0,..., 7 } ⱶ[ 7, 2, 3, 1, 0, 5, 4, 6 ]→ { 0,..., 7 }
#! 
#! A morphism in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#! / [ x*x*x*x*x*x*x = x*x*x ], SkeletalFinSets ) given by the above data
inv := InverseOfMorphismFromCoimageToImage( pi );
#! <An isomorphism in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x = x*x*x ], SkeletalFinSets )>
Display( inv );
#! Image of <(o)>:
#! { 0,..., 7 } ⱶ[ 4, 3, 1, 2, 6, 5, 7, 0 ]→ { 0,..., 7 }
#! 
#! A morphism in PreSheaves( FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#! / [ x*x*x*x*x*x*x = x*x*x ], SkeletalFinSets ) given by the above data
IsOne( PreCompose( iso, inv ) );
#! true
IsOne( PreCompose( inv, iso ) );
#! true
coYoG := CoYonedaLemmaOnObjects( G );
#! <An object in CoequalizerCompletion( FiniteStrictCoproductCompletion(
#!  FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x = x*x*x ] ) )>
sec := SectionFromOptimizedCoYonedaProjectiveObjectIntoCoYonedaProjectiveObject( G );
#! <A split monomorphism in FiniteStrictCoproductCompletion(
#!  FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#!  / [ x*x*x*x*x*x*x = x*x*x ] )>
IsWellDefined( sec );
#! true
Display( sec );
#! { 0, 1 } ⱶ[ 7, 6 ]→ { 0,..., 7 }
#! 
#! [ (o)-[(o)]->(o), (o)-[(o)]->(o) ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! FreeCategory( RightQuiver( "q(o)[x:o->o]" ) )
#! / [ x*x*x*x*x*x*x = x*x*x ] ) given by the above data
#! @EndExample

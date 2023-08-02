#! @Chunk LazyTerminalCategory

LoadPackage( "LazyCategories" );

# the following packages introduce more CAP operations
# which are not used below; still they make the example file
# useful for further testing
LoadPackage( "Locales", ">= 2022.11-04" );
LoadPackage( "SubcategoriesForCAP" );

#! @Example
T := TerminalCategoryWithMultipleObjects( );
#! TerminalCategoryWithMultipleObjects( )
L := LazyCategory( T : primitive_operations := true, optimize := 0 );
#! LazyCategory( TerminalCategoryWithMultipleObjects( ) )
a := "a" / T / L;
#! <An evaluated object in LazyCategory( TerminalCategoryWithMultipleObjects( ) )>
Display( a );
#! a
#! 
#! An evaluated object given by the above data
IsWellDefined( a );
#! true
IsWellDefined( DirectSum( a, a ) );
#! true
IsWellDefined( IdentityMorphism( DirectSum( a, a ) ) );
#! true
aa := ObjectConstructor( T, "a" ) / L;
#! <An evaluated object in LazyCategory( TerminalCategoryWithMultipleObjects( ) )>
Display( aa );
#! a
#! 
#! An evaluated object given by the above data
a = aa;
#! true
b := "b" / T / L;
#! <An evaluated object in LazyCategory( TerminalCategoryWithMultipleObjects( ) )>
Display( b );
#! b
#! 
#! An evaluated object given by the above data
a = b;
#! false
t := TensorProduct( a, b );
#! <An object in LazyCategory( TerminalCategoryWithMultipleObjects( ) )>
Display( t );
#! TensorProductOnObjects(
#! <An evaluated object in
#!  LazyCategory( TerminalCategoryWithMultipleObjects( ) )>,
#! <An evaluated object in
#!  LazyCategory( TerminalCategoryWithMultipleObjects( ) )> )
a = t;
#! false
TensorProduct( a, a ) = t;
#! false
m := MorphismConstructor( EvaluatedCell( a ), "m", EvaluatedCell( b ) ) / L;
#! <An evaluated morphism in
#!  LazyCategory( TerminalCategoryWithMultipleObjects( ) )>
Display( m );
#! a
#! |
#! | m
#! v
#! b
#! 
#! An evaluated morphism given by the above data
IsWellDefined( m );
#! true
n := MorphismConstructor( EvaluatedCell( a ), "n", EvaluatedCell( b ) ) / L;
#! <An evaluated morphism in
#!  LazyCategory( TerminalCategoryWithMultipleObjects( ) )>
Display( n );
#! a
#! |
#! | n
#! v
#! b
#! 
#! An evaluated morphism given by the above data
IsEqualForMorphisms( m, n );
#! false
IsCongruentForMorphisms( m, n );
#! true
m = n;
#! true
id := IdentityMorphism( a );
#! <An identity morphism in
#!  LazyCategory( TerminalCategoryWithMultipleObjects( ) )>
Display( id );
#! IdentityMorphism( <An evaluated object in
#! LazyCategory( TerminalCategoryWithMultipleObjects( ) )> )
m = id;
#! false
id = MorphismConstructor( EvaluatedCell( a ), "xy", EvaluatedCell( a ) ) / L;
#! true
z := ZeroMorphism( a, a );
#! <A zero morphism in LazyCategory( TerminalCategoryWithMultipleObjects( ) )>
Display( z );
#! ZeroMorphism(
#! <An evaluated object in
#!  LazyCategory( TerminalCategoryWithMultipleObjects( ) )>,
#! <An evaluated object in
#!  LazyCategory( TerminalCategoryWithMultipleObjects( ) )> )
id = z;
#! true
#! @EndExample

#! @Chunk FinitelyZGradedClosureCategory

#! @Example
LoadPackage( "GradedCategories" );
#! true
LoadPackage( "LinearAlgebraForCAP" );
#! true
Q := HomalgFieldOfRationals( );
#! Q
Qmat := MatrixCategory( Q );
#! Category of matrices over Q
ZQmat := FinitelyZGradedClosureCategory( Qmat );
#! FinitelyZGradedClosureCategory( Category of matrices over Q )
z := ZeroObject( ZQmat );
#! <A zero object in
#!  FinitelyZGradedClosureCategory( Category of matrices over Q )>
Sublist( z, [ -1 .. 2 ] );
#! [ <A vector space object over Q of dimension 0>,
#!   <A vector space object over Q of dimension 0>,
#!   <A vector space object over Q of dimension 0>,
#!   <A vector space object over Q of dimension 0> ]
o0 := ZQmat[0];
#! <An object in
#!  FinitelyZGradedClosureCategory( Category of matrices over Q )>
Sublist( o0, [ -1 .. 2 ] );
#! [ <A vector space object over Q of dimension 0>,
#!   <A vector space object over Q of dimension 1>,
#!   <A vector space object over Q of dimension 0>,
#!   <A vector space object over Q of dimension 0> ]
IsZero( o0 );
#! false
o1 := ZQmat[1];
#! <An object in
#!  FinitelyZGradedClosureCategory( Category of matrices over Q )>
Sublist( o1, [ -1 .. 2 ] );
#! [ <A vector space object over Q of dimension 0>,
#!   <A vector space object over Q of dimension 0>,
#!   <A vector space object over Q of dimension 1>,
#!   <A vector space object over Q of dimension 0> ]
o00 := DirectSum( o0, o0 );
#! <An object in
#!  FinitelyZGradedClosureCategory( Category of matrices over Q )>
Sublist( o00, [ -1 .. 2 ] );
#! [ <A vector space object over Q of dimension 0>,
#!   <A vector space object over Q of dimension 2>,
#!   <A vector space object over Q of dimension 0>,
#!   <A vector space object over Q of dimension 0> ]
o0 = TensorUnit( ZQmat );
#! true
TensorProduct( o1, ZQmat[-1] ) = o0;
#! true
o11 := TensorProduct( o00, o1 );
#! <An object in
#!  FinitelyZGradedClosureCategory( Category of matrices over Q )>
Sublist( o11, [ -1 .. 2 ] );
#! [ <A vector space object over Q of dimension 0>,
#!   <A vector space object over Q of dimension 0>,
#!   <A vector space object over Q of dimension 2>,
#!   <A vector space object over Q of dimension 0> ]
IsZero( TensorProduct( z, o11 ) );
#! true
lu := LeftUnitor( o00 );
#! <A morphism in
#!  FinitelyZGradedClosureCategory( Category of matrices over Q )>
IsIsomorphism( lu );
#! true
lu;
#! <An isomorphism in
#!  FinitelyZGradedClosureCategory( Category of matrices over Q )>
slu := Sublist( lu, [ -1 .. 2 ] );;
List( slu, IsIsomorphism );
#! [ true, true, true, true ]
List( slu, IsZero );
#! [ true, false, true, true ]
slu;
#! [ <A zero, isomorphism in Category of matrices over Q>,
#!   <An isomorphism in Category of matrices over Q>,
#!   <A zero, isomorphism in Category of matrices over Q>,
#!   <A zero, isomorphism in Category of matrices over Q> ]
Display( lu[0] );
#! [ [  1,  0 ],
#!   [  0,  1 ] ]
#! 
#! An isomorphism in Category of matrices over Q
ru := RightUnitor( o00 );
#! <A morphism in
#!  FinitelyZGradedClosureCategory( Category of matrices over Q )>
IsIsomorphism( ru );
#! true
ru;
#! <An isomorphism in
#!  FinitelyZGradedClosureCategory( Category of matrices over Q )>
sru := Sublist( ru, [ -1 .. 2 ] );;
List( sru, IsIsomorphism );
#! [ true, true, true, true ]
List( sru, IsZero );
#! [ true, false, true, true ]
sru;
#! [ <A zero, isomorphism in Category of matrices over Q>,
#!   <An isomorphism in Category of matrices over Q>,
#!   <A zero, isomorphism in Category of matrices over Q>,
#!   <A zero, isomorphism in Category of matrices over Q> ]
Display( ru[0] );
#! [ [  1,  0 ],
#!   [  0,  1 ] ]
#! 
#! An isomorphism in Category of matrices over Q
lr := AssociatorLeftToRight( o0, o1, o00 );
#! <A morphism in
#!  FinitelyZGradedClosureCategory( Category of matrices over Q )>
IsIsomorphism( lr );
#! true
lr;
#! <An isomorphism in
#!  FinitelyZGradedClosureCategory( Category of matrices over Q )>
slr := Sublist( lr, [ -1 .. 2 ] );;
List( slr, IsIsomorphism );
#! [ true, true, true, true ]
List( slr, IsZero );
#! [ true, true, false, true ]
slr;
#! [ <A zero, isomorphism in Category of matrices over Q>,
#!   <A zero, isomorphism in Category of matrices over Q>,
#!   <An isomorphism in Category of matrices over Q>,
#!   <A zero, isomorphism in Category of matrices over Q> ]
Display( lr[1] );
#! [ [  1,  0 ],
#!   [  0,  1 ] ]
#! 
#! An isomorphism in Category of matrices over Q
rl := AssociatorRightToLeft( o0, o1, o00 );
#! <A morphism in
#!  FinitelyZGradedClosureCategory( Category of matrices over Q )>
IsIsomorphism( rl );
#! true
rl;
#! <An isomorphism in
#!  FinitelyZGradedClosureCategory( Category of matrices over Q )>
srl := Sublist( rl, [ -1 .. 2 ] );;
List( srl, IsIsomorphism );
#! [ true, true, true, true ]
List( srl, IsZero );
#! [ true, true, false, true ]
srl;
#! [ <A zero, isomorphism in Category of matrices over Q>,
#!   <A zero, isomorphism in Category of matrices over Q>,
#!   <An isomorphism in Category of matrices over Q>,
#!   <A zero, isomorphism in Category of matrices over Q> ]
Display( rl[1] );
#! [ [  1,  0 ],
#!   [  0,  1 ] ]
#! 
#! An isomorphism in Category of matrices over Q
b := Braiding( o11, o00 );
#! <A morphism in
#!  FinitelyZGradedClosureCategory( Category of matrices over Q )>
IsIsomorphism( b );
#! true
b;
#! <An isomorphism in
#!  FinitelyZGradedClosureCategory( Category of matrices over Q )>
sb := Sublist( b, [ -1 .. 2 ] );;
List( sb, IsIsomorphism );
#! [ true, true, true, true ]
List( sb, IsZero );
#! [ true, true, false, true ]
sb;
#! [ <A zero, isomorphism in Category of matrices over Q>,
#!   <A zero, isomorphism in Category of matrices over Q>,
#!   <An isomorphism in Category of matrices over Q>,
#!   <A zero, isomorphism in Category of matrices over Q> ]
Display( b[1] );
#! [ [  1,  0,  0,  0 ],
#!   [  0,  0,  1,  0 ],
#!   [  0,  1,  0,  0 ],
#!   [  0,  0,  0,  1 ] ]
#! 
#! An isomorphism in Category of matrices over Q
#! @EndExample

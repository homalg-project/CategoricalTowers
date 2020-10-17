#! @Chunk IteratedInternalHom

LoadPackage( "SubcategoriesForCAP" );

#! Iteratively applying $\underline{Hom}(J,-)$ to the universal morphism $\iota: I \to T$,
#! where $T$ is the terminal object of the slice category, might never become an isomorphism.
#! However, in this example it does.

#! @Example
LoadPackage( "Locales" );
#! true
Q := HomalgFieldOfRationalsInSingular( );
#! Q
R := Q["x,y"];
#! Q[x,y]
P := CategoryOfRows( R );
#! Rows( Q[x,y] )
S := SliceCategoryOverTensorUnit( P );
#! SliceCategoryOverTensorUnit( Rows( Q[x,y] ) )
I := HomalgMatrix( "[ x^2, x*y ]", 2, 1, R ) / P / S;
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
J := HomalgMatrix( "[ x ]", 1, 1, R ) / P / S;
#! An object in the slice category given by: <A morphism in Rows( Q[x,y] )>
iota := InternalHom( UniversalMorphismIntoTerminalObject( J ), I );
#! A morphism in the slice category given by: <A morphism in Rows( Q[x,y] )>
Display( iota );
#! Source:
#! A row module over Q[x,y] of rank 2
#! 
#! Matrix:
#! x,0,
#! 0,x
#! 
#! Range:
#! A row module over Q[x,y] of rank 2
#! 
#! A morphism in Rows( Q[x,y] )
#! 
#! A morphism in the slice category given by the above data
iota := InternalHom( J, iota );
#! A morphism in the slice category given by: <A morphism in Rows( Q[x,y] )>
Display( iota );
#! Source:
#! A row module over Q[x,y] of rank 2
#! 
#! Matrix:
#! y,
#! x
#! 
#! Range:
#! A row module over Q[x,y] of rank 1
#! 
#! A morphism in Rows( Q[x,y] )
#! 
#! A morphism in the slice category given by the above data
iota := InternalHom( J, iota );
#! A morphism in the slice category given by: <A morphism in Rows( Q[x,y] )>
Display( iota );
#! Source:
#! A row module over Q[x,y] of rank 1
#! 
#! Matrix:
#! 1
#! 
#! Range:
#! A row module over Q[x,y] of rank 1
#! 
#! A morphism in Rows( Q[x,y] )
#! 
#! A morphism in the slice category given by the above data
iota = InternalHom( J, iota );
#! true
IsIsomorphism( iota );
#! true
Display( Source( iota ) );
#! Source:
#! A row module over Q[x,y] of rank 1
#! 
#! Matrix:
#! 1
#! 
#! Range:
#! A row module over Q[x,y] of rank 1
#! 
#! A morphism in Rows( Q[x,y] )
#! 
#! An object in the slice category given by the above data
Source( iota ) = Range( iota );
#! true
#! @EndExample

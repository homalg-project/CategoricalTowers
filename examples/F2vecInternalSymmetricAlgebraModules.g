LoadPackage( "LinearAlgebraForCAP" );

F2 := HomalgRingOfIntegers( 2 );

F2vec := MatrixCategory( F2 );

v := VectorSpaceObject( 3, F2 );

LoadPackage( "GradedCategories" );

ZF2vec := PositivelyZGradedCategory( F2vec );

LoadPackage( "InternalModules" );

V := ObjectInPositivelyZGradedCategory( v, 1 );

SVMod := CategoryOfLeftSModules( v );

SV := UnderlyingActingObject( SVMod );

ModSV := CategoryOfRightSModules( v );

S := SymmetricAlgebraAsLeftModule( v );

u := VectorSpaceObject( 3, F2 );

U := ObjectInPositivelyZGradedCategory( u, 3 );

F := FreeInternalModule( U, SVMod );

H := FreeInternalModule( U, ModSV );

f1 :=
  function( n )
    if not n = 3 then
        return UniversalMorphismFromZeroObject( SV[n] );
    fi;
    return VectorSpaceMorphism( SV[0], CertainRows( HomalgIdentityMatrix( 10, F2 ), [ 1 ] ), SV[3] );
end;

e1 := MorphismInPositivelyZGradedCategory(
              ObjectInPositivelyZGradedCategory( SV[0], 3 ),
              f1,
              SV );

e1 := InternalElement( e1 );

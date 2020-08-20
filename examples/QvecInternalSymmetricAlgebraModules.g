#! @Chapter Examples and tests

#! @Section Examples

LoadPackage( "InternalModules" );

#! @Example

Q := HomalgFieldOfRationals( );;
Qvec := MatrixCategory( Q );;
v := VectorSpaceObject( 3, Q );;
ZQvec := PositivelyZGradedCategory( Qvec );
#! The positively graded category of Category of matrices over Q
V := ObjectInPositivelyZGradedCategory( v, 1 );;
SVMod := CategoryOfLeftSModules( v );
#! Abelian category of left modules over the internal symmetric algebra of
#! A vector space object over Q of dimension 3
#! with undecidable (mathematical) equality of morphisms and uncomputable lifts and colifts
ModSV := CategoryOfRightSModules( v );;
SV := UnderlyingActingObject( SVMod );
#! <An object in The positively graded category of Category of matrices over Q>
S := SymmetricAlgebraAsLeftModule( v );
#! <An object in Abelian category of left modules over the internal symmetric algebra of
#! A vector space object over Q of dimension 3
#! with undecidable (mathematical) equality of morphisms and uncomputable lifts and colifts>

u := VectorSpaceObject( 3, Q );;
U := ObjectInPositivelyZGradedCategory( u, 3 );;
F := FreeInternalModule( U, SVMod );
#! <An object in Abelian category of left modules over the internal symmetric algebra of
#! A vector space object over Q of dimension 3
#! with undecidable (mathematical) equality of morphisms and uncomputable lifts and colifts>
H := FreeInternalModule( U, ModSV );;

f1 :=
  function( n )
    if not n = 3 then
        return UniversalMorphismFromZeroObject( SV[n] ); fi; return VectorSpaceMorphism( SV[0], CertainRows( HomalgIdentityMatrix( 10, Q ), [ 1 ] ), SV[3] ); end;;

e1 := MorphismInPositivelyZGradedCategory(
              ObjectInPositivelyZGradedCategory( SV[0], 3 ),
              f1,
              SV );;
e1 := InternalElement( e1 );
#! degree: 3
#! 
#! [ [  1,  0,  0,  0,  0,  0,  0,  0,  0,  0 ] ]
#! 
#! A morphism in Category of matrices over Q

#! @EndExample

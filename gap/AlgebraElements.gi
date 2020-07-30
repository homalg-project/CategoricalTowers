############################################################################
##
##                                InternalModules package
##
##  Copyright 2019, Mohamed Barakat,   University of Siegen
##
#############################################################################

####################################
##
## Constructors
##
####################################

##
InstallMethod( InternalElement,
        "for a CAP category morphism with an internal algebra as its range",
        [ IsCapCategoryMorphism ],
        
  function( iota )
    local source, SV;
    
    source := Source( iota );
    
    SV := Range( iota );
    
    if not IsInternalAlgebra( SV ) then
        
        Error( "IsInternalAlgebra( Range( iota ) ) returned false\n" );
        
    fi;
    
    return ObjectifyWithAttributes( rec( ), TheTypeInternalAlgebraElement,
                Range, SV,
                UnderlyingEmbedding, iota );
    
end );

##
InstallMethod( InternalElement,
        "for an internal algebra in a positively Z-graded category, an object, and two integers",
        [ IsInternalAlgebra and IsObjectInPositivelyZGradedCategory, IsObject, IsInt, IsInt ],
        
  function( SV, chi, degree, i )
    local iota;
    
    iota := ComponentInclusionMorphism( SV, chi, degree, i );
    
    return InternalElement( iota );
    
end );

##
InstallMethod( InternalElement,
        "for an internal algebra in a positively Z-graded category, an object, and an integer",
        [ IsInternalAlgebra and IsObjectInPositivelyZGradedCategory, IsObject, IsInt ],
        
  function( SV, chi, i )
    local iota;
    
    iota := ComponentInclusionMorphism( SV, chi, i );
    
    return InternalElement( iota );
    
end );

####################################
##
## Attributes
##
####################################

##
InstallMethod( NonZeroDegrees,
        "for an element in an internal algebra or module",
        [ IsElementInInternalAlgebraOrModule ],
        
  function( e )
    local iota, source;
    
    iota := UnderlyingEmbedding( e );
    
    source := Source( iota );
    
    return Filtered( NonZeroDegrees( source ), i -> not IsZero( iota[i] ) );
    
end );

##
InstallMethod( NonZeroParts,
        "for an element in an internal algebra or module",
        [ IsElementInInternalAlgebraOrModule ],
        
  function( e )
    local iota;
    
    iota := UnderlyingEmbedding( e );
    
    return List( NonZeroDegrees( e ), i -> Source( iota[i] ) );
    
end );

##
InstallMethod( NonZeroPartsWithDegrees,
        "for an element in an internal algebra or module",
        [ IsElementInInternalAlgebraOrModule ],
        
  function( e )
    
    return ListN( NonZeroDegrees( e ), NonZeroParts( e ) , {d,a} -> [ d, a ] );
    
end );

##
InstallMethod( DecomposedSupportWithDegrees,
        "for an element in an internal algebra or module",
        [ IsElementInInternalAlgebraOrModule ],
        
  function( e )
    local support;
    
    support := NonZeroPartsWithDegrees( e );
    
    support := List( support, a -> List( SemisimpleCategoryObjectListWithActualObjects( a[2] ), c -> [ a[1], c[2] ] ) );
    
    return Concatenation( support );
    
end );

##
InstallMethod( AdditiveInverse,
        "for an element in an internal algebra",
        [ IsElementInInternalAlgebra ],
        
  function( e )
    
    return InternalElement( -UnderlyingEmbedding( e ) );
    
end );

##
InstallMethod( UniversalMorphismFromFreeModule,
        "for an element in an internal algebra",
        [ IsElementInInternalAlgebra ],
        
  function( a )
    
    return UniversalMorphismFromFreeModule(
                   UnderlyingEmbedding( a ),
                   SymmetricAlgebraAsLeftModule( Range( a ) ) );
    
end );

####################################
##
## Operations
##
####################################

##
InstallMethod( IsZero,
        "for an element in an internal algebra or module",
        [ IsElementInInternalAlgebraOrModule ],

  function( e )
    
    return NonZeroDegrees( e ) = [ ];
    
end );

##
InstallMethod( InternalPreAddition,
        "for two elements in an internal algebra or module",
        [ IsElementInInternalAlgebraOrModule, IsElementInInternalAlgebraOrModule ],
        
  function( e1, e2 )
    local iota1, iota2, e, support1, support2, support, source, s1, s2, f1, f2, f;
    
    iota1 := UnderlyingEmbedding( e1 );
    iota2 := UnderlyingEmbedding( e2 );
    
    e := UniversalMorphismFromDirectSum( iota1, iota2 );
    
    return e;
    
end );

##
InstallMethod( \+,
        "for two elements in an internal algebra or module",
        [ IsElementInInternalAlgebraOrModule, IsElementInInternalAlgebraOrModule ],
        
  function( e1, e2 )
    local e, source, add_components;
    
    e := InternalPreAddition( e1, e2 );
    
    source := Source( e );
    
    add_components := DiagonalEmbedding( NonZeroDegrees( source ), source );
    
    e := PreCompose( add_components, e );
    
    if IsElementInInternalAlgebra( e1 ) then
        return InternalElement( e );
    fi;
    
    return InternalElement( e, Range( e1 ) );
    
end );

##
InstallMethod( \=,
        "for two elements in an internal algebra or module",
        [ IsElementInInternalAlgebraOrModule, IsElementInInternalAlgebraOrModule ],
        
  function( e1, e2 )
    
    return IsZero( e1 - e2 );
    
end );

##
InstallMethod( \*,
        "for a rational number and an element in an internal algebra or module",
        [ IsRat, IsElementInInternalAlgebraOrModule ],
        
  function( r, m )
    local iota;
    
    r := r / CommutativeRingOfLinearCategory( CapCategory( Range( m ) ) );
    
    iota := r * UnderlyingEmbedding( m );
    
    if IsElementInInternalAlgebra( m ) then
        return InternalElement( iota );
    fi;
    
    return InternalElement( iota, Range( m ) );
    
end );

##
InstallMethod( InternalPreMultiplication,
        "for an element in an internal algebra and an element in an internal algebra or module",
        [ IsElementInInternalAlgebra, IsElementInInternalAlgebraOrModule ],
        
  function( a, m )
    local iota_a, iota_m, source, degrees, structure_morphism, AoM, am;
    
    iota_a := UnderlyingEmbedding( a );
    iota_m := UnderlyingEmbedding( m );
    
    source := TensorProduct( Source( iota_a ), Source( iota_m ) );
    
    structure_morphism := StructureMorphism( Range( m ) );
    
    AoM := Source( structure_morphism );
    
    am := TensorProductOnMorphismsWithGivenTensorProducts(
                  source,
                  iota_a, iota_m,
                  AoM );
    
    return PreCompose( am, structure_morphism );
    
end );

##
InstallMethod( \*,
        "for an element in an internal algebra and an element in an internal algebra or module",
        [ IsElementInInternalAlgebra, IsElementInInternalAlgebraOrModule ],
        
  function( a, m )
    local am, source, add_components;
    
    am := InternalPreMultiplication( a, m );
    
    source := Source( am );
    
    add_components := DiagonalEmbedding( NonZeroDegrees( source ), source );
    
    am := PreCompose( add_components, am );
    
    if IsElementInInternalAlgebra( m ) then
        return InternalElement( am );
    fi;
    
    return InternalElement( am, Range( m ) );
    
end );

##
InstallMethod( BraidedMultiplication,
        "for two elements in an internal algebra",
        [ IsElementInInternalAlgebra, IsElementInInternalAlgebra ],
        
  function( a, b )
    local ab, source, braiding, add_components;
    
    ab := InternalPreMultiplication( a, b );
    
    source := Source( ab );
    
    braiding := BraidingWithGivenTensorProducts(
                        source,
                        Source( UnderlyingEmbedding( a ) ), Source( UnderlyingEmbedding( b ) ),
                        source );
    
    add_components := DiagonalEmbedding( NonZeroDegrees( source ), source );
    
    ab := PreCompose( [ add_components, braiding, ab ] );
    
    return InternalElement( ab );
    
end );

##
InstallMethod( \[\],
        "for an element in an internal algebra or module",
        [ IsElementInInternalAlgebraOrModule, IsInt ],
        
  function( e, degree )
    
    return UnderlyingEmbedding( e )[degree];
    
end );

####################################
##
## View
##
####################################

##
InstallMethod( ViewObj,
        "for an element in an internal algebra or module",
        [ IsElementInInternalAlgebraOrModule ],
        
  function( e )
    local iota, degrees, i;
    
    iota := UnderlyingEmbedding( e );
    
    degrees := NonZeroDegrees( e );
    
    if degrees =  [ ] then
        Print( "0" );
    fi;
    
    for i in degrees do
        
        Print( "degree: ", i, "\n\n" );
        
        Display( iota[i] );
        
    od;
    
end );

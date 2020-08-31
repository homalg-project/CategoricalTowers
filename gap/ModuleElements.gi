############################################################################
##
## InternalModules package
##
## Copyright 2019, Mohamed Barakat, University of Siegen
##
#############################################################################

####################################
##
## Constructors
##
####################################

##
InstallMethod( InternalElement,
        "for a CAP category morphism and an internal module",
        [ IsCapCategoryMorphism, IsInternalModule ],
        
  function ( iota, M )
    local source;
    
    source := Source( iota );
    
    if not Range( iota ) = ActionDomain( M ) then
        
        Error( "Range( iota ) = ActionDomain( M ) returned false\n" );
        
    fi;
    
    if IsInternalLeftModule( M ) then
        
        return ObjectifyWithAttributes( rec( ), TheTypeInternalLeftModuleElement,
                Range, M,
                UnderlyingEmbedding, iota );
        
    else
        
        return ObjectifyWithAttributes( rec( ), TheTypeInternalRightModuleElement,
                Range, M,
                UnderlyingEmbedding, iota );
        
    fi;
    
end );

##
# graded version
InstallMethod( InternalElement,
        "for an internal module, an object, and two integers",
        [ IsInternalModule, IsObject, IsInt, IsInt ],
        
  function ( M, chi, degree, i )
    local iota;
    
    iota := ComponentInclusionMorphism( ActionDomain( M ), chi, degree, i );
    
    return InternalElement( iota, M );
    
end );

##
# graded version, and chi knows its degree
InstallMethod( InternalElement,
        "for an internal module, an object, and an integer",
        [ IsInternalModule, IsObject, IsInt ],
        
  function ( M, chi, i )
    local iota;
    
    iota := ComponentInclusionMorphism( ActionDomain( M ), chi, i );
    
    return InternalElement( iota, M );
    
end );

####################################
##
## Attributes
##
####################################

##
InstallMethod( AdditiveInverse,
        "for an element in an internal module",
        [ IsElementInInternalModule ],
        
  function ( e )
    
    return InternalElement( - UnderlyingEmbedding( e ), Range( e ) );
    
end );

##
InstallMethod( UniversalMorphismFromFreeModule,
        "for an element in an internal module",
        [ IsElementInInternalModule ],
        
  function ( e )
    
    return UniversalMorphismFromFreeModule( UnderlyingEmbedding( e ), Range( e ) );
    
end );

##
InstallMethod( CoefficientsVector,
        "for an element in an internal algebra or module",
        [ IsElementInInternalAlgebraOrModule ],
        
  function ( e )
    local supp, L, I, vec;
    
    supp := NonZeroDegrees( e );
    
    L := Concatenation( List( supp, d -> SemisimpleCategoryMorphismList( UnderlyingEmbedding( e )[d] ) ) );
    
    L := List( L, a -> a[1] );
    
    I := TensorUnit( CapCategory( Range( L[1] ) ) );
    
    L := List( L, function ( a ) if not IsZero( a ) then return a; fi; return ZeroMorphism( I, Range( a ) ); end );
    
    vec := UniversalMorphismIntoDirectSum( L );
    
    return UnderlyingMatrix( vec );
    
end );

##
InstallMethod( CoefficientsVector,
        "for a list",
        [ IsList ],
        
  function ( L )
    local vecs;
    
    vecs := List( L, CoefficientsVector );
    
    return UnionOfRows( vecs );
    
end );


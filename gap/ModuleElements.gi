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
        "for a positively Z-graded category morphism and an internal module",
        [ IsMorphismInPositivelyZGradedCategory, IsInternalModule ],
        
  function( iota, M )
    local source, chi, degrees;
    
    source := Source( iota );
    
    chi := rec( );
    
    if not Range( iota ) = ActionDomain( M ) then
        
        Error( "Range( iota ) = ActionDomain( M ) returned false\n" );
        
    elif HasSupportDegrees( source ) then
        
        degrees := SupportDegrees( source );
        
        if IsInternalLeftModule( M ) then
            
            ObjectifyWithAttributes( chi, TheTypeInternalLeftModuleElement,
                    Range, M,
                    SupportDegrees, degrees,
                    SupportHullDegrees, degrees,
                    UnderlyingEmbedding, iota );
            
        else
            
            ObjectifyWithAttributes( chi, TheTypeInternalRightModuleElement,
                    Range, M,
                    SupportDegrees, degrees,
                    SupportHullDegrees, degrees,
                    UnderlyingEmbedding, iota );
            
        fi;
        
    elif HasSupportHullDegrees( source )  then
        
        if IsInternalLeftModule( M ) then
            
            ObjectifyWithAttributes( chi, TheTypeInternalLeftModuleElement,
                    Range, M,
                    SupportHullDegrees, SupportHullDegrees( source ),
                    UnderlyingEmbedding, iota );
            
        else
            
            ObjectifyWithAttributes( chi, TheTypeInternalRightModuleElement,
                    Range, M,
                    SupportHullDegrees, SupportHullDegrees( source ),
                    UnderlyingEmbedding, iota );
            
        fi;
            
    else
        
        Error( "Source( iota ) does not have the attribute Support(Hull)Degrees\n" );
        
    fi;
    
    return chi;
    
end );

##
InstallMethod( InternalElement,
        "for an internal module, an object, and two integers",
        [ IsInternalModule, IsObject, IsInt, IsInt ],
        
  function( M, chi, degree, i )
    local iota;
    
    iota := ComponentInclusionMorphism( ActionDomain( M ), chi, degree, i );
    
    return InternalElement( iota, M );
    
end );

##
InstallMethod( InternalElement,
        "for an internal module, an object, and an integer",
        [ IsInternalModule, IsObject, IsInt ],
        
  function( M, chi, i )
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
        
  function( e )
    
    return InternalElement( -UnderlyingEmbedding( e ), Range( e ) );
    
end );

##
InstallMethod( UniversalMorphismFromFreeModule,
        "for an element in an internal module",
        [ IsElementInInternalModule ],
        
  function( e )
    
    return UniversalMorphismFromFreeModule( UnderlyingEmbedding( e ), Range( e ) );
    
end );

##
InstallMethod( CoefficientsVector,
        "for an element in an internal algebra or module",
        [ IsElementInInternalAlgebraOrModule ],
        
  function( e )
    local supp, L, I, vec;
    
    supp := SupportDegrees( e );
    
    L := Concatenation( List( supp, d -> SemisimpleCategoryMorphismList( UnderlyingEmbedding( e )[d] ) ) );
    
    L := List( L, a -> a[1] );
    
    I := TensorUnit( CapCategory( Range( L[1] ) ) );
    
    L := List( L, function( a ) if not IsZero( a ) then return a; fi; return ZeroMorphism( I, Range( a ) ); end );
    
    vec := MorphismBetweenDirectSums( [ L ] );
    
    return UnderlyingMatrix( vec );
    
end );

####################################
##
## Operations
##
####################################

##
InstallMethod( CoefficientsVector,
        "for a list",
        [ IsList ],
        
  function( L )
    local vecs;
    
    vecs := List( L, CoefficientsVector );
    
    return Iterated( vecs, UnionOfRows );
    
end );


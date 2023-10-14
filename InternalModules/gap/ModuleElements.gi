# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Implementations
#

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
    
    if not Target( iota ) = ActionDomain( M ) then
        
        Error( "Target( iota ) = ActionDomain( M ) returned false\n" );
        
    fi;
    
    if IsInternalLeftModule( M ) then
        
        return ObjectifyWithAttributes( rec( ), TheTypeInternalLeftModuleElement,
                Target, M,
                UnderlyingEmbedding, iota );
        
    else
        
        return ObjectifyWithAttributes( rec( ), TheTypeInternalRightModuleElement,
                Target, M,
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
# graded version
InstallMethod( InternalElement,
        "for an internal module, a CAP category object, and two integers",
        [ IsInternalModule, IsSemisimpleCategoryObject, IsInt, IsInt ],
        
  function ( M, obj, degree, i )
    local decomposition, chi;
    
    decomposition := SemisimpleCategoryObjectList( obj );
    
    if Length( decomposition ) <> 1 or decomposition[1][1] <> 1 then
        
        Error( "obj must be a simple object" );
        
    fi;
    
    chi := decomposition[1][2];
    
    return InternalElement( M, chi, degree, i );
    
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
    
    return InternalElement( - UnderlyingEmbedding( e ), Target( e ) );
    
end );

##
InstallMethod( UniversalMorphismFromFreeModule,
        "for an element in an internal module",
        [ IsElementInInternalModule ],
        
  function ( e )
    
    return UniversalMorphismFromFreeModule( UnderlyingEmbedding( e ), Target( e ) );
    
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
    
    I := TensorUnit( CapCategory( Target( L[1] ) ) );
    
    L := List( L, function ( a ) if not IsZero( a ) then return a; fi; return ZeroMorphism( I, Target( a ) ); end );
    
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


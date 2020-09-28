#
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallMethod( DecomposeOnceByRandomEndomorphism,
        "for an object in a Hom-category",
        [ IsCapCategoryObjectInHomCategory ],
        
  function ( F )
    local d, endbas, k, n, random, b, alpha, i, alpha2, keremb;
    
    d := Maximum( List( ValuesOnAllObjects( F ), Dimension ) );
    
    endbas := ShallowCopy( BasisOfExternalHom( F, F ) );
    
    Add( endbas, ZeroMorphism( F, F ) );
    
    k := CommutativeRingOfLinearCategory( CapCategory( F ) );
    
    n := Int( Log2( Float( d ) ) ) + 1;
    
    ## the default is true
    random := not IsIdenticalObj( ValueOption( "random" ), false );
    
    for b in Reversed( [ 2 .. Length( endbas ) ] ) do
        
        if random then
            alpha := endbas[b] + Random( k ) * endbas[b-1];
        else
            alpha := endbas[b] + endbas[b-1];
        fi;
        
        SetFilterObj( alpha, IsMultiplicativeElementWithInverse );
        
        for i in [ 1 .. n ] do
            alpha2 := PreCompose( alpha, alpha );
            if IsCongruentForMorphisms( alpha, alpha2 ) then
                break;
            fi;
            alpha := alpha2;
        od;
        
        if IsZero( alpha ) then
            continue;
        fi;
        
        keremb := KernelEmbedding( alpha );
        
        if IsZero( keremb ) then
            continue;
        fi;
        
        return [ ImageEmbedding( alpha ), keremb ];
        
    od;
    
    return fail;
    
end );

##
InstallMethod( WeakDirectSumDecomposition,
        "for an object in a Hom-category",
        [ IsCapCategoryObjectInHomCategory ],
        
  function ( F )
    local queue, summands, eta, result;
    
    queue := [ IdentityMorphism( F ) ];
    
    summands := [ ];
    
    while not IsEmpty( queue ) do
        
        eta := Remove( queue );
        
        result := DecomposeOnceByRandomEndomorphism( Source( eta ) );
        
        if result = fail then
            Add( summands, eta );
        else
            Append( queue, List( result, emb -> PreCompose( emb, eta ) ) );
        fi;
        
    od;
    
    return summands;
    
end );

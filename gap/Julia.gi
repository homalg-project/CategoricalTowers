##
InstallOtherMethod( ClosedSubsetOfSpec,
        "for a Julia object and a homalg ring",
        [ IsJuliaObject, IsHomalgRing ],

  function( str, R )
    
    str := JuliaToGAP( IsString, str );
    
    return ClosedSubsetOfSpec( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallOtherMethod( ClosedSubsetOfSpecByReducedMorphism,
        "for a Julia object and a homalg ring",
        [ IsJuliaObject, IsHomalgRing ],

  function( str, R )
    
    str := JuliaToGAP( IsString, str );
    
    return ClosedSubsetOfSpecByReducedMorphism( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallOtherMethod( ClosedSubsetOfSpecByStandardMorphism,
        "for a Julia object and a homalg ring",
        [ IsJuliaObject, IsHomalgRing ],

  function( str, R )
    
    str := JuliaToGAP( IsString, str );
    
    return ClosedSubsetOfSpecByStandardMorphism( StringToHomalgColumnMatrix( str, R ) );
    
end );

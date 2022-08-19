# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Implementations
#

##
InstallOtherMethod( ClosedSubsetOfSpec,
        "for a Julia object and a homalg ring",
        [ IsJuliaObject, IsHomalgRing ],
        
  function( str, R )
    
    str := JuliaToGAP( IsString, str );
    
    return ClosedSubsetOfSpec( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallOtherMethod( ClosedSubsetOfSpecByReducedColumn,
        "for a Julia object and a homalg ring",
        [ IsJuliaObject, IsHomalgRing ],

  function( str, R )
    
    str := JuliaToGAP( IsString, str );
    
    return ClosedSubsetOfSpecByReducedColumn( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallOtherMethod( ClosedSubsetOfSpecByStandardColumn,
        "for a Julia object and a homalg ring",
        [ IsJuliaObject, IsHomalgRing ],

  function( str, R )
    
    str := JuliaToGAP( IsString, str );
    
    return ClosedSubsetOfSpecByStandardColumn( StringToHomalgColumnMatrix( str, R ) );
    
end );

##
InstallOtherMethod( Subobject,
        "for a Julia object and a homalg ring",
        [ IsObjectInZariskiFrameOrCoframe, IsJuliaObject ],
        
  function( V, str )
    
    return Subobject( V, JuliaToGAP( IsString, str ) );
    
end );

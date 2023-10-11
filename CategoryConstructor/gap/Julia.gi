# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Implementations
#

##
InstallOtherMethod( PreCompose,
        "for a julia object",
        [ IsJuliaObject ],
        
  function( L )
    
    return PreComposeList( ConvertJuliaToGAP( L ) );
    
end );

##
InstallOtherMethod( PreComposeList,
        "for a julia object",
        [ IsJuliaObject ],
        
  function( L )
    
    return PreComposeList( ConvertJuliaToGAP( L ) );
    
end );

##
InstallOtherMethod( CanCompute,
        "for a julia object",
        [ IsCapCategory, IsJuliaObject ],
        
  function( C, oper )
    
    return CanCompute( C, ConvertJuliaToGAP( oper ) );
    
end );

##
InstallOtherMethod( ProjectionInFactorOfFiberProduct,
        "for a julia object and an integer",
        [ IsJuliaObject, IsInt ],
        
  function( D, k )
    
    return ProjectionInFactorOfFiberProduct( ConvertJuliaToGAP( D ), k );
    
end );

##
InstallOtherMethod( UniversalMorphismIntoFiberProduct,
        "for two julia objects",
        [ IsJuliaObject, IsJuliaObject ],
        
  function( D, tau )
    
    return UniversalMorphismIntoFiberProduct( ConvertJuliaToGAP( D ), ConvertJuliaToGAP( tau ) );
    
end );

##
InstallOtherMethod( MorphismFromFiberProductToSink,
        "for a julia object",
        [ IsJuliaObject ],
        
  function( D )
    
    return MorphismFromFiberProductToSink( ConvertJuliaToGAP( D ) );
    
end );

##
InstallOtherMethod( InjectionOfCofactorOfPushout,
        "for a julia object and an integer",
        [ IsJuliaObject, IsInt ],
        
  function( D, k )
    
    return InjectionOfCofactorOfPushout( ConvertJuliaToGAP( D ), k );
    
end );

##
InstallOtherMethod( UniversalMorphismFromPushout,
        "for two julia objects",
        [ IsJuliaObject, IsJuliaObject ],
        
  function( D, tau )
    
    return UniversalMorphismFromPushout( ConvertJuliaToGAP( D ), ConvertJuliaToGAP( tau ) );
    
end );

##
InstallOtherMethod( MorphismFromSourceToPushout,
        "for a julia object",
        [ IsJuliaObject ],
        
  function( D )
    
    return MorphismFromSourceToPushout( ConvertJuliaToGAP( D ) );
    
end );

##
InstallOtherMethod( Limit,
        "for a julia object",
        [ IsJuliaObject, IsJuliaObject ],
        
  function( D1, D2 )
    
    return Limit( ConvertJuliaToGAP( D1 ), ConvertJuliaToGAP( D2 ) );
    
end );

##
InstallOtherMethod( Colimit,
        "for a julia object",
        [ IsJuliaObject, IsJuliaObject ],
        
  function( D1, D2 )
    
    return Colimit( ConvertJuliaToGAP( D1 ), ConvertJuliaToGAP( D2 ) );
    
end );

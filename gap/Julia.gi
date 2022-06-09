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
    
    return PreCompose( ConvertJuliaToGAP( L ) );
    
end );

##
InstallOtherMethod( CanCompute,
        "for a julia object",
        [ IsCapCategory, IsJuliaObject ],
        
  function( C, oper )
    
    return CanCompute( C, ConvertJuliaToGAP( oper ) );
    
end );

##
InstallOtherMethod( MorphismFromFiberProductToSink,
        "for a julia object",
        [ IsJuliaObject ],
        
  function( D )
    
    return MorphismFromFiberProductToSink( ConvertJuliaToGAP( D ) );
    
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

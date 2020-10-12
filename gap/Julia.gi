#
# CategoryConstructor: Construct categories out of given ones
#
# Implementations
#

##
InstallMethod( PreCompose,
        "for a julia object",
        [ IsJuliaObject ],
        
  function( L )
    
    return PreCompose( ConvertJuliaToGAP( L ) );
    
end );

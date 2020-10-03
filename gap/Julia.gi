#
# CategoryConstructor: Construct categories out of given ones
#
# Implementations
#
  function( L )
    
    return PreCompose( ConvertJuliaToGAP( L ) );
    
end );

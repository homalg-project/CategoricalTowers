# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Implementations
#

##
InstallOtherMethod( FinQuiver,
        [ IsJuliaObject ],
        
  function( description )
    
    return FinQuiver( JuliaToGAP( IsString, description ) );
    
end );

# SPDX-License-Identifier: GPL-2.0-or-later
# CatReps: Representations and cohomology of finite categories
#
# Implementations
#

##
InstallOtherMethod( ConcreteCategoryForCAP,
        [ IsJuliaObject ],
        
  function( str )
    
    return ConcreteCategoryForCAP( EvalString( JuliaToGAP( IsString, str ) ) );
    
end );

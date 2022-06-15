# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Implementations
#

##
InstallGlobalFunction( InitialCategory,
  function(  )
    local I;
    
    I := CreateCapCategory( "InitialCategory" );
    
    SetFilterObj( I, IsInitialCapCategory );
    SetFilterObj( I, IsInitialCategory );
    
    Finalize( I );
    
    return I;
    
end );

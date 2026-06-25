# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Implementations
#

##
InstallOtherMethod( SubobjectsOfGeneratedSublattice,
        "for an object in a category and a julia object",
        [ IsCapCategoryObject, IsJuliaObject ],
        
  function( A, subobjects )
    
    return SubobjectsOfGeneratedSublattice( A, ConvertJuliaToGAP( subobjects ) );
    
end );

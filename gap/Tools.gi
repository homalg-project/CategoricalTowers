# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Implementations
#

if IsPackageMarkedForLoading( "Digraphs", ">= 1.3.1" ) then

##
InstallMethod( DigraphOfSubobjects,
               [ IsCapCategoryObject ],
               
  function( A )
    local subobjects, D;
    
    subobjects := ListOfSubobjects( A );
    
    D := Digraph( [ 1 .. Length( subobjects ) ],
                 { i, j } -> IsLiftableAlongMonomorphism( subobjects[i], subobjects[j] ) );
    
    return DigraphReflexiveTransitiveReduction( D );
    
end );

fi;

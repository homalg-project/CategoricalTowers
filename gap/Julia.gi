# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

##
InstallMethod( VisualizeInJulia,
        "for a datastructure of a constructible object",
        [ IsDatastructureForConstructibleObjects ],
        
  function( C )
    
    Julia.Base.display(
            Julia.Base.MIME( GAPToJulia( "image/svg+xml" ) ),
            GAPToJulia( DotToSVG( DotVertexLabelledDigraph( C ) ) ) );
    
end );

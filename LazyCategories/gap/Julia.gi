# SPDX-License-Identifier: GPL-2.0-or-later
# LazyCategories: Construct an equivalent lazy category out of a CAP category
#
# Implementations
#

##
InstallOtherMethod( SetLabel,
        "for a lazy category cell and a julia object",
        [ IsCellInLazyCategory, IsJuliaObject ],

  function( c, str )
    
    SetLabel( c, JuliaToGAP( IsString, str ) );
    
end );

##
InstallOtherMethod( Visualize,
        "for a cell in a lazy category",
        [ IsCellInLazyCategory ],
        
  function( c )
    
    if IsRunningInJupyter( ) then
        
        return Julia.Base.display(
                       Julia.Base.MIME( GAPToJulia( "image/svg+xml" ) ),
                       GAPToJulia( DotToSVG( DotVertexLabelledDigraph( c ) ) ) );
        
    elif IsRunningInPluto( ) then
        
        JuliaEvalString( "import PlutoUI" );
        
        return Julia.PlutoUI.Show(
                       Julia.Base.MIME( GAPToJulia( "image/svg+xml" ) ),
                       GAPToJulia( DotToSVG( DotVertexLabelledDigraph( c ) ) ) );
        
    fi;
    
    TryNextMethod( );
    
end );

##
InstallOtherMethod( SetLabel,
        "for a lazy category cell and a julia object",
        [ IsLazyCapCategoryCell, IsJuliaObject ],

  function( c, str )
    
    SetLabel( c, JuliaToGAP( IsString, str ) );
    
end );

##
InstallMethod( VisualizeInJulia,
        "for a cell in a lazy CAP category",
        [ IsLazyCapCategoryCell ],
        
  function( c )
    
    Julia.Base.display(
            Julia.Base.MIME( GAPToJulia( "image/svg+xml" ) ),
            GAPToJulia( DotToSVG( DotVertexLabelledDigraph( c ) ) ) );
    
end );

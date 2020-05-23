##
InstallMethod( RightQuiver,
        [ IsJuliaObject, IsInt, IsJuliaObject ],
        
  function( label_with_patterns, num_vertices, arrows )
    
    return RightQuiver( JuliaToGAP( IsString, label_with_patterns ), num_vertices, ConvertJuliaToGAP( IsList, arrows ) );
    
end );

##
InstallMethod( RightQuiver,
        [ IsJuliaObject, IsJuliaObject, IsJuliaObject ],
        
  function( label_with_patterns, vertex_labels, arrows )
    
    return RightQuiver( JuliaToGAP( IsString, label_with_patterns ), ConvertJuliaToGAP( vertex_labels ), ConvertJuliaToGAP( arrows ) );
    
end );

##
InstallMethod( RightQuiver,
        [ IsJuliaObject ],
        
  function( description )
    
    return RightQuiver( JuliaToGAP( IsString, description ) );
    
end );

##
InstallMethod( RightQuiver,
        [ IsJuliaObject, IsInt, IsJuliaObject, IsJuliaObject ],
        
  function( label_with_patterns_list, num_vertices, vertex_labels, arrows )
    
    return RightQuiver( JuliaToGAP( IsString, label_with_patterns_list ), num_vertices, ConvertJuliaToGAP( vertex_labels ), ConvertJuliaToGAP( arrows ) );
    
end );

##
InstallMethod( RightQuiver,
        [ IsObject, IsJuliaObject, IsJuliaObject, IsJuliaObject, IsJuliaObject ],
        
  function( label, vertex_labels, arrow_labels, source_indices, target_indices )
    
    return RightQuiver(
                   JuliaToGAP( IsString, label ), ConvertJuliaToGAP( vertex_labels ), ConvertJuliaToGAP( arrow_labels ),
                   JuliaToGAP( IsList, source_indices ), JuliaToGAP( IsList, target_indices ) );
    
end );

##
InstallMethod( LeftQuiver,
        [ IsJuliaObject, IsInt, IsJuliaObject ],
        
  function( label_with_patterns, num_vertices, arrows )
    
    return LeftQuiver( JuliaToGAP( IsString, label_with_patterns ), num_vertices, ConvertJuliaToGAP( IsList, arrows ) );
    
end );

##
InstallMethod( LeftQuiver,
        [ IsJuliaObject, IsJuliaObject, IsJuliaObject ],
        
  function( label_with_patterns, vertex_labels, arrows )
    
    return LeftQuiver( JuliaToGAP( IsString, label_with_patterns ), ConvertJuliaToGAP( vertex_labels ), ConvertJuliaToGAP( arrows ) );
    
end );

##
InstallMethod( LeftQuiver,
        [ IsJuliaObject ],
        
  function( description )
    
    return LeftQuiver( JuliaToGAP( IsString, description ) );
    
end );

##
InstallMethod( LeftQuiver,
        [ IsJuliaObject, IsInt, IsJuliaObject, IsJuliaObject ],
        
  function( label_with_patterns_list, num_vertices, vertex_labels, arrows )
    
    return LeftQuiver( JuliaToGAP( IsString, label_with_patterns_list ), num_vertices, ConvertJuliaToGAP( vertex_labels ), ConvertJuliaToGAP( arrows ) );
    
end );

##
InstallMethod( LeftQuiver,
        [ IsObject, IsJuliaObject, IsJuliaObject, IsJuliaObject, IsJuliaObject ],
        
  function( label, vertex_labels, arrow_labels, source_indices, target_indices )
    
    return LeftQuiver(
                   JuliaToGAP( IsString, label ), ConvertJuliaToGAP( vertex_labels ), ConvertJuliaToGAP( arrow_labels ),
                   JuliaToGAP( IsList, source_indices ), JuliaToGAP( IsList, target_indices ) );
    
end );

## does not work
InstallOtherMethod( \/,
        [ IsPathAlgebra, IsJuliaObject ],

  function( A, relations )
    
    return A / JuliaToGAP( IsList, relations );
    
end );

##
InstallMethod( QuiverRowsObject,
        [ IsJuliaObject, IsQuiverRowsCategory ],
        
  function( list_of_vertices, category )
    
    return QuiverRowsObject( ConvertJuliaToGAP( list_of_vertices ), category );
    
end );

##
InstallMethod( QuiverRowsMorphism,
        [ IsQuiverRowsObject, IsJuliaObject, IsQuiverRowsObject ],
        
  function( source, matrix, range )
    
    return QuiverRowsMorphism( source, ConvertJuliaToGAP( matrix ), range );
    
end );


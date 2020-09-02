#
# InternalModules: Modules over internal algebras
#
# Implementations
#

##
InstallMethod( RepresentationCategoryObject,
        "for a character, a CAP category, and a string",
        [ IsCharacter, IsCapCategory, IsString ],
        
  function ( irr_char, category, str )
    
    SetString( GIrreducibleObject( irr_char ), str );
    
    return RepresentationCategoryObject( irr_char, category );
    
end );

##
DeclareOperation( "IsShowable",
        [ IsString, IsSemisimpleCategoryObject, ] );

##
InstallMethod( IsShowable,
        "for a string and a an element in an internal algebra or module",
        [ IsString, IsSemisimpleCategoryObject ],
        
  function ( mime, e )
    
    if not mime in [ "text/plain", "text/latex", "application/x-latex" ] then
        TryNextMethod();
    fi;
    
    return true;
    
end );

##
BindGlobal( "LaTeXStringOfSemisimpleCategoryObjectList",
  function ( object_list )
    local size, parts;
    
    size := Size( object_list );
    
    if size = 0 then
        
        return "0";
        
    fi;
    
    parts := List( object_list, function ( l )
      local mult, irr, string;
        
        mult := l[1];
        irr := l[2];
        
        if mult = 1 then
            
            string := "";
            
        else
            
            string := Concatenation( String( mult ), " \\cdot " );
            
        fi;
        
        if false and IsShowable( "text/latex", irr ) then
            
            Append( string, LaTeXString( irr ) );
            
        else
            
            Append( string, String( irr ) );
            
        fi;
        
        return string;
        
    end );
    
    return JoinStringsWithSeparator( parts, " \\oplus " );
    
end );

##
InstallMethod( LaTeXString,
        "for an element in an internal algebra or module",
        [ IsSemisimpleCategoryObject ],
        
  function ( object )
    
    return LaTeXStringOfSemisimpleCategoryObjectList( SemisimpleCategoryObjectList( object ) );
    
end );

##
DeclareOperation( "IsShowable",
        [ IsString, IsSemisimpleCategoryMorphism, ] );

##
InstallMethod( IsShowable,
        "for a string and a an element in an internal algebra or module",
        [ IsString, IsSemisimpleCategoryMorphism ],
        
  function ( mime, e )
    
    if not mime in [ "text/plain", "text/latex", "application/x-latex" ] then
        TryNextMethod();
    fi;
    
    return true;
    
end );

##
InstallMethod( LaTeXString,
        "for an element in an internal algebra or module",
        [ IsSemisimpleCategoryMorphism ],
        
  function ( morphism )
    local morphism_list, object_list, object_string, diag_entries, matrix, string, elem;
    
    morphism_list := SemisimpleCategoryMorphismList( morphism );
    
    morphism_list := Filtered( morphism_list, pair -> not( IsZeroForObjects( Source( pair[1] ) ) or IsZeroForObjects( Range( pair[1] ) ) ) );
    
    if IsEmpty( morphism_list ) then
        
        Display( "0" );
        
    else
        
        object_list := List( morphism_list, m -> [ NrRows( UnderlyingMatrix( m[1] ) ), m[2] ] );
        
        object_string := LaTeXStringOfSemisimpleCategoryObjectList( object_list );
        
        diag_entries := [ ];
        
        for elem in morphism_list do
            
            matrix := UnderlyingMatrix( elem[1] );
            
            if NrRows( matrix ) = 1 then
                
                Add( diag_entries, LaTeXString( matrix[1, 1] ) );
                
            else
                
                Add( diag_entries, LaTeXString( matrix ) );
                
            fi;
            
        od;
        
        string := "";
        Append( string, object_string );
        Append( string, " \\xrightarrow{\\operatorname{diag}(" );
        Append( string, JoinStringsWithSeparator( diag_entries, "," ) );
        Append( string, ")} " );
        Append( string, object_string );
        
        return string;
        
    fi;
    
end );

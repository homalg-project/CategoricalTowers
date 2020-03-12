#
# SubcategoriesForCAP
#
# FunctorsForFullSubcategories.gi

##
InstallMethod( InclusionFunctor,
        [ IsCapFullSubcategory ],
  function( A )
    local C, name, F;
    
    C := AmbientCategory( A );
    
    name := Concatenation( "The inclusion functor from ", Name( A ), " in ", Name( C ) );
    
    F := CapFunctor( name, A, C );
    
    AddObjectFunction( F,
      function( a )
        
        return UnderlyingCell( a );
        
    end );
    
    AddMorphismFunction( F,
      function( s, alpha, r )
        
        return UnderlyingCell( alpha );
        
    end );
    
    return F;
    
end );

##
InstallMethodWithCache( RestrictFunctorToFullSubcategoryOfSource,
          [ IsCapFunctor, IsCapFullSubcategory ],
  function( F, full )
    local source_F, range_F, name, R;
    
    source_F := AsCapCategory( Source( F ) );
    
    range_F := AsCapCategory( Range( F ) );
    
    if not IsIdenticalObj( AmbientCategory( full ), source_F ) then
      
      Error( "The source of ", Name( F ), " is not identical to the ambient category of ", Name( full ) );
      
    fi;
    
    name := Concatenation( "The restriction of ", Name( F ), " to a full subcategory of the source" );
    
    R := CapFunctor( name, full, range_F );
    
    AddObjectFunction( R,
      function( a )
        
        return ApplyFunctor( F, UnderlyingCell( a ) );
        
    end );
    
    AddMorphismFunction( R,
      function( s, alpha, r )
        
        return ApplyFunctor( F, UnderlyingCell( alpha ) );
        
    end );
    
    return R;
    
end );

##
InstallMethodWithCache( RestrictFunctorToFullSubcategoryOfRange,
          [ IsCapFunctor, IsCapFullSubcategory ],
  function( F, full )
    local source_F, range_F, name, R;
    
    source_F := AsCapCategory( Source( F ) );
    
    range_F := AsCapCategory( Range( F ) );
    
    if not IsIdenticalObj( AmbientCategory( full ), range_F ) then
      
      Error( "The range of ", Name( F ), " is not identical to the ambient category of ", Name( full ) );
      
    fi;
    
    name := Concatenation( "The restriction of ", Name( F ), " to a full subcategory of the range" );
    
    R := CapFunctor( name, source_F, full );
    
    AddObjectFunction( R,
      function( a )
        
        return AsSubcategoryCell( full, ApplyFunctor( F, a ) );
        
    end );
    
    AddMorphismFunction( R,
      function( s, alpha, r )
        
        return AsSubcategoryCell( s, ApplyFunctor( F, alpha ), r );
        
    end );
    
    return R;
    
end );

##
InstallMethodWithCache( RestrictFunctorToFullSubcategories,
          [ IsCapFunctor, IsCapFullSubcategory, IsCapFullSubcategory ],
  function( F, full_1, full_2 )
    local source_F, range_F, name, R;
    
    source_F := AsCapCategory( Source( F ) );
    
    range_F := AsCapCategory( Range( F ) );
    
    if not IsIdenticalObj( AmbientCategory( full_1 ), source_F ) then
      
      Error( "The source of ", Name( F ), " is not identical to the ambient category of ", Name( full_1 ) );
      
    fi;
    
    if not IsIdenticalObj( AmbientCategory( full_2 ), range_F ) then
      
      Error( "The range of ", Name( F ), " is not identical to the ambient category of ", Name( full_2 ) );
      
    fi;
   
    name := Concatenation( "The restriction of ", Name( F ), " to full subcategories in source and range" );
    
    R := CapFunctor( name, full_1, full_2 );
    
    AddObjectFunction( R,
      function( a )
        
        return AsSubcategoryCell( full_2, ApplyFunctor( F, UnderlyingCell( a ) ) );
        
    end );
    
    AddMorphismFunction( R,
      function( s, alpha, r )
        
        return AsSubcategoryCell( s, ApplyFunctor( F, UnderlyingCell( alpha ) ), r );
        
    end );
    
    return R;
   
end );

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
    local name, R;
    
    if IsIdenticalObj( AsCapCategory( Source( F ) ), AmbientCategory( full ) ) then
      
      name := "Restriction of a functor to a full subcategory of source";
      
      R := CapFunctor( name, full, AsCapCategory( Range( F ) ) );
      
      AddObjectFunction( R, a -> ApplyFunctor( F, UnderlyingCell( a ) ) );
      
      AddMorphismFunction( R, { s, alpha, r } -> ApplyFunctor( F, UnderlyingCell( alpha ) ) );
      
      return R;
      
    elif IsCapFullSubcategory( AmbientCategory( full ) ) then
      
      F := RestrictFunctorToFullSubcategoryOfSource( F, AmbientCategory( full ) );
      
      return RestrictFunctorToFullSubcategoryOfSource( F, full );
      
    else
      
      Error( "Wrong input!\n" );
      
    fi;
    
end );

##
InstallMethodWithCache( RestrictFunctorToFullSubcategoryOfRange,
              [ IsCapFunctor, IsCapFullSubcategory ],
  function( F, full )
    local name, R;
    
    if IsIdenticalObj( AsCapCategory( Range( F ) ), AmbientCategory( full ) ) then
      
      name := "Restriction of a functor to a full subcategory of range";
      
      R := CapFunctor( name, AsCapCategory( Source( F ) ), full );
      
      AddObjectFunction( R, a -> ApplyFunctor( F, UnderlyingCell( a ) ) );
      
      AddMorphismFunction( R, { s, alpha, r } -> ApplyFunctor( F, UnderlyingCell( alpha ) ) );
      
      return R;
      
    elif IsCapFullSubcategory( AmbientCategory( full ) ) then
      
      F := RestrictFunctorToFullSubcategoryOfRange( F, AmbientCategory( full ) );
      
      return RestrictFunctorToFullSubcategoryOfRange( F, full );
      
    else
      
      Error( "Wrong input!\n" );
      
    fi;
    
end );

##
InstallMethodWithCache( RestrictFunctorToFullSubcategories,
          [ IsCapFunctor, IsCapFullSubcategory, IsCapFullSubcategory ],
  function( F, full_1, full_2 )
    
    F := RestrictFunctorToFullSubcategoryOfRange(
            RestrictFunctorToFullSubcategoryOfSource( F, full_1 ), full_2
          );
    
    F!.Name := "Restriction of a functor to full subcategories of source and range";
    
    return F;
    
end );


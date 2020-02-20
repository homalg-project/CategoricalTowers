#
# CatReps: Representations and cohomology of finite categories
#
# Implementations
#

##
InstallGlobalFunction( ConvertToMapOfFinSets,
   function( objects, gen )
    
    ## code
    
end );

##
InstallMethod( ConcreteCategoryForCAP,
        "for a list",
        [ IsList ],
        
  function( L )
    local C, c;
    
    C := Subcategory( FinSets, "A finite concrete category" );

    SetFilterObj( C, IsFiniteConcreteCategory );

    c := ConcreteCategory( L );

    C!.ConcreteCategoryRecord := c;
    
    SetOfObjects( C, List( c.objects, FinSet ) );
    #SetOfGeneratingMorphism( C, c.generators );
    
    return C;
    
end );


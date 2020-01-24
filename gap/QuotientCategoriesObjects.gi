#############################################################################
##
##  QuotientCategories: Quotient categories for CAP categories
##
##  Copyright 2019, Kamal Saleh, University of Siegen
##
#############################################################################

##
InstallMethod( QuotientCategoryObject,
               [ IsQuotientCategory, IsCapCategoryObject ],
  
  function( quotient_category, a )
    local quotient_a;
  
    if not IsIdenticalObj( CapCategory( a ), UnderlyingCategory( quotient_category ) ) then
      
      Error( "Wrong input!" );
      
    fi;
    
    quotient_a := rec( );
    
    ObjectifyObjectForCAPWithAttributes( quotient_a, quotient_category,
                                         UnderlyingCell, a );
    
    return quotient_a;
    
end );

##
InstallMethod( \/,
          [ IsCapCategoryObject, IsQuotientCategory ],
  {a,Q} -> QuotientCategoryObject( Q, a )
);

##
InstallMethod( Display,
            [ IsQuotientCategoryObject ],
  function( a )
    local test_function, name;
    
    test_function := CongruencyTestFunctionForQuotientCategory( CapCategory( a ) );
    
    name := NameFunction( test_function );
    
    if name = "unknown" then
      
      name := "a congruency test function";
    
    fi;
    
    Print( "Quotient object defined by:\n\n" );
    
    Display( UnderlyingCell( a ) );
    
    Print( "\nmodulo ", name );
    
end );


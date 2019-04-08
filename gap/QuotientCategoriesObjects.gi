#############################################################################
##
##  QuotientCategoriesForCAP: Quotient categories for CAP categories
##
##  Copyright 2019, Kamal Saleh, University of Siegen
##
#############################################################################

##
InstallMethod( AsQuotientCategoryObject,
               [ IsQuotientCategory, IsCapCategoryObject ],
  
  function( quotient_category, a )
    local quotient_a;
  
    if not IsIdenticalObj( CapCategory( a ), UnderlyingCapCategory( quotient_category ) ) then
      
      Error( "Wrong input!" );
      
    fi;
    
    quotient_a := rec( );
    
    ObjectifyObjectForCAPWithAttributes( quotient_a, quotient_category,
                                         UnderlyingCapCategoryObject, a );
    
    return quotient_a;
    
end );

##
InstallMethod( Display,
            [ IsQuotientCategoryObject ],
  function( a )
    local test_function;
    
    test_function := CongruencyTestFunctionForQuotientCategory( CapCategory( a ) );
    
    Print( "Quotient object defined by:\n\n" );
    
    Display( UnderlyingCapCategoryObject( a ) );
    
    Print( "\nmodulo ", NameFunction( test_function ) );
    
end );


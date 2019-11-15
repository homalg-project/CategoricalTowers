#############################################################################
##
##  QuotientCategoriesForCAP: Quotient categories for CAP categories
##
##  Copyright 2019, Kamal Saleh, University of Siegen
##
#############################################################################

##
InstallMethod( QuotientCategoryMorphism,
               [ IsQuotientCategory, IsCapCategoryMorphism ],
  
  function( quotient_category, alpha )
    local quotient_alpha, source, range;
  
    if not IsIdenticalObj( CapCategory( alpha ), UnderlyingCapCategory( quotient_category ) ) then
      
      Error( "Wrong input!" );
      
    fi;
    
    quotient_alpha := rec( );
    
    source := QuotientCategoryObject( quotient_category, Source( alpha ) );
    
    range := QuotientCategoryObject( quotient_category, Range( alpha ) );
    
    ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( quotient_alpha, quotient_category,
                                           source,
                                           range,
                                           UnderlyingCapCategoryMorphism, alpha );
    
    return quotient_alpha;
    
end );

##
InstallMethod( Display,
            [ IsQuotientCategoryMorphism ],
  function( alpha )
    local name, test_function;
    
    test_function := CongruencyTestFunctionForQuotientCategory( CapCategory( alpha ) );
    
    name := NameFunction( test_function );
    
    if name = "unknown" then
      
      name := "a congruency test function";
      
    fi;
    
    Print( "Quotient morphism defined by:\n\n" );
    
    Display( UnderlyingCapCategoryMorphism( alpha ) );
    
    Print( "\nmodulo ", name );
    
end );


#############################################################################
##
##  QuotientCategories: Quotient categories for CAP categories
##
##  Copyright 2019, Kamal Saleh, University of Siegen
##
#############################################################################

##
InstallMethod( QuotientCategoryMorphism,
               [ IsQuotientCategory, IsCapCategoryMorphism ],
  
  function( quotient_category, alpha )
    local quotient_alpha, source, range;
  
    if not IsIdenticalObj( CapCategory( alpha ), UnderlyingCategory( quotient_category ) ) then
      
      Error( "Wrong input!" );
      
    fi;
    
    quotient_alpha := rec( );
    
    source := QuotientCategoryObject( quotient_category, Source( alpha ) );
    
    range := QuotientCategoryObject( quotient_category, Range( alpha ) );
    
    ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( quotient_alpha, quotient_category,
                                           source,
                                           range,
                                           UnderlyingCell, alpha );
    
    return quotient_alpha;
    
end );

##
InstallMethod( \/,
          [ IsCapCategoryMorphism, IsQuotientCategory ],
  {a,Q} -> QuotientCategoryMorphism( Q, a )
);

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
    
    Display( UnderlyingCell( alpha ) );
    
    Print( "\nmodulo ", name );
    
end );


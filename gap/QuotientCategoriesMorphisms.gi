#############################################################################
##
##  QuotientCategoriesForCAP: Quotient categories for CAP categories
##
##  Copyright 2019, Kamal Saleh, University of Siegen
##
#############################################################################

##
InstallMethod( AsQuotientCategoryMorphism,
               [ IsQuotientCategory, IsCapCategoryMorphism ],
  
  function( quotient_category, alpha )
    local quotient_alpha, source, range;
  
    if not IsIdenticalObj( CapCategory( alpha ), UnderlyingCapCategory( quotient_category ) ) then
      
      Error( "Wrong input!" );
      
    fi;
    
    quotient_alpha := rec( );
    
    source := AsQuotientCategoryObject( quotient_category, Source( alpha ) );
    
    range := AsQuotientCategoryObject( quotient_category, Range( alpha ) );
    
    ObjectifyMorphismForCAPWithAttributes( quotient_alpha, quotient_category,
                                           Source, source,
                                           Range, range,
                                           UnderlyingCapCategoryMorphism, alpha );
    
    return quotient_alpha;
    
end );

##
InstallMethod( Display,
            [ IsQuotientCategoryMorphism ],
  function( alpha )
    local test_function;
    
    test_function := CongruencyTestFunctionForQuotientCategory( CapCategory( alpha ) );
    
    Print( "Quotient morphism defined by:\n\n" );
    
    Display( UnderlyingCapCategoryMorphism( alpha ) );
    
    Print( "\nmodulo ", NameFunction( test_function ) );
    
end );


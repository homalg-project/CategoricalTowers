# SPDX-License-Identifier: GPL-2.0-or-later
# QuotientCategories: Quotient categories of CAP categories by two-sided ideals
#
# Implementations
#

##
InstallMethod( QuotientCategoryMorphism,
               [ IsQuotientCategoryObject, IsCapCategoryMorphism, IsQuotientCategoryObject ],
  
  function( quotient_source, alpha, quotient_range )
    local quotient_category, quotient_alpha;
    
    quotient_category := CapCategory( quotient_source );
    
    if not IsIdenticalObj( CapCategory( alpha ), UnderlyingCategory( quotient_category ) ) then
      
      Error( "Wrong input!" );
      
    fi;

    quotient_alpha := rec( );
        
    ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( quotient_alpha, quotient_category,
                                           quotient_source,
                                           quotient_range,
                                           UnderlyingCell, alpha );
    
    return quotient_alpha;
    
end );

##
InstallMethod( QuotientCategoryMorphism,
               [ IsQuotientCategory, IsCapCategoryMorphism ],
  function( quotient_category, alpha )
    local quotient_source, quotient_range;
        
    quotient_source := QuotientCategoryObject( quotient_category, Source( alpha ) );
    
    quotient_range := QuotientCategoryObject( quotient_category, Range( alpha ) );
    
    return QuotientCategoryMorphism( quotient_source, alpha, quotient_range );
    
end );

##
InstallMethod( \/,
          [ IsCapCategoryMorphism, IsQuotientCategory ],
  function( alpha, quotient_category )
    
    if not IsIdenticalObj( CapCategory( alpha ), UnderlyingCategory( quotient_category ) ) then
      
      TryNextMethod( );
      
    fi;
    
    return QuotientCategoryMorphism( quotient_category, alpha );
    
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
    
    Display( UnderlyingCell( alpha ) );
    
    Print( "\nmodulo ", name );
    
end );


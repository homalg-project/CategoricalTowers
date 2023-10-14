# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
InstallMethod( EnrichmentSpecificFiniteStrictCoproductCompletion,
        "for a category",
        [ IsCapCategory ],
        
  function( C )
    
    if not HasRangeCategoryOfHomomorphismStructure( C ) then
        Error( "the category `C` has no RangeCategoryOfHomomorphismStructure\n" );
    fi;
    
    return EnrichmentSpecificFiniteStrictCoproductCompletion( C, RangeCategoryOfHomomorphismStructure( C ) );
    
end );

##
InstallMethod( TensorizeObjectWithObjectInRangeCategoryOfHomomorphismStructure,
        "for an object in a cocartesian category and an object in the its range category of the homomorphism structure",
        [ IsCapCategoryObject, IsCapCategoryObject ],
        
  function( c, h )
    local UC;
    
    UC := EnrichmentSpecificFiniteStrictCoproductCompletion( CapCategory( c ) );
    
    return TensorizeObjectWithObjectInRangeCategoryOfHomomorphismStructure( RangeCategoryOfHomomorphismStructure( UC ), UC, c, h );
    
end );

##
InstallMethod( TensorizeObjectWithMorphismInRangeCategoryOfHomomorphismStructure,
        "an object in a cocartesian category and a morphism in its range category of the homomorphism structure",
        [ IsCapCategoryObject, IsCapCategoryMorphism ],
        
  function( c, nu )
    local UC, H;
    
    UC := EnrichmentSpecificFiniteStrictCoproductCompletion( CapCategory( c ) );
    H := RangeCategoryOfHomomorphismStructure( UC );
    
    return TensorizeObjectWithMorphismInRangeCategoryOfHomomorphismStructure( H, UC,
                   TensorizeObjectWithObjectInRangeCategoryOfHomomorphismStructure( H, UC, c, Source( nu ) ),
                   c,
                   nu,
                   TensorizeObjectWithObjectInRangeCategoryOfHomomorphismStructure( H, UC, c, Target( nu ) ) );
    
end );

##
InstallMethod( TensorizeMorphismWithObjectInRangeCategoryOfHomomorphismStructure,
        "for a morphism in a cocartesian category and an object in its range category of the homomorphism structure",
        [ IsCapCategoryMorphism, IsCapCategoryObject ],
        
  function( phi, h )
    local UC, H;
    
    UC := EnrichmentSpecificFiniteStrictCoproductCompletion( CapCategory( phi ) );
    H := RangeCategoryOfHomomorphismStructure( UC );
    
    return TensorizeMorphismWithObjectInRangeCategoryOfHomomorphismStructure( H, UC,
                   TensorizeObjectWithObjectInRangeCategoryOfHomomorphismStructure( H, UC, Source( phi ), h ),
                   phi,
                   h,
                   TensorizeObjectWithObjectInRangeCategoryOfHomomorphismStructure( H, UC, Target( phi ), h ) );
    
end );

#
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Implementations
#

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_SLICE_CATEGORY,
  [
   "AdditionForMorphisms",
   "AdditiveInverseForMorphisms",
   # "Colift" cannot be derived from the ambient category
   "ColiftAlongEpimorphism",
   "IdentityMorphism",
   "InverseImmutable",
   "IsAutomorphism",
   "IsColiftableAlongEpimorphism",
   "IsCongruentForMorphisms",
   "IsIdenticalToIdentityMorphism",
   "IsIdenticalToZeroMorphism",
   "IsInitial",
   "IsIsomorphism",
   "IsLiftable",
   "IsLiftableAlongMonomorphism",
   "IsOne",
   "IsSplitEpimorphism", ## this is a special case of Lift
   # "IsSplitMonomorphism" cannot be derived from the ambient category, a special case of Colift
   # "IsTerminal": no natural underlying morphism from terminal object to base, and even if = IsInitial then the universal morphism into terminal is not well-defined (i.g.)
   # "IsZeroForMorphisms" does not make sense, since a zero object only becomes an initial object (unless the category is terminal)
   # "IsZeroForObjects"
   "Lift",
   "LiftAlongMonomorphism",
   "MultiplyWithElementOfCommutativeRingForMorphisms",
   "PostCompose",
   "PreCompose",
   "SubtractionForMorphisms",
   "UniversalMorphismFromInitialObject",
   "UniversalMorphismFromInitialObjectWithGivenInitialObject",
   "ZeroMorphism"
   ] );

##################################
##
## Attributes
##
##################################

##
InstallMethod( DualOverTensorUnit,
        [ IsCapCategoryMorphism ],
        
  function( J )
    local R;
    
    R := TensorUnit( CapCategory( J ) );

    ## R -> InternalHom( J, R )
    return PreCompose(
                   [ Inverse( EvaluationMorphism( R, R ) ), ## R -> InternalHom( R, R ) ⊗ R
                     RightUnitor( InternalHom( R, R ) ), ## InternalHom( R, R ) ⊗ R -> InternalHom( R, R )
                     InternalHom( J, R ) ] ); ## InternalHom( R, R ) -> InternalHom( R^m, R )
    
end );

##################################
##
## Operations
##
##################################

##
InstallMethod( MorphismFromCovariantArgumentOfInternalHom,
        "for two objects in a slice category over a tensor unit",
        [ IsCapCategoryObjectInASliceCategoryOverTensorUnit, IsCapCategoryObjectInASliceCategoryOverTensorUnit ],
        
  function( J, I )
    local source, target;
    
    source := I;
    target := InternalHom( J, I );
    
    I := UnderlyingMorphism( I );
    J := UnderlyingMorphism( J );

    return AsSliceCategoryCell(
                   source,
                   UniversalMorphismIntoBiasedWeakFiberProduct(
                           DualOverTensorUnit( J ),
                           InternalHom( Source( J ), I ),
                           I ),
                   target );
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( ViewObj,
    [ IsCapCategoryObjectInASliceCategory ],
  function( a )
    
    Print( "An object in the slice category given by: " );
    
    ViewObj( UnderlyingMorphism( a ) );
    
end );

##
InstallMethod( ViewObj,
    [ IsCapCategoryMorphismInASliceCategory ],
  function( phi )
    
    Print( "A morphism in the slice category given by: " );
    
    ViewObj( UnderlyingCell( phi ) );
    
end );

##
InstallMethod( Display,
    [ IsCapCategoryObjectInASliceCategory ],
  function( a )
    
    Display( UnderlyingMorphism( a ) );
    
    Display( "\nAn object in the slice category given by the above data" );
    
end );

##
InstallMethod( Display,
    [ IsCapCategoryMorphismInASliceCategory ],
  function( phi )
    
    Display( UnderlyingCell( phi ) );
    
    Display( "\nA morphism in the slice category given by the above data" );
    
end );

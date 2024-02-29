# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Implementations
#

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_FULL_SUBCATEGORY,
  [
   "AdditionForMorphisms",
   "AdditiveInverseForMorphisms",
   "Colift",
   "InverseForMorphisms",
   "IsAutomorphism",
   "IsColiftable",
   "IsIsomorphism",
   "IsLiftable",
   "IsSplitEpimorphism",
   "IsSplitMonomorphism",
   "IsZeroForMorphisms",
   "Lift",
   "MultiplyWithElementOfCommutativeRingForMorphisms",
   "SubtractionForMorphisms",
   "ZeroMorphism"
   ] );

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_ADDITIVE_FULL_SUBCATEGORY,
  [
   "ComponentOfMorphismFromDirectSum",
   "ComponentOfMorphismIntoDirectSum",
   "DirectSum",
   "DirectSumCodiagonalDifference",
   "DirectSumDiagonalDifference",
   "DirectSumFunctorialWithGivenDirectSums",
   "DirectSumProjectionInPushout",
   "InjectionOfCofactorOfDirectSum",
   "InjectionOfCofactorOfDirectSumWithGivenDirectSum",
   "IsomorphismFromCoproductToDirectSum",
   "IsomorphismFromDirectProductToDirectSum",
   "IsomorphismFromDirectSumToCoproduct",
   "IsomorphismFromDirectSumToDirectProduct",
   "IsZeroForObjects",
   "MorphismBetweenDirectSumsWithGivenDirectSums",
   "ProjectionInFactorOfDirectSum",
   "ProjectionInFactorOfDirectSumWithGivenDirectSum",
   "UniversalMorphismFromDirectSum",
   "UniversalMorphismFromDirectSumWithGivenDirectSum",
   "UniversalMorphismIntoDirectSum",
   "UniversalMorphismIntoDirectSumWithGivenDirectSum",
   "UniversalMorphismFromZeroObject",
   "UniversalMorphismFromZeroObjectWithGivenZeroObject",
   "UniversalMorphismIntoZeroObject",
   "UniversalMorphismIntoZeroObjectWithGivenZeroObject",
   "ZeroObject",
   "ZeroObjectFunctorial",
   ] );

##
InstallMethod( FullSubcategory,
        "for a CAP category and a string",
        [ IsCapCategory, IsString ],
        
  function( C, name )
    local D;
    
    D := Subcategory( C, name : is_full := true, FinalizeCategory := false );
    
    if CanCompute( C, "MultiplyWithElementOfCommutativeRingForMorphisms" ) then
        
        ##
        AddMultiplyWithElementOfCommutativeRingForMorphisms( D,
          function( cat, r, phi )
            
            return AsSubcategoryCell( cat, MultiplyWithElementOfCommutativeRingForMorphisms( AmbientCategory( cat ), r, UnderlyingCell( phi ) ) );
            
        end );
        
    fi;
    
    if HasRangeCategoryOfHomomorphismStructure( C ) then
        
        SetRangeCategoryOfHomomorphismStructure( D, RangeCategoryOfHomomorphismStructure( C ) );
        
        if CanCompute( C, "DistinguishedObjectOfHomomorphismStructure" ) then
            AddDistinguishedObjectOfHomomorphismStructure( D,
              function( cat )
                
                return DistinguishedObjectOfHomomorphismStructure( AmbientCategory( cat ) );
                
            end );
        fi;
        
        if CanCompute( C, "HomomorphismStructureOnObjects" ) then
            AddHomomorphismStructureOnObjects( D,
              function( cat, a, b )
                
                return HomomorphismStructureOnObjects( AmbientCategory( cat ), UnderlyingCell( a ), UnderlyingCell( b ) );
                
            end );
        fi;
        
        if CanCompute( C, "HomomorphismStructureOnMorphismsWithGivenObjects" ) then
            AddHomomorphismStructureOnMorphismsWithGivenObjects( D,
              function( cat, s, alpha, beta, r )
                
                return HomomorphismStructureOnMorphismsWithGivenObjects( AmbientCategory( cat ), s, UnderlyingCell( alpha ), UnderlyingCell( beta ), r );
                
            end );
        fi;
        
        if CanCompute( C, "InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure" ) then
            AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( D,
              function( cat, alpha )
                
                return InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( AmbientCategory( cat ), UnderlyingCell( alpha ) );
                
            end );
        fi;
        
        if CanCompute( C, "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism" ) then
            AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( D,
              function( cat, a, b, iota )
                
                return AsSubcategoryCell( cat, InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( AmbientCategory( cat ), UnderlyingCell( a ), UnderlyingCell( b ), iota ) );
                
            end );
        fi;
        
        if CanCompute( C, "BasisOfExternalHom" ) and CanCompute( C, "CoefficientsOfMorphism" ) then
            
            AddBasisOfExternalHom( D,
              function( cat, a, b )
                
                return List( BasisOfExternalHom( AmbientCategory( cat ), UnderlyingCell( a ), UnderlyingCell( b ) ), m -> AsSubcategoryCell( cat, m ) );
                
            end );
            
            AddCoefficientsOfMorphism( D,
              function( cat, alpha )
                
                return CoefficientsOfMorphism( AmbientCategory( cat ), UnderlyingCell( alpha ) );
                
            end );
            
        fi;
        
    fi;
    
    Finalize( D );
    
    return D;
    
end );

##
InstallGlobalFunction( FullSubcategoryGeneratedByListOfObjects,
  function( L )
    local C, name, full;
    
    if L = [ ] then
        Error( "the input list is empty\n" );
    fi;
    
    C := CapCategory( L[1] );
    
    L := ShallowCopy( L );
    
    MakeImmutable( L );
    
    name := ValueOption( "name_of_full_subcategory" );
    
    if name = fail then
      
      name := Name( C );
      
      if Size( L ) > 1 then
        name := Concatenation( "Full subcategory generated by ", String( Size( L ) ), " objects in ", name );
      else
        name := Concatenation( "Full subcategory generated by 1 object in ", name );
      fi;
      
    fi;
    
    full := FullSubcategory( C, name : FinalizeCategory := false );
    
    SetFilterObj( full, IsCapFullSubcategoryGeneratedByFiniteNumberOfObjects );
    
    full!.Objects := L;
    
    AddIsWellDefinedForObjects( full,
      function( cat, a )
        
        return ForAny( L, obj -> IsEqualForObjects( obj, UnderlyingCell( a ) ) );
        
    end );
    
    if CanCompute( C, "IsWellDefinedForMorphisms" ) then
      
      AddIsWellDefinedForMorphisms( full,
        function( cat, phi )
          
          return IsWellDefinedForObjects( cat, Source( phi ) ) and
                 IsWellDefinedForObjects( cat, Target( phi ) ) and
                 IsWellDefinedForMorphisms( AmbientCategory( cat ), UnderlyingCell( phi ) );
                    
      end );
      
    fi;
    
    SetSetOfKnownObjects( full, List( L, obj -> AsSubcategoryCell( full, obj ) ) );
    
    Finalize( full );
    
    return full;
    
end );

##
InstallMethod( \[\],
          [ IsCapFullSubcategoryGeneratedByFiniteNumberOfObjects, IsInt ],
  { full, i } -> SetOfKnownObjects( full )[ i ]
);

##
InstallMethod( FullSubcategoryOfIndecomposableProjectiveObjects,
          [ IsCapCategory ],
  
  function ( C )
    local name;
    
    if not CanCompute( C, "IndecomposableProjectiveObjects" ) then
      Error( "the operation 'IndecomposableProjectiveObjects' must be computable in the input category!\n" );
    fi;
    
    name := Concatenation( "FullSubcategoryOfIndecomposableProjectiveObjects( ", Name( C ), " )" );
    
    return FullSubcategoryGeneratedByListOfObjects( IndecomposableProjectiveObjects( C ) : name_of_full_subcategory := name );
    
end );

##
InstallMethod( FullSubcategoryOfIndecomposableInjectiveObjects,
          [ IsCapCategory ],
  
  function ( C )
    local name;
    
    if not CanCompute( C, "IndecomposableInjectiveObjects" ) then
      Error( "the operation 'IndecomposableInjectiveObjects' must be computable in the input category!\n" );
    fi;
    
    name := Concatenation( "FullSubcategoryOfIndecomposableInjectiveObjects( ", Name( C ), " )" );
    
    return FullSubcategoryGeneratedByListOfObjects( IndecomposableInjectiveObjects( C ) : name_of_full_subcategory := name );
    
end );


##
InstallGlobalFunction( FullSubcategoryByObjectMembershipFunction,
  function( C, membership_func )
    local name, full;
    
    name := ValueOption( "name_of_full_subcategory" );
    
    if name = fail then
        
        name := Name( C );
        
        name := Concatenation( "FullSubcategoryByObjectMembershipFunction( ", name, ", ObjectMembershipFunction )" );
        
    fi;
    
    full := FullSubcategory( C, name : FinalizeCategory := false );
    
    SetFilterObj( full, IsCapFullSubcategoryDefinedByObjectMembershipFunction );
    
    full!.ObjectMembershipFunction := membership_func;
    
    ##
    AddIsWellDefinedForObjects( full,
      function( cat, a )
        
        return IsWellDefinedForObjects( AmbientCategory( cat ), UnderlyingCell( a ) ) and
               cat!.ObjectMembershipFunction( cat, a );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( full,
      function( cat, alpha )
        
        return IsWellDefinedForMorphisms( AmbientCategory( cat ), UnderlyingCell( alpha ) ) and
               IsWellDefinedForObjects( cat, Source( alpha ) ) and
               IsWellDefinedForObjects( cat, Target( alpha ) );
        
    end );
    
    Finalize( full );
    
    return full;
    
end );

##
InstallMethod( FullSubcategoryOfProjectiveObjects,
          [ IsCapCategory ],
  
  function ( C )
    local name;
    
    name := Concatenation( "FullSubcategoryOfProjectiveObjects( ", Name( C ), " )" );
    
    return FullSubcategoryByObjectMembershipFunction( C, { cat, o } -> IsProjective( C, UnderlyingCell( o ) ) : name_of_full_subcategory := name );
    
end );

##
InstallMethod( FullSubcategoryOfInjectiveObjects,
          [ IsCapCategory ],
  
  function ( C )
    local name;
    
    name := Concatenation( "FullSubcategoryOfInjectiveObjects( ", Name( C ), " )" );
    
    return FullSubcategoryByObjectMembershipFunction( C, { cat, o } -> IsInjective( C, UnderlyingCell( o ) ) : name_of_full_subcategory := name );
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( ViewObj,
    [ IsObjectInAFullSubcategory ],
  function( a )
    
    Print( "An object in full subcategory given by: " );
    
    ViewObj( UnderlyingCell( a ) );
    
end );

##
InstallMethod( ViewObj,
    [ IsMorphismInAFullSubcategory ],
  function( phi )
    
    Print( "A morphism in full subcategory given by: " );
    
    ViewObj( UnderlyingCell( phi ) );
    
end );

##
InstallMethod( Display,
    [ IsObjectInAFullSubcategory ],
  function( a )
    
    Print( "An object in full subcategory given by: " );
    
    Display( UnderlyingCell( a ) );
    
end );

##
InstallMethod( Display,
    [ IsMorphismInAFullSubcategory ],
  function( phi )
    
    Print( "A morphism in full subcategory given by: " );
    
    Display( UnderlyingCell( phi ) );
    
end );

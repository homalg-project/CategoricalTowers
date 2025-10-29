# SPDX-License-Identifier: GPL-2.0-or-later
# FpLinearCategories: Finitely presented linear categories by generating quivers and relations
#
# Implementations
#

##
BindGlobal( "DATA_TABLES_OF_CATEGORY_FOR_LINEAR_CLOSURE_OF_PATH_CATEGORY_OR_QUOTIENT_OF_PATH_CATEGORY",
  
  function ( kC )
    local C, q, objs, gmors, external_homs;
    
    if not HasRangeCategoryOfHomomorphismStructure( kC ) then
        Error( "the linear closure category passed to 'DataTablesOfCategory' must be hom-finite!\n" );
    fi;
    
    C := UnderlyingCategory( kC );
    
    q := UnderlyingQuiver( C );
    
    objs := SetOfObjects( kC );
    
    gmors := SetOfGeneratingMorphisms( kC );
    
    external_homs :=  List( objs, s -> List( objs, t -> BasisOfExternalHom( kC, s, t ) ) );
    
    return NTuple( 5,
              #coefficients_ring,
              UnderlyingRing( kC ),
              #quiver
              q,
              #decomposition_indices_of_bases_elements
              List( external_homs,
                s -> List( s, hom_st -> List( hom_st, m -> MorphismIndices( CanonicalRepresentative( SupportMorphisms( m )[1] ) ) ) ) ),
              # hom_structure_objs_gmors
              List( objs,
                o -> List( gmors,
                  gm -> EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( HomomorphismStructureOnMorphisms( kC, IdentityMorphism( kC, o ), gm ) ) ) ) ),
              #hom_structure_gmors_objs
              List( objs,
                o -> List( gmors,
                  gm -> EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( HomomorphismStructureOnMorphisms( kC, gm, IdentityMorphism( kC, o ) ) ) ) ) ) );
    
end );

##
BindGlobal( "DATA_TABLES_OF_CATEGORY_FOR_QUOTIENT_CATEGORY_OF_LINEAR_CLOSURE_OF_PATH_CATEGORY_OR_QUOTIENT_OF_PATH_CATEGORY",
  
  function ( quo_kC )
    local kC, C, all_objs, support_objs, objs, all_gmors, support_gmors, gmors, q;
    
    if not HasRangeCategoryOfHomomorphismStructure( quo_kC ) then
        Error( "the quotient category passed to 'DataTablesOfCategory' must be hom-finite!" );
    fi;
    
    all_objs := SetOfObjects( quo_kC );
    support_objs := PositionsProperty( all_objs, o -> not IsZero( o ) );
    objs := all_objs{support_objs};
    
    all_gmors := SetOfGeneratingMorphisms( quo_kC );
    support_gmors := PositionsProperty( all_gmors, m -> not IsZero( m ) );
    gmors := all_gmors{support_gmors};
    
    q := UnderlyingQuiver( quo_kC );
    
    if Length( objs ) <> Length( all_objs ) or Length( gmors ) <> Length( all_gmors ) then
      
      q := FinQuiver(
              NTuple( 3,
                "q",
                NTuple( 3,
                  Length( support_objs ),
                  LabelsOfObjects( q ){support_objs},
                  LaTeXStringsOfObjects( q ){support_objs} ),
                NTuple( 5,
                  Length( support_gmors ),
                  List( IndicesOfSources( q ){support_gmors}, s -> SafePosition( support_objs, s ) ),
                  List( IndicesOfTargets( q ){support_gmors}, t -> SafePosition( support_objs, t ) ),
                  LabelsOfMorphisms( q ){support_gmors},
                  LaTeXStringsOfMorphisms( q ){support_gmors} ) ) );
      
    fi;
    
    return NTuple( 5,
              #coefficients_ring,
              CommutativeRingOfLinearCategory( quo_kC ),
              #quiver
              q,
              #decomposition_indices_of_bases_elements
              List( objs, s -> List( objs, t -> List( BasisOfExternalHom( quo_kC, s, t ), m ->
                List( MorphismIndices( CanonicalRepresentative( SupportMorphisms( CanonicalRepresentative( m ) )[1] ) ), index -> Position( support_gmors, index ) ) ) ) ),
              # hom_structure_objs_gmors
              List( objs, o -> List( gmors, gm ->
                EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( HomomorphismStructureOnMorphisms( quo_kC, IdentityMorphism( quo_kC, o ), gm ) ) ) ) ),
              #hom_structure_gmors_objs
              List( objs, o -> List( gmors, gm ->
                EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( HomomorphismStructureOnMorphisms( quo_kC, gm, IdentityMorphism( quo_kC, o ) ) ) ) ) ) );
    
end );

##
BindGlobal( "DATA_TABLES_OF_CATEGORY_FOR_QUOTIENT_CATEGORY_OF_ALGEBROID_FROM_DATA_TABLES",
  
  function ( qA )
    local A, all_objs, support_objs, objs, all_gmors, support_gmors, gmors, q;
    
    if not HasRangeCategoryOfHomomorphismStructure( qA ) then
        Error( "the quotient category passed to 'DataTablesOfCategory' must be hom-finite!\n" );
    fi;
    
    if not IsCategoryOfRows( RangeCategoryOfHomomorphismStructure( qA ) ) then
        Error( "the range category of Hom-Structure must be a category of rows!\n" );
    fi;
    
    A := AmbientCategory( qA );
    
    if not IsAlgebroidFromDataTables( A ) then
        Error( "the ambient category of the passed category must be an algebroid from data-tables!\n" );
    fi;
    
    all_objs := List( SetOfObjects( A ), o -> ObjectConstructor( qA, o ) );
    support_objs := PositionsProperty( all_objs, o -> not IsZero( o ) );
    objs := all_objs{support_objs};
    
    all_gmors := List( SetOfGeneratingMorphisms( A ), m -> MorphismConstructor( qA, ObjectConstructor( qA, Source( m ) ), m, ObjectConstructor( qA, Target( m ) ) ) );
    support_gmors := PositionsProperty( all_gmors, m -> not IsZero( m ) );
    gmors := all_gmors{support_gmors};
    
    q := UnderlyingQuiver( A );
    
    if Length( objs ) <> Length( all_objs ) or Length( gmors ) <> Length( all_gmors ) then
      
      q := FinQuiver(
              NTuple( 3,
                "q",
                NTuple( 3,
                  Length( support_objs ),
                  LabelsOfObjects( q ){support_objs},
                  LaTeXStringsOfObjects( q ){support_objs} ),
                NTuple( 5,
                  Length( support_gmors ),
                  List( IndicesOfSources( q ){support_gmors}, s -> SafePosition( support_objs, s ) ),
                  List( IndicesOfTargets( q ){support_gmors}, t -> SafePosition( support_objs, t ) ),
                  LabelsOfMorphisms( q ){support_gmors},
                  LaTeXStringsOfMorphisms( q ){support_gmors} ) ) );
      
    fi;
    
    return NTuple( 5,
              CommutativeRingOfLinearCategory( A ),
              q,
              List( objs, s -> List( objs, t -> List( BasisOfExternalHom( qA, s, t ), m ->
                List( DecompositionIndicesOfMorphismInAlgebroid( MorphismDatum( m ) )[1][2], index -> SafePosition( support_gmors, index ) ) ) ) ),
              List( objs, o -> List( gmors, gm ->
                EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( HomomorphismStructureOnMorphisms( qA, IdentityMorphism( qA, o ), gm ) ) ) ) ),
              List( objs, o -> List( gmors, gm ->
                EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( HomomorphismStructureOnMorphisms( qA, gm, IdentityMorphism( qA, o ) ) ) ) ) ) );
    
end );

##
InstallMethod( DataTablesOfLinearCategory,
          [ IsCapCategory ],
          
  function ( kC )
    local C;
    
    if IsLinearClosure( kC ) then
        
        C := UnderlyingCategory( kC );
          
        if (IsPathCategory( C ) or IsQuotientOfPathCategory( C ))  then
          
          return DATA_TABLES_OF_CATEGORY_FOR_LINEAR_CLOSURE_OF_PATH_CATEGORY_OR_QUOTIENT_OF_PATH_CATEGORY( kC );
          
        fi;
        
    elif IsQuotientCategory( kC ) then
        
        C := AmbientCategory( kC );
        
        if IsAlgebroidFromDataTables( C ) then
            
            return DATA_TABLES_OF_CATEGORY_FOR_QUOTIENT_CATEGORY_OF_ALGEBROID_FROM_DATA_TABLES( kC );
            
        elif IsLinearClosure( C ) then
            
            if IsPathCategory( UnderlyingCategory( C ) ) or IsQuotientOfPathCategory( UnderlyingCategory( C ) ) then
                
                return DATA_TABLES_OF_CATEGORY_FOR_QUOTIENT_CATEGORY_OF_LINEAR_CLOSURE_OF_PATH_CATEGORY_OR_QUOTIENT_OF_PATH_CATEGORY( kC );
                
            fi;
            
        fi;
        
    fi;
    
    TryNextMethod( );
    
end );

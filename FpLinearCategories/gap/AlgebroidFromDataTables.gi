# SPDX-License-Identifier: GPL-2.0-or-later
# FpLinearCategories: Finitely presented linear categories by generating quivers and relations
#
# Implementations
#

############################
#
# Auxiliary Functions
#
############################

##
BindGlobal( "_KroneckerProduct_",
  function ( m_1, mat_1, n_1, m_2, mat_2, n_2 )
    
    if m_1 * m_2 = 0 or n_1 * n_2 = 0 then
        return ListWithIdenticalEntries( m_1 * m_2, [] );
    else
        return KroneckerProduct( mat_1, mat_2 );
    fi;
    
end );

##
BindGlobal( "_ConcatenationLazyHLists_",
  
  function ( list )
    local n, indices, i;
    
    n := Length( list );
    
    indices := [ 0 ];
    
    for i in [ 1 .. n ] do
        Add( indices, indices[i] + Length( list[i] ) );
    od;
    
    return LazyHList( [ 1 .. indices[n+1] ],
                function ( i )
                  local pos;
                  
                  pos := PositionSorted( indices, i ) - 1;
                  
                  return list[pos][i-indices[pos]];
                  
                end );
     
end );

BindGlobal( "CREATE_NAME_FOR_ALGEBROID_FROM_DATA_TABLES",
  
  function ( coefficients_ring, q )
    local o_string, gm_string, with_or_without_s;
    
    if NumberOfObjects( q ) < 10 then
            o_string := JoinStringsWithSeparator( LabelsOfObjects( q ), "," );
    else
            o_string := Concatenation(
                              JoinStringsWithSeparator( LabelsOfObjects( q ){ [ 1 .. 3 ] }, "," ),
                              ",..,",
                              JoinStringsWithSeparator( LabelsOfObjects( q ){ [ NumberOfObjects( q ) - 2 .. NumberOfObjects( q ) ] }, "," ) );
    fi;
    
    if NumberOfMorphisms( q ) < 10 then
        
        gm_string := JoinStringsWithSeparator(
                          ListN( LabelsOfMorphisms( q ), IndicesOfSources( q ), IndicesOfTargets( q ),
                              { l, i, j } -> Concatenation( l, ":", LabelsOfObjects( q )[i], "→", LabelsOfObjects( q )[j] ) ), "," );
        
    else
        
        gm_string := Concatenation(
                              JoinStringsWithSeparator(
                                  ListN( LabelsOfMorphisms( q ){ [ 1 .. 3 ] }, IndicesOfSources( q ){ [ 1 .. 3 ] }, IndicesOfTargets( q ){ [ 1 .. 3 ] },
                                    { l, i, j } -> Concatenation( l, ":", LabelsOfObjects( q )[i], "→", LabelsOfObjects( q )[j] ) ), "," ),
                              ",..,",
                              JoinStringsWithSeparator(
                                  ListN( LabelsOfMorphisms( q ){ [ NumberOfMorphisms( q ) - 2 .. NumberOfMorphisms( q ) ] },
                                         IndicesOfSources( q ){ [ NumberOfMorphisms( q ) - 2 .. NumberOfMorphisms( q ) ] },
                                         IndicesOfTargets( q ){ [ NumberOfMorphisms( q ) - 2 .. NumberOfMorphisms( q ) ] },
                                            { l, i, j } -> Concatenation( l, ":", LabelsOfObjects( q )[i], "→", LabelsOfObjects( q )[j] ) ), "," ) );
        
    fi;
    
    with_or_without_s := nr -> Concatenation( Concatenation( [ "" ], ListWithIdenticalEntries( Position( [ false, true ], nr <> 1 ) - 1, "s" ) ) );
    
    return Concatenation(
                RingName( coefficients_ring ),
                "-algebroid( {",
                o_string,
                "}[",
                gm_string,
                "] ) defined by ",
                String( NumberOfObjects( q ) ),
                " object",
                with_or_without_s( NumberOfObjects( q ) ),
                " and ",
                String( NumberOfMorphisms( q ) ),
                " generating morphism",
                with_or_without_s( NumberOfMorphisms( q ) ) );
    
end );

##
InstallMethod( AlgebroidFromDataTables,
          [ IsDenseList ],
  FunctionWithNamedArguments(
  [
    [ "colors", fail ],
    [ "range_of_HomStructure", fail ],
    [ "eager", false ],
  ],
  function ( CAP_NAMED_ARGUMENTS, input_data )
    local ring, q, name, A, ranks, hom_structure_objs_gmors, hom_structure_objs_mors, hom_structure_gmors_objs, hom_structure_mors_objs,
    hom_structure_matrices, range_category_of_hom_structure;
    
    ring := input_data[1];
    
    q := input_data[2];
    
    if not IsFinQuiver( q ) then
      
      q := FinQuiver( q );
      
    fi;
    
    name := CREATE_NAME_FOR_ALGEBROID_FROM_DATA_TABLES( ring, q );
    
    A := CreateCapCategoryWithDataTypes( name,
             IsAlgebroidFromDataTables,
             IsObjectInAlgebroidFromDataTables,
             IsMorphismInAlgebroidFromDataTables,
             IsCapCategoryTwoCell,
             IsInt,
             CapJitDataTypeOfListOf( CapJitDataTypeOfElementOfRing( ring ) ),
             fail );
    
    if CAP_NAMED_ARGUMENTS.colors = fail then
    
        A!.colors := rec( obj := "", coeff := "", basis_elm := "", other := "", reset := "" );
        
    elif CAP_NAMED_ARGUMENTS.colors = true then
        
        A!.colors := rec( obj := "\033[34m", coeff := "\033[35m", basis_elm := "\033[32m", other := "\033[31m", reset := "\033[0m" );
        
    else
        
        A!.colors := CAP_NAMED_ARGUMENTS.colors;
        
    fi;
    
    A!.compiler_hints :=
      rec( category_attribute_names :=
           [ "SetOfObjectsAsUnresolvableAttribute",
             "SetOfGeneratingMorphismsAsUnresolvableAttribute",
             "UnderlyingQuiver",
             "CommutativeRingOfLinearCategory",
             "DefiningTripleOfUnderlyingQuiver",
             "HomomorphismStructureOnObjectsRanks",
             "HomomorphismStructureOnMorphismsMatrices",
             "DecompositionIndicesOfBasesElements",
             "BasesElements",
             "DistinguishedObjectOfHomomorphismStructure",
             "RangeCategoryOfHomomorphismStructure",
             "LabelsOfBasesElements",
             "LaTeXStringsOfBasesElements"
            ],
            precompiled_towers := [
            rec(
                remaining_constructors_in_tower := [ "AdditiveClosure" ],
                precompiled_functions_adder := ADD_FUNCTIONS_FOR_AdditiveClosureOfAlgebroidFromDataTablesPrecompiled ),
            ] );
    
    # Similar to Algebroids
    DeactivateCachingOfCategory( A );
    CapCategorySwitchLogicOff( A );
    DisableSanityChecks( A );
    
    SetIsAbCategory( A, true );
    SetIsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms( A, true );
    SetIsObjectFiniteCategory( A, true );
    
    SetCategoryDatum( A, input_data );
    SetCommutativeRingOfLinearCategory( A, input_data[1] );
    SetUnderlyingQuiver( A, q );
    SetDecompositionIndicesOfBasesElements( A, input_data[3] );
    
    SetDefiningTripleOfUnderlyingQuiver( A,
            NTuple( 3,
              NumberOfObjects( q ),
              NumberOfMorphisms( q ),
              ListN( IndicesOfSources( q ), IndicesOfTargets( q ), { s, t } -> [ -1 + s, -1 + t ] ) ) );
    
    # homomorphism structure
    
    range_category_of_hom_structure := CAP_NAMED_ARGUMENTS.range_of_HomStructure;
    
    if range_category_of_hom_structure = fail then
      
      range_category_of_hom_structure := CategoryOfRows( ring :
            FinalizeCategory := true,
            #= comment for Julia
            overhead := false
            # =#
            );
      
    fi;
    
    SET_RANGE_CATEGORY_Of_HOMOMORPHISM_STRUCTURE( A, range_category_of_hom_structure );
    
    ranks := List( input_data[3], s -> List( s, Length ) );
    
    if CAP_NAMED_ARGUMENTS.eager then
        
        ranks := List( ListOfValues( ranks ), ListOfValues );
        
    fi;
    
    SetHomomorphismStructureOnObjectsRanks( A, ranks );
    
    # [ [ hom(o_s, m_h:s_h -> t_h): hom(o_s, s_h) -> hom(o_s, t_h) ] ]_{s,h}
    hom_structure_objs_gmors := LazyHList( [ 1 .. NumberOfObjects( q ) ],
                  s -> LazyHList( [ 1 .. NumberOfMorphisms( q ) ],
                    h -> HomalgMatrix( input_data[4][s][h], ranks[s][IndicesOfSources( q )[h]], ranks[s][IndicesOfTargets( q )[h]], ring ) ) );
    
    # [ [ [ [ hom(o_s, m:o_i -> o_j):hom(o_s, o_i) -> hom(o_s, o_j) ] ] ] ]_{s,i,j,m}
    hom_structure_objs_mors := LazyHList( [ 1 .. NumberOfObjects( q ) ],
                                  s -> LazyHList( [ 1 .. NumberOfObjects( q ) ],
                                    i -> LazyHList( [ 1 .. NumberOfObjects( q ) ],
                                       j ->  LazyHList( input_data[3][i][j],
                                          indices -> Iterated( _ConcatenationLazyHLists_( [ LazyHList( [ 1 ], r -> HomalgIdentityMatrix( ranks[s][i], ring ) ), hom_structure_objs_gmors[s]{indices} ] ), {a, b} -> a * b  ) ) ) ) );
    
    # [ [ hom(m_h:s_h -> t_h, o_t): hom(t_h, o_t) -> hom(s_h, o_t) ] ]_{t,h}
    hom_structure_gmors_objs := LazyHList( [ 1 .. NumberOfObjects( q ) ],
                  t -> LazyHList( [ 1 .. NumberOfMorphisms( q ) ],
                    h -> HomalgMatrix( input_data[5][t][h], ranks[IndicesOfTargets( q )[h]][t], ranks[IndicesOfSources( q )[h]][t], ring ) ) );
    
    # [ [ [ [ hom(m:o_i -> o_j, o_t):hom(o_j, o_t) -> hom(o_i, o_t) ] ] ] ]_{t,i,j,m}
    hom_structure_mors_objs := LazyHList( [ 1 .. NumberOfObjects( q ) ],
                                  t -> LazyHList( [ 1 .. NumberOfObjects( q ) ],
                                    i -> LazyHList( [ 1 .. NumberOfObjects( q ) ],
                                       j ->  LazyHList( input_data[3][i][j],
                                          indices -> Iterated( _ConcatenationLazyHLists_( [ LazyHList( [ 1 ], r -> HomalgIdentityMatrix( ranks[j][t], ring ) ), hom_structure_gmors_objs[t]{Reversed(indices)} ] ), {a, b} -> a * b ) ) ) ) );
    
    # H(l:i->j, r:p->q) = H( l⋅id_j, r⋅id_q ) = H(id_j, r)⋅H(l, id_q)
    hom_structure_matrices := LazyHList( [ 1 .. NumberOfObjects( q ) ],
                                i -> LazyHList( [ 1 .. NumberOfObjects( q ) ],
                                  j -> LazyHList( [ 1 .. NumberOfObjects( q ) ],
                                    p -> LazyHList( [ 1 .. NumberOfObjects( q ) ],
                                      q -> LazyHList( hom_structure_mors_objs[q][i][j],
                                        l -> LazyHList( hom_structure_objs_mors[j][p][q],
                                          r -> r * l ) ) ) ) ) );
    
    if CAP_NAMED_ARGUMENTS.eager then
       
       hom_structure_matrices := List( ListOfValues( hom_structure_matrices ),
                                    a -> List( ListOfValues( a ),
                                      b -> List( ListOfValues( b ),
                                        c -> List( ListOfValues( c ),
                                          d -> List( ListOfValues( d ),
                                            e -> ListOfValues( e ) ) ) ) ) );
      
    fi;
    
    SetHomomorphismStructureOnMorphismsMatrices( A, hom_structure_matrices );
    
    ##
    AddObjectConstructor( A,
      
      function ( A, index )
        
        return SetOfObjects( A )[index];
        
    end );
    
    ##
    AddObjectDatum( A,
      
      function ( A, obj )
        
        return ObjectIndex( obj );
        
    end );
    
    ##
    AddMorphismConstructor( A,
      
      function ( A, obj_1, datum, obj_2 )
        
        return CreateCapCategoryMorphismWithAttributes( A, obj_1, obj_2, CoefficientsList, datum );
        
    end );
    
    ##
    AddMorphismDatum( A,
      
      function ( A, alpha )
        
        return CoefficientsList( alpha );
        
    end );
    
    ##
    AddSetOfObjectsOfCategory( A,
      function ( A )
        
        return List( [ 1 .. NumberOfObjects( UnderlyingQuiver( A ) ) ], index -> CreateCapCategoryObjectWithAttributes( A, ObjectIndex, index ) );
        
    end );
    
    ##
    AddSetOfGeneratingMorphismsOfCategory( A,
      function ( A )
        local q;
        
        q := UnderlyingQuiver( A );
        
        return ListN( [ 1 .. NumberOfMorphisms( q ) ], IndicesOfSources( q ), IndicesOfTargets( q ),
                 { index, i, j } -> BasesElements( A )[i][j][SafePosition( DecompositionIndicesOfBasesElements( A )[i][j], [ index ] )] );
        
    end );
    
    ##
    AddIsWellDefinedForObjects( A,
      
      function ( A, obj )
        
        return true;
        
    end );
    
    ##
    AddIsEqualForObjects( A,
      
      function ( A, obj_1, obj_2 )
        
        return ObjectIndex( obj_1 ) = ObjectIndex( obj_2 );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( A,
      
      function ( A, mor )
        
        return Length( CoefficientsList( mor ) ) = HomomorphismStructureOnObjectsRanks( A )[ObjectIndex( Source( mor ) )][ObjectIndex( Target( mor ) )];
        
    end );
    
    ##
    AddIsEqualForMorphisms( A,
      
      function ( A, mor_1, mor_2 )
        
        return CoefficientsList( mor_1 ) = CoefficientsList( mor_2 );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( A,
      
      function ( A, mor_1, mor_2 )
        
        return IsEqualForMorphisms( A, mor_1, mor_2 );
        
    end );
    
    ## External Homs
    
    ##
    AddBasisOfExternalHom( A,
      
      function ( A, obj_1, obj_2 )
        
        return BasesElements( A )[ObjectIndex( obj_1 )][ObjectIndex( obj_2 )];
        
    end );
    
    AddCoefficientsOfMorphism( A,
      
      function ( A, mor )
        
        return CoefficientsList( mor );
        
    end );
    
    ##
    AddIdentityMorphism( A,
      
      function ( A, obj )
        local i, empty_list;
        
        i := ObjectIndex( obj );
        
        empty_list := CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsInt ) );
        
        return BasesElements( A )[i][i][SafePositionProperty( DecompositionIndicesOfBasesElements( A )[i][i], indices -> indices = empty_list )];
        
    end );
    
    #
    AddZeroMorphism( A,
      
      function ( A, obj_1, obj_2 )
        
        return MorphismConstructor( A,
                  obj_1,
                  ListWithIdenticalEntries(
                      HomomorphismStructureOnObjectsRanks( A )[ObjectIndex( obj_1 )][ObjectIndex( obj_2 )],
                      ZeroImmutable( CommutativeRingOfLinearCategory( A ) ) ),
                  obj_2 );
        
    end );
    
    ##
    AddMultiplyWithElementOfCommutativeRingForMorphisms( A,
      
      function ( A, r, alpha )
        
        return MorphismConstructor( A, Source( alpha ), List( CoefficientsList( alpha ), c -> r * c ), Target( alpha ) );
        
    end );
    
    ##
    AddAdditionForMorphisms( A,
      
      function ( A, alpha_1, alpha_2 )
        
        return MorphismConstructor( A, Source( alpha_1 ), Sum( List( [ alpha_1, alpha_2 ], CoefficientsList ) ), Target( alpha_1 ) );
        
    end );
    
    ##
    AddAdditiveInverseForMorphisms( A,
      
      function ( A, alpha )
        
        return  MorphismConstructor( A, Source( alpha ), List( CoefficientsList( alpha ), c -> -c ), Target( alpha ) );
        
    end );
    
    ## Hom-Structure
    
    ##
    AddDistinguishedObjectOfHomomorphismStructure( A,
      
      function ( A )
        
        return ObjectConstructor( RangeCategoryOfHomomorphismStructure( A ), 1 );
        
    end );
    
    ##
    AddHomomorphismStructureOnObjects( A,
      
      function ( A, obj_1, obj_2 )
        
        return ObjectConstructor( RangeCategoryOfHomomorphismStructure( A ), HomomorphismStructureOnObjectsRanks( A )[ObjectIndex( obj_1 )][ObjectIndex( obj_2 )] );
        
    end );
    
    ##  H(α:i->j, γ:p->q) = H( α⋅id_j, γ⋅id_q ) = H(id_j, γ)⋅H(α, id_q)
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( A,
      
      function ( A, s, alpha, gamma, r )
        local s_alpha, s_gamma, i, j, p, q, hom_ijpq, coeffs_alpha, coeffs_gamma, mat;
        
        if (RankOfObject( s ) = 0 or Length( IndicesOfSupportMorphisms( alpha ) ) = 0)  or (RankOfObject( r ) = 0 or Length( IndicesOfSupportMorphisms( gamma ) ) = 0) then
            
            return ZeroMorphism( RangeCategoryOfHomomorphismStructure( A ), s, r );
            
        else
            
            s_alpha := IndicesOfSupportMorphisms( alpha );
            s_gamma := IndicesOfSupportMorphisms( gamma );
            
            i := ObjectIndex( Source( alpha ) );
            j := ObjectIndex( Target( alpha ) );
            
            p := ObjectIndex( Source( gamma ) );
            q := ObjectIndex( Target( gamma ) );
            
            hom_ijpq := HomomorphismStructureOnMorphismsMatrices( A )[i][j][p][q];
            
            coeffs_alpha := CoefficientsList( alpha );
            coeffs_gamma := CoefficientsList( gamma );
            
            mat := Sum( List( [ 1 .. Length( s_alpha ) ],
                    l -> Sum( List( [ 1 .. Length( s_gamma ) ],
                      r -> coeffs_alpha[s_alpha[l]] * coeffs_gamma[s_gamma[r]] * hom_ijpq[s_alpha[l]][s_gamma[r]] ) ) ) );
            
            return MorphismConstructor( RangeCategoryOfHomomorphismStructure( A ), s, mat, r );
            
        fi;
        
    end );
    
    #
    AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( A,
      
      function ( A, distinguished_object, alpha, r )
        
        return MorphismConstructor( RangeCategoryOfHomomorphismStructure( A ),
                          distinguished_object,
                          HomalgMatrixListList( [ CoefficientsList( alpha ) ], 1, RankOfObject( r ), CommutativeRingOfLinearCategory( A ) ),
                          r );
        
    end );
    
    ##
    AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( A,
      
      function ( A, alpha )
        local dim;
        
        dim := HomomorphismStructureOnObjectsRanks( A )[ObjectIndex( Source( alpha ) )][ObjectIndex( Target( alpha ) )];
        
        return MorphismConstructor( RangeCategoryOfHomomorphismStructure( A ),
                            DistinguishedObjectOfHomomorphismStructure( A ),
                            HomalgMatrixListList( [ CoefficientsList( alpha ) ], 1, dim, CommutativeRingOfLinearCategory( A ) ),
                            ObjectConstructor( RangeCategoryOfHomomorphismStructure( A ), dim ) );
    end );
    #
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( A,
      
      function ( A, obj_1, obj_2, eta )
        
        return MorphismConstructor( A, obj_1, EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( eta ) )[1], obj_2 );
        
    end );
    
    ## α:i->j, β:j->k
    ## α⋅β = ν⁻¹(ν(α⋅β)) = ν⁻¹(ν(α⋅id_j⋅β)) = ν⁻¹(ν(id_j)⋅H(α,β))
    ##
    AddPreCompose( A,
      
      function ( A, alpha, beta )
        
        return InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( A, Source( alpha ), Target( beta ),
                                  PreCompose( RangeCategoryOfHomomorphismStructure( A ),
                                    InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( A, IdentityMorphism( A, Target( alpha ) ) ),
                                    HomomorphismStructureOnMorphisms( A, alpha, beta ) ) );
        
    end );
    
    ## Random Methods
    
    ##
    AddRandomObjectByInteger( A,
      
      function ( A, i )
        
        return Random( SetOfObjects( A ) );
        
    end );
    
    ##
    AddRandomMorphismWithFixedSourceByInteger( A,
      
      function ( A, obj, n )
        local ring, s, indices, t, basis;
        
        ring := CommutativeRingOfLinearCategory( A );
        
        s := ObjectIndex( obj );
        
        # in Julia: Shuffle(1:n) raises error, hence this workaround
        indices := Shuffle( List( [ 1 .. NumberOfObjects( UnderlyingQuiver( A ) ) ], i -> i ) );
        
        t := indices[SafePositionProperty( indices, p -> HomomorphismStructureOnObjectsRanks( A )[s][p] <> 0 )];
        
        basis := BasesElements( A )[s][t];
        
        return SumOfMorphisms( A, obj, List( [ 0 .. AbsInt( n ) ], i -> Random( [ MinusOne( ring ), One( ring ) ] ) * Random( basis ) ), SetOfObjects( A )[t] );
        
    end );
    
    ##
    AddRandomMorphismWithFixedRangeByInteger( A,
      
      function ( A, obj, n )
        local ring, t, indices, s, basis;
        
        ring := CommutativeRingOfLinearCategory( A );
        
        t := ObjectIndex( obj );
        
        # in Julia: Shuffle(1:n) raises error, hence this workaround
        indices := Shuffle( List( [ 1 .. NumberOfObjects( UnderlyingQuiver( A ) ) ], i -> i ) );
        
        s := indices[SafePositionProperty( indices, p -> HomomorphismStructureOnObjectsRanks( A )[p][t] <> 0 )];
        
        basis := BasesElements( A )[s][t];
        
        return SumOfMorphisms( A, SetOfObjects( A )[s], List( [ 0 .. AbsInt( n ) ], i -> Random( [ MinusOne( ring ), One( ring ) ] ) * Random( basis ) ), obj );
        
    end );
    
    ##
    AddRandomMorphismWithFixedSourceAndRangeByInteger( A,
      
      function ( A, obj_1, obj_2, n )
        local ring, morphisms;
        
        ring := CommutativeRingOfLinearCategory( A );
        
        morphisms := Concatenation( [ ZeroMorphism( A, obj_1, obj_2 ) ], BasesElements( A )[ObjectIndex( obj_1 )][ObjectIndex( obj_2 )] );
        
        return SumOfMorphisms( A, obj_1, List( [ 0 .. AbsInt( n ) ], i -> Random( [ MinusOne( ring ), One( ring ) ] ) * Random( morphisms ) ), obj_2 );
        
    end );
    
    Finalize( A );
    
    return A;
    
end ) );

##
InstallOtherMethod( AlgebroidFromDataTables,
          [ IsCapCategory ],
  
  FunctionWithNamedArguments(
  [
    [ "colors", fail ]
  ],
  function ( CAP_NAMED_ARGUMENTS, C )
    
    return AlgebroidFromDataTables( DataTablesOfLinearCategory( C ) : colors := CAP_NAMED_ARGUMENTS.colors );
    
end ) );


##
InstallMethodForCompilerForCAP( SetOfObjects,
        "for an algebroid from data tables",
        [ IsAlgebroidFromDataTables ],
        
  function( cat )
    
    return SetOfObjectsAsUnresolvableAttribute( cat );
    
end );

##
InstallMethodForCompilerForCAP( SetOfGeneratingMorphisms,
        "for an algebroid from data tables",
        [ IsAlgebroidFromDataTables ],
        
  function( cat )
    
    return SetOfGeneratingMorphismsAsUnresolvableAttribute( cat );
    
end );

##
InstallOtherMethod( Dimension,
          [ IsAlgebroidFromDataTables ],
  
  function ( A )
    
    return Sum( List( HomomorphismStructureOnObjectsRanks( A ), Sum ) );
    
end );

##
InstallOtherMethod( \[\],
          [ IsAlgebroidFromDataTables, IsInt ],
  
  function ( A, index )
    
    return SetOfObjects( A )[index];
    
end );

##
InstallOtherMethod( \^,
          [ IsAlgebroidFromDataTables, IsInt ],
  
  function ( A, index )
    
    return SetOfGeneratingMorphisms( A )[index];
    
end );

##
InstallOtherMethod( MorphismConstructor,
          [ IsAlgebroidFromDataTables, IsObjectInAlgebroidFromDataTables, IsDenseList, IsDenseList, IsObjectInAlgebroidFromDataTables ],
  
  function ( A, source, coeffs, indices_nonzero_coeffs, target )
    
    return CreateCapCategoryMorphismWithAttributes( A,
                source, target,
                CoefficientsList, coeffs,
                IndicesOfSupportMorphisms, indices_nonzero_coeffs );
    
end );

##
InstallMethod( IndicesOfSupportMorphisms,
          [ IsMorphismInAlgebroidFromDataTables ],
  
  function ( alpha )
    
    return PositionsProperty( CoefficientsList( alpha ), c -> not IsZero( c ) );
    
end );

##
InstallMethod( SupportMorphisms,
          [ IsMorphismInAlgebroidFromDataTables ],
  
  function ( alpha )
    
    return BasesElements( CapCategory( alpha ) )[ObjectIndex( Source( alpha ) )][ObjectIndex( Target( alpha ) )]{IndicesOfSupportMorphisms( alpha )};
    
end );

##
InstallMethod( CoefficientsOfSupportMorphisms,
          [ IsMorphismInAlgebroidFromDataTables ],
  
  function ( alpha )
    
    return CoefficientsList( alpha ){IndicesOfSupportMorphisms( alpha )};
    
end );

#= comment for Julia
##
InstallMethod( AssignSetOfObjects,
        [ IsAlgebroidFromDataTables, IsString ],
  
  function ( A, label )
    local names, func;
    
    names := LabelsOfObjects( UnderlyingQuiver( A ) );
    
    if label = "" and ForAny( names, name -> Int( name ) <> fail ) then
        Error( "the <label> passed to 'AssignSetOfObjects' must be a non-empty string!\n" );
    fi;
    
    func :=
      function ( name, o )
        
        name := Concatenation( label, ReplacedString( name, "-", "m" ) );
        MakeReadWriteGlobal( name );
        DeclareSynonym( name, o );
        return true;
        
    end;
    
    ListN( names, SetOfObjects( A ), func );
    
end );

##
InstallOtherMethod( AssignSetOfObjects,
        [ IsAlgebroidFromDataTables ],
  
  function ( A )
    
    AssignSetOfObjects( A, "" );
    
end );

##
InstallMethod( AssignSetOfGeneratingMorphisms,
        [ IsAlgebroidFromDataTables, IsString ],
  
  function ( A, label )
    local names, morphisms, func;
    
    names := LabelsOfMorphisms( UnderlyingQuiver( A ) );
    
    if label = "" and ForAny( names, name -> Int( name ) <> fail ) then
        Error( "the <label> passed to 'AssignSetOfGeneratingMorphisms' must be a non-empty string!\n" );
    fi;
    
    morphisms := SetOfGeneratingMorphisms( A );
    
    func :=
      function ( name, m )
        
        name := Concatenation( label, ReplacedString( name, "-", "m" ) );
        MakeReadWriteGlobal( name );
        DeclareSynonym( name, m );
        return true;
        
    end;
    
    ListN( names, morphisms, func );
    
end );

##
InstallOtherMethod( AssignSetOfGeneratingMorphisms,
        [ IsAlgebroidFromDataTables ],
  
  function ( A )
    
    AssignSetOfGeneratingMorphisms( A, "" );
    
end );
# =#

##
InstallOtherMethod( \/,
        [ IsString, IsAlgebroidFromDataTables ],
  
  function ( name, A )
    local q, objs_labels, mors_labels, p, id_mors_labels, label, labels, l, m, power;
    
    q := UnderlyingQuiver( A );
    
    objs_labels := LabelsOfObjects( q );
    mors_labels := LabelsOfMorphisms( q );
    
    p := Position( objs_labels, name );
    
    if p <> fail then
        return SetOfObjects( A )[p];
    fi;
    
    id_mors_labels := List( objs_labels, obj -> Concatenation( "id(", obj, ")" ) );
    
    if name in id_mors_labels then
        
        label := name{ [ 4 .. Length(name) - 1 ] };
        
        if label in objs_labels then
            
            return IdentityMorphism( A, label / A );
            
        fi;
        
    fi;
    
    id_mors_labels := List( objs_labels, obj -> Concatenation( "id_", obj ) );
    
    if name in id_mors_labels then
        
        label := name{ [ 4 .. Length(name) ] };
        
        if label in objs_labels then
            
            return IdentityMorphism( A, label / A );
            
        fi;
        
    fi;
    
    p := Position( mors_labels, name );
    
    if p <> fail then
        
        return SetOfGeneratingMorphisms( A )[p];
        
    fi;
    
    if ForAny( [ "⋅", "*" ], s -> PositionSublist( name, s ) <> fail ) then
      
      labels := SplitString( ReplacedString( name, "⋅", "*" ), "*" );
      
      return PreComposeList( A, List( labels, label -> label / A ) );
      
    else
      
      # starting matching at the end is usually less error prone
      p := PositionProperty( mors_labels, label -> Length( name ) >= Length( label ) and IsMatchingSublist( name, label, Length( name ) - Length( label ) + 1 ) );
      
      if p <> fail then
          
          label := mors_labels[p];
          
          l := Length( name ) - Length( label );
          
          m := SetOfGeneratingMorphisms( A )[p];
          
          if l = 0 then
              return m;
          else
              return PreCompose( A, name{ [ 1 .. l ] } / A, m );
          fi;
          
      else
          
          p := Positions( name, '^' );
          
          if p <> [ ] then
              
              p := Last( p );
              
              power := Int( name{ [ p + 1 .. Length( name )  ] } );
              
              if power <> fail then
                    
                    name := name{ [ 1 .. p - 1  ] };
                    
                    p := PositionProperty( mors_labels,
                                  label -> Length( name ) >= Length( label ) and IsMatchingSublist( name, label, Length( name ) - Length( label ) + 1 ) );
                    
                    if p <> fail then
                        
                        label := mors_labels[p];
                        
                        l := Length( name ) - Length( label );
                        
                        m := PreComposeList( A, ListWithIdenticalEntries( power, SetOfGeneratingMorphisms( A )[p] ) );
                        
                        if l = 0 then
                            return m;
                        else
                            return PreCompose( A, name{ [ 1 .. l ] } / A, m );
                        fi;
                        
                    fi;
                    
              fi;
              
          fi;
          
      fi;
      
    fi;
    
    Error( "the label '", name, "' can't be recognized!\n" );
    
end );

#= comment for Julia
##
INSTALL_DOT_METHOD( IsAlgebroidFromDataTables );
# =#

##
InstallMethod( DecompositionIndicesOfMorphismInAlgebroid,
          [ IsMorphismInAlgebroidFromDataTables ],
  
  function ( mor )
    local A, s, t, indices;
    
    A := CapCategory( mor );
    
    s := ObjectIndex( Source( mor ) );
    t := ObjectIndex( Target( mor ) );
    
    indices := IndicesOfSupportMorphisms( mor );
    
    return TransposedMat( [ CoefficientsList( mor ){indices}, DecompositionIndicesOfBasesElements( A )[s][t]{indices} ] );
    
end );

##
InstallMethod( DecompositionOfMorphismInAlgebroid,
          [ IsMorphismInAlgebroidFromDataTables ],
  
  function ( mor )
    local A, s, t;
    
    A := CapCategory( mor );
    
    return List( DecompositionIndicesOfMorphismInAlgebroid( mor ),
                    function ( p )
                      if IsEmpty( p[2] ) then
                        return Pair( p[1], [ IdentityMorphism( A, Source( mor ) ) ] );
                      else
                        return Pair( p[1], SetOfGeneratingMorphisms( A ){ p[2] } );
                      fi;
                    end );
    
end );

##
InstallOtherMethod( BasesElements,
          [ IsAlgebroidFromDataTables ],
  
  function ( A )
    local q, ranks;
    
    q := UnderlyingQuiver( A );
    
    ranks := HomomorphismStructureOnObjectsRanks( A );
    
    return LazyHList( [ 1 .. NumberOfObjects( q ) ],
          i -> LazyHList( [ 1 .. NumberOfObjects( q ) ],
            j -> ListN( IdentityMat( ranks[i][j], CommutativeRingOfLinearCategory( A ) ), [ 1 .. ranks[i][j] ],
              { coeff, index } -> MorphismConstructor( A, SetOfObjects( A )[i], coeff, [ index ], SetOfObjects( A )[j] ) ) ) );
    
end );

##
InstallMethod( LabelsOfBasesElements,
          [ IsAlgebroidFromDataTables ],
  
  function ( A )
    local q, dec;
    
    q := UnderlyingQuiver( A );
    
    dec := DecompositionIndicesOfBasesElements( A );
    
    return LazyHList( [ 1 .. NumberOfObjects( q ) ],
          i -> LazyHList( [ 1 .. NumberOfObjects( q ) ],
              j -> List( dec[i][j],
                  function ( indices )
                    
                    if Length( indices ) = 0 then
                        
                        return Concatenation( "id(", LabelsOfObjects( q )[i], ")" );
                        
                    else
                        
                        return JoinStringsWithSeparator(
                                  ListN( CollectEntries( LabelsOfMorphisms( q ){indices} ),
                                    function ( l )
                                      if l[2] = 1 then
                                        return l[1];
                                      else
                                        return Concatenation( l[1], "^", String( l[2] ) );
                                      fi;
                                    end ), "⋅" );
                        
                    fi;
                    
                  end ) ) );
    
end );

##
InstallMethod( LaTeXStringsOfBasesElements,
          [ IsAlgebroidFromDataTables ],
  
  function ( A )
    local q, indices;
    
    q := UnderlyingQuiver( A );
    
    indices := DecompositionIndicesOfBasesElements( A );
    
    return  LazyHList( [ 1 .. NumberOfObjects( q ) ],
          i -> LazyHList( [ 1 .. NumberOfObjects( q ) ],
              j -> List( indices[i][j],
                  function ( indices )
                    local labels;
                    
                    if Length( indices ) = 0 then
                        
                        return Concatenation( "id(", LaTeXStringsOfObjects( q )[i], ")" );
                        
                    else
                        
                        labels := CollectEntries( LaTeXStringsOfMorphisms( q ){indices} );
                        
                        return JoinStringsWithSeparator(
                                  ListN( labels,
                                    function ( l )
                                      if l[2] = 1 then
                                        return Concatenation( "{", l[1], "}" );
                                      else
                                        return Concatenation( "{", l[1], "}^{", String( l[2] ), "}" );
                                      fi;
                                    end ), "" );
                        
                    fi;
                    
                  end ) ) );
    
end );

##
InstallMethod( PowerOfArrowIdealOp,
          [ IsAlgebroidFromDataTables, IsInt ],
  function ( A, n )
    
    if n = 0 then
        return Filtered( List( SetOfObjects( A ), o -> IdentityMorphism( A, o ) ), h -> not IsZero( h ) );
    else
        return Filtered( Concatenation( List( PowerOfArrowIdeal( A, n - 1 ),
                f -> List( Filtered( SetOfGeneratingMorphisms( A ), g -> ObjectIndex( Target( f ) ) = ObjectIndex( Source( g ) ) ),
                  g -> PreCompose( A, f, g ) ) ) ),
                    h -> not IsZeroForMorphisms( A, h ) );
    fi;
    
end );

#= comment for Julia
##
InstallMethod( IsAdmissibleAlgebroid,
          [ IsAlgebroidFromDataTables ],
  
  function ( A )
    local q, A_op, dim, i, bool;
    
    q := UnderlyingQuiver( A );
    
    A_op := OppositeAlgebroid( A );
    
    if HasIsAdmissibleAlgebroid( A_op ) then
        
        return IsAdmissibleAlgebroid( A_op );
        
    fi;
    
    dim := AsZFunction(
        function ( i )
          local C, objs;
          
          C := QuotientCategory( A, PowerOfArrowIdeal( A, i ) : overhead := false );
          
          objs := List( SetOfObjects( A ), u -> ObjectConstructor( C, u ) );
          
          return Sum( List( objs, u -> Sum( List( objs, v -> RankOfObject( HomomorphismStructureOnObjects( C, u, v ) ) ) ) ) );
          
        end );
    
    i := 2;
    
    if dim[i] <> NumberOfObjects( q ) + NumberOfMorphisms( q ) then
        return false;
    fi;
    
    while true do
      
      i := i + 1;
      
      if dim[i] = dim[i-1] then
        
        break;

      fi;
      
    od;
    
    bool := dim[i] = Dimension( A );
    
    SetIsAdmissibleAlgebroid( A_op, bool );
    
    return bool;
    
end );
# =#

##
InstallOtherMethod( CapFunctor,
        "for an algebroid from data tables, two lists, a CAP Category",
        [ IsAlgebroidFromDataTables, IsList, IsList, IsCapCategory ],

  function( A, imgs_of_objs, imgs_of_gmors, C )
    local F;
    
    F := CapFunctor( Concatenation( "Functor from ", Name( A ), " -> ", Name( C ) ), A, C );
    
    AddObjectFunction( F,
      function ( obj )
        
        return imgs_of_objs[ObjectIndex( obj )];
        
    end );
    
    AddMorphismFunction( F,
      function ( F_s, mor, F_t )
        
        return SumOfMorphisms( C,
                  F_s,
                  List( DecompositionIndicesOfMorphismInAlgebroid( mor ), p -> p[1] * PreComposeList( C, F_s, ListOfValues( imgs_of_gmors ){ p[2] }, F_t ) ),
                  F_t );
        
    end );
    
    return F;
    
end );

####################################
#
# Opposite Algebroid
#
####################################

##
InstallOtherMethod( OppositeAlgebroid,
          [ IsAlgebroidFromDataTables ],
  
  function ( A )
    local data_tables, A_op;
    
    data_tables := NTuple( 5,
                    CategoryDatum( A )[1],
                    OppositeQuiver( UnderlyingQuiver( A ) ),
                    TransposedMat( List( CategoryDatum( A )[3], s -> List( s, hom_st -> List( hom_st, indices -> Reversed( indices ) ) ) ) ),
                    CategoryDatum( A )[5],
                    CategoryDatum( A )[4] );
    
    A_op := AlgebroidFromDataTables( data_tables : colors := A!.colors, range_of_HomStructure := RangeCategoryOfHomomorphismStructure( A ) );
    
    SetOppositeAlgebroid( A_op, A );
    
    if HasIsAdmissibleAlgebroid( A ) then
        SetIsAdmissibleAlgebroid( A_op, IsAdmissibleAlgebroid( A ) );
    fi;
    
    return A_op;
    
end );

####################################
#
# Tensor Product Of Algebroids
#
####################################

##
InstallMethodWithCache( TensorProductOfAlgebroids,
          [ IsAlgebroidFromDataTables, IsAlgebroidFromDataTables ],
  
  function ( A_1, A_2 )
    local ring, q1, q2, data_tables, labels_of_bases_elements, T;
    
    if not IsIdenticalObj( CommutativeRingOfLinearCategory( A_1 ), CommutativeRingOfLinearCategory( A_2 ) ) then
        Error( "the algebroids must be linear over the same commutative ring!" );
    fi;
    
    ring := CommutativeRingOfLinearCategory( A_1 );
    
    q1 := UnderlyingQuiver( A_1 );
    q2 := UnderlyingQuiver( A_2 );
    
    data_tables := NTuple( 5,
        ring,
        ## quiver
        TensorProductOfFinQuivers( q1, q2 ),
        
        ## decomposition_indices_of_bases_elements
        LazyHList( [ 1 .. NumberOfObjects( q1 ) * NumberOfObjects( q2 ) ],
          s_u -> LazyHList( [ 1 .. NumberOfObjects( q1 ) * NumberOfObjects( q2 ) ],
            function( t_v )
              local s, t, u, v, indices_hom_st, indices_hom_uv;
              
              # s_u = (s-1) * NumberOfObjects( q2 ) + u
              #
              s := 1 + QuoInt( s_u - 1, NumberOfObjects( q2 ) );
              u := 1 + RemInt( s_u - 1, NumberOfObjects( q2 ) );
              
              # t_v = (t-1) * NumberOfObjects( q2 ) + v
              #
              t := 1 + QuoInt( t_v - 1, NumberOfObjects( q2 ) );
              v := 1 + RemInt( t_v - 1, NumberOfObjects( q2 ) );
              
              indices_hom_st := DecompositionIndicesOfBasesElements( A_1 )[s][t];
              indices_hom_uv := DecompositionIndicesOfBasesElements( A_2 )[u][v];
              
              return Concatenation(
                    List( indices_hom_st,
                      indices_l -> List( indices_hom_uv,
                        indices_r -> Concatenation(
                                        List( indices_l, i -> NumberOfObjects( q1 ) * NumberOfMorphisms( q2 ) + ( i - 1 ) * NumberOfObjects( q2 ) + u ),
                                        List( indices_r, j -> ( t - 1 ) * NumberOfMorphisms( q2 ) + j ) ) ) ) );
              
            end ) ),
        
        ## hom_structure_objs_gmors
        _ConcatenationLazyHLists_(
          LazyHList( [ 1 .. NumberOfObjects( q1 ) ],
            i -> LazyHList( [ 1 .. NumberOfObjects( q2 ) ],
              p -> _ConcatenationLazyHLists_(
                      [ _ConcatenationLazyHLists_(
                          LazyHList( [ 1 .. NumberOfObjects( q1 ) ],
                              j -> LazyHList( [ 1 .. NumberOfMorphisms( q2 ) ],
                                index_2 -> _KroneckerProduct_(
                                                HomomorphismStructureOnObjectsRanks( A_1 )[i][j],
                                                IdentityMat( HomomorphismStructureOnObjectsRanks( A_1 )[i][j], ring ),
                                                HomomorphismStructureOnObjectsRanks( A_1 )[i][j],
                                                HomomorphismStructureOnObjectsRanks( A_2 )[p][IndicesOfSources( q2 )[index_2]],
                                                CategoryDatum( A_2 )[4][p][index_2],
                                                HomomorphismStructureOnObjectsRanks( A_2 )[p][IndicesOfTargets( q2 )[index_2]] ) ) ) ),
                        _ConcatenationLazyHLists_(
                          LazyHList( [ 1 .. NumberOfMorphisms( q1 ) ],
                              index_1 -> LazyHList( [ 1 .. NumberOfObjects( q2 ) ],
                                q -> _KroneckerProduct_(
                                                HomomorphismStructureOnObjectsRanks( A_1 )[i][IndicesOfSources( q1 )[index_1]],
                                                CategoryDatum( A_1 )[4][i][index_1],
                                                HomomorphismStructureOnObjectsRanks( A_1 )[i][IndicesOfTargets( q1 )[index_1]],
                                                HomomorphismStructureOnObjectsRanks( A_2 )[p][q],
                                                IdentityMat( HomomorphismStructureOnObjectsRanks( A_2 )[p][q], ring ),
                                                HomomorphismStructureOnObjectsRanks( A_2 )[p][q] ) ) ) ) ] ) ) ) ),
        
        ## hom_structure_gmors_objs
        _ConcatenationLazyHLists_(
          LazyHList( [ 1 .. NumberOfObjects( q1 ) ],
            i -> LazyHList( [ 1 .. NumberOfObjects( q2 ) ],
              p -> _ConcatenationLazyHLists_(
                      [ _ConcatenationLazyHLists_(
                          LazyHList( [ 1 .. NumberOfObjects( q1 ) ],
                              j -> LazyHList( [ 1 .. NumberOfMorphisms( q2 ) ],
                                index_2 -> _KroneckerProduct_(
                                                HomomorphismStructureOnObjectsRanks( A_1 )[j][i],
                                                IdentityMat( HomomorphismStructureOnObjectsRanks( A_1 )[j][i], ring ),
                                                HomomorphismStructureOnObjectsRanks( A_1 )[j][i],
                                                HomomorphismStructureOnObjectsRanks( A_2 )[IndicesOfTargets( q2 )[index_2]][p],
                                                CategoryDatum( A_2 )[5][p][index_2],
                                                HomomorphismStructureOnObjectsRanks( A_2 )[IndicesOfSources( q2 )[index_2]][p] ) ) ) ),
                        _ConcatenationLazyHLists_(
                          LazyHList( [ 1 .. NumberOfMorphisms( q1 ) ],
                              index_1 -> LazyHList( [ 1 .. NumberOfObjects( q2 ) ],
                                q -> _KroneckerProduct_(
                                                HomomorphismStructureOnObjectsRanks( A_1 )[IndicesOfTargets( q1 )[index_1]][i],
                                                CategoryDatum( A_1 )[5][i][index_1],
                                                HomomorphismStructureOnObjectsRanks( A_1 )[IndicesOfSources( q1 )[index_1]][i],
                                                HomomorphismStructureOnObjectsRanks( A_2 )[q][p],
                                                IdentityMat( HomomorphismStructureOnObjectsRanks( A_2 )[q][p], ring ),
                                                HomomorphismStructureOnObjectsRanks( A_2 )[q][p] ) ) ) ) ] ) ) ) ) );
    
    labels_of_bases_elements := LazyHList( [ 1 .. NumberOfObjects( q1 ) * NumberOfObjects( q2 ) ],
          s_u -> LazyHList( [ 1 .. NumberOfObjects( q1 ) * NumberOfObjects( q2 ) ],
            function( t_v )
              local s, u, t, v;
              
              s := 1 + QuoInt( s_u - 1, NumberOfObjects( q2 ) );
              u := 1 + RemInt( s_u - 1, NumberOfObjects( q2 ) );
              t := 1 + QuoInt( t_v - 1, NumberOfObjects( q2 ) );
              v := 1 + RemInt( t_v - 1, NumberOfObjects( q2 ) );
              
              return Concatenation(
                    List( LabelsOfBasesElements( A_1 )[s][t],
                      label_l -> List( LabelsOfBasesElements( A_2 )[u][v],
                        label_r -> Concatenation( label_l, "⊗", label_r ) ) ) );
              
            end ) );

    T := AlgebroidFromDataTables( data_tables : colors := A_1!.colors, range_of_HomStructure := RangeCategoryOfHomomorphismStructure( A_1 ) );
    
    SetLabelsOfBasesElements( T, labels_of_bases_elements );
    
    return T;
    
end );

##
InstallMethod( \*,
          [ IsAlgebroidFromDataTables, IsAlgebroidFromDataTables ],
  
  { A_1, A_2 } -> TensorProductOfAlgebroids( A_1, A_2 :
                      #= comment for Julia
                      eager := false
                      # =#
                      )
);

##
InstallMethod( ElementaryTensor,
        [ IsObjectInAlgebroidFromDataTables, IsObjectInAlgebroidFromDataTables, IsAlgebroidFromDataTables ],
  
  function ( obj_1, obj_2, A_1_x_A_2 )
    local q2;
    
    q2 := UnderlyingQuiver( CapCategory( obj_2 ) );
    
    return SetOfObjects( A_1_x_A_2 )[( ObjectIndex( obj_1 ) - 1 ) * NumberOfObjects( q2 ) + ObjectIndex( obj_2 )];
    
end );

##
InstallMethod( ElementaryTensor,
        [ IsMorphismInAlgebroidFromDataTables, IsMorphismInAlgebroidFromDataTables, IsAlgebroidFromDataTables ],
  
  function ( mor_1, mor_2, A_1_x_A_2 )
    
    return MorphismConstructor( A_1_x_A_2,
                ElementaryTensor( Source( mor_1 ), Source( mor_2 ), A_1_x_A_2 ),
                Concatenation( List( CoefficientsList( mor_1 ),
                                        c_1 -> List( CoefficientsList( mor_2 ),
                                          c_2 -> c_1 * c_2 ) ) ),
                Concatenation( List( IndicesOfSupportMorphisms( mor_1 ),
                                        l -> List( IndicesOfSupportMorphisms( mor_2 ),
                                          r -> (l-1) * Length( CoefficientsList( mor_2 ) ) + r ) ) ),
                ElementaryTensor( Target( mor_1 ), Target( mor_2 ), A_1_x_A_2 ) );
    
end );

##
InstallOtherMethod( ElementaryTensor,
        [ IsObjectInAlgebroidFromDataTables, IsObjectInAlgebroidFromDataTables ],
  
  { obj_1, obj_2 } -> ElementaryTensor( obj_1, obj_2, TensorProductOfAlgebroids( CapCategory( obj_1 ), CapCategory( obj_2 ) ) )
);

##
InstallOtherMethod( ElementaryTensor,
        [ IsMorphismInAlgebroidFromDataTables, IsMorphismInAlgebroidFromDataTables ],
  
  { mor_1, mor_2 } -> ElementaryTensor( mor_1, mor_2, TensorProductOfAlgebroids( CapCategory( mor_1 ), CapCategory( mor_2 ) ) )
);

##
InstallOtherMethod( ElementaryTensor,
        [ IsObjectInAlgebroidFromDataTables, IsMorphismInAlgebroidFromDataTables ],
  
  { obj_1, mor_2 } -> ElementaryTensor( IdentityMorphism( obj_1 ), mor_2 )
);

##
InstallOtherMethod( ElementaryTensor,
        [ IsMorphismInAlgebroidFromDataTables, IsObjectInAlgebroidFromDataTables ],
  
  { mor_1, obj_2 } -> ElementaryTensor( mor_1, IdentityMorphism( obj_2 ) )
);

##
#InstallMethod( CellAsEvaluatableString,
#        [ IsMorphismInAlgebroidFromDataTables, IsList ], ## not HasHasGenesisOfCell
#        
#  _MorphismInAlgebroid_CellAsEvaluatableString );

###################
#
# View Methods
#
###################

##
InstallMethod( ViewString,
          [ IsObjectInAlgebroidFromDataTables ],
  
  function ( obj )
    local A;
    
    A := CapCategory( obj );
    
    return Concatenation( "<(", A!.colors.obj, LabelsOfObjects( UnderlyingQuiver( A ) )[ObjectIndex( obj )], A!.colors.reset, ")>");
    
end );

##
InstallMethod( DisplayString,
          [ IsObjectInAlgebroidFromDataTables ],
  
  o -> Concatenation( ViewString( o ), "\n" ) );

##
InstallMethod( LaTeXOutput,
          [ IsObjectInAlgebroidFromDataTables ],
  
  function ( obj )
    
    return LaTeXOutput( SetOfObjects( UnderlyingQuiver( CapCategory( obj ) ) )[ObjectIndex( obj )] );
    
end );

##
InstallMethod( ViewString,
          [ IsMorphismInAlgebroidFromDataTables ],
  
  function ( alpha )
    local A, q, i, j, coeffs, indices_nonzero_coeffs, colors, datum_string, labels;
    
    A := CapCategory( alpha );
    
    q := UnderlyingQuiver( A );
    
    i := ObjectIndex( Source( alpha ) );
    j := ObjectIndex( Target( alpha ) );
    
    coeffs := CoefficientsList( alpha );
    indices_nonzero_coeffs := IndicesOfSupportMorphisms( alpha );
    
    colors := A!.colors;
    
    if IsEmpty( indices_nonzero_coeffs ) then
        datum_string := Concatenation( colors.coeff, "0", colors.reset );
    else
        coeffs := List( coeffs{indices_nonzero_coeffs}, String );
        coeffs := List( coeffs, c -> Concatenation( colors.coeff, c, colors.reset ) );
        
        labels := LabelsOfBasesElements( A )[i][j]{indices_nonzero_coeffs};
        labels := List( labels, l -> Concatenation( colors.basis_elm, l, colors.reset ) );
        
        datum_string := JoinStringsWithSeparator( ListN( coeffs, labels, { c, l } -> Concatenation( c, "*", l ) ), " + " );
        datum_string := ReplacedString( datum_string, Concatenation( "+ ", colors.coeff, "-" ), Concatenation( "- ", colors.coeff ) );
    fi;
    
    return Concatenation(
          "<",
          datum_string,
          colors.other,
          ":",
          colors.reset,
          "(",
          colors.obj,
          LabelsOfObjects( q )[i],
          colors.reset,
          ") ",
          colors.other,
          "→",
          colors.reset,
          " (",
          colors.obj,
          LabelsOfObjects( q )[j],
          colors.reset,
          ")>" );
    
end );

##
InstallMethod( DisplayString,
          [ IsMorphismInAlgebroidFromDataTables ],
  
  m -> Concatenation( ViewString( m ), "\n" ) );

##
InstallMethod( LaTeXOutput,
          [ IsMorphismInAlgebroidFromDataTables ],
  
  function ( alpha )
    local A, q, i, j, coeffs, support, string;
    
    A := CapCategory( alpha );
    q := UnderlyingQuiver( A );
    
    i := ObjectIndex( Source( alpha ) );
    j := ObjectIndex( Target( alpha ) );
    
    coeffs := CoefficientsList( alpha );
    support := IndicesOfSupportMorphisms( alpha );
    
    if IsEmpty( support ) then
        string := "0";
    else
        coeffs := List( coeffs{support},
                    function ( c )
                      
                      if c in [ 1, -1 ] then
                          return ReplacedString( LaTeXOutput( c ), "1", "" );
                      else
                          return Concatenation( LaTeXOutput( c ), "\\cdot " );
                      fi;
                      
                    end );
        
        string := LaTeXStringsOfBasesElements( A )[i][j]{support};
        
        string := ReplacedString( JoinStringsWithSeparator( ListN( coeffs, string, { c, l } -> Concatenation( c, l ) ), " + " ), "+ -", "- " );
    fi;
    
    if ValueOption( "OnlyDatum" ) = true then
      
      return string;
      
    else
      
      return Concatenation(
                "{", LaTeXOutput( Source( alpha ) ), "}-\\left(",
                "{", string, "}\\right)\\rightarrow",
                "{", LaTeXOutput( Target( alpha ) ), "}" );
    
    fi;
    
end );


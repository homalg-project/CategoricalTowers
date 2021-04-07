# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicGradedModules: Finitely presented graded modules over computable graded rings allowing multiple presentations and the notion of elements
#
# Implementations
#

##
InstallOtherMethod( RepresentationObjectOfKoszulId,
        "for an integer, a homalg/CAP graded module",
        [ IsInt, IsCapCategoryIntrinsicObject and IsGradedModuleRep ],
        
  function( d, M )
    local pos_pres, S, A, n, Md, g, presentation;
    
    pos_pres := PositionOfTheDefaultPresentation( M );
    
    if not IsBound( M!.RepresentationObjectsOfKoszulId ) then
        M!.RepresentationObjectsOfKoszulId := rec( );
    fi;
    if not IsBound( M!.RepresentationObjectsOfKoszulId!.(pos_pres) ) then
        M!.RepresentationObjectsOfKoszulId!.(pos_pres) := rec( );
    fi;
    if IsBound( M!.RepresentationObjectsOfKoszulId!.(pos_pres)!.(d) ) then
        return M!.RepresentationObjectsOfKoszulId!.(pos_pres)!.(d);
    fi;
    
    S := HomalgRing( M );
    
    A := KoszulDualRing( S );
    
    n := Length( IndeterminateAntiCommutingVariablesOfExteriorRing( A ) );
    
    Md := HomStructure( S^-d, M );
    
    g := NrGenerators( Md );
    
    Md := MatrixOfRelations( Md );
    
    if IsHomalgLeftObjectOrMorphismOfLeftObjects( M ) then
        presentation := LeftPresentationWithDegrees;
    else
        presentation := RightPresentationWithDegrees;
    fi;
    
    Md := presentation( A * Md, ListWithIdenticalEntries( g, d + n ) );
    
    NrRelations( Md );
    
    M!.RepresentationObjectsOfKoszulId!.(pos_pres)!.(d) := Md;
    
    return Md;
    
end );

##
InstallMethod( RepresentationMapsOfKoszulId,
        "for an integer and a homalg/CAP graded module",
        [ IsInt, IsCapCategoryIntrinsicObject and IsGradedModuleRep ],
        
  function( d, M )
    local pos_pres, S, vars, weights, pos, EC;
    
    pos_pres := PositionOfTheDefaultPresentation( M );
    
    if not IsBound( M!.RepresentationMapsOfKoszulId ) then
        M!.RepresentationMapsOfKoszulId := rec( );
    fi;
    if not IsBound( M!.RepresentationMapsOfKoszulId!.(pos_pres) ) then
        M!.RepresentationMapsOfKoszulId!.(pos_pres) := rec( );
    fi;
    if IsBound( M!.RepresentationMapsOfKoszulId!.(pos_pres)!.(d) ) then
        return M!.RepresentationMapsOfKoszulId!.(pos_pres)!.(d);
    fi;
    
    S := HomalgRing( M );
    
    vars := Indeterminates( S );
    
    weights := WeightsOfIndeterminates( S );
    
    weights := List( weights, HomalgElementToInteger );
    
    if not Set( weights ) = [ 1 ] then
        
        pos := Filtered( [ 1 .. Length( weights ) ], p -> weights[p] = 1 );
        
        ## the variables of weight 1
        vars := vars{pos};
        
    fi;
    
    ## this whole computation is over S = HomalgRing( M )
    vars := List( vars, x -> HomalgMatrix( [ x ], 1, 1, S ) );
    vars := List( vars, x -> GradedMap( x, S^(-d-1), S^-d ) ); ## x: S^{-d-1} -> S^{-d}
    vars := List( vars, x -> HomStructure( x, M ) );    ## x: M_d = Hom(S^{-d},M) -> Hom(S^{-d-1},M) = M_{d+1}
    
    Perform( vars, function( x ) SetIsMorphism( x, true ); end );
    
    M!.RepresentationMapsOfKoszulId!.(pos_pres)!.(d) := vars;
    
    return vars;
    
end );

##
InstallMethod( RepresentationMatrixOfKoszulId,
        "for an integer, a homalg/CAP graded module, and a graded homalg ring",
        [ IsInt, IsCapCategoryIntrinsicObject and IsGradedModuleRep, IsHomalgGradedRing ],
        
  function( d, M, A )
    local pos_pres, pos, dual, weights, vars;
    
    pos_pres := PositionOfTheDefaultPresentation( M );
    
    if not IsBound( M!.RepresentationMatricesOfKoszulId ) then
        M!.RepresentationMatricesOfKoszulId := rec( );
    fi;
    if not IsBound( M!.RepresentationMatricesOfKoszulId!.(pos_pres) ) then
        M!.RepresentationMatricesOfKoszulId!.(pos_pres) := rec( );
    fi;
    if IsBound( M!.RepresentationMatricesOfKoszulId!.(pos_pres)!.(d) ) then
        return M!.RepresentationMatricesOfKoszulId!.(pos_pres)!.(d);
    fi;
    
    dual := Indeterminates( A );
    
    weights := WeightsOfIndeterminates( A );

    weights := List( weights, HomalgElementToInteger );
    
    if not Set( weights ) = [ -1 ] then
        
        pos := Filtered( [ 1 .. Length( weights ) ], p -> weights[p] = -1 );
        
        ## the variables of weight 1
        dual := dual{pos};
        
    fi;    
    
    vars := RepresentationMapsOfKoszulId( d, M );
    vars := List( vars, MatrixOfMap );
    vars := List( vars, mat -> A * mat );
    
    vars := Sum( [ 1 .. Length( vars ) ], i -> dual[i] * vars[i] );
    
    M!.RepresentationMatricesOfKoszulId!.(pos_pres)!.(d) := vars;
    
    return vars;
    
end );

##
InstallMethod( RepresentationMapOfKoszulId,
        "for an integer and a homalg/CAP graded module",
        [ IsInt, IsCapCategoryIntrinsicObject and IsGradedModuleRep ],
        
  function( d, M )
    local vars, EC;
    
    vars := RepresentationMapsOfKoszulId( d, M );
    
    EC := ExteriorPowersCategory( Length( vars ), CapCategory( vars[1] ) );
    
    vars := MorphismInExteriorPowersCategory(
                    ObjectInExteriorPowersCategory( Source( vars[1] ), d , EC ),
                    vars,
                    ObjectInExteriorPowersCategory( Range( vars[1] ), d + 1, EC ) );
    
    return vars;
    
end );

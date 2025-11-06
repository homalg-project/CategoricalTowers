# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Implementations
#

####################################
#
# global variables:
#
####################################

##
InstallGlobalFunction( SimplicialCategoryTruncatedInDegree,
  
  FunctionWithNamedArguments(
  [
    [ "range_of_HomStructure", fail ],
    [ "FinalizeCategory", true ],
  ],
  function ( CAP_NAMED_ARGUMENTS, n )
    local F, rels, Delta;
    
    if n = 0 then
        
        F := PathCategory( FinQuiver( "Delta(C0)[]" ) : range_of_HomStructure := CAP_NAMED_ARGUMENTS.range_of_HomStructure, FinalizeCategory := CAP_NAMED_ARGUMENTS.FinalizeCategory );
        
        Delta := F;
        
    elif n = 1 then
        
        F := PathCategory( FinQuiver( "Delta(C0,C1)[id:C1->C0,s:C0->C1,t:C0->C1]" ) );
        
        rels := List( [ [ "s*id", "id_C0" ],
                        [ "t*id", "id_C0" ] ],
                  pair -> Pair( CallFuncListAtRuntime( \/, [ pair[1], F ] ), CallFuncListAtRuntime( \/, [ pair[2], F ] ) ) );
        
        Delta := CallFuncListAtRuntime(
                    {} -> QuotientCategory( F, rels : range_of_HomStructure := CAP_NAMED_ARGUMENTS.range_of_HomStructure, FinalizeCategory := CAP_NAMED_ARGUMENTS.FinalizeCategory ),
                    [] );
        
    elif n = 2 then
        
        F := PathCategory( FinQuiver( "Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,is:C2->C1,it:C2->C1,ps:C1->C2,pt:C1->C2,mu:C1->C2]" ) );
        
        rels := List( [ [ "s*id", "id_C0" ],
                        [ "t*id", "id_C0" ],
                        [ "ps*is", "id_C1" ],
                        [ "pt*it", "id_C1" ],
                        [ "is*id", "it*id" ], ## s(1_M) == M == t(1_M)
                        [ "pt*is", "id*t" ],
                        [ "ps*it", "id*s" ],
                        [ "s*pt", "t*ps" ],
                        [ "s*mu", "s*ps" ],
                        [ "t*mu", "t*pt" ],
                        [ "mu*is", "id_C1" ],
                        [ "mu*it", "id_C1" ] ],
                  pair -> Pair( CallFuncListAtRuntime( \/, [ pair[1], F ] ), CallFuncListAtRuntime( \/, [ pair[2], F ] ) ) );
        
        Delta := CallFuncListAtRuntime(
                    {} -> QuotientCategory( F, rels : range_of_HomStructure := CAP_NAMED_ARGUMENTS.range_of_HomStructure, FinalizeCategory := CAP_NAMED_ARGUMENTS.FinalizeCategory ),
                    [] );
        
    else
        
        Error( "the case n > 2 is not implemented yet\n" );
        
    fi;
    
    return Delta;
    
end ) );

##
BindGlobal( "SimplicialCategoryTruncatedInDegree2",
        SimplicialCategoryTruncatedInDegree( 2 ) );

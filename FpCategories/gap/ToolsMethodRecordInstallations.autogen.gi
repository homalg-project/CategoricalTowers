# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Implementations
#
# THIS FILE IS AUTOMATICALLY GENERATED, SEE CAP_project/CAP/gap/MethodRecordTools.gi

## SetOfGeneratingMorphismsOfCategory
InstallMethod( AddSetOfGeneratingMorphismsOfCategory,
               [ IsCapCategory, IsFunction ],
               
  function( category, func )
    
    AddCapOperation( "SetOfGeneratingMorphismsOfCategory", category, func, -1 );
    
end );

InstallMethod( AddSetOfGeneratingMorphismsOfCategory,
               [ IsCapCategory, IsFunction, IsInt ],
               
    FunctionWithNamedArguments(
        [
            [ "IsPrecompiledDerivation", false ],
        ],
        function( CAP_NAMED_ARGUMENTS, category, func, weight )
            
            AddCapOperation( "SetOfGeneratingMorphismsOfCategory", category, func, weight : IsPrecompiledDerivation := CAP_NAMED_ARGUMENTS.IsPrecompiledDerivation );
            
        end
    )
);

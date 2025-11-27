#! @BeginChunk PrecompileAdelmanCategoryOfAdditiveClosureOfAlgebroid

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "Algebroids", false );
#! true
LoadPackage( "CompilerForCAP", ">= 2025.11-01", false );
#! true
ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" );
#! true

QQ := HomalgFieldOfRationals( );;
snake_quiver := RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" );;
A := PathAlgebra( QQ, snake_quiver );;

SetRingFilter( A, IsQuiverAlgebra );
SetRingElementFilter( A, IsQuiverAlgebraElement );

ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" );
#! true

# only valid for the construction above
# FIXME: IsInt should be IsRat, but specializations of types are not yet supported by CompilerForCAP
# this might already have been added by PrecompileAdditiveClosureOfAlgebroid.g
if not IsBound( CAP_JIT_INTERNAL_TYPE_SIGNATURES.CoefficientsOfPaths ) then CapJitAddTypeSignature( "CoefficientsOfPaths", [ IsList, IsQuiverAlgebraElement ], CapJitDataTypeOfListOf( IsInt ) ); fi;
if not IsBound( CAP_JIT_INTERNAL_TYPE_SIGNATURES.HomStructureOnBasisPaths ) then
    CapJitAddTypeSignature( "HomStructureOnBasisPaths", [ IsAlgebroid ], function ( input_types )
        
        return CapJitDataTypeOfListOf(
                       CapJitDataTypeOfListOf(
                               CapJitDataTypeOfListOf(
                                       CapJitDataTypeOfListOf(
                                               CapJitDataTypeOfListOf(
                                                       CapJitDataTypeOfListOf(
                                                               CapJitDataTypeOfListOf(
                                                                       CapJitDataTypeOfListOf( IsInt ) ) ) ) ) ) ) ); end ); fi;


# EXPERIMENTAL
Add( CAP_JIT_EXPENSIVE_FUNCTION_NAMES, "CoefficientsOfPaths" );

precompile_AdelmanCategoryOfAdditiveClosureOfAlgebroid := function( Rq, over_Z, ring )
    CapJitPrecompileCategoryAndCompareResult(
        EvalString( ReplacedString( """Rq -> AdelmanCategory( AdditiveClosure( Algebroid(
            Rq, over_Z : FinalizeCategory := true
        ) : FinalizeCategory := true ) )""", "over_Z", String( over_Z ) ) ),
        [ Rq ],
        "Algebroids",
        Concatenation(
            "AdelmanCategoryOfAdditiveClosureOfAlgebroidOfFiniteDimensionalQuiverAlgebraOfRightQuiverOver",
            ring,
            "Precompiled"
        ) :
        operations := [
            "IsZeroForMorphisms",
            "CokernelProjection",
            "IsDominating",
            "IsEqualAsSubobjects",
        ]
    ); end;;

precompile_AdelmanCategoryOfAdditiveClosureOfAlgebroid( A, false, "Field" );
precompile_AdelmanCategoryOfAdditiveClosureOfAlgebroid( A, true, "Z" );

AdelmanCategoryOfAdditiveClosureOfAlgebroidOfFiniteDimensionalQuiverAlgebraOfRightQuiverOverFieldPrecompiled( A );
#! Adelman category( AdditiveClosure( Algebroid( Q, FreeCategory(
#! RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) ) )

AdelmanCategoryOfAdditiveClosureOfAlgebroidOfFiniteDimensionalQuiverAlgebraOfRightQuiverOverZPrecompiled( A );
#! Adelman category( AdditiveClosure( Algebroid( Z, FreeCategory(
#! RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) ) )

AdelmanCategory( AdditiveClosure( Algebroid( A, false ) ) )!.precompiled_functions_added;
#! true

AdelmanCategory( AdditiveClosure( Algebroid( A, true ) ) )!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample

#! @EndChunk

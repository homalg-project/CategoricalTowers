#! @BeginChunk PrecompileAdditiveClosureOfAlgebroid

#! @Example

#! #@if ValueOption( "no_precompiled_code" ) <> true

LoadPackage( "Algebroids", false );
#! true
LoadPackage( "CompilerForCAP", false );
#! true

QQ := HomalgFieldOfRationals( );;
snake_quiver := RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" );;
A := PathAlgebra( QQ, snake_quiver );;

ReadPackageOnce( "Algebroids", "gap/CompilerLogic.gi" );
#! true

# only valid for the construction above
# FIXME: IsInt should be IsRat, but specializations of types are not yet supported by CompilerForCAP
CapJitAddTypeSignature( "CoefficientsOfPaths", [ IsList, IsQuiverAlgebraElement ], CapJitDataTypeOfListOf( IsInt ) );

# EXPERIMENTAL
Add( CAP_JIT_EXPENSIVE_FUNCTION_NAMES, "CoefficientsOfPaths" );

precompile_AdditiveClosureOfAlgebroid :=
  function( Rq, over_Z, ring )
    CapJitPrecompileCategoryAndCompareResult(
        EvalString( ReplacedString( """Rq -> AdditiveClosure( Algebroid(
            Rq, over_Z : FinalizeCategory := true
        ) )""", "over_Z", String( over_Z ) ) ),
        [ Rq ],
        "Algebroids",
        Concatenation(
            "AdditiveClosureOfAlgebroidOfFiniteDimensionalQuiverAlgebraOfRightQuiverOver",
            ring,
            "Precompiled"
        ) :
        operations := "primitive"
    ); end;;

precompile_AdditiveClosureOfAlgebroid( A, false, "Field" );
precompile_AdditiveClosureOfAlgebroid( A, true, "Z" );

AdditiveClosureOfAlgebroidOfFiniteDimensionalQuiverAlgebraOfRightQuiverOverFieldPrecompiled( A );
#! AdditiveClosure( Algebroid( Q, FreeCategory( RightQuiver(
#! "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) )

AdditiveClosure( Algebroid( A, false ) )!.precompiled_functions_added;
#! true

AdditiveClosure( Algebroid( A, true ) )!.precompiled_functions_added;
#! true

#! #@fi

#! @EndExample

#! @EndChunk

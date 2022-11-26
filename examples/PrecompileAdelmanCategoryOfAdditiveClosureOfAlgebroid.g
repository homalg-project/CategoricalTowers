#! @BeginChunk PrecompileAdelmanCategoryOfAdditiveClosureOfAlgebroid

#! @Example

LoadPackage( "Algebroids", false );
#! true
LoadPackage( "CompilerForCAP", false );
#! true
ReadPackage( "Algebroids", "gap/CompilerLogic.gi" );
#! true

QQ := HomalgFieldOfRationals( );;
snake_quiver := RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" );;
A := PathAlgebra( QQ, snake_quiver );;

ReadPackage( "Algebroids", "gap/CompilerLogic.gi" );
#! true

# only valid for the construction above
# FIXME: IsInt should be IsRat, but specializations of types are not yet supported by CompilerForCAP
# this might already have been added by PrecompileAdditiveClosureOfAlgebroid.g
if not IsBound( CAP_JIT_INTERNAL_TYPE_SIGNATURES.CoefficientsOfPaths ) then CapJitAddTypeSignature( "CoefficientsOfPaths", [ IsList, IsQuiverAlgebraElement ], rec( filter := IsList, element_type := rec( filter := IsInt ) ) ); fi;

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
#! Adelman category( Additive closure( Algebroid( Q, FreeCategory(
#! RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) ) )

AdelmanCategoryOfAdditiveClosureOfAlgebroidOfFiniteDimensionalQuiverAlgebraOfRightQuiverOverZPrecompiled( A );
#! Adelman category( Additive closure( Algebroid( Z, FreeCategory(
#! RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" ) ) ) ) )

#! @EndExample

#! Check that the compiled code is loaded automatically
#! for this, we use the name of the first argument of `IsZeroForMorphisms`:
#! for non-compiled code it is "cat", while for compiled code it is "cat_1"

#! @Example

cat := AdelmanCategory( AdditiveClosure( Algebroid( A, false ) ) );;
argument_name := NamesLocalVariablesFunction(
                         Last( cat!.added_functions.IsZeroForMorphisms )[1] )[1];;

( ValueOption( "no_precompiled_code" ) = true and argument_name = "cat" ) or
  ( ValueOption( "no_precompiled_code" ) = fail and argument_name = "cat_1" );
#! true

cat := AdelmanCategory( AdditiveClosure( Algebroid( A, true ) ) );;
argument_name := NamesLocalVariablesFunction(
                         Last( cat!.added_functions.IsZeroForMorphisms )[1] )[1];;

( ValueOption( "no_precompiled_code" ) = true and argument_name = "cat" ) or
  ( ValueOption( "no_precompiled_code" ) = fail and argument_name = "cat_1" );
#! true

#! @EndExample

#! @EndChunk

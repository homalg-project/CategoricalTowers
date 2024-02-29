#! @Chunk FreeBooleanAlgebra

#! Construct the free boolean algebra on two generators with its $2^(2^2)$ elements
#! in two steps.

#! @Example
LoadPackage( "FunctorCategories", false );
#! true
pq := FinQuiver( "quiver(p,q)" );
#! FinQuiver( "quiver(p,q)[]" )
F := PathCategory( pq );
#! PathCategory( FinQuiver( "quiver(p,q)[]" ) )
P := PosetOfCategory( F );
#! PosetOfCategory( PathCategory( FinQuiver( "quiver(p,q)[]" ) ) )
Length( SetOfObjects( P ) );
#! 2
Dist := FreeDistributiveCompletion( P );
#! FreeDistributiveCompletion(
#! PosetOfCategory( PathCategory( FinQuiver( "quiver(p,q)[]" ) ) ) )
Display( Dist );
#! A CAP category with name FreeDistributiveCompletion(
#! PosetOfCategory( PathCategory( FinQuiver( "quiver(p,q)[]" ) ) ) ):
#! 
#! 54 primitive operations were used to derive 250 operations for this category
#! which algorithmically
#! * IsFiniteCategory
#! * IsEquippedWithHomomorphismStructure
#! * IsHeytingAlgebra
#! and not yet algorithmically
#! * IsBiHeytingAlgebra
Length( SetOfObjects( Dist ) );
#! 6
#Splash( DotVertexLabelledDigraph( Dist, [ [ Dist.p, Dist.q ] ], [ "magenta", "blue" ] ) );
DiffbCSL := MeetSemilatticeOfSingleDifferences( Dist );
#! MeetSemilatticeOfSingleDifferences( FreeDistributiveCompletion(
#! PosetOfCategory( PathCategory( FinQuiver( "quiver(p,q)[]" ) ) ) ) )
Length( SetOfObjects( DiffbCSL ) );
#! 13
#Splash( DotVertexLabelledDigraph( DiffbCSL, [ [ DiffbCSL.p, DiffbCSL.q ], SetOfGeneratingObjects( DiffbCSL ) ], [ "orange", "blue", "magenta" ] ) );
PSh := PreSheaves( DiffbCSL );
#! PreSheaves( MeetSemilatticeOfSingleDifferences( FreeDistributiveCompletion(
#! PosetOfCategory( PathCategory( FinQuiver( "quiver(p,q)[]" ) ) ) ) ),
#! IntervalCategory )
Y := YonedaEmbeddingOfSourceCategory( PSh );;
Length( SetOfObjects( PSh ) );
#! 85
coproducts := [ [ 1, [ ] ],
                [ 3, [ 5, 11 ] ],
                [ 4, [ 5, 12 ] ],
                [ 7, [ 10, 12 ] ],
                [ 8, [ 10, 11 ] ],
                [ 13, [ 11, 12 ] ],
                [ 6, [ 3, 4, 13 ] ],
                [ 9, [ 7, 8, 13 ] ],
                [ 2, [ 6, 9 ] ] ];;
PSh_J := ClosedPreSheavesWRTCoproductsByIndices( DiffbCSL, coproducts );;
psh_J := ModelingCategory( ModelingCategory( PSh_J ) );;
Assert( 0, Length( SetOfObjects( psh_J ) ) = 16 );
is_closed := psh_J!.ObjectMembershipFunction;
closed := SetOfObjects( PSh_J );;
Assert( 0, Length( closed ) = 16 );
Assert( 0, ForAll( closed, obj -> is_closed( ObjectDatum( ModelingObject( PSh_J, obj ) ) ) ) );
#Splash( DotVertexLabelledDigraph( PSh, [ [ PSh.p, PSh.q ], List( SetOfGeneratingObjects( DiffbCSL ), Y ), Y, psh_J ], [ "gray", "blue", "magenta", "orange", "red" ] ) );
#Splash( DotVertexLabelledDigraph( psh_J, [ [ PSh.p, PSh.q ], List( SetOfGeneratingObjects( DiffbCSL ), Y ), Y ], [ "red", "blue", "magenta", "orange" ] : offset := 0 ) );
#! @EndExample

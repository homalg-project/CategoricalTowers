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
DiffbCSL := MeetSemilatticeOfSingleDifferences( Dist );
#! MeetSemilatticeOfSingleDifferences( FreeDistributiveCompletion(
#! PosetOfCategory( PathCategory( FinQuiver( "quiver(p,q)[]" ) ) ) ) )
Length( SetOfObjects( DiffbCSL ) );
#! 13
PSh := PreSheaves( DiffbCSL );
#! PreSheaves( MeetSemilatticeOfSingleDifferences( FreeDistributiveCompletion(
#! PosetOfCategory( PathCategory( FinQuiver( "quiver(p,q)[]" ) ) ) ) ),
#! IntervalCategory )
Y := YonedaEmbeddingOfSourceCategory( PSh );;
Length( SetOfObjects( PSh ) );
#! 85
cocones := [ [ 0, [ ] ],
             [ 2, [ 4, 10 ] ],
             [ 3, [ 4, 11 ] ],
             [ 6, [ 9, 11 ] ],
             [ 7, [ 9, 10 ] ],
             [ 12, [ 10, 11 ] ],
             [ 5, [ 2, 3, 12 ] ],
             [ 8, [ 6, 7, 12 ] ],
             [ 1, [ 5, 8 ] ] ];;
is_closed := G -> IsClosedPreSheafWRTCoproductsByIndices( PSh, G, cocones : offset := 1 );
PShJ := FullSubcategoryByObjectMembershipFunction( PSh, is_closed );
#! FullSubcategoryByObjectMembershipFunction( PreSheaves(
#! MeetSemilatticeOfSingleDifferences( FreeDistributiveCompletion(
#! PosetOfCategory( PathCategory( FinQuiver( "quiver(p,q)[]" ) ) ) ) ),
#! IntervalCategory ), ObjectMembershipFunction )
Length( SetOfObjects( PShJ ) );
#! 16
#Splash( DotVertexLabelledDigraph( PSh, [ [ PSh.p, PSh.q ], List( SetOfGeneratingObjects( DiffbCSL ), Y ), Y, PShJ ], [ "gray", "blue", "magenta", "orange", "red" ] ) );
#Splash( DotVertexLabelledDigraph( PShJ, [ [ PSh.p, PSh.q ], List( SetOfGeneratingObjects( DiffbCSL ), Y ), Y ], [ "red", "blue", "magenta", "orange" ] ) );
#! @EndExample

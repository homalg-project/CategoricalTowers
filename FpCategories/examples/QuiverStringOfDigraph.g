#! @Chunk QuiverStringOfDigraph

#! @Example
LoadPackage( "Locales", false );
#! true
LoadPackage( "FpCategories", false );
#! true
q := "q(1,2,3,4)[m_1_2:1->2,m_1_3:1->3,m_2_4:2->4,m_3_4:3->4]";;
F := PathCategory( FinQuiver( q ) );
#! PathCategory( FinQuiver(
#! "q(1,2,3,4)[m_1_2:1-≻2,m_1_3:1-≻3,m_2_4:2-≻4,m_3_4:3-≻4]" ) )
digraph := DigraphReflexiveTransitiveReduction(
                   Digraph( SetOfObjects( F ), IsHomSetInhabited ) );
#! <immutable digraph with 4 vertices, 4 edges>
QuiverStringOfDigraph( digraph, "q", "m" ) = q;
#! true
#! @EndExample

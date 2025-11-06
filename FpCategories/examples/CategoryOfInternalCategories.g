#! @BeginChunk CategoryOfInternalCategories

#! @Example
LoadPackage( "FunctorCategories", false );
#! true
Delta2 := SimplicialCategoryTruncatedInDegree( 2 );
#! PathCategory( FinQuiver(
#!   "Delta(C0,C1,C2)[id:C1→C0,s:C0→C1,t:C0→C1,
#!                    is:C2→C1,it:C2→C1,ps:C1→C2,pt:C1→C2,mu:C1→C2]" ) )
#! / [ s⋅id = id(C0), t⋅id = id(C0), ps⋅is = id(C1), ... ]
N := NerveTruncatedInDegree2( Delta2 );
#! <An object in PreSheaves( PathCategory( FinQuiver(
#!  "Delta(C0,C1,C2)[id:C1→C0,s:C0→C1,t:C0→C1,
#!                   is:C2→C1,it:C2→C1,ps:C1→C2,pt:C1→C2,mu:C1→C2]" ) )
#!  / [ s⋅id = id(C0), t⋅id = id(C0), ps⋅is = id(C1), ... ], SkeletalFinSets )>
IntCat := CategoryOfInternalCategories(
                  RangeCategoryOfHomomorphismStructure( Delta2 ) );
#! FullSubcategoryByObjectMembershipFunction(
#! PreSheaves( PathCategory( FinQuiver(
#!   "Delta(C0,C1,C2)[id:C1→C0,s:C0→C1,t:C0→C1,
#!                    is:C2→C1,it:C2→C1,ps:C1→C2,pt:C1→C2,mu:C1→C2]" ) )
#! / [ s⋅id = id(C0), t⋅id = id(C0), ps⋅is = id(C1), ... ], SkeletalFinSets ),
#! ObjectMembershipFunction )
# @drop_example_in_Julia
#! @EndExample
#! @EndChunk

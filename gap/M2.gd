#
# M2: Intrinsic modules with elements for the CAP based homalg
#
# Declarations
#

#! @Description
#!  
#! @Arguments R
#! @Returns an intrinsic cateogry of left modules
DeclareAttribute( "CategoryOfHomalgLeftModules",
        IsHomalgRing );

#! @Description
#!  
#! @Arguments R
#! @Returns an intrinsic cateogry of right modules
DeclareAttribute( "CategoryOfHomalgRightModules",
        IsHomalgRing );

#! @Description
#!  
#! @Arguments M
#! @Returns a homalg module, i.e., an intrinsic module with generators for each cell
DeclareOperation( "HomalgModule",
        [ IsLeftOrRightPresentation ] );

#! @Description
#!  
#! @Arguments mat
#! @Returns a homalg left module
DeclareOperation( "LeftPresentation",
        [ IsHomalgMatrix ] );

#! @Description
#!  
#! @Arguments mat
#! @Returns a homalg right module
DeclareOperation( "RightPresentation",
        [ IsHomalgMatrix ] );


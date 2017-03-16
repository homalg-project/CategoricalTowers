#! @Chapter Relations

#! @Section Constructors

#! @Description
#!  Add the filters <C>IsHomalgRelationsOfLeftModule</C> resp. <C>IsHomalgRelationsOfRightModule</C>
#!  to the <C>IsLeftOrRightPresentation</C> <A>rel</A> and return <A>rel</A>.
#! @Arguments rel
#! @Returns rel with side effect
DeclareOperation( "HomalgRelationsForModule",
        [ IsLeftOrRightPresentation ] );

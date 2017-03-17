#! @Chapter Relations

#! @Section Constructors

#! @Description
#!  Add the filters <C>IsHomalgRelationsOfLeftModule</C> resp. <C>IsHomalgRelationsOfRightModule</C>
#!  to <A>rel</A> of (type <C>IsLeftOrRightPresentation</C>) and return it.
#! @Arguments rel
#! @Returns rel with side effect
DeclareOperation( "HomalgRelationsForModule",
        [ IsLeftOrRightPresentation ] );

#! @Chapter Relations

#! @Section Constructors

#! @Description
#!  Add the filters <C>IsHomalgRelationsOfLeftModule</C> resp. <C>IsHomalgRelationsOfRightModule</C>
#!  to <A>rels</A> of (type <C>IsLeftOrRightPresentation</C>) and return it.
#! @Arguments rels
#! @Returns rels with side effect
DeclareOperation( "HomalgRelationsForModule",
        [ IsLeftOrRightPresentation ] );

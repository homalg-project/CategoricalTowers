#! @Chapter Generators

#! @Section Constructors

#! @Description
#!  Add the filters <C>IsHomalgGeneratorsOfLeftModule</C> resp. <C>IsHomalgGeneratorsOfRightModule</C>
#!  to the <C>IsLeftOrRightPresentation</C> <A>rel</A> and return <A>rel</A>.
#! @Arguments rel
#! @Returns rel with side effect
DeclareOperation( "HomalgGeneratorsForModule",
        [ IsLeftOrRightPresentationMorphism ] );

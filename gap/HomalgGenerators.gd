#! @Chapter Generators

#! @Section Constructors

#! @Description
#!  Add the filters <C>IsHomalgGeneratorsOfLeftModule</C> resp. <C>IsHomalgGeneratorsOfRightModule</C>
#!  to the <C>IsLeftOrRightPresentation</C> <A>gens</A> and return <A>gens</A>.
#! @Arguments gens
#! @Returns gens with side effect
DeclareOperation( "HomalgGeneratorsForModule",
        [ IsLeftOrRightPresentationMorphism ] );

#! @Section Operations

#! @Description
#!  If <C>HasProcedureToReadjustGenerators</C>( <A>o</A> ) then
#!  set them for <A>gens</A>.
#!  Likewise for the attribute <C>ProcedureToNormalizeGenerators</C>.
#! @Arguments o, gens
#! @Returns non
DeclareOperation( "UpdateHomalgGenerators",
        [ IsObject, IsHomalgGenerators ] );

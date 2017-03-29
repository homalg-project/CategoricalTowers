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
#!  If <C>HasProcedureToReadjustGenerators</C>( <A>gens</A> ) then
#!  set them for <A>gens_new</A>.
#!  Likewise for <C>ProcedureToNormalizeGenerators</C>.
#! @Arguments gens, gens_new
#! @Returns non
DeclareOperation( "UpdateHomalgGenerators",
        [ IsHomalgGenerators, IsHomalgGenerators ] );

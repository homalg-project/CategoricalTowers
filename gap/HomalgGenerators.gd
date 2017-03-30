#! @Chapter Generators

#! @Section Constructors

#! @Description
#!  Add the filters <C>IsHomalgGeneratorsOfLeftModule</C> resp. <C>IsHomalgGeneratorsOfRightModule</C>
#!  (depending on the parity of <A>M</A>) to <A>gens</A> and return it.
#! @Arguments gens
#! @Returns gens with side effect
DeclareOperation( "HomalgGeneratorsForModule",
        [ IsLazyGeneralizedEmbeddingInAmbientObject, IsHomalgModule ] );

#! @Section Operations

#! @Description
#!  If <C>HasProcedureToReadjustGenerators</C>( <A>o</A> ) then
#!  set them for <A>gens</A>.
#!  Likewise for the attribute <C>ProcedureToNormalizeGenerators</C>.
#! @Arguments o, gens
#! @Returns non
DeclareOperation( "UpdateHomalgGenerators",
        [ IsObject, IsHomalgGenerators ] );

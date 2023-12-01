# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Declarations
#

#! @Chapter Quotient categories of algebroids from data tables using presheaves categories

#! @Section Attributes

#! @Description
#!  The argument is an algebroid $A$ over a commutative ring $k$.
#!  The output is the presheaf object $F_{A}\in \mathrm{PSh}(A^{\mathrm{op}}\otimes A)$ which maps an object $u^{\mathrm{op}}\otimes t \in A^{\mathrm{op}}\otimes A$ to
#!  $\mathrm{Hom}_B(t,u) \in k\mbox{-}\mathrm{rows}$ and maps a morphism $g^{\mathrm{op}}\otimes f : v^{\mathrm{op}}\otimes s \to u^{\mathrm{op}}\otimes t \in A^{\mathrm{op}}\otimes A$
#!  to $f\bullet(-)\bullet g =\mathrm{Hom}_B(f,g): \mathrm{Hom}_B(t,u) \to \mathrm{Hom}_B(s,v) \in k\mbox{-}\mathrm{rows}$.
#! @Arguments A
#! @Returns a &CAP; category morphism
DeclareAttribute( "AlgebroidAsObjectInPreSheavesCategory", IsAlgebroidFromDataTables );

#! @Description
#!  The argument is a morphism $\alpha: t \to u$ in an algebroid $A$ over a commutative ring $k$.
#!  The output is the morphism $\lambda_{\alpha}:P_{u^{\mathrm{op}}\otimes t} \to F_{A}$ where $P_{u^{\mathrm{op}}\otimes t}$ is the image of $u^{\mathrm{op}}\otimes t$ under the Yoneda embdding
#!  $A^{\mathrm{op}}\otimes A \hookrightarrow \mathrm{PSh}(A^{\mathrm{op}}\otimes A)$; and $\lambda_{\alpha}$ the image of $\alpha$ under the natural isomorphism
#!  $\mathrm{Hom}_{A}(t,u) = F_{A}(u^{\mathrm{op}}\otimes t) \simeq \mathrm{Hom}_{\mathrm{PSh}(A^{\mathrm{op}}\otimes A)}(P_{u^{\mathrm{op}}\otimes t},F_{A})$.
#! @Arguments alpha
#! @Returns a &CAP; category morphism
DeclareAttribute( "AssociatedMorphismIntoAlgebroidAsObjectInPreSheavesCategory", IsMorphismInAlgebroidFromDataTables );
#! @InsertChunk QuotientsOfAlgebroidsFromDataTables

##################################################################################
# Test the correspondences between the cartesian closed structure of the category
# of the terminal category and the cocartesian coclosed structure of its opposite.
##################################################################################

gap> START_TEST("TerminalCategory.tst");

##############################################################
# (Co)Product, Exp and Coexp on objects
##############################################################

# Products and exponential objects for the terminal category

gap> T := TerminalCategoryWithMultipleObjects( );;
gap> a := ObjectConstructor( T, "a" );;
gap> b := ObjectConstructor( T, "b" );;
gap> c := ObjectConstructor( T, "c" );;
gap> d := ObjectConstructor( T, "d" );;

gap> i := InitialObject( T );;
gap> t := TerminalObject( T );;

gap> a_product_b := DirectProduct( a, b );;
gap> b_product_a := DirectProduct( b, a );;
gap> c_product_d := DirectProduct( c, d );;
gap> d_product_c := DirectProduct( d, c );;

gap> i_product_a := DirectProduct( i, a );;
gap> a_product_i := DirectProduct( a, i );;

gap> t_product_a := DirectProduct( t, a );;
gap> a_product_t := DirectProduct( a, t );;

gap> exp_ab := ExponentialOnObjects( a, b );;
gap> exp_ba := ExponentialOnObjects( b, a );;
gap> exp_cd := ExponentialOnObjects( c, d );;
gap> exp_dc := ExponentialOnObjects( d, c );;

gap> exp_ia := ExponentialOnObjects( i, a );;
gap> exp_ai := ExponentialOnObjects( a, i );;
gap> exp_ta := ExponentialOnObjects( t, a );;
gap> exp_at := ExponentialOnObjects( a, t );;

# Coproducts and coexponentials for opposite

gap> T_op := Opposite( T );;

gap> aop := Opposite( a );;
gap> bop := Opposite( b );;
gap> cop := Opposite( c );;
gap> dop := Opposite( d );;
gap> iop := Opposite( i );;

gap> iop := InitialObject( T_op );;
gap> top := TerminalObject( T_op );;

gap> a_coproduct_bop := Coproduct( aop, bop );;
gap> b_coproduct_aop := Coproduct( bop, aop );;
gap> c_coproduct_dop := Coproduct( cop, dop );;
gap> d_coproduct_cop := Coproduct( dop, cop );;

gap> i_coproduct_aop := Coproduct( iop, aop );;
gap> a_coproduct_iop := Coproduct( aop, iop );;

gap> t_coproduct_aop := Coproduct( top, aop );;
gap> a_coproduct_top := Coproduct( aop, top );;

gap> coexp_abop := CoexponentialOnObjects( aop, bop );;
gap> coexp_baop := CoexponentialOnObjects( bop, aop );;
gap> coexp_cdop := CoexponentialOnObjects( cop, dop );;
gap> coexp_dcop := CoexponentialOnObjects( dop, cop );;

gap> coexp_iaop := CoexponentialOnObjects( iop, aop );;
gap> coexp_aiop := CoexponentialOnObjects( aop, iop );;
gap> coexp_taop := CoexponentialOnObjects( top, aop );;
gap> coexp_atop := CoexponentialOnObjects( aop, top );;

# Opposite correspondence on product objects

gap> iop = Opposite( t );
true
gap> top = Opposite( i );
true

gap> a_coproduct_bop = Opposite( a_product_b );
true
gap> b_coproduct_aop = Opposite( b_product_a );
true
gap> c_coproduct_dop = Opposite( c_product_d );
true
gap> d_coproduct_cop = Opposite( d_product_c );
true

gap> i_coproduct_aop = Opposite( t_product_a );
true
gap> a_coproduct_iop = Opposite( a_product_t );
true

gap> t_coproduct_aop = Opposite( i_product_a );
true
gap> a_coproduct_top = Opposite( a_product_i );
true

gap> b_coproduct_aop = Opposite( c_product_d );
true
gap> b_coproduct_aop = Opposite( d_product_c );
true
gap> c_coproduct_dop = Opposite( a_product_b );
true
gap> c_coproduct_dop = Opposite( b_product_a );
true

# Opposite correspondence on (co)exps

gap> coexp_abop = Opposite( exp_ba );
true
gap> coexp_baop = Opposite( exp_ab );
true
gap> coexp_cdop = Opposite( exp_dc );
true
gap> coexp_dcop = Opposite( exp_cd );
true

gap> coexp_iaop = Opposite( exp_at );
true
gap> coexp_aiop = Opposite( exp_ta );
true

gap> coexp_taop = Opposite( exp_ai );
true
gap> coexp_atop = Opposite( exp_ia );
true

gap> coexp_cdop = Opposite( exp_ab );
true
gap> coexp_cdop = Opposite( exp_ba );
true
gap> coexp_dcop = Opposite( exp_ab );
true
gap> coexp_dcop = Opposite( exp_ba );
true

# Opposite must be self-inverse

gap> exp_ab = Opposite( coexp_baop );
true
gap> exp_ba = Opposite( coexp_abop );
true
gap> exp_cd = Opposite( coexp_dcop );
true
gap> exp_dc = Opposite( coexp_cdop );
true

# Convenience methods

gap> exp_ab = Exponential( a, b );
true
gap> exp_ba = Exponential( b, a );
true
gap> exp_cd = Exponential( c, d );
true
gap> exp_dc = Exponential( d, c );
true

gap> exp_ia = Exponential( i, a );
true
gap> exp_ai = Exponential( a, i );
true
gap> exp_ta = Exponential( t, a );
true
gap> exp_at = Exponential( a, t );
true

gap> coexp_abop = Coexponential( aop, bop );
true
gap> coexp_baop = Coexponential( bop, aop );
true
gap> coexp_cdop = Coexponential( cop, dop );
true
gap> coexp_dcop = Coexponential( dop, cop );
true

gap> coexp_iaop = Coexponential( iop, aop );
true
gap> coexp_aiop = Coexponential( aop, iop );
true
gap> coexp_taop = Coexponential( top, aop );
true
gap> coexp_atop = Coexponential( aop, top );
true

################################################################
# (Co)Product, Hom and CoHom on morphisms
################################################################

# Morphisms for the terminal category

gap> id_a := IdentityMorphism( a );;
gap> id_b := IdentityMorphism( b );;

gap> alpha := MorphismConstructor( a, "g_ab", b );;
gap> beta := MorphismConstructor( c, "g_cd", d );;
gap> gamma := MorphismConstructor( b, "g_bc", c );;

gap> alpha_gamma := PreCompose( alpha, gamma );;
gap> gamma_beta := PreCompose( gamma, beta );;
gap> alpha_gamma_beta := PreCompose( [ alpha, gamma, beta ] );;

gap> alpha_product_beta := DirectProductOnMorphisms( alpha, beta );;
gap> beta_product_alpha := DirectProductOnMorphisms( beta, alpha );;

gap> exp_alpha_id_a := ExponentialOnMorphisms( alpha, id_a );;
gap> exp_alpha_id_b := ExponentialOnMorphisms( alpha, id_b );;
gap> exp_id_a_alpha := ExponentialOnMorphisms( id_a, alpha );;
gap> exp_id_b_alpha := ExponentialOnMorphisms( id_b, alpha );;

gap> exp_alpha_beta := ExponentialOnMorphisms( alpha, beta );;
gap> exp_beta_alpha := ExponentialOnMorphisms( beta, alpha );;

# Morphisms for opposite of the terminal category

gap> id_aop := IdentityMorphism( aop );;
gap> id_bop := IdentityMorphism( bop );;

gap> alphaop := Opposite( alpha );;
gap> betaop := Opposite( beta );;
gap> gammaop := Opposite( gamma );;

gap> alpha_gammaop := PostCompose( alphaop, gammaop );;
gap> gamma_betaop := PostCompose( gammaop, betaop );;
gap> alpha_gamma_betaop := PostCompose( [ alphaop, gammaop, betaop ] );;

gap> alpha_coproduct_betaop := CoproductOnMorphisms( alphaop, betaop );;
gap> beta_coproduct_alphaop := CoproductOnMorphisms( betaop, alphaop );;

gap> coexp_alpha_id_aop := CoexponentialOnMorphisms( alphaop, id_aop );;
gap> coexp_alpha_id_bop := CoexponentialOnMorphisms( alphaop, id_bop );;
gap> coexp_id_a_alphaop := CoexponentialOnMorphisms( id_aop, alphaop );;
gap> coexp_id_b_alphaop := CoexponentialOnMorphisms( id_bop, alphaop );;

gap> coexp_alpha_betaop := CoexponentialOnMorphisms( alphaop, betaop );;
gap> coexp_beta_alphaop := CoexponentialOnMorphisms( betaop, alphaop );;

# Check if morphisms are well-defined

gap> IsWellDefined( alpha );
true
gap> IsWellDefined( beta );
true
gap> IsWellDefined( gamma );
true

gap> IsWellDefined( alphaop );
true
gap> IsWellDefined( betaop );
true
gap> IsWellDefined( gammaop );
true

# Opposite correspondence on products of morphisms

gap> alpha_coproduct_betaop = Opposite( alpha_product_beta );
true
gap> beta_coproduct_alphaop = Opposite( beta_product_alpha );
true

# Opposite correspondence on (co)exps

gap> coexp_alpha_betaop = Opposite( exp_beta_alpha );
true
gap> coexp_beta_alphaop = Opposite( exp_alpha_beta );
true

gap> coexp_alpha_betaop = Opposite( exp_alpha_beta );
true
gap> coexp_beta_alphaop = Opposite( exp_beta_alpha );
true

# Opposite correspondence on compositions of morphisms

gap> alpha_gammaop = Opposite( alpha_gamma );
true
gap> gamma_betaop = Opposite( gamma_beta );
true
gap> alpha_gamma_betaop = Opposite( alpha_gamma_beta );
true

gap> alpha_gammaop = Opposite( gamma_beta );
false
gap> alpha_gammaop = Opposite( alpha_gamma_beta );
false
gap> gamma_betaop = Opposite( alpha_gamma );
false
gap> gamma_betaop = Opposite( alpha_gamma_beta );
false
gap> alpha_gamma_betaop = Opposite( alpha_gamma );
false
gap> alpha_gamma_betaop = Opposite( gamma_beta );
false

# Opposite must be self-inverse

gap> exp_alpha_beta = Opposite( coexp_beta_alphaop );
true
gap> exp_beta_alpha = Opposite( coexp_alpha_betaop );
true

# Convenience methods in the opposite category

gap> exp_alpha_beta = Exponential( alpha, beta );
true
gap> exp_beta_alpha = Exponential( beta, alpha );
true

gap> coexp_alpha_betaop = Coexponential( alphaop, betaop );
true
gap> coexp_beta_alphaop = Coexponential( betaop, alphaop );
true

gap> coexp_alpha_id_aop = Coexponential( alphaop, aop );
true
gap> coexp_alpha_id_bop = Coexponential( alphaop, bop );
true
gap> coexp_id_a_alphaop = Coexponential( aop, alphaop );
true
gap> coexp_id_b_alphaop = Coexponential( bop, alphaop );
true

######################################################
# Unitors
######################################################

# Cartesian unitors

gap> cart_left_unitor_a := CartesianLeftUnitor( a );;
gap> cart_left_unitor_b := CartesianLeftUnitor( b );;
gap> cart_left_unitor_c := CartesianLeftUnitor( c );;
gap> cart_left_unitor_d := CartesianLeftUnitor( d );;
gap> cart_left_unitor_i := CartesianLeftUnitor( i );;
gap> cart_left_unitor_t := CartesianLeftUnitor( t );;

gap> cart_left_unitor_aop := CartesianLeftUnitor( aop );;
gap> cart_left_unitor_bop := CartesianLeftUnitor( bop );;
gap> cart_left_unitor_cop := CartesianLeftUnitor( cop );;
gap> cart_left_unitor_dop := CartesianLeftUnitor( dop );;
gap> cart_left_unitor_iop := CartesianLeftUnitor( iop );;
gap> cart_left_unitor_top := CartesianLeftUnitor( top );;

gap> cart_right_unitor_a := CartesianRightUnitor( a );;
gap> cart_right_unitor_b := CartesianRightUnitor( b );;
gap> cart_right_unitor_c := CartesianRightUnitor( c );;
gap> cart_right_unitor_d := CartesianRightUnitor( d );;
gap> cart_right_unitor_i := CartesianRightUnitor( i );;
gap> cart_right_unitor_t := CartesianRightUnitor( t );;

gap> cart_right_unitor_aop := CartesianRightUnitor( aop );;
gap> cart_right_unitor_bop := CartesianRightUnitor( bop );;
gap> cart_right_unitor_cop := CartesianRightUnitor( cop );;
gap> cart_right_unitor_dop := CartesianRightUnitor( dop );;
gap> cart_right_unitor_iop := CartesianRightUnitor( iop );;
gap> cart_right_unitor_top := CartesianRightUnitor( top );;

# Cocartesian unitors

gap> cocart_left_unitor_a := CocartesianLeftUnitor( a );;
gap> cocart_left_unitor_b := CocartesianLeftUnitor( b );;
gap> cocart_left_unitor_c := CocartesianLeftUnitor( c );;
gap> cocart_left_unitor_d := CocartesianLeftUnitor( d );;
gap> cocart_left_unitor_i := CocartesianLeftUnitor( i );;
gap> cocart_left_unitor_t := CocartesianLeftUnitor( t );;

gap> cocart_left_unitor_aop := CocartesianLeftUnitor( aop );;
gap> cocart_left_unitor_bop := CocartesianLeftUnitor( bop );;
gap> cocart_left_unitor_cop := CocartesianLeftUnitor( cop );;
gap> cocart_left_unitor_dop := CocartesianLeftUnitor( dop );;
gap> cocart_left_unitor_iop := CocartesianLeftUnitor( iop );;
gap> cocart_left_unitor_top := CocartesianLeftUnitor( top );;

gap> cocart_right_unitor_a := CocartesianRightUnitor( a );;
gap> cocart_right_unitor_b := CocartesianRightUnitor( b );;
gap> cocart_right_unitor_c := CocartesianRightUnitor( c );;
gap> cocart_right_unitor_d := CocartesianRightUnitor( d );;
gap> cocart_right_unitor_i := CocartesianRightUnitor( i );;
gap> cocart_right_unitor_t := CocartesianRightUnitor( t );;

gap> cocart_right_unitor_aop := CocartesianRightUnitor( aop );;
gap> cocart_right_unitor_bop := CocartesianRightUnitor( bop );;
gap> cocart_right_unitor_cop := CocartesianRightUnitor( cop );;
gap> cocart_right_unitor_dop := CocartesianRightUnitor( dop );;
gap> cocart_right_unitor_iop := CocartesianRightUnitor( iop );;
gap> cocart_right_unitor_top := CocartesianRightUnitor( top );;

# Inverse cartesian unitors

gap> cart_left_unitor_inverse_a := CartesianLeftUnitorInverse( a );;
gap> cart_left_unitor_inverse_b := CartesianLeftUnitorInverse( b );;
gap> cart_left_unitor_inverse_c := CartesianLeftUnitorInverse( c );;
gap> cart_left_unitor_inverse_d := CartesianLeftUnitorInverse( d );;
gap> cart_left_unitor_inverse_i := CartesianLeftUnitorInverse( i );;
gap> cart_left_unitor_inverse_t := CartesianLeftUnitorInverse( t );;

gap> cart_left_unitor_inverse_aop := CartesianLeftUnitorInverse( aop );;
gap> cart_left_unitor_inverse_bop := CartesianLeftUnitorInverse( bop );;
gap> cart_left_unitor_inverse_cop := CartesianLeftUnitorInverse( cop );;
gap> cart_left_unitor_inverse_dop := CartesianLeftUnitorInverse( dop );;
gap> cart_left_unitor_inverse_iop := CartesianLeftUnitorInverse( iop );;
gap> cart_left_unitor_inverse_top := CartesianLeftUnitorInverse( top );;

gap> cart_right_unitor_inverse_a := CartesianRightUnitorInverse( a );;
gap> cart_right_unitor_inverse_b := CartesianRightUnitorInverse( b );;
gap> cart_right_unitor_inverse_c := CartesianRightUnitorInverse( c );;
gap> cart_right_unitor_inverse_d := CartesianRightUnitorInverse( d );;
gap> cart_right_unitor_inverse_i := CartesianRightUnitorInverse( i );;
gap> cart_right_unitor_inverse_t := CartesianRightUnitorInverse( t );;

gap> cart_right_unitor_inverse_aop := CartesianRightUnitorInverse( aop );;
gap> cart_right_unitor_inverse_bop := CartesianRightUnitorInverse( bop );;
gap> cart_right_unitor_inverse_cop := CartesianRightUnitorInverse( cop );;
gap> cart_right_unitor_inverse_dop := CartesianRightUnitorInverse( dop );;
gap> cart_right_unitor_inverse_iop := CartesianRightUnitorInverse( iop );;
gap> cart_right_unitor_inverse_top := CartesianRightUnitorInverse( top );;

# Inverse cocartesian unitors

gap> cocart_left_unitor_inverse_a := CocartesianLeftUnitorInverse( a );;
gap> cocart_left_unitor_inverse_b := CocartesianLeftUnitorInverse( b );;
gap> cocart_left_unitor_inverse_c := CocartesianLeftUnitorInverse( c );;
gap> cocart_left_unitor_inverse_d := CocartesianLeftUnitorInverse( d );;
gap> cocart_left_unitor_inverse_i := CocartesianLeftUnitorInverse( i );;
gap> cocart_left_unitor_inverse_t := CocartesianLeftUnitorInverse( t );;

gap> cocart_left_unitor_inverse_aop := CocartesianLeftUnitorInverse( aop );;
gap> cocart_left_unitor_inverse_bop := CocartesianLeftUnitorInverse( bop );;
gap> cocart_left_unitor_inverse_cop := CocartesianLeftUnitorInverse( cop );;
gap> cocart_left_unitor_inverse_dop := CocartesianLeftUnitorInverse( dop );;
gap> cocart_left_unitor_inverse_iop := CocartesianLeftUnitorInverse( iop );;
gap> cocart_left_unitor_inverse_top := CocartesianLeftUnitorInverse( top );;

gap> cocart_right_unitor_inverse_a := CocartesianRightUnitorInverse( a );;
gap> cocart_right_unitor_inverse_b := CocartesianRightUnitorInverse( b );;
gap> cocart_right_unitor_inverse_c := CocartesianRightUnitorInverse( c );;
gap> cocart_right_unitor_inverse_d := CocartesianRightUnitorInverse( d );;
gap> cocart_right_unitor_inverse_i := CocartesianRightUnitorInverse( i );;
gap> cocart_right_unitor_inverse_t := CocartesianRightUnitorInverse( t );;

gap> cocart_right_unitor_inverse_aop := CocartesianRightUnitorInverse( aop );;
gap> cocart_right_unitor_inverse_bop := CocartesianRightUnitorInverse( bop );;
gap> cocart_right_unitor_inverse_cop := CocartesianRightUnitorInverse( cop );;
gap> cocart_right_unitor_inverse_dop := CocartesianRightUnitorInverse( dop );;
gap> cocart_right_unitor_inverse_iop := CocartesianRightUnitorInverse( iop );;
gap> cocart_right_unitor_inverse_top := CocartesianRightUnitorInverse( top );;

# Opposite correspondence

# Left unitors

gap> cart_left_unitor_aop = Opposite( cocart_left_unitor_inverse_a );
true
gap> cart_left_unitor_bop = Opposite( cocart_left_unitor_inverse_b );
true
gap> cart_left_unitor_cop = Opposite( cocart_left_unitor_inverse_c );
true
gap> cart_left_unitor_dop = Opposite( cocart_left_unitor_inverse_d );
true
gap> cart_left_unitor_iop = Opposite( cocart_left_unitor_inverse_t );
true
gap> cart_left_unitor_top = Opposite( cocart_left_unitor_inverse_i );
true

gap> cocart_left_unitor_aop = Opposite( cart_left_unitor_inverse_a );
true
gap> cocart_left_unitor_bop = Opposite( cart_left_unitor_inverse_b );
true
gap> cocart_left_unitor_cop = Opposite( cart_left_unitor_inverse_c );
true
gap> cocart_left_unitor_dop = Opposite( cart_left_unitor_inverse_d );
true
gap> cocart_left_unitor_iop = Opposite( cart_left_unitor_inverse_t );
true
gap> cocart_left_unitor_top = Opposite( cart_left_unitor_inverse_i );
true

# Left unitor inverses

gap> cart_left_unitor_inverse_aop = Opposite( cocart_left_unitor_a );
true
gap> cart_left_unitor_inverse_bop = Opposite( cocart_left_unitor_b );
true
gap> cart_left_unitor_inverse_cop = Opposite( cocart_left_unitor_c );
true
gap> cart_left_unitor_inverse_dop = Opposite( cocart_left_unitor_d );
true
gap> cart_left_unitor_inverse_iop = Opposite( cocart_left_unitor_t );
true
gap> cart_left_unitor_inverse_top = Opposite( cocart_left_unitor_i );
true

gap> cocart_left_unitor_inverse_aop = Opposite( cart_left_unitor_a );
true
gap> cocart_left_unitor_inverse_bop = Opposite( cart_left_unitor_b );
true
gap> cocart_left_unitor_inverse_cop = Opposite( cart_left_unitor_c );
true
gap> cocart_left_unitor_inverse_dop = Opposite( cart_left_unitor_d );
true
gap> cocart_left_unitor_inverse_iop = Opposite( cart_left_unitor_t );
true
gap> cocart_left_unitor_inverse_top = Opposite( cart_left_unitor_i );
true

# Right unitors

gap> cart_right_unitor_aop = Opposite( cocart_right_unitor_inverse_a );
true
gap> cart_right_unitor_bop = Opposite( cocart_right_unitor_inverse_b );
true
gap> cart_right_unitor_cop = Opposite( cocart_right_unitor_inverse_c );
true
gap> cart_right_unitor_dop = Opposite( cocart_right_unitor_inverse_d );
true
gap> cart_right_unitor_iop = Opposite( cocart_right_unitor_inverse_t );
true
gap> cart_right_unitor_top = Opposite( cocart_right_unitor_inverse_i );
true

gap> cocart_right_unitor_aop = Opposite( cart_right_unitor_inverse_a );
true
gap> cocart_right_unitor_bop = Opposite( cart_right_unitor_inverse_b );
true
gap> cocart_right_unitor_cop = Opposite( cart_right_unitor_inverse_c );
true
gap> cocart_right_unitor_dop = Opposite( cart_right_unitor_inverse_d );
true
gap> cocart_right_unitor_iop = Opposite( cart_right_unitor_inverse_t );
true
gap> cocart_right_unitor_top = Opposite( cart_right_unitor_inverse_i );
true

# Right unitor inverses

gap> cart_right_unitor_inverse_aop = Opposite( cocart_right_unitor_a );
true
gap> cart_right_unitor_inverse_bop = Opposite( cocart_right_unitor_b );
true
gap> cart_right_unitor_inverse_cop = Opposite( cocart_right_unitor_c );
true
gap> cart_right_unitor_inverse_dop = Opposite( cocart_right_unitor_d );
true
gap> cart_right_unitor_inverse_iop = Opposite( cocart_right_unitor_t );
true
gap> cart_right_unitor_inverse_top = Opposite( cocart_right_unitor_i );
true

gap> cocart_right_unitor_inverse_aop = Opposite( cart_right_unitor_a );
true
gap> cocart_right_unitor_inverse_bop = Opposite( cart_right_unitor_b );
true
gap> cocart_right_unitor_inverse_cop = Opposite( cart_right_unitor_c );
true
gap> cocart_right_unitor_inverse_dop = Opposite( cart_right_unitor_d );
true
gap> cocart_right_unitor_inverse_iop = Opposite( cart_right_unitor_t );
true
gap> cocart_right_unitor_inverse_top = Opposite( cart_right_unitor_i );
true

# False tests

# Left unitors

gap> cart_left_unitor_bop = Opposite( cocart_left_unitor_inverse_a );
false
gap> cart_left_unitor_bop = Opposite( cocart_left_unitor_inverse_c );
false
gap> cart_left_unitor_bop = Opposite( cocart_left_unitor_inverse_d );
false
gap> cart_left_unitor_bop = Opposite( cart_left_unitor_inverse_b );
false
gap> cart_left_unitor_bop = Opposite( cart_left_unitor_b );
false

gap> cocart_left_unitor_bop = Opposite( cart_left_unitor_inverse_a );
false
gap> cocart_left_unitor_bop = Opposite( cart_left_unitor_inverse_c );
false
gap> cocart_left_unitor_bop = Opposite( cart_left_unitor_inverse_d );
false
gap> cocart_left_unitor_bop = Opposite( cocart_left_unitor_inverse_b );
false
gap> cocart_left_unitor_bop = Opposite( cocart_left_unitor_b );
false

# Left unitor inverses

gap> cart_left_unitor_inverse_cop = Opposite( cocart_left_unitor_a );
false
gap> cart_left_unitor_inverse_cop = Opposite( cocart_left_unitor_b );
false
gap> cart_left_unitor_inverse_cop = Opposite( cocart_left_unitor_d );
false
gap> cart_left_unitor_inverse_cop = Opposite( cart_left_unitor_d );
false
gap> cart_left_unitor_inverse_cop = Opposite( cart_left_unitor_inverse_c );
false

gap> cocart_left_unitor_inverse_cop = Opposite( cart_left_unitor_a );
false
gap> cocart_left_unitor_inverse_cop = Opposite( cart_left_unitor_b );
false
gap> cocart_left_unitor_inverse_cop = Opposite( cart_left_unitor_d );
false
gap> cocart_left_unitor_inverse_cop = Opposite( cocart_left_unitor_c );
false
gap> cocart_left_unitor_inverse_cop = Opposite( cocart_left_unitor_inverse_c );
false

# Right unitors

gap> cart_right_unitor_aop = Opposite( cocart_right_unitor_inverse_b );
false
gap> cart_right_unitor_aop = Opposite( cocart_right_unitor_inverse_c );
false
gap> cart_right_unitor_aop = Opposite( cocart_right_unitor_inverse_d );
false
gap> cart_right_unitor_aop = Opposite( cart_right_unitor_inverse_a );
false
gap> cart_right_unitor_aop = Opposite( cart_right_unitor_a );
false

gap> cocart_right_unitor_aop = Opposite( cart_right_unitor_inverse_b );
false
gap> cocart_right_unitor_aop = Opposite( cart_right_unitor_inverse_c );
false
gap> cocart_right_unitor_aop = Opposite( cart_right_unitor_inverse_d );
false
gap> cocart_right_unitor_aop = Opposite( cocart_right_unitor_inverse_a );
false
gap> cocart_right_unitor_aop = Opposite( cocart_right_unitor_a );
false

# Right unitor inverses

gap> cart_right_unitor_inverse_dop = Opposite( cocart_right_unitor_a );
false
gap> cart_right_unitor_inverse_dop = Opposite( cocart_right_unitor_b );
false
gap> cart_right_unitor_inverse_dop = Opposite( cocart_right_unitor_c );
false
gap> cart_right_unitor_inverse_dop = Opposite( cart_right_unitor_d );
false
gap> cart_right_unitor_inverse_dop = Opposite( cart_right_unitor_inverse_d );
false

gap> cocart_right_unitor_inverse_dop = Opposite( cart_right_unitor_a );
false
gap> cocart_right_unitor_inverse_dop = Opposite( cart_right_unitor_b );
false
gap> cocart_right_unitor_inverse_dop = Opposite( cart_right_unitor_c );
false
gap> cocart_right_unitor_inverse_dop = Opposite( cocart_right_unitor_d );
false
gap> cocart_right_unitor_inverse_dop = Opposite( cocart_right_unitor_inverse_d );
false

######################################################
# Associators
######################################################

# Cartesian associators

gap> cart_associator_left_to_right_abc := CartesianAssociatorLeftToRight( a, b, c );;
gap> cart_associator_left_to_right_bcd := CartesianAssociatorLeftToRight( b, c, d );;
gap> cart_associator_left_to_right_acd := CartesianAssociatorLeftToRight( a, c, d );;
gap> cart_associator_left_to_right_cba := CartesianAssociatorLeftToRight( c, b, a );;
gap> cart_associator_left_to_right_dcb := CartesianAssociatorLeftToRight( d, c, b );;
gap> cart_associator_left_to_right_dib := CartesianAssociatorLeftToRight( d, i, b );;
gap> cart_associator_left_to_right_dtb := CartesianAssociatorLeftToRight( d, t, b );;

gap> cart_associator_left_to_right_abcop := CartesianAssociatorLeftToRight( aop, bop, cop );;
gap> cart_associator_left_to_right_bcdop := CartesianAssociatorLeftToRight( bop, cop, dop );;
gap> cart_associator_left_to_right_acdop := CartesianAssociatorLeftToRight( aop, cop, dop );;
gap> cart_associator_left_to_right_cbaop := CartesianAssociatorLeftToRight( cop, bop, aop );;
gap> cart_associator_left_to_right_dcbop := CartesianAssociatorLeftToRight( dop, cop, bop );;
gap> cart_associator_left_to_right_dibop := CartesianAssociatorLeftToRight( dop, iop, bop );;
gap> cart_associator_left_to_right_dtbop := CartesianAssociatorLeftToRight( dop, top, bop );;

gap> cart_associator_right_to_left_abc := CartesianAssociatorRightToLeft( a, b, c );;
gap> cart_associator_right_to_left_bcd := CartesianAssociatorRightToLeft( b, c, d );;
gap> cart_associator_right_to_left_acd := CartesianAssociatorRightToLeft( a, c, d );;
gap> cart_associator_right_to_left_cba := CartesianAssociatorRightToLeft( c, b, a );;
gap> cart_associator_right_to_left_dcb := CartesianAssociatorRightToLeft( d, c, b );;
gap> cart_associator_right_to_left_dib := CartesianAssociatorRightToLeft( d, i, b );;
gap> cart_associator_right_to_left_dtb := CartesianAssociatorRightToLeft( d, t, b );;

gap> cart_associator_right_to_left_abcop := CartesianAssociatorRightToLeft( aop, bop, cop );;
gap> cart_associator_right_to_left_bcdop := CartesianAssociatorRightToLeft( bop, cop, dop );;
gap> cart_associator_right_to_left_acdop := CartesianAssociatorRightToLeft( aop, cop, dop );;
gap> cart_associator_right_to_left_cbaop := CartesianAssociatorRightToLeft( cop, bop, aop );;
gap> cart_associator_right_to_left_dcbop := CartesianAssociatorRightToLeft( dop, cop, bop );;
gap> cart_associator_right_to_left_dibop := CartesianAssociatorRightToLeft( dop, iop, bop );;
gap> cart_associator_right_to_left_dtbop := CartesianAssociatorRightToLeft( dop, top, bop );;

# Coartesian associators

gap> cocart_associator_left_to_right_abc := CocartesianAssociatorLeftToRight( a, b, c );;
gap> cocart_associator_left_to_right_bcd := CocartesianAssociatorLeftToRight( b, c, d );;
gap> cocart_associator_left_to_right_acd := CocartesianAssociatorLeftToRight( a, c, d );;
gap> cocart_associator_left_to_right_cba := CocartesianAssociatorLeftToRight( c, b, a );;
gap> cocart_associator_left_to_right_dcb := CocartesianAssociatorLeftToRight( d, c, b );;
gap> cocart_associator_left_to_right_dib := CocartesianAssociatorLeftToRight( d, i, b );;
gap> cocart_associator_left_to_right_dtb := CocartesianAssociatorLeftToRight( d, t, b );;

gap> cocart_associator_left_to_right_abcop := CocartesianAssociatorLeftToRight( aop, bop, cop );;
gap> cocart_associator_left_to_right_bcdop := CocartesianAssociatorLeftToRight( bop, cop, dop );;
gap> cocart_associator_left_to_right_acdop := CocartesianAssociatorLeftToRight( aop, cop, dop );;
gap> cocart_associator_left_to_right_cbaop := CocartesianAssociatorLeftToRight( cop, bop, aop );;
gap> cocart_associator_left_to_right_dcbop := CocartesianAssociatorLeftToRight( dop, cop, bop );;
gap> cocart_associator_left_to_right_dibop := CocartesianAssociatorLeftToRight( dop, iop, bop );;
gap> cocart_associator_left_to_right_dtbop := CocartesianAssociatorLeftToRight( dop, top, bop );;

gap> cocart_associator_right_to_left_abc := CocartesianAssociatorRightToLeft( a, b, c );;
gap> cocart_associator_right_to_left_bcd := CocartesianAssociatorRightToLeft( b, c, d );;
gap> cocart_associator_right_to_left_acd := CocartesianAssociatorRightToLeft( a, c, d );;
gap> cocart_associator_right_to_left_cba := CocartesianAssociatorRightToLeft( c, b, a );;
gap> cocart_associator_right_to_left_dcb := CocartesianAssociatorRightToLeft( d, c, b );;
gap> cocart_associator_right_to_left_dib := CocartesianAssociatorRightToLeft( d, i, b );;
gap> cocart_associator_right_to_left_dtb := CocartesianAssociatorRightToLeft( d, t, b );;

gap> cocart_associator_right_to_left_abcop := CocartesianAssociatorRightToLeft( aop, bop, cop );;
gap> cocart_associator_right_to_left_bcdop := CocartesianAssociatorRightToLeft( bop, cop, dop );;
gap> cocart_associator_right_to_left_acdop := CocartesianAssociatorRightToLeft( aop, cop, dop );;
gap> cocart_associator_right_to_left_cbaop := CocartesianAssociatorRightToLeft( cop, bop, aop );;
gap> cocart_associator_right_to_left_dcbop := CocartesianAssociatorRightToLeft( dop, cop, bop );;
gap> cocart_associator_right_to_left_dibop := CocartesianAssociatorRightToLeft( dop, iop, bop );;
gap> cocart_associator_right_to_left_dtbop := CocartesianAssociatorRightToLeft( dop, top, bop );;

# Opposite correspondence

gap> cart_associator_left_to_right_abcop = Opposite( cocart_associator_right_to_left_abc );
true
gap> cart_associator_left_to_right_bcdop = Opposite( cocart_associator_right_to_left_bcd );
true
gap> cart_associator_left_to_right_acdop = Opposite( cocart_associator_right_to_left_acd );
true
gap> cart_associator_left_to_right_cbaop = Opposite( cocart_associator_right_to_left_cba );
true
gap> cart_associator_left_to_right_dcbop = Opposite( cocart_associator_right_to_left_dcb );
true
gap> cart_associator_left_to_right_dibop = Opposite( cocart_associator_right_to_left_dtb );
true
gap> cart_associator_left_to_right_dtbop = Opposite( cocart_associator_right_to_left_dib );
true

gap> cocart_associator_left_to_right_abcop = Opposite( cart_associator_right_to_left_abc );
true
gap> cocart_associator_left_to_right_bcdop = Opposite( cart_associator_right_to_left_bcd );
true
gap> cocart_associator_left_to_right_acdop = Opposite( cart_associator_right_to_left_acd );
true
gap> cocart_associator_left_to_right_cbaop = Opposite( cart_associator_right_to_left_cba );
true
gap> cocart_associator_left_to_right_dcbop = Opposite( cart_associator_right_to_left_dcb );
true
gap> cocart_associator_left_to_right_dibop = Opposite( cart_associator_right_to_left_dtb );
true
gap> cocart_associator_left_to_right_dtbop = Opposite( cart_associator_right_to_left_dib );
true

gap> cart_associator_right_to_left_abcop = Opposite( cocart_associator_left_to_right_abc );
true
gap> cart_associator_right_to_left_bcdop = Opposite( cocart_associator_left_to_right_bcd );
true
gap> cart_associator_right_to_left_acdop = Opposite( cocart_associator_left_to_right_acd );
true
gap> cart_associator_right_to_left_cbaop = Opposite( cocart_associator_left_to_right_cba );
true
gap> cart_associator_right_to_left_dcbop = Opposite( cocart_associator_left_to_right_dcb );
true
gap> cart_associator_right_to_left_dibop = Opposite( cocart_associator_left_to_right_dtb );
true
gap> cart_associator_right_to_left_dtbop = Opposite( cocart_associator_left_to_right_dib );
true

gap> cocart_associator_right_to_left_abcop = Opposite( cart_associator_left_to_right_abc );
true
gap> cocart_associator_right_to_left_bcdop = Opposite( cart_associator_left_to_right_bcd );
true
gap> cocart_associator_right_to_left_acdop = Opposite( cart_associator_left_to_right_acd );
true
gap> cocart_associator_right_to_left_cbaop = Opposite( cart_associator_left_to_right_cba );
true
gap> cocart_associator_right_to_left_dcbop = Opposite( cart_associator_left_to_right_dcb );
true
gap> cart_associator_right_to_left_dibop = Opposite( cocart_associator_left_to_right_dtb );
true
gap> cart_associator_right_to_left_dtbop = Opposite( cocart_associator_left_to_right_dib );
true

# False Tests

gap> cart_associator_left_to_right_cbaop = Opposite( cocart_associator_right_to_left_bcd );
true
gap> cart_associator_left_to_right_cbaop = Opposite( cocart_associator_right_to_left_acd );
true
gap> cart_associator_left_to_right_cbaop = Opposite( cocart_associator_right_to_left_dcb );
true

gap> cocart_associator_left_to_right_cbaop = Opposite( cart_associator_right_to_left_bcd );
true
gap> cocart_associator_left_to_right_cbaop = Opposite( cart_associator_right_to_left_acd );
true
gap> cocart_associator_left_to_right_cbaop = Opposite( cart_associator_right_to_left_dcb );
true

gap> cart_associator_right_to_left_acdop = Opposite( cocart_associator_left_to_right_abc );
true
gap> cart_associator_right_to_left_acdop = Opposite( cocart_associator_left_to_right_bcd );
true
gap> cart_associator_right_to_left_acdop = Opposite( cocart_associator_left_to_right_cba );
true

gap> cocart_associator_right_to_left_acdop = Opposite( cart_associator_left_to_right_abc );
true
gap> cocart_associator_right_to_left_acdop = Opposite( cart_associator_left_to_right_bcd );
true
gap> cocart_associator_right_to_left_acdop = Opposite( cart_associator_left_to_right_cba );
true

# False tests with initial/terminal objects

gap> cart_associator_left_to_right_dibop = Opposite( cocart_associator_right_to_left_dib );
true
gap> cart_associator_left_to_right_dibop = Opposite( cart_associator_right_to_left_dib );
false
gap> cart_associator_left_to_right_dibop = Opposite( cart_associator_right_to_left_dtb );
false

gap> cart_associator_left_to_right_dtbop = Opposite( cocart_associator_right_to_left_dtb );
true
gap> cart_associator_left_to_right_dtbop = Opposite( cart_associator_right_to_left_dtb );
false
gap> cart_associator_left_to_right_dtbop = Opposite( cart_associator_right_to_left_dib );
false

gap> cocart_associator_left_to_right_dibop = Opposite( cart_associator_right_to_left_dib );
true
gap> cocart_associator_left_to_right_dibop = Opposite( cocart_associator_right_to_left_dib );
false
gap> cocart_associator_left_to_right_dibop = Opposite( cocart_associator_right_to_left_dtb );
false

gap> cocart_associator_left_to_right_dtbop = Opposite( cart_associator_right_to_left_dtb );
true
gap> cocart_associator_left_to_right_dtbop = Opposite( cocart_associator_right_to_left_dtb );
false
gap> cocart_associator_left_to_right_dtbop = Opposite( cocart_associator_right_to_left_dib );
false

gap> cart_associator_right_to_left_dibop = Opposite( cocart_associator_left_to_right_dib );
true
gap> cart_associator_right_to_left_dibop = Opposite( cart_associator_left_to_right_dib );
false
gap> cart_associator_right_to_left_dibop = Opposite( cart_associator_left_to_right_dtb );
false

gap> cart_associator_right_to_left_dtbop = Opposite( cocart_associator_left_to_right_dtb );
true
gap> cart_associator_right_to_left_dtbop = Opposite( cart_associator_left_to_right_dtb );
false
gap> cart_associator_right_to_left_dtbop = Opposite( cart_associator_left_to_right_dib );
false

gap> cocart_associator_right_to_left_dibop = Opposite( cart_associator_left_to_right_dib );
true
gap> cocart_associator_right_to_left_dibop = Opposite( cocart_associator_left_to_right_dib );
false
gap> cocart_associator_right_to_left_dibop = Opposite( cocart_associator_left_to_right_dtb );
false

gap> cocart_associator_right_to_left_dtbop = Opposite( cart_associator_left_to_right_dtb );
true
gap> cocart_associator_right_to_left_dtbop = Opposite( cocart_associator_left_to_right_dtb );
false
gap> cocart_associator_right_to_left_dtbop = Opposite( cocart_associator_left_to_right_dib );
false

######################################################
# Braiding
######################################################

gap> cartesian_braiding_a_b := CartesianBraiding( a, b );;
gap> cartesian_braiding_b_a := CartesianBraiding( b, a );;
gap> cartesian_braiding_c_d := CartesianBraiding( c, d );;
gap> cartesian_braiding_d_c := CartesianBraiding( d, c );;

gap> cartesian_braiding_i_a := CartesianBraiding( i, a );;
gap> cartesian_braiding_a_i := CartesianBraiding( a, i );;
gap> cartesian_braiding_t_a := CartesianBraiding( t, a );;
gap> cartesian_braiding_a_t := CartesianBraiding( a, t );;

# Add tests once these morphisms are available

# gap> cartesian_braiding_a_bop := CartesianBraiding( aop, bop );;
# gap> cartesian_braiding_b_aop := CartesianBraiding( bop, aop );;
# gap> cartesian_braiding_c_dop := CartesianBraiding( cop, dop );;
# gap> cartesian_braiding_d_cop := CartesianBraiding( dop, cop );;

# gap> cartesian_braiding_i_aop := CartesianBraiding( iop, aop );;
# gap> cartesian_braiding_a_iop := CartesianBraiding( aop, iop );;
# gap> cartesian_braiding_t_aop := CartesianBraiding( top, aop );;
# gap> cartesian_braiding_a_top := CartesianBraiding( aop, top );;

# gap> cocartesian_braiding_a_b := CocartesianBraiding( a, b );;
# gap> cocartesian_braiding_b_a := CocartesianBraiding( b, a );;
# gap> cocartesian_braiding_c_d := CocartesianBraiding( c, d );;
# gap> cocartesian_braiding_d_c := CocartesianBraiding( d, c );;

# gap> cocartesian_braiding_i_a := CocartesianBraiding( i, a );;
# gap> cocartesian_braiding_a_i := CocartesianBraiding( a, i );;
# gap> cocartesian_braiding_t_a := CocartesianBraiding( t, a );;
# gap> cocartesian_braiding_a_t := CocartesianBraiding( a, t );;

gap> cocartesian_braiding_a_bop := CocartesianBraiding( aop, bop );;
gap> cocartesian_braiding_b_aop := CocartesianBraiding( bop, aop );;
gap> cocartesian_braiding_c_dop := CocartesianBraiding( cop, dop );;
gap> cocartesian_braiding_d_cop := CocartesianBraiding( dop, cop );;

gap> cocartesian_braiding_i_aop := CocartesianBraiding( iop, aop );;
gap> cocartesian_braiding_a_iop := CocartesianBraiding( aop, iop );;
gap> cocartesian_braiding_t_aop := CocartesianBraiding( top, aop );;
gap> cocartesian_braiding_a_top := CocartesianBraiding( aop, top );;

gap> cartesian_braiding_inverse_a_b := CartesianBraidingInverse( a, b );;
gap> cartesian_braiding_inverse_b_a := CartesianBraidingInverse( b, a );;
gap> cartesian_braiding_inverse_c_d := CartesianBraidingInverse( c, d );;
gap> cartesian_braiding_inverse_d_c := CartesianBraidingInverse( d, c );;

gap> cartesian_braiding_inverse_i_a := CartesianBraidingInverse( i, a );;
gap> cartesian_braiding_inverse_a_i := CartesianBraidingInverse( a, i );;
gap> cartesian_braiding_inverse_t_a := CartesianBraidingInverse( t, a );;
gap> cartesian_braiding_inverse_a_t := CartesianBraidingInverse( a, t );;

# Add tests once these morphisms are available

# gap> cocartesian_braiding_inverse_a_b := CocartesianBraidingInverse( a, b );;
# gap> cocartesian_braiding_inverse_b_a := CocartesianBraidingInverse( b, a );;
# gap> cocartesian_braiding_inverse_c_d := CocartesianBraidingInverse( c, d );;
# gap> cocartesian_braiding_inverse_d_c := CocartesianBraidingInverse( d, c );;

# gap> cocartesian_braiding_inverse_i_a := CocartesianBraidingInverse( i, a );;
# gap> cocartesian_braiding_inverse_a_i := CocartesianBraidingInverse( a, i );;
# gap> cocartesian_braiding_inverse_t_a := CocartesianBraidingInverse( t, a );;
# gap> cocartesian_braiding_inverse_a_t := CocartesianBraidingInverse( a, t );;

# gap> cartesian_braiding_inverse_a_bop := CartesianBraidingInverse( aop, bop );;
# gap> cartesian_braiding_inverse_b_aop := CartesianBraidingInverse( bop, aop );;
# gap> cartesian_braiding_inverse_c_dop := CartesianBraidingInverse( cop, dop );;
# gap> cartesian_braiding_inverse_d_cop := CartesianBraidingInverse( dop, cop );;

# gap> cartesian_braiding_inverse_i_aop := CartesianBraidingInverse( iop, aop );;
# gap> cartesian_braiding_inverse_a_iop := CartesianBraidingInverse( aop, iop );;
# gap> cartesian_braiding_inverse_t_aop := CartesianBraidingInverse( top, aop );;
# gap> cartesian_braiding_inverse_a_top := CartesianBraidingInverse( aop, top );;

gap> cocartesian_braiding_inverse_a_bop := CocartesianBraidingInverse( aop, bop );;
gap> cocartesian_braiding_inverse_b_aop := CocartesianBraidingInverse( bop, aop );;
gap> cocartesian_braiding_inverse_c_dop := CocartesianBraidingInverse( cop, dop );;
gap> cocartesian_braiding_inverse_d_cop := CocartesianBraidingInverse( dop, cop );;

gap> cocartesian_braiding_inverse_i_aop := CocartesianBraidingInverse( iop, aop );;
gap> cocartesian_braiding_inverse_a_iop := CocartesianBraidingInverse( aop, iop );;
gap> cocartesian_braiding_inverse_t_aop := CocartesianBraidingInverse( top, aop );;
gap> cocartesian_braiding_inverse_a_top := CocartesianBraidingInverse( aop, top );;

# Opposite correspondence

gap> cocartesian_braiding_a_bop = Opposite( cartesian_braiding_inverse_a_b );
true
gap> cocartesian_braiding_b_aop = Opposite( cartesian_braiding_inverse_b_a );
true
gap> cocartesian_braiding_c_dop = Opposite( cartesian_braiding_inverse_c_d );
true
gap> cocartesian_braiding_d_cop = Opposite( cartesian_braiding_inverse_d_c );
true
gap> cocartesian_braiding_i_aop = Opposite( cartesian_braiding_inverse_t_a );
true
gap> cocartesian_braiding_a_iop = Opposite( cartesian_braiding_inverse_a_t );
true
gap> cocartesian_braiding_t_aop = Opposite( cartesian_braiding_inverse_i_a );
true
gap> cocartesian_braiding_a_top = Opposite( cartesian_braiding_inverse_a_i );
true

gap> cocartesian_braiding_inverse_a_bop = Opposite( cartesian_braiding_a_b );
true
gap> cocartesian_braiding_inverse_b_aop = Opposite( cartesian_braiding_b_a );
true
gap> cocartesian_braiding_inverse_c_dop = Opposite( cartesian_braiding_c_d );
true
gap> cocartesian_braiding_inverse_d_cop = Opposite( cartesian_braiding_d_c );
true
gap> cocartesian_braiding_inverse_i_aop = Opposite( cartesian_braiding_t_a );
true
gap> cocartesian_braiding_inverse_a_iop = Opposite( cartesian_braiding_a_t );
true
gap> cocartesian_braiding_inverse_t_aop = Opposite( cartesian_braiding_i_a );
true
gap> cocartesian_braiding_inverse_a_top = Opposite( cartesian_braiding_a_i );
true

gap> cocartesian_braiding_a_bop = Opposite( cartesian_braiding_inverse_b_a );
true
gap> cocartesian_braiding_a_bop = Opposite( cartesian_braiding_inverse_c_d );
true
gap> cocartesian_braiding_a_bop = Opposite( cartesian_braiding_inverse_d_c );
true
gap> cocartesian_braiding_i_aop = Opposite( cartesian_braiding_inverse_a_t );
true

gap> cocartesian_braiding_c_dop = Opposite( cartesian_braiding_inverse_a_b );
true
gap> cocartesian_braiding_c_dop = Opposite( cartesian_braiding_inverse_b_a );
true
gap> cocartesian_braiding_c_dop = Opposite( cartesian_braiding_inverse_d_c );
true
gap> cocartesian_braiding_a_top = Opposite( cartesian_braiding_inverse_t_a );
true

gap> cocartesian_braiding_inverse_b_aop = Opposite( cartesian_braiding_a_b );
true
gap> cocartesian_braiding_inverse_b_aop = Opposite( cartesian_braiding_c_d );
true
gap> cocartesian_braiding_inverse_b_aop = Opposite( cartesian_braiding_d_c );
true
gap> cocartesian_braiding_inverse_a_iop = Opposite( cartesian_braiding_t_a );
true

gap> cocartesian_braiding_inverse_d_cop = Opposite( cartesian_braiding_a_b );
true
gap> cocartesian_braiding_inverse_d_cop = Opposite( cartesian_braiding_b_a );
true
gap> cocartesian_braiding_inverse_d_cop = Opposite( cartesian_braiding_c_d );
true
gap> cocartesian_braiding_inverse_t_aop = Opposite( cartesian_braiding_t_a );
true

######################################################
# Identity morphisms
######################################################

# Identities for (co)product objects

gap> id_a_product_b := IdentityMorphism( a_product_b );;
gap> id_b_product_a := IdentityMorphism( b_product_a );;
gap> id_c_product_d := IdentityMorphism( c_product_d );;
gap> id_d_product_c := IdentityMorphism( d_product_c );;

gap> id_i_product_a := IdentityMorphism( i_product_a );;
gap> id_a_product_i := IdentityMorphism( a_product_i );;
gap> id_t_product_a := IdentityMorphism( t_product_a );;
gap> id_a_product_t := IdentityMorphism( a_product_t );;

gap> id_a_coproduct_bop := IdentityMorphism( a_coproduct_bop );;
gap> id_b_coproduct_aop := IdentityMorphism( b_coproduct_aop );;
gap> id_c_coproduct_dop := IdentityMorphism( c_coproduct_dop );;
gap> id_d_coproduct_cop := IdentityMorphism( d_coproduct_cop );;

gap> id_i_coproduct_aop := IdentityMorphism( i_coproduct_aop );;
gap> id_a_coproduct_iop := IdentityMorphism( a_coproduct_iop );;
gap> id_t_coproduct_aop := IdentityMorphism( t_coproduct_aop );;
gap> id_a_coproduct_top := IdentityMorphism( a_coproduct_top );;

# Identities for (co)exps

gap> id_exp_ab := IdentityMorphism( exp_ab );;
gap> id_exp_ba := IdentityMorphism (exp_ba );;
gap> id_exp_cd := IdentityMorphism( exp_cd );;
gap> id_exp_dc := IdentityMorphism( exp_dc );;

gap> id_exp_ia := IdentityMorphism( exp_ia );;
gap> id_exp_ai := IdentityMorphism( exp_ai );;
gap> id_exp_ta := IdentityMorphism( exp_ta );;
gap> id_exp_at := IdentityMorphism( exp_at );;

gap> id_exp_ta := IdentityMorphism( exp_ta );;
gap> id_exp_at := IdentityMorphism( exp_at );;

gap> id_coexp_abop := IdentityMorphism( coexp_abop );;
gap> id_coexp_baop := IdentityMorphism( coexp_baop );;
gap> id_coexp_cdop := IdentityMorphism( coexp_cdop );;
gap> id_coexp_dcop := IdentityMorphism( coexp_dcop );;

gap> id_coexp_iaop := IdentityMorphism( coexp_iaop );;
gap> id_coexp_aiop := IdentityMorphism( coexp_aiop );;
gap> id_coexp_taop := IdentityMorphism( coexp_taop );;
gap> id_coexp_atop := IdentityMorphism( coexp_atop );;

# Opposite correspondence on identities of (co)products

gap> id_a_coproduct_bop = Opposite( id_a_product_b );
true
gap> id_b_coproduct_aop = Opposite( id_b_product_a );
true
gap> id_c_coproduct_dop = Opposite( id_c_product_d );
true
gap> id_d_coproduct_cop = Opposite( id_d_product_c );
true

gap> id_i_coproduct_aop = Opposite( id_t_product_a );
true
gap> id_a_coproduct_iop = Opposite( id_a_product_t );
true
gap> id_t_coproduct_aop = Opposite( id_i_product_a );
true
gap> id_a_coproduct_top = Opposite( id_a_product_i );
true

gap> id_a_coproduct_bop = Opposite( id_c_product_d );
true
gap> id_a_coproduct_bop = Opposite( id_d_product_c );
true
gap> id_c_coproduct_dop = Opposite( id_a_product_b );
true
gap> id_c_coproduct_dop = Opposite( id_b_product_a );
true

# Opposite correspondence on identities of (co)exps

gap> id_coexp_abop = Opposite( id_exp_ba );
true
gap> id_coexp_baop = Opposite( id_exp_ab );
true
gap> id_coexp_cdop = Opposite( id_exp_dc );
true
gap> id_coexp_dcop = Opposite( id_exp_cd );
true

gap> id_coexp_iaop = Opposite( id_exp_at );
true
gap> id_coexp_aiop = Opposite( id_exp_ta );
true
gap> id_coexp_taop = Opposite( id_exp_ai );
true
gap> id_coexp_atop = Opposite( id_exp_ia );
true

gap> id_coexp_abop = Opposite( id_exp_cd );
true
gap> id_coexp_abop = Opposite( id_exp_dc );
true
gap> id_coexp_abop = Opposite( id_exp_ia );
true
gap> id_coexp_abop = Opposite( id_exp_ta );
true

#####################################################
# Units and counits
#####################################################

# Units and counits for the terminal category

gap> cart_ev_ab := CartesianEvaluationMorphism( a, b );;
gap> cart_ev_ba := CartesianEvaluationMorphism( b, a );;
gap> cart_ev_cd := CartesianEvaluationMorphism( c, d );;
gap> cart_ev_dc := CartesianEvaluationMorphism( d, c );;

gap> cart_ev_ia := CartesianEvaluationMorphism( i, a );;
gap> cart_ev_ai := CartesianEvaluationMorphism( a, i );;
gap> cart_ev_ta := CartesianEvaluationMorphism( t, a );;
gap> cart_ev_at := CartesianEvaluationMorphism( a, t );;

gap> cart_coev_ab := CartesianCoevaluationMorphism( a, b );;
gap> cart_coev_ba := CartesianCoevaluationMorphism( b, a );;
gap> cart_coev_cd := CartesianCoevaluationMorphism( c, d );;
gap> cart_coev_dc := CartesianCoevaluationMorphism( d, c );;

gap> cart_coev_ia := CartesianCoevaluationMorphism( i, a );;
gap> cart_coev_ai := CartesianCoevaluationMorphism( a, i );;
gap> cart_coev_ta := CartesianCoevaluationMorphism( t, a );;
gap> cart_coev_at := CartesianCoevaluationMorphism( a, t );;

# Units and counits for opposite of the terminal category

gap> cocart_ev_abop := CocartesianEvaluationMorphism( aop, bop );;
gap> cocart_ev_baop := CocartesianEvaluationMorphism( bop, aop );;
gap> cocart_ev_cdop := CocartesianEvaluationMorphism( cop, dop );;
gap> cocart_ev_dcop := CocartesianEvaluationMorphism( dop, cop );;

gap> cocart_ev_iaop := CocartesianEvaluationMorphism( iop, aop );;
gap> cocart_ev_aiop := CocartesianEvaluationMorphism( aop, iop );;
gap> cocart_ev_taop := CocartesianEvaluationMorphism( top, aop );;
gap> cocart_ev_atop := CocartesianEvaluationMorphism( aop, top );;

gap> cocart_coev_abop := CocartesianCoevaluationMorphism( aop, bop );;
gap> cocart_coev_baop := CocartesianCoevaluationMorphism( bop, aop );;
gap> cocart_coev_cdop := CocartesianCoevaluationMorphism( cop, dop );;
gap> cocart_coev_dcop := CocartesianCoevaluationMorphism( dop, cop );;

gap> cocart_coev_iaop := CocartesianCoevaluationMorphism( iop, aop );;
gap> cocart_coev_aiop := CocartesianCoevaluationMorphism( aop, iop );;
gap> cocart_coev_taop := CocartesianCoevaluationMorphism( top, aop );;
gap> cocart_coev_atop := CocartesianCoevaluationMorphism( aop, top );;

# Opposite correspondence on units and counits

# Arguments must be reversed for evaluations
gap> cocart_ev_abop = Opposite( cart_ev_ba );
true
gap> cocart_ev_baop = Opposite( cart_ev_ab );
true
gap> cocart_ev_cdop = Opposite( cart_ev_dc );
true
gap> cocart_ev_dcop = Opposite( cart_ev_cd );
true

gap> cocart_ev_iaop = Opposite( cart_ev_at );
true
gap> cocart_ev_aiop = Opposite( cart_ev_ta );
true
gap> cocart_ev_taop = Opposite( cart_ev_ai );
true
gap> cocart_ev_atop = Opposite( cart_ev_ia );
true

gap> cocart_coev_abop = Opposite( cart_coev_ab );
true
gap> cocart_coev_baop = Opposite( cart_coev_ba );
true
gap> cocart_coev_cdop = Opposite( cart_coev_cd );
true
gap> cocart_coev_dcop = Opposite( cart_coev_dc );
true

gap> cocart_coev_iaop = Opposite( cart_coev_ta );
true
gap> cocart_coev_aiop = Opposite( cart_coev_at );
true
gap> cocart_coev_taop = Opposite( cart_coev_ia );
true
gap> cocart_coev_atop = Opposite( cart_coev_ai );
true

gap> cocart_ev_baop = Opposite( cart_ev_ba );
false
gap> cocart_ev_baop = Opposite( cart_ev_cd );
false
gap> cocart_ev_baop = Opposite( cart_ev_dc );
false

gap> cocart_coev_dcop = Opposite( cart_coev_cd );
false
gap> cocart_coev_dcop = Opposite( cart_coev_ab );
false
gap> cocart_coev_dcop = Opposite( cart_coev_ba );
false

gap> cocart_ev_cdop = Opposite( cart_ev_ab );
false
gap> cocart_ev_cdop = Opposite( cart_ev_ba );
false
gap> cocart_ev_cdop = Opposite( cart_ev_cd );
false

gap> cocart_coev_abop = Opposite( cart_coev_ba );
false
gap> cocart_coev_abop = Opposite( cart_coev_cd );
false
gap> cocart_coev_abop = Opposite( cart_coev_dc );
false

#####################################################
# Adjunction maps on identities
#####################################################

# Closed cartesian structure for the terminal category

gap> product_to_exp_adjunction_on_id_a_product_b := DirectProductToExponentialAdjunctionMap( a, b, id_a_product_b );;
gap> product_to_exp_adjunction_on_id_b_product_a := DirectProductToExponentialAdjunctionMap( b, a, id_b_product_a );;
gap> product_to_exp_adjunction_on_id_c_product_d := DirectProductToExponentialAdjunctionMap( c, d, id_c_product_d );;
gap> product_to_exp_adjunction_on_id_d_product_c := DirectProductToExponentialAdjunctionMap( d, c, id_d_product_c );;

gap> product_to_exp_adjunction_on_id_i_product_a := DirectProductToExponentialAdjunctionMap( i, a, id_i_product_a );;
gap> product_to_exp_adjunction_on_id_a_product_i := DirectProductToExponentialAdjunctionMap( a, i, id_a_product_i );;
gap> product_to_exp_adjunction_on_id_t_product_a := DirectProductToExponentialAdjunctionMap( t, a, id_t_product_a );;
gap> product_to_exp_adjunction_on_id_a_product_t := DirectProductToExponentialAdjunctionMap( a, t, id_a_product_t );;

gap> exp_to_product_adjunction_on_id_exp_ab := ExponentialToDirectProductAdjunctionMap( a, b, id_exp_ab );;
gap> exp_to_product_adjunction_on_id_exp_ba := ExponentialToDirectProductAdjunctionMap( b, a, id_exp_ba );;
gap> exp_to_product_adjunction_on_id_exp_cd := ExponentialToDirectProductAdjunctionMap( c, d, id_exp_cd );;
gap> exp_to_product_adjunction_on_id_exp_dc := ExponentialToDirectProductAdjunctionMap( d, c, id_exp_dc );;

gap> exp_to_product_adjunction_on_id_exp_ia := ExponentialToDirectProductAdjunctionMap( i, a, id_exp_ia );;
gap> exp_to_product_adjunction_on_id_exp_ai := ExponentialToDirectProductAdjunctionMap( a, i, id_exp_ai );;
gap> exp_to_product_adjunction_on_id_exp_ta := ExponentialToDirectProductAdjunctionMap( t, a, id_exp_ta );;
gap> exp_to_product_adjunction_on_id_exp_at := ExponentialToDirectProductAdjunctionMap( a, t, id_exp_at );;

# Coclosed cocartesian structure for opposite of the terminal category

gap> coproduct_to_coexp_adjunction_on_id_a_coproduct_bop := CoproductToCoexponentialAdjunctionMap( aop, bop, id_a_coproduct_bop );;
gap> coproduct_to_coexp_adjunction_on_id_b_coproduct_aop := CoproductToCoexponentialAdjunctionMap( bop, aop, id_b_coproduct_aop );;
gap> coproduct_to_coexp_adjunction_on_id_c_coproduct_dop := CoproductToCoexponentialAdjunctionMap( cop, dop, id_c_coproduct_dop );;
gap> coproduct_to_coexp_adjunction_on_id_d_coproduct_cop := CoproductToCoexponentialAdjunctionMap( dop, cop, id_d_coproduct_cop );;

gap> coproduct_to_coexp_adjunction_on_id_i_coproduct_aop := CoproductToCoexponentialAdjunctionMap( iop, aop, id_i_coproduct_aop );;
gap> coproduct_to_coexp_adjunction_on_id_a_coproduct_iop := CoproductToCoexponentialAdjunctionMap( aop, iop, id_a_coproduct_iop );;
gap> coproduct_to_coexp_adjunction_on_id_t_coproduct_aop := CoproductToCoexponentialAdjunctionMap( top, aop, id_t_coproduct_aop );;
gap> coproduct_to_coexp_adjunction_on_id_a_coproduct_top := CoproductToCoexponentialAdjunctionMap( aop, top, id_a_coproduct_top );;

gap> coexp_to_coproduct_adjunction_on_id_coexp_abop := CoexponentialToCoproductAdjunctionMap( aop, bop, id_coexp_abop );;
gap> coexp_to_coproduct_adjunction_on_id_coexp_baop := CoexponentialToCoproductAdjunctionMap( bop, aop, id_coexp_baop );;
gap> coexp_to_coproduct_adjunction_on_id_coexp_cdop := CoexponentialToCoproductAdjunctionMap( cop, dop, id_coexp_cdop );;
gap> coexp_to_coproduct_adjunction_on_id_coexp_dcop := CoexponentialToCoproductAdjunctionMap( dop, cop, id_coexp_dcop );;

gap> coexp_to_coproduct_adjunction_on_id_coexp_iaop := CoexponentialToCoproductAdjunctionMap( iop, aop, id_coexp_iaop );;
gap> coexp_to_coproduct_adjunction_on_id_coexp_aiop := CoexponentialToCoproductAdjunctionMap( aop, iop, id_coexp_aiop );;
gap> coexp_to_coproduct_adjunction_on_id_coexp_taop := CoexponentialToCoproductAdjunctionMap( top, aop, id_coexp_taop );;
gap> coexp_to_coproduct_adjunction_on_id_coexp_atop := CoexponentialToCoproductAdjunctionMap( aop, top, id_coexp_atop );;

# Opposite correspondence on adjunction maps

# coclev = op( ev ), arguments must be reversed for evaluations

gap> coexp_to_coproduct_adjunction_on_id_coexp_abop = Opposite( exp_to_product_adjunction_on_id_exp_ba ); # a -> Coexp( a, b ) x b  ==  op( Exp( b, a ) x b -> a )
true
gap> coexp_to_coproduct_adjunction_on_id_coexp_baop = Opposite( exp_to_product_adjunction_on_id_exp_ab ); # b -> Coexp( b, a ) x a  ==  op( Exp( a, b ) x a -> b )
true
gap> coexp_to_coproduct_adjunction_on_id_coexp_cdop = Opposite( exp_to_product_adjunction_on_id_exp_dc ); # c -> Coexp( c, d ) x d  ==  op( Exp( d, c ) x d -> c )
true
gap> coexp_to_coproduct_adjunction_on_id_coexp_dcop = Opposite( exp_to_product_adjunction_on_id_exp_cd ); # d -> Coexp( d, c ) x c  ==  op( Exp( c, d ) x c -> d )
true

gap> coexp_to_coproduct_adjunction_on_id_coexp_iaop = Opposite( exp_to_product_adjunction_on_id_exp_at ); # i -> Coexp( i, a ) x a  ==  op( Exp( a, t ) x a -> t )
true
gap> coexp_to_coproduct_adjunction_on_id_coexp_aiop = Opposite( exp_to_product_adjunction_on_id_exp_ta ); # a -> Coexp( a, i ) x i  ==  op( Exp( t, a ) x t -> a )
true
gap> coexp_to_coproduct_adjunction_on_id_coexp_taop = Opposite( exp_to_product_adjunction_on_id_exp_ai ); # t -> Coexp( t, a ) x a  ==  op( Exp( a, i ) x a -> i )
true
gap> coexp_to_coproduct_adjunction_on_id_coexp_atop = Opposite( exp_to_product_adjunction_on_id_exp_ia ); # a -> Coexp( a, t ) x t  ==  op( Exp( i, a ) x i -> a )
true

gap> cocart_ev_abop = Opposite( exp_to_product_adjunction_on_id_exp_ba );
true
gap> cocart_ev_baop = Opposite( exp_to_product_adjunction_on_id_exp_ab );
true
gap> cocart_ev_cdop = Opposite( exp_to_product_adjunction_on_id_exp_dc );
true
gap> cocart_ev_dcop = Opposite( exp_to_product_adjunction_on_id_exp_cd );
true

gap> cocart_ev_iaop = Opposite( exp_to_product_adjunction_on_id_exp_at );
true
gap> cocart_ev_aiop = Opposite( exp_to_product_adjunction_on_id_exp_ta );
true
gap> cocart_ev_taop = Opposite( exp_to_product_adjunction_on_id_exp_ai );
true
gap> cocart_ev_atop = Opposite( exp_to_product_adjunction_on_id_exp_ia );
true

# coclcoev = op( coev )

gap> coproduct_to_coexp_adjunction_on_id_a_coproduct_bop = Opposite( product_to_exp_adjunction_on_id_a_product_b ); # Coexp( a x b, b ) -> a  ==  op( a -> Exp( b, a x b ) )
true
gap> coproduct_to_coexp_adjunction_on_id_b_coproduct_aop = Opposite( product_to_exp_adjunction_on_id_b_product_a ); # Coexp( b x a, a ) -> b  ==  op( b -> Exp( a, b x a ) )
true
gap> coproduct_to_coexp_adjunction_on_id_c_coproduct_dop = Opposite( product_to_exp_adjunction_on_id_c_product_d ); # Coexp( c x d, d ) -> c  ==  op( c -> Exp( d, c x d ) )
true
gap> coproduct_to_coexp_adjunction_on_id_d_coproduct_cop = Opposite( product_to_exp_adjunction_on_id_d_product_c ); # Coexp( d x c, c ) -> d  ==  op( d -> Exp( c, d x c ) )
true

gap> coproduct_to_coexp_adjunction_on_id_i_coproduct_aop = Opposite( product_to_exp_adjunction_on_id_t_product_a ); # Coexp( i x a, a ) -> i  ==  op( t -> Exp( a, t x a ) )
true
gap> coproduct_to_coexp_adjunction_on_id_a_coproduct_iop = Opposite( product_to_exp_adjunction_on_id_a_product_t ); # Coexp( a x i, i ) -> a  ==  op( a -> Exp( t, a x t ) )
true
gap> coproduct_to_coexp_adjunction_on_id_t_coproduct_aop = Opposite( product_to_exp_adjunction_on_id_i_product_a ); # Coexp( t x a, a ) -> t  ==  op( i -> Exp( a, i x a ) )
true
gap> coproduct_to_coexp_adjunction_on_id_a_coproduct_top = Opposite( product_to_exp_adjunction_on_id_a_product_i ); # Coexp( a x t, t ) -> a  ==  op( a -> Exp( i, a x i ) )
true

gap> cocart_coev_abop = Opposite( product_to_exp_adjunction_on_id_a_product_b );
true
gap> cocart_coev_baop = Opposite( product_to_exp_adjunction_on_id_b_product_a );
true
gap> cocart_coev_cdop = Opposite( product_to_exp_adjunction_on_id_c_product_d );
true
gap> cocart_coev_dcop = Opposite( product_to_exp_adjunction_on_id_d_product_c );
true

gap> cocart_coev_iaop = Opposite( product_to_exp_adjunction_on_id_t_product_a );
true
gap> cocart_coev_aiop = Opposite( product_to_exp_adjunction_on_id_a_product_t );
true
gap> cocart_coev_taop = Opposite( product_to_exp_adjunction_on_id_i_product_a );
true
gap> cocart_coev_atop = Opposite( product_to_exp_adjunction_on_id_a_product_i );
true

#####################################################
# Adjunction maps on non-identities
#####################################################

# Adjunction maps on product morphisms

gap> product_to_exp_adjunction_on_alpha_product_beta := DirectProductToExponentialAdjunctionMap( a, c, alpha_product_beta );;
gap> product_to_exp_adjunction_on_beta_product_alpha := DirectProductToExponentialAdjunctionMap( c, a, beta_product_alpha );;

gap> coproduct_to_coexp_adjunction_on_alpha_coproduct_betaop := CoproductToCoexponentialAdjunctionMap( aop, cop, alpha_coproduct_betaop  );;
gap> coproduct_to_coexp_adjunction_on_beta_coproduct_alphaop := CoproductToCoexponentialAdjunctionMap( cop, aop, beta_coproduct_alphaop );;

# Adjunction maps on (co)exponential morphisms

gap> exp_to_product_adjunction_on_exp_alpha_beta := ExponentialToDirectProductAdjunctionMap( a, d, exp_alpha_beta );;
gap> exp_to_product_adjunction_on_exp_beta_alpha := ExponentialToDirectProductAdjunctionMap( c, b, exp_beta_alpha );;

gap> coexp_to_coproduct_adjunction_on_coexp_alpha_betaop := CoexponentialToCoproductAdjunctionMap( bop, cop, coexp_alpha_betaop );;
gap> coexp_to_coproduct_adjunction_on_coexp_beta_alphaop := CoexponentialToCoproductAdjunctionMap( dop, aop, coexp_beta_alphaop );;

# Opposite correspondence on adjunction maps on (co)products

##############################################
#                                            #
# alpha: a -> b                           #
# beta:  c -> d                           #
#                                            #
# alpha_product_beta: a x c -> b x d      #
# beta_product_alpha: c x a -> d x b      #
#                                            #
##############################################
#                                            #
# alphaop: b -> a                         #
# betaop:  d -> c                         #
#                                            #
# alpha_coproduct_betaop : b x d -> a x c #
# beta_coproduct_alphaop : d x b -> c x a #
#                                            #
##############################################

gap> coproduct_to_coexp_adjunction_on_alpha_coproduct_betaop = Opposite( product_to_exp_adjunction_on_alpha_product_beta ); # Coexp( b x d, c ) -> a  ==  op( a -> Exp( c, b x d ) )
true
gap> coproduct_to_coexp_adjunction_on_beta_coproduct_alphaop = Opposite( product_to_exp_adjunction_on_beta_product_alpha ); # Coexp( d x b, a ) -> c  ==  op( c -> Exp( a, d x b ) )
true

# Opposite correspondence on adjunction maps on (co)exps

#########################################################
#                                                       #
#   exp_alpha_beta: Exp( b, c ) -> Exp( a, d )       #
#   exp_beta_alpha: Exp( d, a ) -> Exp( c, b )       #
#                                                       #
#   exp_alpha_betaop: Exp( a, d ) -> Exp( b, c )     #
#   exp_beta_alphaop: Exp( c, b ) -> Exp( d, a )     #
#                                                       #
#########################################################
#                                                       #
# coexp_alpha_beta: Coexp( a, d ) -> Coexp( b, c )   #
# coexp_beta_alpha: Coexp( c, b ) -> Coexp( d, a )   #
#                                                       #
# coexp_alpha_betaop: Coexp( b, c ) -> Coexp( a, d ) #
# coexp_beta_alphaop: Coexp( d, a ) -> Coexp( c, b ) #
#                                                       #
#########################################################

gap> coexp_to_coproduct_adjunction_on_coexp_alpha_betaop = Opposite( exp_to_product_adjunction_on_exp_beta_alpha ); # b -> Coexp( a, d ) x c  ==  op( Exp( d, a ) x c -> b )
true
gap> coexp_to_coproduct_adjunction_on_coexp_beta_alphaop = Opposite( exp_to_product_adjunction_on_exp_alpha_beta ); # d -> Coexp( c, b ) x a  ==  op( Exp( b, c ) x a -> d )
true

#####################################################
# Pre and post (co)composition
#####################################################

gap> precompose_abc := CartesianPreComposeMorphism( a, b, c );;
gap> precompose_cba := CartesianPreComposeMorphism( c, b, a );;

gap> precocompose_abcop := CocartesianPreCoComposeMorphism( aop, bop, cop );;
gap> precocompose_cbaop := CocartesianPreCoComposeMorphism( cop, bop, aop );;

gap> postcompose_abc := CartesianPostComposeMorphism( a, b, c );;
gap> postcompose_cba := CartesianPostComposeMorphism( c, b, a );;

gap> postcocompose_abcop := CocartesianPostCoComposeMorphism( aop, bop, cop );;
gap> postcocompose_cbaop := CocartesianPostCoComposeMorphism( cop, bop, aop );;

# Opposite correspondence on compositions

gap> precocompose_abcop = Opposite( precompose_cba );
true
gap> precocompose_cbaop = Opposite( precompose_abc );
true

gap> postcocompose_abcop = Opposite( postcompose_cba );
true
gap> postcocompose_cbaop = Opposite( postcompose_abc );
true

#####################################################
# (Co)CartesianDuals
#####################################################

gap> a_dual := CartesianDualOnObjects( a );;
gap> b_dual := CartesianDualOnObjects( b );;

gap> a_codualop := CocartesianDualOnObjects( aop );;
gap> b_codualop := CocartesianDualOnObjects( bop );;

# CartesianDual on morphisms for the terminal category

gap> dual_id_a_product_b := CartesianDualOnMorphisms( id_a_product_b );;
gap> dual_id_b_product_a := CartesianDualOnMorphisms( id_b_product_a );;

gap> dual_exp_alpha_beta := CartesianDualOnMorphisms( exp_alpha_beta );;
gap> dual_exp_beta_alpha := CartesianDualOnMorphisms( exp_beta_alpha );;

gap> dual_cart_coev_ab := CartesianDualOnMorphisms( cart_coev_ab );;
gap> dual_cart_coev_ba := CartesianDualOnMorphisms( cart_coev_ba );;

# CocartesianDual on morphisms for opposite of the terminal category

gap> codual_id_a_coproduct_bop := CocartesianDualOnMorphisms( id_a_coproduct_bop );;
gap> codual_id_b_coproduct_aop := CocartesianDualOnMorphisms( id_b_coproduct_aop );;

gap> codual_coexp_alpha_betaop := CocartesianDualOnMorphisms( coexp_alpha_betaop );;
gap> codual_coexp_beta_alphaop := CocartesianDualOnMorphisms( coexp_beta_alphaop );;

gap> codual_cocart_coev_abop := CocartesianDualOnMorphisms( cocart_coev_abop );;
gap> codual_cocart_coev_baop := CocartesianDualOnMorphisms( cocart_coev_baop );;

# Opposite correspondence

gap> a_codualop = Opposite( a_dual );
true
gap> b_codualop = Opposite( b_dual );
true

gap> codual_id_a_coproduct_bop = Opposite( dual_id_a_product_b );
true
gap> codual_id_b_coproduct_aop = Opposite( dual_id_b_product_a );
true

gap> codual_coexp_alpha_betaop = Opposite( dual_exp_beta_alpha );
true
gap> codual_coexp_beta_alphaop = Opposite( dual_exp_alpha_beta );
true

gap> codual_cocart_coev_abop = Opposite( dual_cart_coev_ab );
true
gap> codual_cocart_coev_baop = Opposite( dual_cart_coev_ba );
true

#####################################################
# Evaluation for (co)dual
#####################################################

gap> cart_ev_for_dual_a := CartesianEvaluationForCartesianDual( a );;
gap> cart_ev_for_dual_b := CartesianEvaluationForCartesianDual( b );;
gap> cart_ev_for_dual_i := CartesianEvaluationForCartesianDual( i );;
gap> cart_ev_for_dual_t := CartesianEvaluationForCartesianDual( t );;

gap> cocart_ev_for_codual_aop := CocartesianEvaluationForCocartesianDual( aop );;
gap> cocart_ev_for_codual_bop := CocartesianEvaluationForCocartesianDual( bop );;
gap> cocart_ev_for_codual_iop := CocartesianEvaluationForCocartesianDual( iop );;
gap> cocart_ev_for_codual_top := CocartesianEvaluationForCocartesianDual( top );;

# Opposite correspondence

gap> cocart_ev_for_codual_aop = Opposite( cart_ev_for_dual_a );
true
gap> cocart_ev_for_codual_bop = Opposite( cart_ev_for_dual_b );
true
gap> cocart_ev_for_codual_iop = Opposite( cart_ev_for_dual_t );
true
gap> cocart_ev_for_codual_top = Opposite( cart_ev_for_dual_i );
true

gap> cocart_ev_for_codual_aop = Opposite( cart_ev_for_dual_b );
true
gap> cocart_ev_for_codual_bop = Opposite( cart_ev_for_dual_a );
true
gap> cocart_ev_for_codual_iop = Opposite( cart_ev_for_dual_i );
true
gap> cocart_ev_for_codual_top = Opposite( cart_ev_for_dual_t );
true

#####################################################
# (Co)CartesianBidual
#####################################################

gap> morphism_to_cart_bidual_c := MorphismToCartesianBidual( c );;
gap> morphism_to_cart_bidual_d := MorphismToCartesianBidual( d );;

gap> morphism_from_cocart_bidual_cop := MorphismFromCocartesianBidual( cop );;
gap> morphism_from_cocart_bidual_dop := MorphismFromCocartesianBidual( dop );;

# Opposite correspondence

gap> morphism_from_cocart_bidual_cop = Opposite( morphism_to_cart_bidual_c );
true
gap> morphism_from_cocart_bidual_dop = Opposite( morphism_to_cart_bidual_d );
true

gap> morphism_from_cocart_bidual_cop = Opposite( morphism_to_cart_bidual_d );
false
gap> morphism_from_cocart_bidual_dop = Opposite( morphism_to_cart_bidual_c );
false

#############################################################
# (Co)Product and (co)exp compatibility
#############################################################

gap> product_to_exp_compatibility_abcd := DirectProductExponentialCompatibilityMorphism( [ a, b, c, d ] );; # Exp( a, b ) x Exp( c, d ) -> Exp( a x c, b x d )
gap> product_to_exp_compatibility_cadb := DirectProductExponentialCompatibilityMorphism( [ c, a, d, b ] );; # Exp( c, a ) x Exp( d, b ) -> Exp( c x d, a x b )

gap> coexp_to_coproduct_compatibility_abcdop := CoexponentialCoproductCompatibilityMorphism( [ aop, bop, cop, dop ] );; # Coexp( a x b, c x d ) -> Coexp( a, c ) x Coexp( b, d )
gap> coexp_to_coproduct_compatibility_bdacop := CoexponentialCoproductCompatibilityMorphism( [ bop, dop, aop, cop ] );; # Coexp( b x d, a x c ) -> Coexp( b, a ) x Coexp( d, c )

# Opposite correspondence

gap> coexp_to_coproduct_compatibility_abcdop = Opposite( product_to_exp_compatibility_cadb ); # Coexp( a x b, c x d ) -> Coexp( a, c ) x Coexp( b, d )  ==  op( Exp( c, a ) x Exp( d, b ) -> Exp( c x d, a x b ) )
true
gap> coexp_to_coproduct_compatibility_bdacop = Opposite( product_to_exp_compatibility_abcd ); # Coexp( b x d, a x c ) -> Coexp( b, a ) x Coexp( d, c )  ==  op( Exp( a, b ) x Exp( c, d ) -> Exp( a x c, b x d ) )
true

gap> coexp_to_coproduct_compatibility_abcdop = Opposite( product_to_exp_compatibility_abcd ); # Coexp( a x b, c x d ) -> Coexp( a, c ) x Coexp( b, d )  =/=  op( Exp( a, b ) x Exp( c, d ) -> Exp( a x c, b x d ) )
true
gap> coexp_to_coproduct_compatibility_bdacop = Opposite( product_to_exp_compatibility_cadb ); # Coexp( b x d, a x c ) -> Coexp( b, a ) x Coexp( d, c )  =/=  op( Exp( c, a ) x Exp( d, b ) -> Exp( c x d, a x b ) )
true

#########################################################
# (Co)Cartesian compatibility
#########################################################

# (Co)CartesianDuality compatibility

gap> direct_product_cart_duality_compatibility_ab := DirectProductCartesianDualityCompatibilityMorphism( a, b );; # a^v x b^v -> (a x b)^v
gap> direct_product_cart_duality_compatibility_ba := DirectProductCartesianDualityCompatibilityMorphism( b, a );; # b^v x a^v -> (b x a)^v
gap> direct_product_cart_duality_compatibility_cd := DirectProductCartesianDualityCompatibilityMorphism( c, d );; # c^v x d^v -> (c x d)^v
gap> direct_product_cart_duality_compatibility_dc := DirectProductCartesianDualityCompatibilityMorphism( d, c );; # d^v x c^v -> (d x c)^v

gap> cocart_duality_coproduct_compatibility_abop := CocartesianDualityCoproductCompatibilityMorphism( aop, bop );; # (a x b)_v -> a_v x b_v
gap> cocart_duality_coproduct_compatibility_baop := CocartesianDualityCoproductCompatibilityMorphism( bop, aop );; # (b x a)_v -> b_v x a_v
gap> cocart_duality_coproduct_compatibility_cdop := CocartesianDualityCoproductCompatibilityMorphism( cop, dop );; # (c x d)_v -> c_v x d_v
gap> cocart_duality_coproduct_compatibility_dcop := CocartesianDualityCoproductCompatibilityMorphism( dop, cop );; # (d x c)_v -> d_v x c_v

# Opposite correspondence on (co)duality compatibility

gap> cocart_duality_coproduct_compatibility_abop = Opposite( direct_product_cart_duality_compatibility_ab );
true
gap> cocart_duality_coproduct_compatibility_baop = Opposite( direct_product_cart_duality_compatibility_ba );
true
gap> cocart_duality_coproduct_compatibility_cdop = Opposite( direct_product_cart_duality_compatibility_cd );
true
gap> cocart_duality_coproduct_compatibility_dcop = Opposite( direct_product_cart_duality_compatibility_dc );
true

gap> cocart_duality_coproduct_compatibility_baop = Opposite( direct_product_cart_duality_compatibility_cd );
true
gap> cocart_duality_coproduct_compatibility_baop = Opposite( direct_product_cart_duality_compatibility_dc );
true
gap> cocart_duality_coproduct_compatibility_dcop = Opposite( direct_product_cart_duality_compatibility_ab );
true
gap> cocart_duality_coproduct_compatibility_dcop = Opposite( direct_product_cart_duality_compatibility_ba );
true

#########################################################
# Morphism from direct product to exponential 
#########################################################

gap> morphism_from_direct_product_to_exp_ab := MorphismFromDirectProductToExponential( a, b );;
gap> morphism_from_direct_product_to_exp_ba := MorphismFromDirectProductToExponential( b, a );;
gap> morphism_from_direct_product_to_exp_cd := MorphismFromDirectProductToExponential( c, d );;
gap> morphism_from_direct_product_to_exp_dc := MorphismFromDirectProductToExponential( d, c );;

gap> morphism_from_coexp_to_coproduct_abop := MorphismFromCoexponentialToCoproduct( aop, bop );;
gap> morphism_from_coexp_to_coproduct_baop := MorphismFromCoexponentialToCoproduct( bop, aop );;
gap> morphism_from_coexp_to_coproduct_cdop := MorphismFromCoexponentialToCoproduct( cop, dop );;
gap> morphism_from_coexp_to_coproduct_dcop := MorphismFromCoexponentialToCoproduct( dop, cop );;

# Opposite correspondence

gap> morphism_from_coexp_to_coproduct_abop = Opposite( morphism_from_direct_product_to_exp_ba );
true
gap> morphism_from_coexp_to_coproduct_baop = Opposite( morphism_from_direct_product_to_exp_ab );
true
gap> morphism_from_coexp_to_coproduct_cdop = Opposite( morphism_from_direct_product_to_exp_dc );
true
gap> morphism_from_coexp_to_coproduct_dcop = Opposite( morphism_from_direct_product_to_exp_cd );
true

gap> morphism_from_coexp_to_coproduct_abop = Opposite( morphism_from_direct_product_to_exp_cd );
true
gap> morphism_from_coexp_to_coproduct_abop = Opposite( morphism_from_direct_product_to_exp_dc );
true

gap> morphism_from_coexp_to_coproduct_cdop = Opposite( morphism_from_direct_product_to_exp_ab );
true
gap> morphism_from_coexp_to_coproduct_cdop = Opposite( morphism_from_direct_product_to_exp_ba );
true

#########################################################
# Isomorphisms between dual and exp
#########################################################

gap> isomorphism_from_dual_to_exp_a := IsomorphismFromCartesianDualToExponential( a );;
gap> isomorphism_from_dual_to_exp_b := IsomorphismFromCartesianDualToExponential( b );;
gap> isomorphism_from_dual_to_exp_c := IsomorphismFromCartesianDualToExponential( c );;
gap> isomorphism_from_dual_to_exp_d := IsomorphismFromCartesianDualToExponential( d );;

gap> isomorphism_from_exp_to_dual_a := IsomorphismFromExponentialToCartesianDual( a );;
gap> isomorphism_from_exp_to_dual_b := IsomorphismFromExponentialToCartesianDual( b );;
gap> isomorphism_from_exp_to_dual_c := IsomorphismFromExponentialToCartesianDual( c );;
gap> isomorphism_from_exp_to_dual_d := IsomorphismFromExponentialToCartesianDual( d );;

gap> isomorphism_from_codual_to_coexp_aop := IsomorphismFromCocartesianDualToCoexponential( aop );;
gap> isomorphism_from_codual_to_coexp_bop := IsomorphismFromCocartesianDualToCoexponential( bop );;
gap> isomorphism_from_codual_to_coexp_cop := IsomorphismFromCocartesianDualToCoexponential( cop );;
gap> isomorphism_from_codual_to_coexp_dop := IsomorphismFromCocartesianDualToCoexponential( dop );;

gap> isomorphism_from_coexp_to_codual_aop := IsomorphismFromCoexponentialToCocartesianDual( aop );;
gap> isomorphism_from_coexp_to_codual_bop := IsomorphismFromCoexponentialToCocartesianDual( bop );;
gap> isomorphism_from_coexp_to_codual_cop := IsomorphismFromCoexponentialToCocartesianDual( cop );;
gap> isomorphism_from_coexp_to_codual_dop := IsomorphismFromCoexponentialToCocartesianDual( dop );;

# Opposite correspondence

gap> isomorphism_from_codual_to_coexp_aop = Opposite( isomorphism_from_exp_to_dual_a );
true
gap> isomorphism_from_codual_to_coexp_bop = Opposite( isomorphism_from_exp_to_dual_b );
true
gap> isomorphism_from_codual_to_coexp_cop = Opposite( isomorphism_from_exp_to_dual_c );
true
gap> isomorphism_from_codual_to_coexp_dop = Opposite( isomorphism_from_exp_to_dual_d );
true

gap> isomorphism_from_coexp_to_codual_aop = Opposite( isomorphism_from_dual_to_exp_a );
true
gap> isomorphism_from_coexp_to_codual_bop = Opposite( isomorphism_from_dual_to_exp_b );
true
gap> isomorphism_from_coexp_to_codual_cop = Opposite( isomorphism_from_dual_to_exp_c );
true
gap> isomorphism_from_coexp_to_codual_dop = Opposite( isomorphism_from_dual_to_exp_d );
true

gap> isomorphism_from_codual_to_coexp_cop = Opposite( isomorphism_from_exp_to_dual_a );
true
gap> isomorphism_from_codual_to_coexp_cop = Opposite( isomorphism_from_exp_to_dual_b );
true
gap> isomorphism_from_codual_to_coexp_cop = Opposite( isomorphism_from_exp_to_dual_d );
true

gap> isomorphism_from_coexp_to_codual_dop = Opposite( isomorphism_from_dual_to_exp_a );
true
gap> isomorphism_from_coexp_to_codual_dop = Opposite( isomorphism_from_dual_to_exp_b );
true
gap> isomorphism_from_coexp_to_codual_dop = Opposite( isomorphism_from_dual_to_exp_c );
true

#########################################################
# Universal property of dual
#########################################################

# Morphisms

gap> ab_to_t := UniversalMorphismIntoTerminalObject( a_product_b );;
gap> cd_to_t := UniversalMorphismIntoTerminalObject( c_product_d );;

gap> i_to_ab := UniversalMorphismFromInitialObject( a_product_b );;
gap> i_to_cd := UniversalMorphismFromInitialObject( c_product_d );;

gap> ab_to_top := UniversalMorphismIntoTerminalObject( a_coproduct_bop );;
gap> cd_to_top := UniversalMorphismIntoTerminalObject( c_coproduct_dop );;

gap> t_to_abop := UniversalMorphismFromInitialObject( a_coproduct_bop );;
gap> t_to_cdop := UniversalMorphismFromInitialObject( c_coproduct_dop );;

# Universal property

gap> universal_property_of_cart_dual_ab_to_t := UniversalPropertyOfCartesianDual( a, b, ab_to_t );;
gap> universal_property_of_cart_dual_cd_to_t := UniversalPropertyOfCartesianDual( c, d, cd_to_t );;

gap> universal_property_of_cocart_dual_t_to_abop := UniversalPropertyOfCocartesianDual( aop, bop, t_to_abop );;
gap> universal_property_of_cocart_dual_t_to_cdop := UniversalPropertyOfCocartesianDual( cop, dop, t_to_cdop);;

# Opposite correspondence

gap> universal_property_of_cocart_dual_t_to_abop = Opposite( universal_property_of_cart_dual_ab_to_t );
true
gap> universal_property_of_cocart_dual_t_to_cdop = Opposite( universal_property_of_cart_dual_cd_to_t );
true

gap> universal_property_of_cocart_dual_t_to_abop = Opposite( universal_property_of_cart_dual_cd_to_t );
false
gap> universal_property_of_cocart_dual_t_to_cdop = Opposite( universal_property_of_cart_dual_ab_to_t );
false

#########################################################
# Lambdas
#########################################################

gap> cart_lambda_intro_a_to_b := CartesianLambdaIntroduction( alpha );;
gap> cart_lambda_intro_b_to_c := CartesianLambdaIntroduction( gamma );;
gap> cart_lambda_intro_c_to_d := CartesianLambdaIntroduction( beta );;

gap> cocart_lambda_intro_b_to_aop := CocartesianLambdaIntroduction( alphaop );;
gap> cocart_lambda_intro_c_to_bop := CocartesianLambdaIntroduction( gammaop );;
gap> cocart_lambda_intro_d_to_cop := CocartesianLambdaIntroduction( betaop );;

gap> cart_lambda_elim_t_to_exp_ab := CartesianLambdaElimination( a, b, cart_lambda_intro_a_to_b );;
gap> cart_lambda_elim_t_to_exp_bc := CartesianLambdaElimination( b, c, cart_lambda_intro_b_to_c );;
gap> cart_lambda_elim_t_to_exp_cd := CartesianLambdaElimination( c, d, cart_lambda_intro_c_to_d );;

gap> cocart_lambda_elim_coexp_ba_to_top := CocartesianLambdaElimination( bop, aop, cocart_lambda_intro_b_to_aop );;
gap> cocart_lambda_elim_coexp_cb_to_top := CocartesianLambdaElimination( cop, bop, cocart_lambda_intro_c_to_bop );;
gap> cocart_lambda_elim_coexp_dc_to_top := CocartesianLambdaElimination( dop, cop, cocart_lambda_intro_d_to_cop );;

# Opposite correspondence

gap> cocart_lambda_intro_b_to_aop = Opposite( cart_lambda_intro_a_to_b );
true
gap> cocart_lambda_intro_c_to_bop = Opposite( cart_lambda_intro_b_to_c );
true
gap> cocart_lambda_intro_d_to_cop = Opposite( cart_lambda_intro_c_to_d );
true

gap> cocart_lambda_elim_coexp_ba_to_top = Opposite( cart_lambda_elim_t_to_exp_ab );
true
gap> cocart_lambda_elim_coexp_cb_to_top = Opposite( cart_lambda_elim_t_to_exp_bc );
true
gap> cocart_lambda_elim_coexp_dc_to_top = Opposite( cart_lambda_elim_t_to_exp_cd );
true

gap> cocart_lambda_intro_d_to_cop = Opposite( cart_lambda_intro_a_to_b );
true
gap> cocart_lambda_intro_d_to_cop = Opposite( cart_lambda_intro_b_to_c );
true

gap> cocart_lambda_elim_coexp_dc_to_top = Opposite( cart_lambda_elim_t_to_exp_ab );
false
gap> cocart_lambda_elim_coexp_dc_to_top = Opposite( cart_lambda_elim_t_to_exp_bc );
false

#########################################################
# Isomorphisms between object and (co)exponential
#########################################################

gap> isomorphism_from_a_to_exp := IsomorphismFromObjectToExponential( a );;
gap> isomorphism_from_b_to_exp := IsomorphismFromObjectToExponential( b );;
gap> isomorphism_from_c_to_exp := IsomorphismFromObjectToExponential( c );;
gap> isomorphism_from_d_to_exp := IsomorphismFromObjectToExponential( d );;
gap> isomorphism_from_i_to_exp := IsomorphismFromObjectToExponential( i );;
gap> isomorphism_from_t_to_exp := IsomorphismFromObjectToExponential( t );;

gap> isomorphism_from_exp_to_a := IsomorphismFromExponentialToObject( a );;
gap> isomorphism_from_exp_to_b := IsomorphismFromExponentialToObject( b );;
gap> isomorphism_from_exp_to_c := IsomorphismFromExponentialToObject( c );;
gap> isomorphism_from_exp_to_d := IsomorphismFromExponentialToObject( d );;
gap> isomorphism_from_exp_to_i := IsomorphismFromExponentialToObject( i );;
gap> isomorphism_from_exp_to_t := IsomorphismFromExponentialToObject( t );;

gap> isomorphism_from_a_to_coexpop := IsomorphismFromObjectToCoexponential( aop );;
gap> isomorphism_from_b_to_coexpop := IsomorphismFromObjectToCoexponential( bop );;
gap> isomorphism_from_c_to_coexpop := IsomorphismFromObjectToCoexponential( cop );;
gap> isomorphism_from_d_to_coexpop := IsomorphismFromObjectToCoexponential( dop );;
gap> isomorphism_from_i_to_coexpop := IsomorphismFromObjectToCoexponential( iop );;
gap> isomorphism_from_t_to_coexpop := IsomorphismFromObjectToCoexponential( top );;

gap> isomorphism_from_coexp_to_aop := IsomorphismFromCoexponentialToObject( aop );;
gap> isomorphism_from_coexp_to_bop := IsomorphismFromCoexponentialToObject( bop );;
gap> isomorphism_from_coexp_to_cop := IsomorphismFromCoexponentialToObject( cop) ;;
gap> isomorphism_from_coexp_to_dop := IsomorphismFromCoexponentialToObject( dop );;
gap> isomorphism_from_coexp_to_iop := IsomorphismFromCoexponentialToObject( iop );;
gap> isomorphism_from_coexp_to_top := IsomorphismFromCoexponentialToObject( top );;

# Opposite correspondence

gap> isomorphism_from_a_to_coexpop = Opposite( isomorphism_from_exp_to_a );
true
gap> isomorphism_from_b_to_coexpop = Opposite( isomorphism_from_exp_to_b );
true
gap> isomorphism_from_c_to_coexpop = Opposite( isomorphism_from_exp_to_c );
true
gap> isomorphism_from_d_to_coexpop = Opposite( isomorphism_from_exp_to_d );
true
gap> isomorphism_from_i_to_coexpop = Opposite( isomorphism_from_exp_to_t );
true
gap> isomorphism_from_t_to_coexpop = Opposite( isomorphism_from_exp_to_i );
true

gap> isomorphism_from_coexp_to_aop = Opposite( isomorphism_from_a_to_exp );
true
gap> isomorphism_from_coexp_to_bop = Opposite( isomorphism_from_b_to_exp );
true
gap> isomorphism_from_coexp_to_cop = Opposite( isomorphism_from_c_to_exp );
true
gap> isomorphism_from_coexp_to_dop = Opposite( isomorphism_from_d_to_exp );
true
gap> isomorphism_from_coexp_to_iop = Opposite( isomorphism_from_t_to_exp );
true
gap> isomorphism_from_coexp_to_top = Opposite( isomorphism_from_i_to_exp );
true

gap> isomorphism_from_c_to_coexpop = Opposite( isomorphism_from_exp_to_a );
false
gap> isomorphism_from_c_to_coexpop = Opposite( isomorphism_from_exp_to_b );
false
gap> isomorphism_from_c_to_coexpop = Opposite( isomorphism_from_exp_to_d );
false
gap> isomorphism_from_c_to_coexpop = Opposite( isomorphism_from_exp_to_i );
false

gap> isomorphism_from_coexp_to_dop = Opposite( isomorphism_from_a_to_exp );
false
gap> isomorphism_from_coexp_to_dop = Opposite( isomorphism_from_b_to_exp );
false
gap> isomorphism_from_coexp_to_dop = Opposite( isomorphism_from_c_to_exp );
false
gap> isomorphism_from_coexp_to_dop = Opposite( isomorphism_from_t_to_exp );
false

gap> STOP_TEST("TerminalCategory.tst", 1);

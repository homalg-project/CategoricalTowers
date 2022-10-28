# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#
BindGlobal( "ADD_FUNCTIONS_FOR_FinQuiversAsCCCPrecompiled", function ( cat )
    
    ##
    AddExponentialOnObjects( cat,
        
########
function ( cat_1, a_1, b_1 )
    local hoisted_1_1, hoisted_2_1, hoisted_3_1, hoisted_4_1, hoisted_5_1, hoisted_6_1, hoisted_7_1, hoisted_8_1, hoisted_9_1, hoisted_10_1, hoisted_11_1, hoisted_12_1, hoisted_13_1, hoisted_14_1, hoisted_15_1, hoisted_16_1, hoisted_17_1, hoisted_18_1, hoisted_19_1, hoisted_20_1, hoisted_21_1, hoisted_22_1, hoisted_23_1, hoisted_24_1, hoisted_25_1, hoisted_26_1, hoisted_27_1, hoisted_28_1, hoisted_29_1, hoisted_30_1, hoisted_31_1, hoisted_32_1, hoisted_33_1, hoisted_34_1, hoisted_35_1, hoisted_36_1, hoisted_37_1, hoisted_38_1, hoisted_39_1, hoisted_40_1, hoisted_41_1, hoisted_42_1, hoisted_43_1, hoisted_44_1, hoisted_45_1, hoisted_46_1, hoisted_47_1, hoisted_48_1, hoisted_49_1, hoisted_50_1, 
    hoisted_51_1, hoisted_52_1, hoisted_53_1, hoisted_54_1, hoisted_55_1, hoisted_56_1, hoisted_57_1, hoisted_58_1, hoisted_59_1, hoisted_60_1, hoisted_61_1, hoisted_62_1, hoisted_63_1, hoisted_64_1, hoisted_65_1, hoisted_66_1, hoisted_67_1, hoisted_68_1, hoisted_69_1, hoisted_70_1, hoisted_71_1, hoisted_72_1, hoisted_73_1, hoisted_74_1, hoisted_75_1, hoisted_76_1, hoisted_77_1, hoisted_78_1, hoisted_79_1, hoisted_80_1, hoisted_81_1, hoisted_82_1, hoisted_83_1, hoisted_84_1, hoisted_85_1, hoisted_86_1, hoisted_87_1, hoisted_88_1, hoisted_89_1, hoisted_90_1, hoisted_91_1, hoisted_92_1, hoisted_93_1, hoisted_94_1, hoisted_95_1, hoisted_96_1, hoisted_97_1, hoisted_98_1, hoisted_99_1, hoisted_100_1, hoisted_101_1, hoisted_102_1, hoisted_103_1, hoisted_104_1, hoisted_105_1, hoisted_106_1, hoisted_107_1, hoisted_108_1, hoisted_109_1, hoisted_110_1, hoisted_111_1, hoisted_112_1, hoisted_113_1, hoisted_114_1, hoisted_115_1, hoisted_116_1, hoisted_117_1, hoisted_118_1, hoisted_119_1, hoisted_120_1, hoisted_121_1, hoisted_122_1, hoisted_123_1, hoisted_124_1, hoisted_125_1, hoisted_126_1, hoisted_127_1, hoisted_128_1, hoisted_129_1, hoisted_130_1, hoisted_131_1, hoisted_132_1, hoisted_133_1, hoisted_134_1, hoisted_135_1, hoisted_136_1, hoisted_137_1, hoisted_138_1, hoisted_139_1, hoisted_140_1, hoisted_141_1, hoisted_142_1, hoisted_143_1, hoisted_144_1, hoisted_145_1, hoisted_146_1, hoisted_147_1, hoisted_148_1, hoisted_149_1, hoisted_150_1, hoisted_151_1, hoisted_152_1, hoisted_153_1, hoisted_154_1, hoisted_155_1, hoisted_156_1, hoisted_157_1, hoisted_158_1, hoisted_159_1, hoisted_160_1, hoisted_161_1, hoisted_162_1, hoisted_163_1, hoisted_164_1, hoisted_165_1, hoisted_166_1, hoisted_167_1, hoisted_168_1, hoisted_169_1, hoisted_170_1, hoisted_171_1, hoisted_172_1, hoisted_173_1, hoisted_174_1, hoisted_175_1, hoisted_176_1, hoisted_177_1, hoisted_178_1, hoisted_179_1, hoisted_180_1, hoisted_181_1, hoisted_182_1, hoisted_183_1, hoisted_184_1, hoisted_185_1, hoisted_186_1, hoisted_187_1, hoisted_188_1, hoisted_189_1, hoisted_190_1, hoisted_191_1, hoisted_192_1, hoisted_193_1, hoisted_194_1, hoisted_195_1, hoisted_196_1, hoisted_197_1, hoisted_198_1, hoisted_199_1, hoisted_200_1, hoisted_201_1, hoisted_202_1, hoisted_203_1, hoisted_204_1, hoisted_205_1, hoisted_206_1, hoisted_207_1, hoisted_208_1, hoisted_209_1, hoisted_210_1, hoisted_211_1, hoisted_212_1, deduped_213_1, deduped_214_1, deduped_215_1, deduped_216_1, deduped_217_1, deduped_218_1, deduped_219_1, deduped_220_1, deduped_221_1, deduped_222_1, deduped_223_1, deduped_224_1, deduped_225_1, deduped_226_1, deduped_227_1, deduped_228_1, deduped_229_1, deduped_230_1, deduped_231_1, deduped_232_1, deduped_233_1, deduped_234_1, deduped_235_1, deduped_236_1, deduped_237_1, deduped_238_1, deduped_239_1, deduped_240_1, deduped_241_1, deduped_242_1, deduped_243_1, deduped_244_1, deduped_245_1, deduped_246_1, deduped_247_1, deduped_248_1, deduped_249_1, deduped_250_1, deduped_251_1, deduped_252_1, deduped_253_1, deduped_254_1, deduped_255_1, deduped_256_1, deduped_257_1, deduped_258_1, deduped_259_1, deduped_260_1, deduped_261_1, deduped_262_1, deduped_263_1, deduped_264_1, deduped_265_1, deduped_266_1, deduped_267_1, deduped_268_1, deduped_269_1, deduped_270_1, deduped_271_1, deduped_272_1, deduped_273_1, deduped_274_1, deduped_275_1, deduped_276_1, deduped_277_1, deduped_278_1, deduped_279_1, deduped_280_1, deduped_281_1, deduped_282_1, deduped_283_1, deduped_284_1, deduped_285_1, deduped_286_1, deduped_287_1, deduped_288_1, deduped_289_1, deduped_290_1, deduped_291_1, deduped_292_1, deduped_293_1, deduped_294_1, deduped_295_1, deduped_296_1, deduped_297_1, deduped_298_1, deduped_299_1, deduped_300_1, deduped_301_1, deduped_302_1, deduped_303_1, deduped_304_1, deduped_305_1, deduped_306_1, deduped_307_1, deduped_308_1, deduped_309_1, deduped_310_1, deduped_311_1, deduped_312_1, deduped_313_1, deduped_314_1, deduped_315_1, deduped_316_1, deduped_317_1, deduped_318_1, deduped_319_1, deduped_320_1, deduped_321_1, deduped_322_1, deduped_323_1, deduped_324_1, deduped_325_1, 
    deduped_326_1, deduped_327_1, deduped_328_1, deduped_329_1, deduped_330_1, deduped_331_1, deduped_332_1, deduped_333_1, deduped_334_1, deduped_335_1, deduped_336_1, deduped_337_1;
    deduped_337_1 := DefiningTripleOfQuiver( a_1 );
    deduped_336_1 := DefiningTripleOfQuiver( b_1 );
    deduped_335_1 := deduped_336_1[3];
    deduped_334_1 := deduped_337_1[3];
    deduped_333_1 := deduped_337_1[2];
    deduped_332_1 := deduped_336_1[2];
    deduped_331_1 := deduped_337_1[1];
    deduped_330_1 := ModelingCategory( ModelingCategory( cat_1 ) );
    deduped_329_1 := deduped_336_1[1];
    deduped_328_1 := SetOfGeneratingMorphisms( deduped_330_1 );
    deduped_327_1 := Source( deduped_330_1 );
    deduped_326_1 := SetOfObjects( deduped_330_1 );
    deduped_325_1 := List( deduped_328_1, function ( logic_new_func_x_2 )
            return BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) );
        end );
    deduped_324_1 := BasisPathsByVertexIndex( deduped_327_1 );
    deduped_323_1 := List( deduped_328_1, function ( logic_new_func_x_2 )
            return QuiverVertexAsIdentityPath( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
        end );
    deduped_322_1 := List( deduped_328_1, function ( logic_new_func_x_2 )
            return VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
        end );
    deduped_321_1 := List( deduped_328_1, function ( logic_new_func_x_2 )
            return QuiverVertexAsIdentityPath( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
        end );
    deduped_320_1 := List( deduped_328_1, function ( logic_new_func_x_2 )
            return VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
        end );
    deduped_318_1 := deduped_322_1[2];
    hoisted_164_1 := deduped_318_1;
    hoisted_1_1 := List( deduped_324_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, Length );
        end );
    deduped_319_1 := List( deduped_326_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_164_1];
        end );
    deduped_317_1 := deduped_320_1[2];
    deduped_315_1 := deduped_322_1[1];
    hoisted_89_1 := deduped_315_1;
    deduped_316_1 := List( deduped_326_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_89_1];
        end );
    deduped_314_1 := deduped_320_1[1];
    hoisted_139_1 := deduped_317_1;
    deduped_313_1 := List( deduped_326_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_139_1];
        end );
    hoisted_64_1 := deduped_314_1;
    deduped_312_1 := List( deduped_326_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_64_1];
        end );
    deduped_311_1 := List( deduped_328_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_164_1];
        end );
    deduped_310_1 := List( deduped_328_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_164_1];
        end );
    deduped_309_1 := deduped_324_1[deduped_318_1];
    deduped_308_1 := deduped_319_1[2];
    deduped_307_1 := deduped_319_1[1];
    deduped_306_1 := List( deduped_328_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_139_1];
        end );
    deduped_305_1 := List( deduped_328_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_139_1];
        end );
    deduped_304_1 := List( deduped_328_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_89_1];
        end );
    deduped_303_1 := List( deduped_328_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_89_1];
        end );
    deduped_302_1 := deduped_324_1[deduped_315_1];
    deduped_301_1 := deduped_316_1[2];
    deduped_300_1 := deduped_316_1[1];
    deduped_299_1 := List( deduped_328_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_64_1];
        end );
    deduped_298_1 := List( deduped_328_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_64_1];
        end );
    deduped_297_1 := deduped_313_1[2];
    deduped_296_1 := deduped_313_1[1];
    deduped_295_1 := deduped_312_1[2];
    deduped_294_1 := deduped_312_1[1];
    deduped_293_1 := deduped_308_1 * deduped_333_1;
    deduped_292_1 := deduped_307_1 * deduped_331_1;
    deduped_291_1 := deduped_301_1 * deduped_333_1;
    deduped_290_1 := deduped_300_1 * deduped_331_1;
    deduped_289_1 := deduped_297_1 * deduped_333_1;
    deduped_288_1 := deduped_296_1 * deduped_331_1;
    deduped_287_1 := deduped_295_1 * deduped_333_1;
    deduped_286_1 := deduped_294_1 * deduped_331_1;
    deduped_285_1 := deduped_329_1 ^ deduped_293_1;
    deduped_284_1 := deduped_332_1 ^ deduped_293_1;
    deduped_283_1 := deduped_329_1 ^ deduped_292_1;
    deduped_282_1 := deduped_329_1 ^ deduped_291_1;
    deduped_281_1 := deduped_332_1 ^ deduped_291_1;
    deduped_280_1 := deduped_329_1 ^ deduped_290_1;
    deduped_279_1 := deduped_329_1 ^ deduped_289_1;
    deduped_278_1 := deduped_332_1 ^ deduped_289_1;
    deduped_277_1 := deduped_329_1 ^ deduped_288_1;
    deduped_276_1 := deduped_329_1 ^ deduped_287_1;
    deduped_275_1 := deduped_332_1 ^ deduped_287_1;
    deduped_274_1 := deduped_329_1 ^ deduped_286_1;
    deduped_273_1 := [ 0 .. deduped_293_1 - 1 ];
    deduped_272_1 := [ 0 .. deduped_292_1 - 1 ];
    deduped_271_1 := [ 0 .. deduped_289_1 - 1 ];
    deduped_270_1 := [ 0 .. deduped_291_1 - 1 ];
    deduped_269_1 := [ 0 .. deduped_290_1 - 1 ];
    deduped_268_1 := [ 0 .. deduped_287_1 - 1 ];
    hoisted_192_1 := SafePosition( deduped_309_1[deduped_317_1], deduped_325_1[2] );
    hoisted_5_1 := deduped_324_1;
    hoisted_4_1 := HomStructureOnBasisPaths( deduped_327_1 );
    deduped_267_1 := List( deduped_326_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := UnderlyingVertex( logic_new_func_x_2 );
            deduped_2_2 := VertexIndex( deduped_3_2 );
            hoisted_1_2 := hoisted_4_1[deduped_2_2][hoisted_164_1][deduped_2_2][hoisted_139_1][SafePosition( hoisted_5_1[deduped_2_2][deduped_2_2], QuiverVertexAsIdentityPath( deduped_3_2 ) )][hoisted_192_1];
            return List( [ 1 .. hoisted_1_1[deduped_2_2][hoisted_164_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    deduped_266_1 := deduped_277_1 * deduped_278_1;
    hoisted_117_1 := SafePosition( deduped_302_1[deduped_314_1], deduped_325_1[1] );
    deduped_265_1 := List( deduped_326_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := UnderlyingVertex( logic_new_func_x_2 );
            deduped_2_2 := VertexIndex( deduped_3_2 );
            hoisted_1_2 := hoisted_4_1[deduped_2_2][hoisted_89_1][deduped_2_2][hoisted_64_1][SafePosition( hoisted_5_1[deduped_2_2][deduped_2_2], QuiverVertexAsIdentityPath( deduped_3_2 ) )][hoisted_117_1];
            return List( [ 1 .. hoisted_1_1[deduped_2_2][hoisted_89_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    deduped_264_1 := deduped_274_1 * deduped_275_1;
    deduped_263_1 := [ 0 .. deduped_284_1 - 1 ];
    deduped_262_1 := [ 0 .. deduped_283_1 - 1 ];
    deduped_261_1 := [ 0 .. deduped_278_1 - 1 ];
    deduped_260_1 := [ 0 .. deduped_277_1 - 1 ];
    deduped_259_1 := [ 0 .. deduped_281_1 - 1 ];
    deduped_258_1 := [ 0 .. deduped_280_1 - 1 ];
    deduped_257_1 := [ 0 .. deduped_275_1 - 1 ];
    deduped_256_1 := [ 0 .. deduped_274_1 - 1 ];
    hoisted_171_1 := SafePosition( deduped_309_1[deduped_318_1], deduped_323_1[2] );
    deduped_255_1 := List( deduped_328_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_4_1[deduped_2_2][hoisted_164_1][deduped_3_2][hoisted_164_1][SafePosition( hoisted_5_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_171_1];
            return List( [ 1 .. hoisted_1_1[deduped_2_2][hoisted_164_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_146_1 := SafePosition( deduped_324_1[deduped_317_1][deduped_317_1], deduped_321_1[2] );
    deduped_254_1 := List( deduped_328_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_4_1[deduped_2_2][hoisted_139_1][deduped_3_2][hoisted_139_1][SafePosition( hoisted_5_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_146_1];
            return List( [ 1 .. hoisted_1_1[deduped_2_2][hoisted_139_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_96_1 := SafePosition( deduped_302_1[deduped_315_1], deduped_323_1[1] );
    deduped_253_1 := List( deduped_328_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_4_1[deduped_2_2][hoisted_89_1][deduped_3_2][hoisted_89_1][SafePosition( hoisted_5_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_96_1];
            return List( [ 1 .. hoisted_1_1[deduped_2_2][hoisted_89_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_71_1 := SafePosition( deduped_324_1[deduped_314_1][deduped_314_1], deduped_321_1[1] );
    deduped_252_1 := List( deduped_328_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_4_1[deduped_2_2][hoisted_64_1][deduped_3_2][hoisted_64_1][SafePosition( hoisted_5_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_71_1];
            return List( [ 1 .. hoisted_1_1[deduped_2_2][hoisted_64_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    deduped_251_1 := [ 0 .. deduped_266_1 - 1 ];
    deduped_250_1 := [ 0 .. deduped_264_1 - 1 ];
    hoisted_177_1 := deduped_273_1;
    hoisted_37_1 := List( deduped_335_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_25_1 := deduped_332_1;
    hoisted_12_1 := deduped_329_1;
    hoisted_188_1 := List( deduped_263_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_177_1, function ( logic_new_func_x_3 )
                    return hoisted_37_1[1 + REM_INT( QUO_INT( i_2, hoisted_25_1 ^ logic_new_func_x_3 ), hoisted_25_1 )];
                end );
            return Sum( List( hoisted_177_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_186_1 := deduped_311_1[2];
    hoisted_182_1 := deduped_310_1[2];
    hoisted_32_1 := List( deduped_334_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_17_1 := deduped_333_1;
    hoisted_185_1 := List( deduped_273_1, function ( logic_new_func_x_2 )
            return hoisted_32_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_182_1 ), hoisted_17_1 )];
        end );
    hoisted_183_1 := deduped_255_1[2];
    hoisted_184_1 := List( deduped_273_1, function ( logic_new_func_x_2 )
            return hoisted_183_1[1 + REM_INT( logic_new_func_x_2, hoisted_182_1 )];
        end );
    hoisted_170_1 := deduped_272_1;
    hoisted_187_1 := List( deduped_262_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_170_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_12_1 ^ j_3 ), hoisted_12_1 );
                end );
            hoisted_2_2 := List( hoisted_177_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_184_1[deduped_1_3] + hoisted_185_1[deduped_1_3] * hoisted_186_1)];
                end );
            return Sum( List( hoisted_177_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_26_1 := List( deduped_335_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_181_1 := List( deduped_263_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_177_1, function ( logic_new_func_x_3 )
                    return hoisted_26_1[1 + REM_INT( QUO_INT( i_2, hoisted_25_1 ^ logic_new_func_x_3 ), hoisted_25_1 )];
                end );
            return Sum( List( hoisted_177_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_180_1 := deduped_284_1;
    hoisted_176_1 := deduped_311_1[1];
    hoisted_172_1 := deduped_310_1[1];
    hoisted_18_1 := List( deduped_334_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_175_1 := List( deduped_273_1, function ( logic_new_func_x_2 )
            return hoisted_18_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_172_1 ), hoisted_17_1 )];
        end );
    hoisted_173_1 := deduped_255_1[1];
    hoisted_174_1 := List( deduped_273_1, function ( logic_new_func_x_2 )
            return hoisted_173_1[1 + REM_INT( logic_new_func_x_2, hoisted_172_1 )];
        end );
    hoisted_179_1 := List( deduped_262_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_170_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_12_1 ^ j_3 ), hoisted_12_1 );
                end );
            hoisted_2_2 := List( hoisted_177_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_174_1[deduped_1_3] + hoisted_175_1[deduped_1_3] * hoisted_176_1)];
                end );
            return Sum( List( hoisted_177_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_178_1 := deduped_283_1;
    hoisted_169_1 := Product( [ deduped_285_1, deduped_285_1, deduped_285_1 ] );
    hoisted_168_1 := deduped_285_1 * deduped_285_1;
    hoisted_167_1 := Product( [ deduped_283_1, deduped_284_1, deduped_285_1 ] );
    hoisted_166_1 := deduped_285_1;
    hoisted_165_1 := deduped_283_1 * deduped_284_1;
    deduped_249_1 := Filtered( [ 0 .. Product( [ deduped_283_1, deduped_284_1, deduped_285_1, deduped_285_1 ] ) - 1 ], function ( x_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2;
            deduped_4_2 := 1 + REM_INT( x_2, hoisted_178_1 );
            deduped_3_2 := REM_INT( QUO_INT( x_2, hoisted_167_1 ), hoisted_166_1 );
            deduped_2_2 := REM_INT( QUO_INT( x_2, hoisted_165_1 ), hoisted_166_1 );
            deduped_1_2 := 1 + REM_INT( QUO_INT( x_2, hoisted_178_1 ), hoisted_180_1 );
            return deduped_2_2 + deduped_2_2 * hoisted_166_1 + deduped_3_2 * hoisted_168_1 + deduped_3_2 * hoisted_169_1 = hoisted_179_1[deduped_4_2] + hoisted_181_1[deduped_1_2] * hoisted_166_1 + hoisted_187_1[deduped_4_2] * hoisted_168_1 + hoisted_188_1[deduped_1_2] * hoisted_169_1;
        end );
    hoisted_102_1 := deduped_270_1;
    hoisted_113_1 := List( deduped_259_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_102_1, function ( logic_new_func_x_3 )
                    return hoisted_37_1[1 + REM_INT( QUO_INT( i_2, hoisted_25_1 ^ logic_new_func_x_3 ), hoisted_25_1 )];
                end );
            return Sum( List( hoisted_102_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_111_1 := deduped_304_1[2];
    hoisted_107_1 := deduped_303_1[2];
    hoisted_110_1 := List( deduped_270_1, function ( logic_new_func_x_2 )
            return hoisted_32_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_107_1 ), hoisted_17_1 )];
        end );
    hoisted_108_1 := deduped_253_1[2];
    hoisted_109_1 := List( deduped_270_1, function ( logic_new_func_x_2 )
            return hoisted_108_1[1 + REM_INT( logic_new_func_x_2, hoisted_107_1 )];
        end );
    hoisted_95_1 := deduped_269_1;
    hoisted_112_1 := List( deduped_258_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_95_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_12_1 ^ j_3 ), hoisted_12_1 );
                end );
            hoisted_2_2 := List( hoisted_102_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_109_1[deduped_1_3] + hoisted_110_1[deduped_1_3] * hoisted_111_1)];
                end );
            return Sum( List( hoisted_102_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_106_1 := List( deduped_259_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_102_1, function ( logic_new_func_x_3 )
                    return hoisted_26_1[1 + REM_INT( QUO_INT( i_2, hoisted_25_1 ^ logic_new_func_x_3 ), hoisted_25_1 )];
                end );
            return Sum( List( hoisted_102_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_105_1 := deduped_281_1;
    hoisted_101_1 := deduped_304_1[1];
    hoisted_97_1 := deduped_303_1[1];
    hoisted_100_1 := List( deduped_270_1, function ( logic_new_func_x_2 )
            return hoisted_18_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_97_1 ), hoisted_17_1 )];
        end );
    hoisted_98_1 := deduped_253_1[1];
    hoisted_99_1 := List( deduped_270_1, function ( logic_new_func_x_2 )
            return hoisted_98_1[1 + REM_INT( logic_new_func_x_2, hoisted_97_1 )];
        end );
    hoisted_104_1 := List( deduped_258_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_95_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_12_1 ^ j_3 ), hoisted_12_1 );
                end );
            hoisted_2_2 := List( hoisted_102_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_99_1[deduped_1_3] + hoisted_100_1[deduped_1_3] * hoisted_101_1)];
                end );
            return Sum( List( hoisted_102_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_103_1 := deduped_280_1;
    hoisted_94_1 := Product( [ deduped_282_1, deduped_282_1, deduped_282_1 ] );
    hoisted_93_1 := deduped_282_1 * deduped_282_1;
    hoisted_92_1 := Product( [ deduped_280_1, deduped_281_1, deduped_282_1 ] );
    hoisted_91_1 := deduped_282_1;
    hoisted_90_1 := deduped_280_1 * deduped_281_1;
    deduped_248_1 := Filtered( [ 0 .. Product( [ deduped_280_1, deduped_281_1, deduped_282_1, deduped_282_1 ] ) - 1 ], function ( x_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2;
            deduped_4_2 := 1 + REM_INT( x_2, hoisted_103_1 );
            deduped_3_2 := REM_INT( QUO_INT( x_2, hoisted_92_1 ), hoisted_91_1 );
            deduped_2_2 := REM_INT( QUO_INT( x_2, hoisted_90_1 ), hoisted_91_1 );
            deduped_1_2 := 1 + REM_INT( QUO_INT( x_2, hoisted_103_1 ), hoisted_105_1 );
            return deduped_2_2 + deduped_2_2 * hoisted_91_1 + deduped_3_2 * hoisted_93_1 + deduped_3_2 * hoisted_94_1 = hoisted_104_1[deduped_4_2] + hoisted_106_1[deduped_1_2] * hoisted_91_1 + hoisted_112_1[deduped_4_2] * hoisted_93_1 + hoisted_113_1[deduped_1_2] * hoisted_94_1;
        end );
    hoisted_152_1 := deduped_271_1;
    hoisted_163_1 := List( deduped_261_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_152_1, function ( logic_new_func_x_3 )
                    return hoisted_37_1[1 + REM_INT( QUO_INT( i_2, hoisted_25_1 ^ logic_new_func_x_3 ), hoisted_25_1 )];
                end );
            return Sum( List( hoisted_152_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_161_1 := deduped_306_1[2];
    hoisted_157_1 := deduped_305_1[2];
    hoisted_160_1 := List( deduped_271_1, function ( logic_new_func_x_2 )
            return hoisted_32_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_157_1 ), hoisted_17_1 )];
        end );
    hoisted_158_1 := deduped_254_1[2];
    hoisted_159_1 := List( deduped_271_1, function ( logic_new_func_x_2 )
            return hoisted_158_1[1 + REM_INT( logic_new_func_x_2, hoisted_157_1 )];
        end );
    hoisted_145_1 := [ 0 .. deduped_288_1 - 1 ];
    hoisted_162_1 := List( deduped_260_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_145_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_12_1 ^ j_3 ), hoisted_12_1 );
                end );
            hoisted_2_2 := List( hoisted_152_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_159_1[deduped_1_3] + hoisted_160_1[deduped_1_3] * hoisted_161_1)];
                end );
            return Sum( List( hoisted_152_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_156_1 := List( deduped_261_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_152_1, function ( logic_new_func_x_3 )
                    return hoisted_26_1[1 + REM_INT( QUO_INT( i_2, hoisted_25_1 ^ logic_new_func_x_3 ), hoisted_25_1 )];
                end );
            return Sum( List( hoisted_152_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_155_1 := deduped_278_1;
    hoisted_151_1 := deduped_306_1[1];
    hoisted_147_1 := deduped_305_1[1];
    hoisted_150_1 := List( deduped_271_1, function ( logic_new_func_x_2 )
            return hoisted_18_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_147_1 ), hoisted_17_1 )];
        end );
    hoisted_148_1 := deduped_254_1[1];
    hoisted_149_1 := List( deduped_271_1, function ( logic_new_func_x_2 )
            return hoisted_148_1[1 + REM_INT( logic_new_func_x_2, hoisted_147_1 )];
        end );
    hoisted_154_1 := List( deduped_260_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_145_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_12_1 ^ j_3 ), hoisted_12_1 );
                end );
            hoisted_2_2 := List( hoisted_152_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_149_1[deduped_1_3] + hoisted_150_1[deduped_1_3] * hoisted_151_1)];
                end );
            return Sum( List( hoisted_152_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_153_1 := deduped_277_1;
    hoisted_144_1 := Product( [ deduped_279_1, deduped_279_1, deduped_279_1 ] );
    hoisted_143_1 := deduped_279_1 * deduped_279_1;
    hoisted_142_1 := Product( [ deduped_277_1, deduped_278_1, deduped_279_1 ] );
    hoisted_141_1 := deduped_279_1;
    hoisted_140_1 := deduped_266_1;
    deduped_247_1 := Filtered( [ 0 .. Product( [ deduped_277_1, deduped_278_1, deduped_279_1, deduped_279_1 ] ) - 1 ], function ( x_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2;
            deduped_4_2 := 1 + REM_INT( x_2, hoisted_153_1 );
            deduped_3_2 := REM_INT( QUO_INT( x_2, hoisted_142_1 ), hoisted_141_1 );
            deduped_2_2 := REM_INT( QUO_INT( x_2, hoisted_140_1 ), hoisted_141_1 );
            deduped_1_2 := 1 + REM_INT( QUO_INT( x_2, hoisted_153_1 ), hoisted_155_1 );
            return deduped_2_2 + deduped_2_2 * hoisted_141_1 + deduped_3_2 * hoisted_143_1 + deduped_3_2 * hoisted_144_1 = hoisted_154_1[deduped_4_2] + hoisted_156_1[deduped_1_2] * hoisted_141_1 + hoisted_162_1[deduped_4_2] * hoisted_143_1 + hoisted_163_1[deduped_1_2] * hoisted_144_1;
        end );
    hoisted_77_1 := deduped_268_1;
    hoisted_88_1 := List( deduped_257_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_77_1, function ( logic_new_func_x_3 )
                    return hoisted_37_1[1 + REM_INT( QUO_INT( i_2, hoisted_25_1 ^ logic_new_func_x_3 ), hoisted_25_1 )];
                end );
            return Sum( List( hoisted_77_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_86_1 := deduped_299_1[2];
    hoisted_82_1 := deduped_298_1[2];
    hoisted_85_1 := List( deduped_268_1, function ( logic_new_func_x_2 )
            return hoisted_32_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_82_1 ), hoisted_17_1 )];
        end );
    hoisted_83_1 := deduped_252_1[2];
    hoisted_84_1 := List( deduped_268_1, function ( logic_new_func_x_2 )
            return hoisted_83_1[1 + REM_INT( logic_new_func_x_2, hoisted_82_1 )];
        end );
    hoisted_70_1 := [ 0 .. deduped_286_1 - 1 ];
    hoisted_87_1 := List( deduped_256_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_70_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_12_1 ^ j_3 ), hoisted_12_1 );
                end );
            hoisted_2_2 := List( hoisted_77_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_84_1[deduped_1_3] + hoisted_85_1[deduped_1_3] * hoisted_86_1)];
                end );
            return Sum( List( hoisted_77_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_81_1 := List( deduped_257_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_77_1, function ( logic_new_func_x_3 )
                    return hoisted_26_1[1 + REM_INT( QUO_INT( i_2, hoisted_25_1 ^ logic_new_func_x_3 ), hoisted_25_1 )];
                end );
            return Sum( List( hoisted_77_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_80_1 := deduped_275_1;
    hoisted_76_1 := deduped_299_1[1];
    hoisted_72_1 := deduped_298_1[1];
    hoisted_75_1 := List( deduped_268_1, function ( logic_new_func_x_2 )
            return hoisted_18_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_72_1 ), hoisted_17_1 )];
        end );
    hoisted_73_1 := deduped_252_1[1];
    hoisted_74_1 := List( deduped_268_1, function ( logic_new_func_x_2 )
            return hoisted_73_1[1 + REM_INT( logic_new_func_x_2, hoisted_72_1 )];
        end );
    hoisted_79_1 := List( deduped_256_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_70_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_12_1 ^ j_3 ), hoisted_12_1 );
                end );
            hoisted_2_2 := List( hoisted_77_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_74_1[deduped_1_3] + hoisted_75_1[deduped_1_3] * hoisted_76_1)];
                end );
            return Sum( List( hoisted_77_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_78_1 := deduped_274_1;
    hoisted_69_1 := Product( [ deduped_276_1, deduped_276_1, deduped_276_1 ] );
    hoisted_68_1 := deduped_276_1 * deduped_276_1;
    hoisted_67_1 := Product( [ deduped_274_1, deduped_275_1, deduped_276_1 ] );
    hoisted_66_1 := deduped_276_1;
    hoisted_65_1 := deduped_264_1;
    deduped_246_1 := Filtered( [ 0 .. Product( [ deduped_274_1, deduped_275_1, deduped_276_1, deduped_276_1 ] ) - 1 ], function ( x_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2;
            deduped_4_2 := 1 + REM_INT( x_2, hoisted_78_1 );
            deduped_3_2 := REM_INT( QUO_INT( x_2, hoisted_67_1 ), hoisted_66_1 );
            deduped_2_2 := REM_INT( QUO_INT( x_2, hoisted_65_1 ), hoisted_66_1 );
            deduped_1_2 := 1 + REM_INT( QUO_INT( x_2, hoisted_78_1 ), hoisted_80_1 );
            return deduped_2_2 + deduped_2_2 * hoisted_66_1 + deduped_3_2 * hoisted_68_1 + deduped_3_2 * hoisted_69_1 = hoisted_79_1[deduped_4_2] + hoisted_81_1[deduped_1_2] * hoisted_66_1 + hoisted_87_1[deduped_4_2] * hoisted_68_1 + hoisted_88_1[deduped_1_2] * hoisted_69_1;
        end );
    hoisted_6_1 := deduped_328_1;
    hoisted_3_1 := deduped_326_1;
    hoisted_2_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_245_1 := List( deduped_326_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, deduped_3_2, deduped_4_2;
            deduped_4_2 := UnderlyingVertex( logic_new_func_x_2 );
            deduped_3_2 := VertexIndex( deduped_4_2 );
            hoisted_2_2 := SafePosition( hoisted_5_1[deduped_3_2][deduped_3_2], QuiverVertexAsIdentityPath( deduped_4_2 ) );
            hoisted_1_2 := deduped_3_2;
            return NTuple( 2, List( hoisted_3_1, function ( o_3 )
                      return CreateCapCategoryObjectWithAttributes( hoisted_2_1, Length, hoisted_1_1[VertexIndex( UnderlyingVertex( o_3 ) )][hoisted_1_2] );
                  end ), List( hoisted_6_1, function ( m_3 )
                      local hoisted_1_3, deduped_2_3, deduped_3_3, deduped_4_3;
                      deduped_4_3 := VertexIndex( UnderlyingVertex( Source( m_3 ) ) );
                      deduped_3_3 := VertexIndex( UnderlyingVertex( Range( m_3 ) ) );
                      deduped_2_3 := hoisted_1_1[deduped_3_3][hoisted_1_2];
                      hoisted_1_3 := hoisted_4_1[deduped_3_3][hoisted_1_2][deduped_4_3][hoisted_1_2][SafePosition( hoisted_5_1[deduped_4_3][deduped_3_3], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( m_3 ) ) )][hoisted_2_2];
                      return CreateCapCategoryMorphismWithAttributes( hoisted_2_1, CreateCapCategoryObjectWithAttributes( hoisted_2_1, Length, deduped_2_3 ), CreateCapCategoryObjectWithAttributes( hoisted_2_1, Length, hoisted_1_1[deduped_4_3][hoisted_1_2] ), AsList, List( [ 1 .. deduped_2_3 ], function ( phi_index_4 )
                                return hoisted_1_3[phi_index_4];
                            end ) );
                  end ) );
        end );
    deduped_244_1 := deduped_245_1[2];
    deduped_243_1 := deduped_245_1[1];
    deduped_242_1 := [ 0 .. Length( deduped_249_1 ) - 1 ];
    deduped_241_1 := [ 0 .. Length( deduped_248_1 ) - 1 ];
    deduped_240_1 := [ 0 .. Length( deduped_247_1 ) - 1 ];
    deduped_239_1 := [ 0 .. Length( deduped_246_1 ) - 1 ];
    deduped_238_1 := deduped_244_1[2];
    deduped_237_1 := deduped_243_1[2];
    deduped_236_1 := List( deduped_238_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_235_1 := List( deduped_238_1, AsList );
    deduped_234_1 := List( deduped_238_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_233_1 := List( deduped_237_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_232_1 := List( deduped_237_1, AsList );
    deduped_231_1 := List( deduped_237_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_230_1 := List( deduped_244_1[1], Length );
    deduped_229_1 := List( deduped_243_1[1], Length );
    deduped_228_1 := deduped_230_1[2] * deduped_333_1;
    deduped_227_1 := deduped_230_1[1] * deduped_331_1;
    deduped_226_1 := deduped_229_1[2] * deduped_333_1;
    deduped_225_1 := deduped_229_1[1] * deduped_331_1;
    deduped_224_1 := deduped_329_1 ^ deduped_228_1;
    deduped_223_1 := deduped_332_1 ^ deduped_228_1;
    deduped_222_1 := deduped_329_1 ^ deduped_227_1;
    deduped_221_1 := deduped_329_1 ^ deduped_226_1;
    deduped_220_1 := deduped_332_1 ^ deduped_226_1;
    deduped_219_1 := deduped_329_1 ^ deduped_225_1;
    deduped_218_1 := [ 0 .. deduped_228_1 - 1 ];
    deduped_217_1 := [ 0 .. deduped_226_1 - 1 ];
    deduped_216_1 := [ 0 .. deduped_223_1 - 1 ];
    deduped_215_1 := [ 0 .. deduped_222_1 - 1 ];
    deduped_214_1 := [ 0 .. deduped_220_1 - 1 ];
    deduped_213_1 := [ 0 .. deduped_219_1 - 1 ];
    hoisted_189_1 := deduped_249_1;
    hoisted_191_1 := List( deduped_242_1, function ( i_2 )
            return REM_INT( QUO_INT( hoisted_189_1[1 + i_2], hoisted_178_1 ), hoisted_180_1 );
        end );
    hoisted_190_1 := List( deduped_242_1, function ( i_2 )
            return REM_INT( hoisted_189_1[1 + i_2], hoisted_178_1 );
        end );
    hoisted_212_1 := List( deduped_242_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return hoisted_190_1[deduped_1_2] + hoisted_191_1[deduped_1_2] * hoisted_178_1;
        end );
    hoisted_204_1 := deduped_297_1;
    hoisted_200_1 := deduped_308_1;
    hoisted_203_1 := List( deduped_273_1, function ( logic_new_func_x_2 )
            return REM_INT( QUO_INT( logic_new_func_x_2, hoisted_200_1 ), hoisted_17_1 );
        end );
    hoisted_201_1 := deduped_267_1[2];
    hoisted_202_1 := List( deduped_273_1, function ( logic_new_func_x_2 )
            return hoisted_201_1[1 + REM_INT( logic_new_func_x_2, hoisted_200_1 )];
        end );
    hoisted_205_1 := List( deduped_261_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_152_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_25_1 ^ j_3 ), hoisted_25_1 );
                end );
            hoisted_2_2 := List( hoisted_177_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_202_1[deduped_1_3] + hoisted_203_1[deduped_1_3] * hoisted_204_1)];
                end );
            return Sum( List( hoisted_177_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_25_1 ^ k_3;
                  end ) );
        end );
    hoisted_206_1 := List( deduped_251_1, function ( logic_new_func_x_2 )
            return hoisted_205_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_153_1 ), hoisted_155_1 )];
        end );
    hoisted_197_1 := deduped_296_1;
    hoisted_193_1 := deduped_307_1;
    hoisted_121_1 := deduped_331_1;
    hoisted_196_1 := List( deduped_272_1, function ( logic_new_func_x_2 )
            return REM_INT( QUO_INT( logic_new_func_x_2, hoisted_193_1 ), hoisted_121_1 );
        end );
    hoisted_194_1 := deduped_267_1[1];
    hoisted_195_1 := List( deduped_272_1, function ( logic_new_func_x_2 )
            return hoisted_194_1[1 + REM_INT( logic_new_func_x_2, hoisted_193_1 )];
        end );
    hoisted_198_1 := List( deduped_260_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_145_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_12_1 ^ j_3 ), hoisted_12_1 );
                end );
            hoisted_2_2 := List( hoisted_170_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_195_1[deduped_1_3] + hoisted_196_1[deduped_1_3] * hoisted_197_1)];
                end );
            return Sum( List( hoisted_170_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_199_1 := List( deduped_251_1, function ( logic_new_func_x_2 )
            return hoisted_198_1[1 + REM_INT( logic_new_func_x_2, hoisted_153_1 )];
        end );
    hoisted_210_1 := List( deduped_251_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return hoisted_199_1[deduped_1_2] + hoisted_206_1[deduped_1_2] * hoisted_178_1;
        end );
    hoisted_207_1 := deduped_247_1;
    hoisted_209_1 := List( deduped_240_1, function ( i_2 )
            return REM_INT( QUO_INT( hoisted_207_1[1 + i_2], hoisted_153_1 ), hoisted_155_1 );
        end );
    hoisted_208_1 := List( deduped_240_1, function ( i_2 )
            return REM_INT( hoisted_207_1[1 + i_2], hoisted_153_1 );
        end );
    hoisted_211_1 := List( deduped_240_1, function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + logic_new_func_x_2;
            return hoisted_210_1[1 + (hoisted_208_1[deduped_1_2] + hoisted_209_1[deduped_1_2] * hoisted_153_1)];
        end );
    hoisted_114_1 := deduped_248_1;
    hoisted_116_1 := List( deduped_241_1, function ( i_2 )
            return REM_INT( QUO_INT( hoisted_114_1[1 + i_2], hoisted_103_1 ), hoisted_105_1 );
        end );
    hoisted_115_1 := List( deduped_241_1, function ( i_2 )
            return REM_INT( hoisted_114_1[1 + i_2], hoisted_103_1 );
        end );
    hoisted_138_1 := List( deduped_241_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return hoisted_115_1[deduped_1_2] + hoisted_116_1[deduped_1_2] * hoisted_103_1;
        end );
    hoisted_130_1 := deduped_295_1;
    hoisted_126_1 := deduped_301_1;
    hoisted_129_1 := List( deduped_270_1, function ( logic_new_func_x_2 )
            return REM_INT( QUO_INT( logic_new_func_x_2, hoisted_126_1 ), hoisted_17_1 );
        end );
    hoisted_127_1 := deduped_265_1[2];
    hoisted_128_1 := List( deduped_270_1, function ( logic_new_func_x_2 )
            return hoisted_127_1[1 + REM_INT( logic_new_func_x_2, hoisted_126_1 )];
        end );
    hoisted_131_1 := List( deduped_257_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_77_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_25_1 ^ j_3 ), hoisted_25_1 );
                end );
            hoisted_2_2 := List( hoisted_102_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_128_1[deduped_1_3] + hoisted_129_1[deduped_1_3] * hoisted_130_1)];
                end );
            return Sum( List( hoisted_102_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_25_1 ^ k_3;
                  end ) );
        end );
    hoisted_132_1 := List( deduped_250_1, function ( logic_new_func_x_2 )
            return hoisted_131_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_78_1 ), hoisted_80_1 )];
        end );
    hoisted_123_1 := deduped_294_1;
    hoisted_118_1 := deduped_300_1;
    hoisted_122_1 := List( deduped_269_1, function ( logic_new_func_x_2 )
            return REM_INT( QUO_INT( logic_new_func_x_2, hoisted_118_1 ), hoisted_121_1 );
        end );
    hoisted_119_1 := deduped_265_1[1];
    hoisted_120_1 := List( deduped_269_1, function ( logic_new_func_x_2 )
            return hoisted_119_1[1 + REM_INT( logic_new_func_x_2, hoisted_118_1 )];
        end );
    hoisted_124_1 := List( deduped_256_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_70_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_12_1 ^ j_3 ), hoisted_12_1 );
                end );
            hoisted_2_2 := List( hoisted_95_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_120_1[deduped_1_3] + hoisted_122_1[deduped_1_3] * hoisted_123_1)];
                end );
            return Sum( List( hoisted_95_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_125_1 := List( deduped_250_1, function ( logic_new_func_x_2 )
            return hoisted_124_1[1 + REM_INT( logic_new_func_x_2, hoisted_78_1 )];
        end );
    hoisted_136_1 := List( deduped_250_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return hoisted_125_1[deduped_1_2] + hoisted_132_1[deduped_1_2] * hoisted_103_1;
        end );
    hoisted_133_1 := deduped_246_1;
    hoisted_135_1 := List( deduped_239_1, function ( i_2 )
            return REM_INT( QUO_INT( hoisted_133_1[1 + i_2], hoisted_78_1 ), hoisted_80_1 );
        end );
    hoisted_134_1 := List( deduped_239_1, function ( i_2 )
            return REM_INT( hoisted_133_1[1 + i_2], hoisted_78_1 );
        end );
    hoisted_137_1 := List( deduped_239_1, function ( logic_new_func_x_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + logic_new_func_x_2;
            return hoisted_136_1[1 + (hoisted_134_1[deduped_1_2] + hoisted_135_1[deduped_1_2] * hoisted_78_1)];
        end );
    hoisted_51_1 := deduped_218_1;
    hoisted_63_1 := List( deduped_216_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_51_1, function ( logic_new_func_x_3 )
                    return hoisted_37_1[1 + REM_INT( QUO_INT( i_2, hoisted_25_1 ^ logic_new_func_x_3 ), hoisted_25_1 )];
                end );
            return Sum( List( hoisted_51_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_60_1 := deduped_236_1[2];
    hoisted_56_1 := deduped_234_1[2];
    hoisted_59_1 := List( deduped_218_1, function ( logic_new_func_x_2 )
            return hoisted_32_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_56_1 ), hoisted_17_1 )];
        end );
    hoisted_57_1 := deduped_235_1[2];
    hoisted_58_1 := List( deduped_218_1, function ( logic_new_func_x_2 )
            return hoisted_57_1[1 + REM_INT( logic_new_func_x_2, hoisted_56_1 )];
        end );
    hoisted_61_1 := List( deduped_218_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return hoisted_58_1[deduped_1_2] + hoisted_59_1[deduped_1_2] * hoisted_60_1;
        end );
    hoisted_44_1 := [ 0 .. deduped_227_1 - 1 ];
    hoisted_62_1 := List( deduped_215_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_44_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_12_1 ^ j_3 ), hoisted_12_1 );
                end );
            hoisted_2_2 := List( hoisted_51_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[1 + hoisted_61_1[(1 + logic_new_func_x_3)]];
                end );
            return Sum( List( hoisted_51_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_55_1 := List( deduped_216_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_51_1, function ( logic_new_func_x_3 )
                    return hoisted_26_1[1 + REM_INT( QUO_INT( i_2, hoisted_25_1 ^ logic_new_func_x_3 ), hoisted_25_1 )];
                end );
            return Sum( List( hoisted_51_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_54_1 := deduped_223_1;
    hoisted_49_1 := deduped_236_1[1];
    hoisted_45_1 := deduped_234_1[1];
    hoisted_48_1 := List( deduped_218_1, function ( logic_new_func_x_2 )
            return hoisted_18_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_45_1 ), hoisted_17_1 )];
        end );
    hoisted_46_1 := deduped_235_1[1];
    hoisted_47_1 := List( deduped_218_1, function ( logic_new_func_x_2 )
            return hoisted_46_1[1 + REM_INT( logic_new_func_x_2, hoisted_45_1 )];
        end );
    hoisted_50_1 := List( deduped_218_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return hoisted_47_1[deduped_1_2] + hoisted_48_1[deduped_1_2] * hoisted_49_1;
        end );
    hoisted_53_1 := List( deduped_215_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_44_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_12_1 ^ j_3 ), hoisted_12_1 );
                end );
            hoisted_2_2 := List( hoisted_51_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[1 + hoisted_50_1[(1 + logic_new_func_x_3)]];
                end );
            return Sum( List( hoisted_51_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_52_1 := deduped_222_1;
    hoisted_43_1 := Product( [ deduped_224_1, deduped_224_1, deduped_224_1 ] );
    hoisted_42_1 := deduped_224_1 * deduped_224_1;
    hoisted_41_1 := Product( [ deduped_222_1, deduped_223_1, deduped_224_1 ] );
    hoisted_40_1 := deduped_224_1;
    hoisted_39_1 := deduped_222_1 * deduped_223_1;
    hoisted_22_1 := deduped_217_1;
    hoisted_38_1 := List( deduped_214_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_22_1, function ( logic_new_func_x_3 )
                    return hoisted_37_1[1 + REM_INT( QUO_INT( i_2, hoisted_25_1 ^ logic_new_func_x_3 ), hoisted_25_1 )];
                end );
            return Sum( List( hoisted_22_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_34_1 := deduped_233_1[2];
    hoisted_29_1 := deduped_231_1[2];
    hoisted_33_1 := List( deduped_217_1, function ( logic_new_func_x_2 )
            return hoisted_32_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_29_1 ), hoisted_17_1 )];
        end );
    hoisted_30_1 := deduped_232_1[2];
    hoisted_31_1 := List( deduped_217_1, function ( logic_new_func_x_2 )
            return hoisted_30_1[1 + REM_INT( logic_new_func_x_2, hoisted_29_1 )];
        end );
    hoisted_35_1 := List( deduped_217_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return hoisted_31_1[deduped_1_2] + hoisted_33_1[deduped_1_2] * hoisted_34_1;
        end );
    hoisted_13_1 := [ 0 .. deduped_225_1 - 1 ];
    hoisted_36_1 := List( deduped_213_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_13_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_12_1 ^ j_3 ), hoisted_12_1 );
                end );
            hoisted_2_2 := List( hoisted_22_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[1 + hoisted_35_1[(1 + logic_new_func_x_3)]];
                end );
            return Sum( List( hoisted_22_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_28_1 := List( deduped_214_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_22_1, function ( logic_new_func_x_3 )
                    return hoisted_26_1[1 + REM_INT( QUO_INT( i_2, hoisted_25_1 ^ logic_new_func_x_3 ), hoisted_25_1 )];
                end );
            return Sum( List( hoisted_22_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_27_1 := deduped_220_1;
    hoisted_20_1 := deduped_233_1[1];
    hoisted_14_1 := deduped_231_1[1];
    hoisted_19_1 := List( deduped_217_1, function ( logic_new_func_x_2 )
            return hoisted_18_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_14_1 ), hoisted_17_1 )];
        end );
    hoisted_15_1 := deduped_232_1[1];
    hoisted_16_1 := List( deduped_217_1, function ( logic_new_func_x_2 )
            return hoisted_15_1[1 + REM_INT( logic_new_func_x_2, hoisted_14_1 )];
        end );
    hoisted_21_1 := List( deduped_217_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return hoisted_16_1[deduped_1_2] + hoisted_19_1[deduped_1_2] * hoisted_20_1;
        end );
    hoisted_24_1 := List( deduped_213_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_13_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_12_1 ^ j_3 ), hoisted_12_1 );
                end );
            hoisted_2_2 := List( hoisted_22_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[1 + hoisted_21_1[(1 + logic_new_func_x_3)]];
                end );
            return Sum( List( hoisted_22_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_12_1 ^ k_3;
                  end ) );
        end );
    hoisted_23_1 := deduped_219_1;
    hoisted_11_1 := Product( [ deduped_221_1, deduped_221_1, deduped_221_1 ] );
    hoisted_10_1 := deduped_221_1 * deduped_221_1;
    hoisted_9_1 := Product( [ deduped_219_1, deduped_220_1, deduped_221_1 ] );
    hoisted_8_1 := deduped_221_1;
    hoisted_7_1 := deduped_219_1 * deduped_220_1;
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiver, NTuple( 3, Length( Filtered( [ 0 .. Product( [ deduped_219_1, deduped_220_1, deduped_221_1, deduped_221_1 ] ) - 1 ], function ( x_2 )
                  local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2;
                  deduped_4_2 := 1 + REM_INT( x_2, hoisted_23_1 );
                  deduped_3_2 := REM_INT( QUO_INT( x_2, hoisted_9_1 ), hoisted_8_1 );
                  deduped_2_2 := REM_INT( QUO_INT( x_2, hoisted_7_1 ), hoisted_8_1 );
                  deduped_1_2 := 1 + REM_INT( QUO_INT( x_2, hoisted_23_1 ), hoisted_27_1 );
                  return deduped_2_2 + deduped_2_2 * hoisted_8_1 + deduped_3_2 * hoisted_10_1 + deduped_3_2 * hoisted_11_1 = hoisted_24_1[deduped_4_2] + hoisted_28_1[deduped_1_2] * hoisted_8_1 + hoisted_36_1[deduped_4_2] * hoisted_10_1 + hoisted_38_1[deduped_1_2] * hoisted_11_1;
              end ) ), Length( Filtered( [ 0 .. Product( [ deduped_222_1, deduped_223_1, deduped_224_1, deduped_224_1 ] ) - 1 ], function ( x_2 )
                  local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2;
                  deduped_4_2 := 1 + REM_INT( x_2, hoisted_52_1 );
                  deduped_3_2 := REM_INT( QUO_INT( x_2, hoisted_41_1 ), hoisted_40_1 );
                  deduped_2_2 := REM_INT( QUO_INT( x_2, hoisted_39_1 ), hoisted_40_1 );
                  deduped_1_2 := 1 + REM_INT( QUO_INT( x_2, hoisted_52_1 ), hoisted_54_1 );
                  return deduped_2_2 + deduped_2_2 * hoisted_40_1 + deduped_3_2 * hoisted_42_1 + deduped_3_2 * hoisted_43_1 = hoisted_53_1[deduped_4_2] + hoisted_55_1[deduped_1_2] * hoisted_40_1 + hoisted_62_1[deduped_4_2] * hoisted_42_1 + hoisted_63_1[deduped_1_2] * hoisted_43_1;
              end ) ), ListN( List( deduped_239_1, function ( x_2 )
                  return -1 + SafePosition( hoisted_138_1, hoisted_137_1[(1 + x_2)] );
              end ), List( deduped_240_1, function ( x_2 )
                  return -1 + SafePosition( hoisted_212_1, hoisted_211_1[(1 + x_2)] );
              end ), function ( s_2, t_2 )
                return NTuple( 2, s_2, t_2 );
            end ) ) );
end
########
        
    , 100 );
    
end );

BindGlobal( "FinQuiversAsCCCPrecompiled", function (  )
  local category_constructor, cat;
    
    category_constructor :=
        
        
        function (  )
    return CategoryOfQuiversEnrichedOver( CategoryOfSkeletalFinSets(  : FinalizeCategory := true ) );
end;
        
        
    
    cat := category_constructor(  : FinalizeCategory := false, no_precompiled_code := true );
    
    ADD_FUNCTIONS_FOR_FinQuiversAsCCCPrecompiled( cat );
    
    Finalize( cat );
    
    return cat;
    
end );

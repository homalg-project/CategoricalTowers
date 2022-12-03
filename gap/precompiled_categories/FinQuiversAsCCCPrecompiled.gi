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
    hoisted_51_1, hoisted_52_1, hoisted_53_1, hoisted_54_1, hoisted_55_1, hoisted_56_1, hoisted_57_1, hoisted_58_1, hoisted_59_1, hoisted_60_1, hoisted_61_1, hoisted_62_1, hoisted_63_1, hoisted_64_1, hoisted_65_1, hoisted_66_1, hoisted_67_1, hoisted_68_1, hoisted_69_1, hoisted_70_1, hoisted_71_1, hoisted_72_1, hoisted_73_1, hoisted_74_1, hoisted_75_1, hoisted_76_1, hoisted_77_1, hoisted_78_1, hoisted_79_1, hoisted_80_1, hoisted_81_1, hoisted_82_1, hoisted_83_1, hoisted_84_1, hoisted_85_1, hoisted_86_1, hoisted_87_1, hoisted_88_1, hoisted_89_1, hoisted_90_1, hoisted_91_1, hoisted_92_1, hoisted_93_1, hoisted_94_1, hoisted_95_1, hoisted_96_1, hoisted_97_1, hoisted_98_1, hoisted_99_1, hoisted_100_1, hoisted_101_1, hoisted_102_1, hoisted_103_1, hoisted_104_1, hoisted_105_1, hoisted_106_1, hoisted_107_1, hoisted_108_1, hoisted_109_1, hoisted_110_1, hoisted_111_1, hoisted_112_1, hoisted_113_1, hoisted_114_1, hoisted_115_1, hoisted_116_1, hoisted_117_1, hoisted_118_1, hoisted_119_1, hoisted_120_1, hoisted_121_1, hoisted_122_1, hoisted_123_1, hoisted_124_1, hoisted_125_1, hoisted_126_1, hoisted_127_1, hoisted_128_1, hoisted_129_1, hoisted_130_1, hoisted_131_1, hoisted_132_1, hoisted_133_1, hoisted_134_1, hoisted_135_1, hoisted_136_1, hoisted_137_1, hoisted_138_1, hoisted_139_1, hoisted_140_1, hoisted_141_1, hoisted_142_1, hoisted_143_1, hoisted_144_1, hoisted_145_1, hoisted_146_1, hoisted_147_1, hoisted_148_1, hoisted_149_1, hoisted_150_1, hoisted_151_1, hoisted_152_1, hoisted_153_1, hoisted_154_1, hoisted_155_1, hoisted_156_1, hoisted_157_1, hoisted_158_1, hoisted_159_1, hoisted_160_1, hoisted_161_1, hoisted_162_1, hoisted_163_1, hoisted_164_1, hoisted_165_1, hoisted_166_1, hoisted_167_1, hoisted_168_1, hoisted_169_1, hoisted_170_1, hoisted_171_1, hoisted_172_1, hoisted_173_1, hoisted_174_1, hoisted_175_1, hoisted_176_1, hoisted_177_1, hoisted_178_1, hoisted_179_1, hoisted_180_1, hoisted_181_1, hoisted_182_1, hoisted_183_1, hoisted_184_1, hoisted_185_1, hoisted_186_1, hoisted_187_1, hoisted_188_1, hoisted_189_1, hoisted_190_1, hoisted_191_1, hoisted_192_1, hoisted_193_1, hoisted_194_1, hoisted_195_1, hoisted_196_1, hoisted_197_1, hoisted_198_1, hoisted_199_1, hoisted_200_1, hoisted_201_1, hoisted_202_1, hoisted_203_1, hoisted_204_1, hoisted_205_1, hoisted_206_1, hoisted_207_1, hoisted_208_1, hoisted_209_1, hoisted_210_1, hoisted_211_1, hoisted_212_1, hoisted_213_1, hoisted_214_1, hoisted_215_1, deduped_216_1, deduped_217_1, deduped_218_1, deduped_219_1, deduped_220_1, deduped_221_1, deduped_222_1, deduped_223_1, deduped_224_1, deduped_225_1, deduped_226_1, deduped_227_1, deduped_228_1, deduped_229_1, deduped_230_1, deduped_231_1, deduped_232_1, deduped_233_1, deduped_234_1, deduped_235_1, deduped_236_1, deduped_237_1, deduped_238_1, deduped_239_1, deduped_240_1, deduped_241_1, deduped_242_1, deduped_243_1, deduped_244_1, deduped_245_1, deduped_246_1, deduped_247_1, deduped_248_1, deduped_249_1, deduped_250_1, deduped_251_1, deduped_252_1, deduped_253_1, deduped_254_1, deduped_255_1, deduped_256_1, deduped_257_1, deduped_258_1, deduped_259_1, deduped_260_1, deduped_261_1, deduped_262_1, deduped_263_1, deduped_264_1, deduped_265_1, deduped_266_1, deduped_267_1, deduped_268_1, deduped_269_1, deduped_270_1, deduped_271_1, deduped_272_1, deduped_273_1, deduped_274_1, deduped_275_1, deduped_276_1, deduped_277_1, deduped_278_1, deduped_279_1, deduped_280_1, deduped_281_1, deduped_282_1, deduped_283_1, deduped_284_1, deduped_285_1, deduped_286_1, deduped_287_1, deduped_288_1, deduped_289_1, deduped_290_1, deduped_291_1, deduped_292_1, deduped_293_1, deduped_294_1, deduped_295_1, deduped_296_1, deduped_297_1, deduped_298_1, deduped_299_1, deduped_300_1, deduped_301_1, deduped_302_1, deduped_303_1, deduped_304_1, deduped_305_1, deduped_306_1, deduped_307_1, deduped_308_1, deduped_309_1, deduped_310_1, deduped_311_1, deduped_312_1, deduped_313_1, deduped_314_1, deduped_315_1, deduped_316_1, deduped_317_1, deduped_318_1, deduped_319_1, deduped_320_1, deduped_321_1, deduped_322_1, deduped_323_1, deduped_324_1, deduped_325_1, 
    deduped_326_1, deduped_327_1, deduped_328_1, deduped_329_1, deduped_330_1, deduped_331_1, deduped_332_1, deduped_333_1, deduped_334_1, deduped_335_1, deduped_336_1, deduped_337_1, deduped_338_1, deduped_339_1, deduped_340_1, deduped_341_1, deduped_342_1, deduped_343_1, deduped_344_1, deduped_345_1, deduped_346_1, deduped_347_1, deduped_348_1, deduped_349_1, deduped_350_1, deduped_351_1, deduped_352_1;
    deduped_352_1 := DefiningTripleOfQuiver( a_1 );
    deduped_351_1 := DefiningTripleOfQuiver( b_1 );
    deduped_350_1 := deduped_351_1[3];
    deduped_349_1 := deduped_352_1[3];
    deduped_348_1 := deduped_352_1[2];
    deduped_347_1 := deduped_351_1[2];
    deduped_346_1 := deduped_352_1[1];
    deduped_345_1 := deduped_351_1[1];
    deduped_344_1 := Source( ModelingCategory( ModelingCategory( cat_1 ) ) );
    deduped_343_1 := IndicesOfGeneratingMorphisms( deduped_344_1 );
    deduped_342_1 := DataTablesOfCategory( deduped_344_1 );
    deduped_337_1 := deduped_342_1[1];
    deduped_335_1 := [ 0 .. deduped_337_1[2] - 1 ];
    deduped_315_1 := List( deduped_335_1, function ( logic_new_func_x_2 )
            return [ logic_new_func_x_2 ];
        end );
    hoisted_9_1 := deduped_315_1;
    deduped_341_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_9_1[1 + logic_new_func_x_2];
        end );
    deduped_338_1 := deduped_342_1[2];
    hoisted_6_1 := deduped_338_1[2];
    deduped_314_1 := List( deduped_335_1, function ( logic_new_func_x_2 )
            return [ hoisted_6_1[1 + logic_new_func_x_2] ];
        end );
    hoisted_8_1 := deduped_314_1;
    deduped_340_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_8_1[1 + logic_new_func_x_2];
        end );
    hoisted_4_1 := deduped_338_1[3];
    deduped_313_1 := List( deduped_335_1, function ( logic_new_func_x_2 )
            return [ hoisted_4_1[1 + logic_new_func_x_2] ];
        end );
    hoisted_5_1 := deduped_313_1;
    deduped_339_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_5_1[1 + logic_new_func_x_2];
        end );
    deduped_336_1 := deduped_338_1[1];
    deduped_334_1 := [ 0 .. deduped_337_1[1] - 1 ];
    deduped_330_1 := 1 + deduped_340_1[2][1];
    deduped_301_1 := 1 + deduped_336_1[deduped_330_1];
    hoisted_183_1 := 1 + deduped_313_1[deduped_301_1][1];
    hoisted_1_1 := deduped_338_1[5];
    deduped_333_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[1 + hoisted_8_1[(1 + logic_new_func_x_2)][1]][hoisted_183_1];
        end );
    hoisted_176_1 := 1 + deduped_315_1[deduped_301_1][1];
    hoisted_10_1 := deduped_338_1[6];
    deduped_332_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_10_1[1 + hoisted_9_1[(1 + logic_new_func_x_2)][1]][hoisted_176_1];
        end );
    hoisted_177_1 := 1 + deduped_314_1[deduped_301_1][1];
    deduped_331_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[1 + hoisted_5_1[(1 + logic_new_func_x_2)][1]][hoisted_177_1];
        end );
    deduped_326_1 := 1 + deduped_339_1[2][1];
    deduped_300_1 := 1 + deduped_336_1[deduped_326_1];
    hoisted_155_1 := 1 + deduped_313_1[deduped_300_1][1];
    deduped_329_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[1 + hoisted_8_1[(1 + logic_new_func_x_2)][1]][hoisted_155_1];
        end );
    hoisted_148_1 := 1 + deduped_315_1[deduped_300_1][1];
    deduped_328_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_10_1[1 + hoisted_9_1[(1 + logic_new_func_x_2)][1]][hoisted_148_1];
        end );
    hoisted_149_1 := 1 + deduped_314_1[deduped_300_1][1];
    deduped_327_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[1 + hoisted_5_1[(1 + logic_new_func_x_2)][1]][hoisted_149_1];
        end );
    deduped_322_1 := 1 + deduped_340_1[1][1];
    deduped_298_1 := 1 + deduped_336_1[deduped_322_1];
    hoisted_106_1 := 1 + deduped_313_1[deduped_298_1][1];
    deduped_325_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[1 + hoisted_8_1[(1 + logic_new_func_x_2)][1]][hoisted_106_1];
        end );
    hoisted_99_1 := 1 + deduped_315_1[deduped_298_1][1];
    deduped_324_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_10_1[1 + hoisted_9_1[(1 + logic_new_func_x_2)][1]][hoisted_99_1];
        end );
    hoisted_100_1 := 1 + deduped_314_1[deduped_298_1][1];
    deduped_323_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[1 + hoisted_5_1[(1 + logic_new_func_x_2)][1]][hoisted_100_1];
        end );
    deduped_318_1 := 1 + deduped_339_1[1][1];
    deduped_297_1 := 1 + deduped_336_1[deduped_318_1];
    hoisted_78_1 := 1 + deduped_313_1[deduped_297_1][1];
    deduped_321_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[1 + hoisted_8_1[(1 + logic_new_func_x_2)][1]][hoisted_78_1];
        end );
    hoisted_71_1 := 1 + deduped_315_1[deduped_297_1][1];
    deduped_320_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_10_1[1 + hoisted_9_1[(1 + logic_new_func_x_2)][1]][hoisted_71_1];
        end );
    hoisted_72_1 := 1 + deduped_314_1[deduped_297_1][1];
    deduped_319_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[1 + hoisted_5_1[(1 + logic_new_func_x_2)][1]][hoisted_72_1];
        end );
    hoisted_168_1 := deduped_330_1;
    deduped_317_1 := List( deduped_334_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[1 + logic_new_func_x_2][hoisted_168_1];
        end );
    hoisted_91_1 := deduped_322_1;
    deduped_316_1 := List( deduped_334_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[1 + logic_new_func_x_2][hoisted_91_1];
        end );
    hoisted_140_1 := deduped_326_1;
    deduped_312_1 := List( deduped_334_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[1 + logic_new_func_x_2][hoisted_140_1];
        end );
    hoisted_63_1 := deduped_318_1;
    deduped_311_1 := List( deduped_334_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[1 + logic_new_func_x_2][hoisted_63_1];
        end );
    deduped_310_1 := deduped_317_1[2];
    deduped_309_1 := deduped_317_1[1];
    deduped_308_1 := deduped_316_1[2];
    deduped_307_1 := deduped_316_1[1];
    deduped_306_1 := deduped_312_1[2];
    deduped_305_1 := deduped_312_1[1];
    deduped_304_1 := deduped_311_1[2];
    deduped_303_1 := deduped_311_1[1];
    hoisted_198_1 := 1 + deduped_341_1[2][1];
    hoisted_7_1 := deduped_336_1;
    deduped_302_1 := List( deduped_334_1, function ( logic_new_func_x_2 )
            return hoisted_10_1[1 + hoisted_9_1[(1 + hoisted_7_1[(1 + logic_new_func_x_2)])][1]][hoisted_198_1];
        end );
    hoisted_121_1 := 1 + deduped_341_1[1][1];
    deduped_299_1 := List( deduped_334_1, function ( logic_new_func_x_2 )
            return hoisted_10_1[1 + hoisted_9_1[(1 + hoisted_7_1[(1 + logic_new_func_x_2)])][1]][hoisted_121_1];
        end );
    deduped_296_1 := deduped_310_1 * deduped_348_1;
    deduped_295_1 := deduped_309_1 * deduped_346_1;
    deduped_294_1 := deduped_308_1 * deduped_348_1;
    deduped_293_1 := deduped_307_1 * deduped_346_1;
    deduped_292_1 := deduped_306_1 * deduped_348_1;
    deduped_291_1 := deduped_305_1 * deduped_346_1;
    deduped_290_1 := deduped_304_1 * deduped_348_1;
    deduped_289_1 := deduped_303_1 * deduped_346_1;
    deduped_288_1 := deduped_345_1 ^ deduped_296_1;
    deduped_287_1 := deduped_347_1 ^ deduped_296_1;
    deduped_286_1 := deduped_345_1 ^ deduped_295_1;
    deduped_285_1 := deduped_345_1 ^ deduped_294_1;
    deduped_284_1 := deduped_347_1 ^ deduped_294_1;
    deduped_283_1 := deduped_345_1 ^ deduped_293_1;
    deduped_282_1 := deduped_345_1 ^ deduped_292_1;
    deduped_281_1 := deduped_347_1 ^ deduped_292_1;
    deduped_280_1 := deduped_345_1 ^ deduped_291_1;
    deduped_279_1 := deduped_345_1 ^ deduped_290_1;
    deduped_278_1 := deduped_347_1 ^ deduped_290_1;
    deduped_277_1 := deduped_345_1 ^ deduped_289_1;
    deduped_276_1 := [ 0 .. deduped_296_1 - 1 ];
    deduped_275_1 := [ 0 .. deduped_295_1 - 1 ];
    deduped_274_1 := [ 0 .. deduped_292_1 - 1 ];
    deduped_273_1 := [ 0 .. deduped_294_1 - 1 ];
    deduped_272_1 := [ 0 .. deduped_293_1 - 1 ];
    deduped_271_1 := [ 0 .. deduped_290_1 - 1 ];
    deduped_270_1 := deduped_280_1 * deduped_281_1;
    deduped_269_1 := deduped_277_1 * deduped_278_1;
    deduped_268_1 := [ 0 .. deduped_287_1 - 1 ];
    deduped_267_1 := [ 0 .. deduped_286_1 - 1 ];
    deduped_266_1 := [ 0 .. deduped_281_1 - 1 ];
    deduped_265_1 := [ 0 .. deduped_280_1 - 1 ];
    deduped_264_1 := [ 0 .. deduped_284_1 - 1 ];
    deduped_263_1 := [ 0 .. deduped_283_1 - 1 ];
    deduped_262_1 := [ 0 .. deduped_278_1 - 1 ];
    deduped_261_1 := [ 0 .. deduped_277_1 - 1 ];
    hoisted_11_1 := deduped_343_1;
    hoisted_3_1 := deduped_334_1;
    hoisted_2_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_260_1 := List( deduped_334_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, deduped_5_2, deduped_6_2;
            deduped_6_2 := 1 + logic_new_func_x_2;
            deduped_5_2 := 1 + hoisted_7_1[deduped_6_2];
            hoisted_4_2 := 1 + hoisted_9_1[deduped_5_2][1];
            hoisted_3_2 := 1 + hoisted_5_1[deduped_5_2][1];
            hoisted_2_2 := 1 + hoisted_8_1[deduped_5_2][1];
            hoisted_1_2 := deduped_6_2;
            return NTuple( 2, List( hoisted_3_1, function ( logic_new_func_x_3 )
                      return CreateCapCategoryObjectWithAttributes( hoisted_2_1, Length, hoisted_1_1[1 + logic_new_func_x_3][hoisted_1_2] );
                  end ), List( hoisted_11_1, function ( logic_new_func_x_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + logic_new_func_x_3;
                      return CreateCapCategoryMorphismWithAttributes( hoisted_2_1, CreateCapCategoryObjectWithAttributes( hoisted_2_1, Length, hoisted_1_1[1 + hoisted_5_1[deduped_1_3][1]][hoisted_2_2] ), CreateCapCategoryObjectWithAttributes( hoisted_2_1, Length, hoisted_1_1[1 + hoisted_8_1[deduped_1_3][1]][hoisted_3_2] ), AsList, hoisted_10_1[1 + hoisted_9_1[deduped_1_3][1]][hoisted_4_2] );
                  end ) );
        end );
    deduped_259_1 := [ 0 .. deduped_270_1 - 1 ];
    deduped_258_1 := [ 0 .. deduped_269_1 - 1 ];
    deduped_257_1 := deduped_260_1[2];
    deduped_256_1 := deduped_260_1[1];
    deduped_255_1 := [ 0 .. Product( [ deduped_286_1, deduped_287_1, deduped_288_1, deduped_288_1 ] ) - 1 ];
    deduped_254_1 := [ 0 .. Product( [ deduped_283_1, deduped_284_1, deduped_285_1, deduped_285_1 ] ) - 1 ];
    deduped_253_1 := [ 0 .. Product( [ deduped_280_1, deduped_281_1, deduped_282_1, deduped_282_1 ] ) - 1 ];
    deduped_252_1 := [ 0 .. Product( [ deduped_277_1, deduped_278_1, deduped_279_1, deduped_279_1 ] ) - 1 ];
    deduped_251_1 := deduped_257_1[2];
    deduped_250_1 := deduped_256_1[2];
    hoisted_180_1 := deduped_276_1;
    hoisted_39_1 := List( deduped_350_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_29_1 := deduped_347_1;
    hoisted_18_1 := deduped_345_1;
    hoisted_195_1 := List( deduped_268_1, function ( i_2 )
            return Sum( List( hoisted_180_1, function ( k_3 )
                      return hoisted_39_1[(1 + REM_INT( QUO_INT( i_2, hoisted_29_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_180_1[(1 + k_3)] ) ), hoisted_29_1 ))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_193_1 := deduped_333_1[2];
    hoisted_189_1 := deduped_331_1[2];
    hoisted_35_1 := List( deduped_349_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_23_1 := deduped_348_1;
    hoisted_192_1 := List( deduped_276_1, function ( logic_new_func_x_2 )
            return hoisted_35_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_189_1 ), hoisted_23_1 )];
        end );
    hoisted_190_1 := deduped_332_1[2];
    hoisted_191_1 := List( deduped_276_1, function ( logic_new_func_x_2 )
            return hoisted_190_1[1 + REM_INT( logic_new_func_x_2, hoisted_189_1 )];
        end );
    hoisted_175_1 := deduped_275_1;
    hoisted_194_1 := List( deduped_267_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_175_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_18_1 ^ j_3 ), hoisted_18_1 );
                end );
            return Sum( List( hoisted_180_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_180_1[(1 + k_3)] );
                      return hoisted_1_2[(1 + (hoisted_191_1[deduped_1_3] + hoisted_192_1[deduped_1_3] * hoisted_193_1))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_30_1 := List( deduped_350_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_188_1 := List( deduped_268_1, function ( i_2 )
            return Sum( List( hoisted_180_1, function ( k_3 )
                      return hoisted_30_1[(1 + REM_INT( QUO_INT( i_2, hoisted_29_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_180_1[(1 + k_3)] ) ), hoisted_29_1 ))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_187_1 := deduped_287_1;
    hoisted_184_1 := deduped_333_1[1];
    hoisted_178_1 := deduped_331_1[1];
    hoisted_24_1 := List( deduped_349_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_182_1 := List( deduped_276_1, function ( logic_new_func_x_2 )
            return hoisted_24_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_178_1 ), hoisted_23_1 )];
        end );
    hoisted_179_1 := deduped_332_1[1];
    hoisted_181_1 := List( deduped_276_1, function ( logic_new_func_x_2 )
            return hoisted_179_1[1 + REM_INT( logic_new_func_x_2, hoisted_178_1 )];
        end );
    hoisted_186_1 := List( deduped_267_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_175_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_18_1 ^ j_3 ), hoisted_18_1 );
                end );
            return Sum( List( hoisted_180_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_180_1[(1 + k_3)] );
                      return hoisted_1_2[(1 + (hoisted_181_1[deduped_1_3] + hoisted_182_1[deduped_1_3] * hoisted_184_1))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_185_1 := deduped_286_1;
    hoisted_174_1 := Product( [ deduped_288_1, deduped_288_1, deduped_288_1 ] );
    hoisted_173_1 := deduped_288_1 * deduped_288_1;
    hoisted_172_1 := Product( [ deduped_286_1, deduped_287_1, deduped_288_1 ] );
    hoisted_171_1 := deduped_288_1;
    hoisted_170_1 := deduped_286_1 * deduped_287_1;
    hoisted_169_1 := deduped_255_1;
    deduped_249_1 := Filtered( deduped_255_1, function ( x_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2, deduped_5_2;
            deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_169_1[1 + x_2] );
            deduped_4_2 := 1 + REM_INT( deduped_5_2, hoisted_185_1 );
            deduped_3_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_172_1 ), hoisted_171_1 );
            deduped_2_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_170_1 ), hoisted_171_1 );
            deduped_1_2 := 1 + REM_INT( QUO_INT( deduped_5_2, hoisted_185_1 ), hoisted_187_1 );
            return deduped_2_2 + deduped_2_2 * hoisted_171_1 + deduped_3_2 * hoisted_173_1 + deduped_3_2 * hoisted_174_1 = hoisted_186_1[deduped_4_2] + hoisted_188_1[deduped_1_2] * hoisted_171_1 + hoisted_194_1[deduped_4_2] * hoisted_173_1 + hoisted_195_1[deduped_1_2] * hoisted_174_1;
        end );
    hoisted_103_1 := deduped_273_1;
    hoisted_118_1 := List( deduped_264_1, function ( i_2 )
            return Sum( List( hoisted_103_1, function ( k_3 )
                      return hoisted_39_1[(1 + REM_INT( QUO_INT( i_2, hoisted_29_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_103_1[(1 + k_3)] ) ), hoisted_29_1 ))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_116_1 := deduped_325_1[2];
    hoisted_112_1 := deduped_323_1[2];
    hoisted_115_1 := List( deduped_273_1, function ( logic_new_func_x_2 )
            return hoisted_35_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_112_1 ), hoisted_23_1 )];
        end );
    hoisted_113_1 := deduped_324_1[2];
    hoisted_114_1 := List( deduped_273_1, function ( logic_new_func_x_2 )
            return hoisted_113_1[1 + REM_INT( logic_new_func_x_2, hoisted_112_1 )];
        end );
    hoisted_98_1 := deduped_272_1;
    hoisted_117_1 := List( deduped_263_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_98_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_18_1 ^ j_3 ), hoisted_18_1 );
                end );
            return Sum( List( hoisted_103_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_103_1[(1 + k_3)] );
                      return hoisted_1_2[(1 + (hoisted_114_1[deduped_1_3] + hoisted_115_1[deduped_1_3] * hoisted_116_1))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_111_1 := List( deduped_264_1, function ( i_2 )
            return Sum( List( hoisted_103_1, function ( k_3 )
                      return hoisted_30_1[(1 + REM_INT( QUO_INT( i_2, hoisted_29_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_103_1[(1 + k_3)] ) ), hoisted_29_1 ))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_110_1 := deduped_284_1;
    hoisted_107_1 := deduped_325_1[1];
    hoisted_101_1 := deduped_323_1[1];
    hoisted_105_1 := List( deduped_273_1, function ( logic_new_func_x_2 )
            return hoisted_24_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_101_1 ), hoisted_23_1 )];
        end );
    hoisted_102_1 := deduped_324_1[1];
    hoisted_104_1 := List( deduped_273_1, function ( logic_new_func_x_2 )
            return hoisted_102_1[1 + REM_INT( logic_new_func_x_2, hoisted_101_1 )];
        end );
    hoisted_109_1 := List( deduped_263_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_98_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_18_1 ^ j_3 ), hoisted_18_1 );
                end );
            return Sum( List( hoisted_103_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_103_1[(1 + k_3)] );
                      return hoisted_1_2[(1 + (hoisted_104_1[deduped_1_3] + hoisted_105_1[deduped_1_3] * hoisted_107_1))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_108_1 := deduped_283_1;
    hoisted_97_1 := Product( [ deduped_285_1, deduped_285_1, deduped_285_1 ] );
    hoisted_96_1 := deduped_285_1 * deduped_285_1;
    hoisted_95_1 := Product( [ deduped_283_1, deduped_284_1, deduped_285_1 ] );
    hoisted_94_1 := deduped_285_1;
    hoisted_93_1 := deduped_283_1 * deduped_284_1;
    hoisted_92_1 := deduped_254_1;
    deduped_248_1 := Filtered( deduped_254_1, function ( x_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2, deduped_5_2;
            deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_92_1[1 + x_2] );
            deduped_4_2 := 1 + REM_INT( deduped_5_2, hoisted_108_1 );
            deduped_3_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_95_1 ), hoisted_94_1 );
            deduped_2_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_93_1 ), hoisted_94_1 );
            deduped_1_2 := 1 + REM_INT( QUO_INT( deduped_5_2, hoisted_108_1 ), hoisted_110_1 );
            return deduped_2_2 + deduped_2_2 * hoisted_94_1 + deduped_3_2 * hoisted_96_1 + deduped_3_2 * hoisted_97_1 = hoisted_109_1[deduped_4_2] + hoisted_111_1[deduped_1_2] * hoisted_94_1 + hoisted_117_1[deduped_4_2] * hoisted_96_1 + hoisted_118_1[deduped_1_2] * hoisted_97_1;
        end );
    deduped_247_1 := List( deduped_251_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_246_1 := List( deduped_251_1, AsList );
    deduped_245_1 := List( deduped_251_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_244_1 := List( deduped_250_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_243_1 := List( deduped_250_1, AsList );
    deduped_242_1 := List( deduped_250_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    hoisted_152_1 := deduped_274_1;
    hoisted_167_1 := List( deduped_266_1, function ( i_2 )
            return Sum( List( hoisted_152_1, function ( k_3 )
                      return hoisted_39_1[(1 + REM_INT( QUO_INT( i_2, hoisted_29_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_152_1[(1 + k_3)] ) ), hoisted_29_1 ))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_165_1 := deduped_329_1[2];
    hoisted_161_1 := deduped_327_1[2];
    hoisted_164_1 := List( deduped_274_1, function ( logic_new_func_x_2 )
            return hoisted_35_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_161_1 ), hoisted_23_1 )];
        end );
    hoisted_162_1 := deduped_328_1[2];
    hoisted_163_1 := List( deduped_274_1, function ( logic_new_func_x_2 )
            return hoisted_162_1[1 + REM_INT( logic_new_func_x_2, hoisted_161_1 )];
        end );
    hoisted_147_1 := [ 0 .. deduped_291_1 - 1 ];
    hoisted_166_1 := List( deduped_265_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_147_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_18_1 ^ j_3 ), hoisted_18_1 );
                end );
            return Sum( List( hoisted_152_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_152_1[(1 + k_3)] );
                      return hoisted_1_2[(1 + (hoisted_163_1[deduped_1_3] + hoisted_164_1[deduped_1_3] * hoisted_165_1))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_160_1 := List( deduped_266_1, function ( i_2 )
            return Sum( List( hoisted_152_1, function ( k_3 )
                      return hoisted_30_1[(1 + REM_INT( QUO_INT( i_2, hoisted_29_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_152_1[(1 + k_3)] ) ), hoisted_29_1 ))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_159_1 := deduped_281_1;
    hoisted_156_1 := deduped_329_1[1];
    hoisted_150_1 := deduped_327_1[1];
    hoisted_154_1 := List( deduped_274_1, function ( logic_new_func_x_2 )
            return hoisted_24_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_150_1 ), hoisted_23_1 )];
        end );
    hoisted_151_1 := deduped_328_1[1];
    hoisted_153_1 := List( deduped_274_1, function ( logic_new_func_x_2 )
            return hoisted_151_1[1 + REM_INT( logic_new_func_x_2, hoisted_150_1 )];
        end );
    hoisted_158_1 := List( deduped_265_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_147_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_18_1 ^ j_3 ), hoisted_18_1 );
                end );
            return Sum( List( hoisted_152_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_152_1[(1 + k_3)] );
                      return hoisted_1_2[(1 + (hoisted_153_1[deduped_1_3] + hoisted_154_1[deduped_1_3] * hoisted_156_1))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_157_1 := deduped_280_1;
    hoisted_146_1 := Product( [ deduped_282_1, deduped_282_1, deduped_282_1 ] );
    hoisted_145_1 := deduped_282_1 * deduped_282_1;
    hoisted_144_1 := Product( [ deduped_280_1, deduped_281_1, deduped_282_1 ] );
    hoisted_143_1 := deduped_282_1;
    hoisted_142_1 := deduped_270_1;
    hoisted_141_1 := deduped_253_1;
    deduped_241_1 := Filtered( deduped_253_1, function ( x_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2, deduped_5_2;
            deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_141_1[1 + x_2] );
            deduped_4_2 := 1 + REM_INT( deduped_5_2, hoisted_157_1 );
            deduped_3_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_144_1 ), hoisted_143_1 );
            deduped_2_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_142_1 ), hoisted_143_1 );
            deduped_1_2 := 1 + REM_INT( QUO_INT( deduped_5_2, hoisted_157_1 ), hoisted_159_1 );
            return deduped_2_2 + deduped_2_2 * hoisted_143_1 + deduped_3_2 * hoisted_145_1 + deduped_3_2 * hoisted_146_1 = hoisted_158_1[deduped_4_2] + hoisted_160_1[deduped_1_2] * hoisted_143_1 + hoisted_166_1[deduped_4_2] * hoisted_145_1 + hoisted_167_1[deduped_1_2] * hoisted_146_1;
        end );
    hoisted_75_1 := deduped_271_1;
    hoisted_90_1 := List( deduped_262_1, function ( i_2 )
            return Sum( List( hoisted_75_1, function ( k_3 )
                      return hoisted_39_1[(1 + REM_INT( QUO_INT( i_2, hoisted_29_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_75_1[(1 + k_3)] ) ), hoisted_29_1 ))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_88_1 := deduped_321_1[2];
    hoisted_84_1 := deduped_319_1[2];
    hoisted_87_1 := List( deduped_271_1, function ( logic_new_func_x_2 )
            return hoisted_35_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_84_1 ), hoisted_23_1 )];
        end );
    hoisted_85_1 := deduped_320_1[2];
    hoisted_86_1 := List( deduped_271_1, function ( logic_new_func_x_2 )
            return hoisted_85_1[1 + REM_INT( logic_new_func_x_2, hoisted_84_1 )];
        end );
    hoisted_70_1 := [ 0 .. deduped_289_1 - 1 ];
    hoisted_89_1 := List( deduped_261_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_70_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_18_1 ^ j_3 ), hoisted_18_1 );
                end );
            return Sum( List( hoisted_75_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_75_1[(1 + k_3)] );
                      return hoisted_1_2[(1 + (hoisted_86_1[deduped_1_3] + hoisted_87_1[deduped_1_3] * hoisted_88_1))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_83_1 := List( deduped_262_1, function ( i_2 )
            return Sum( List( hoisted_75_1, function ( k_3 )
                      return hoisted_30_1[(1 + REM_INT( QUO_INT( i_2, hoisted_29_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_75_1[(1 + k_3)] ) ), hoisted_29_1 ))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_82_1 := deduped_278_1;
    hoisted_79_1 := deduped_321_1[1];
    hoisted_73_1 := deduped_319_1[1];
    hoisted_77_1 := List( deduped_271_1, function ( logic_new_func_x_2 )
            return hoisted_24_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_73_1 ), hoisted_23_1 )];
        end );
    hoisted_74_1 := deduped_320_1[1];
    hoisted_76_1 := List( deduped_271_1, function ( logic_new_func_x_2 )
            return hoisted_74_1[1 + REM_INT( logic_new_func_x_2, hoisted_73_1 )];
        end );
    hoisted_81_1 := List( deduped_261_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_70_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_18_1 ^ j_3 ), hoisted_18_1 );
                end );
            return Sum( List( hoisted_75_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_75_1[(1 + k_3)] );
                      return hoisted_1_2[(1 + (hoisted_76_1[deduped_1_3] + hoisted_77_1[deduped_1_3] * hoisted_79_1))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_80_1 := deduped_277_1;
    hoisted_69_1 := Product( [ deduped_279_1, deduped_279_1, deduped_279_1 ] );
    hoisted_68_1 := deduped_279_1 * deduped_279_1;
    hoisted_67_1 := Product( [ deduped_277_1, deduped_278_1, deduped_279_1 ] );
    hoisted_66_1 := deduped_279_1;
    hoisted_65_1 := deduped_269_1;
    hoisted_64_1 := deduped_252_1;
    deduped_240_1 := Filtered( deduped_252_1, function ( x_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2, deduped_5_2;
            deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_64_1[1 + x_2] );
            deduped_4_2 := 1 + REM_INT( deduped_5_2, hoisted_80_1 );
            deduped_3_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_67_1 ), hoisted_66_1 );
            deduped_2_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_65_1 ), hoisted_66_1 );
            deduped_1_2 := 1 + REM_INT( QUO_INT( deduped_5_2, hoisted_80_1 ), hoisted_82_1 );
            return deduped_2_2 + deduped_2_2 * hoisted_66_1 + deduped_3_2 * hoisted_68_1 + deduped_3_2 * hoisted_69_1 = hoisted_81_1[deduped_4_2] + hoisted_83_1[deduped_1_2] * hoisted_66_1 + hoisted_89_1[deduped_4_2] * hoisted_68_1 + hoisted_90_1[deduped_1_2] * hoisted_69_1;
        end );
    deduped_239_1 := List( deduped_257_1[1], Length );
    deduped_238_1 := List( deduped_256_1[1], Length );
    deduped_237_1 := deduped_239_1[2] * deduped_348_1;
    deduped_236_1 := deduped_239_1[1] * deduped_346_1;
    deduped_235_1 := deduped_238_1[2] * deduped_348_1;
    deduped_234_1 := deduped_238_1[1] * deduped_346_1;
    deduped_233_1 := [ 0 .. Length( deduped_249_1 ) - 1 ];
    deduped_232_1 := [ 0 .. Length( deduped_248_1 ) - 1 ];
    deduped_231_1 := [ 0 .. Length( deduped_241_1 ) - 1 ];
    deduped_230_1 := [ 0 .. Length( deduped_240_1 ) - 1 ];
    deduped_229_1 := deduped_345_1 ^ deduped_237_1;
    deduped_228_1 := deduped_347_1 ^ deduped_237_1;
    deduped_227_1 := deduped_345_1 ^ deduped_236_1;
    deduped_226_1 := deduped_345_1 ^ deduped_235_1;
    deduped_225_1 := deduped_347_1 ^ deduped_235_1;
    deduped_224_1 := deduped_345_1 ^ deduped_234_1;
    deduped_223_1 := [ 0 .. deduped_237_1 - 1 ];
    deduped_222_1 := [ 0 .. deduped_235_1 - 1 ];
    deduped_221_1 := [ 0 .. deduped_228_1 - 1 ];
    deduped_220_1 := [ 0 .. deduped_227_1 - 1 ];
    deduped_219_1 := [ 0 .. deduped_225_1 - 1 ];
    deduped_218_1 := [ 0 .. deduped_224_1 - 1 ];
    deduped_217_1 := [ 0 .. Product( [ deduped_227_1, deduped_228_1, deduped_229_1, deduped_229_1 ] ) - 1 ];
    deduped_216_1 := [ 0 .. Product( [ deduped_224_1, deduped_225_1, deduped_226_1, deduped_226_1 ] ) - 1 ];
    hoisted_197_1 := deduped_249_1;
    hoisted_196_1 := deduped_233_1;
    hoisted_215_1 := List( deduped_233_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_169_1[1 + hoisted_197_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_196_1[(1 + i_2)] ))]] );
            return REM_INT( deduped_1_2, hoisted_185_1 ) + REM_INT( QUO_INT( deduped_1_2, hoisted_185_1 ), hoisted_187_1 ) * hoisted_185_1;
        end );
    hoisted_210_1 := deduped_306_1;
    hoisted_206_1 := deduped_310_1;
    hoisted_209_1 := List( deduped_276_1, function ( logic_new_func_x_2 )
            return REM_INT( QUO_INT( logic_new_func_x_2, hoisted_206_1 ), hoisted_23_1 );
        end );
    hoisted_207_1 := deduped_302_1[2];
    hoisted_208_1 := List( deduped_276_1, function ( logic_new_func_x_2 )
            return hoisted_207_1[1 + REM_INT( logic_new_func_x_2, hoisted_206_1 )];
        end );
    hoisted_211_1 := List( deduped_266_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_152_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_29_1 ^ j_3 ), hoisted_29_1 );
                end );
            return Sum( List( hoisted_180_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_180_1[(1 + k_3)] );
                      return hoisted_1_2[(1 + (hoisted_208_1[deduped_1_3] + hoisted_209_1[deduped_1_3] * hoisted_210_1))] * hoisted_29_1 ^ k_3;
                  end ) );
        end );
    hoisted_203_1 := deduped_305_1;
    hoisted_199_1 := deduped_309_1;
    hoisted_125_1 := deduped_346_1;
    hoisted_202_1 := List( deduped_275_1, function ( logic_new_func_x_2 )
            return REM_INT( QUO_INT( logic_new_func_x_2, hoisted_199_1 ), hoisted_125_1 );
        end );
    hoisted_200_1 := deduped_302_1[1];
    hoisted_201_1 := List( deduped_275_1, function ( logic_new_func_x_2 )
            return hoisted_200_1[1 + REM_INT( logic_new_func_x_2, hoisted_199_1 )];
        end );
    hoisted_205_1 := List( deduped_265_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_147_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_18_1 ^ j_3 ), hoisted_18_1 );
                end );
            return Sum( List( hoisted_175_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_175_1[(1 + k_3)] );
                      return hoisted_1_2[(1 + (hoisted_201_1[deduped_1_3] + hoisted_202_1[deduped_1_3] * hoisted_203_1))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_204_1 := deduped_259_1;
    hoisted_214_1 := List( deduped_259_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_204_1[1 + i_2] );
            return hoisted_205_1[1 + REM_INT( deduped_1_2, hoisted_157_1 )] + hoisted_211_1[(1 + REM_INT( QUO_INT( deduped_1_2, hoisted_157_1 ), hoisted_159_1 ))] * hoisted_185_1;
        end );
    hoisted_213_1 := deduped_241_1;
    hoisted_212_1 := deduped_231_1;
    hoisted_120_1 := deduped_248_1;
    hoisted_119_1 := deduped_232_1;
    hoisted_139_1 := List( deduped_232_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_92_1[1 + hoisted_120_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_119_1[(1 + i_2)] ))]] );
            return REM_INT( deduped_1_2, hoisted_108_1 ) + REM_INT( QUO_INT( deduped_1_2, hoisted_108_1 ), hoisted_110_1 ) * hoisted_108_1;
        end );
    hoisted_134_1 := deduped_304_1;
    hoisted_130_1 := deduped_308_1;
    hoisted_133_1 := List( deduped_273_1, function ( logic_new_func_x_2 )
            return REM_INT( QUO_INT( logic_new_func_x_2, hoisted_130_1 ), hoisted_23_1 );
        end );
    hoisted_131_1 := deduped_299_1[2];
    hoisted_132_1 := List( deduped_273_1, function ( logic_new_func_x_2 )
            return hoisted_131_1[1 + REM_INT( logic_new_func_x_2, hoisted_130_1 )];
        end );
    hoisted_135_1 := List( deduped_262_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_75_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_29_1 ^ j_3 ), hoisted_29_1 );
                end );
            return Sum( List( hoisted_103_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_103_1[(1 + k_3)] );
                      return hoisted_1_2[(1 + (hoisted_132_1[deduped_1_3] + hoisted_133_1[deduped_1_3] * hoisted_134_1))] * hoisted_29_1 ^ k_3;
                  end ) );
        end );
    hoisted_127_1 := deduped_303_1;
    hoisted_122_1 := deduped_307_1;
    hoisted_126_1 := List( deduped_272_1, function ( logic_new_func_x_2 )
            return REM_INT( QUO_INT( logic_new_func_x_2, hoisted_122_1 ), hoisted_125_1 );
        end );
    hoisted_123_1 := deduped_299_1[1];
    hoisted_124_1 := List( deduped_272_1, function ( logic_new_func_x_2 )
            return hoisted_123_1[1 + REM_INT( logic_new_func_x_2, hoisted_122_1 )];
        end );
    hoisted_129_1 := List( deduped_261_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_70_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_18_1 ^ j_3 ), hoisted_18_1 );
                end );
            return Sum( List( hoisted_98_1, function ( k_3 )
                      local deduped_1_3;
                      deduped_1_3 := 1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_98_1[(1 + k_3)] );
                      return hoisted_1_2[(1 + (hoisted_124_1[deduped_1_3] + hoisted_126_1[deduped_1_3] * hoisted_127_1))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_128_1 := deduped_258_1;
    hoisted_138_1 := List( deduped_258_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_128_1[1 + i_2] );
            return hoisted_129_1[1 + REM_INT( deduped_1_2, hoisted_80_1 )] + hoisted_135_1[(1 + REM_INT( QUO_INT( deduped_1_2, hoisted_80_1 ), hoisted_82_1 ))] * hoisted_108_1;
        end );
    hoisted_137_1 := deduped_240_1;
    hoisted_136_1 := deduped_230_1;
    hoisted_48_1 := deduped_223_1;
    hoisted_62_1 := List( deduped_221_1, function ( i_2 )
            return Sum( List( hoisted_48_1, function ( k_3 )
                      return hoisted_39_1[(1 + REM_INT( QUO_INT( i_2, hoisted_29_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_48_1[(1 + k_3)] ) ), hoisted_29_1 ))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_59_1 := deduped_247_1[2];
    hoisted_58_1 := deduped_246_1[2];
    hoisted_57_1 := deduped_245_1[2];
    hoisted_60_1 := List( deduped_223_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_48_1[1 + i_2] );
            return hoisted_58_1[1 + REM_INT( deduped_1_2, hoisted_57_1 )] + hoisted_35_1[(1 + REM_INT( QUO_INT( deduped_1_2, hoisted_57_1 ), hoisted_23_1 ))] * hoisted_59_1;
        end );
    hoisted_47_1 := [ 0 .. deduped_236_1 - 1 ];
    hoisted_61_1 := List( deduped_220_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_47_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_18_1 ^ j_3 ), hoisted_18_1 );
                end );
            return Sum( List( hoisted_48_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_60_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_48_1[(1 + k_3)] ))])] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_56_1 := List( deduped_221_1, function ( i_2 )
            return Sum( List( hoisted_48_1, function ( k_3 )
                      return hoisted_30_1[(1 + REM_INT( QUO_INT( i_2, hoisted_29_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_48_1[(1 + k_3)] ) ), hoisted_29_1 ))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_55_1 := deduped_228_1;
    hoisted_51_1 := deduped_247_1[1];
    hoisted_50_1 := deduped_246_1[1];
    hoisted_49_1 := deduped_245_1[1];
    hoisted_52_1 := List( deduped_223_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_48_1[1 + i_2] );
            return hoisted_50_1[1 + REM_INT( deduped_1_2, hoisted_49_1 )] + hoisted_24_1[(1 + REM_INT( QUO_INT( deduped_1_2, hoisted_49_1 ), hoisted_23_1 ))] * hoisted_51_1;
        end );
    hoisted_54_1 := List( deduped_220_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_47_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_18_1 ^ j_3 ), hoisted_18_1 );
                end );
            return Sum( List( hoisted_48_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_52_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_48_1[(1 + k_3)] ))])] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_53_1 := deduped_227_1;
    hoisted_46_1 := Product( [ deduped_229_1, deduped_229_1, deduped_229_1 ] );
    hoisted_45_1 := deduped_229_1 * deduped_229_1;
    hoisted_44_1 := Product( [ deduped_227_1, deduped_228_1, deduped_229_1 ] );
    hoisted_43_1 := deduped_229_1;
    hoisted_42_1 := deduped_227_1 * deduped_228_1;
    hoisted_41_1 := deduped_217_1;
    hoisted_20_1 := deduped_222_1;
    hoisted_40_1 := List( deduped_219_1, function ( i_2 )
            return Sum( List( hoisted_20_1, function ( k_3 )
                      return hoisted_39_1[(1 + REM_INT( QUO_INT( i_2, hoisted_29_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_20_1[(1 + k_3)] ) ), hoisted_29_1 ))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_36_1 := deduped_244_1[2];
    hoisted_34_1 := deduped_243_1[2];
    hoisted_33_1 := deduped_242_1[2];
    hoisted_37_1 := List( deduped_222_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_20_1[1 + i_2] );
            return hoisted_34_1[1 + REM_INT( deduped_1_2, hoisted_33_1 )] + hoisted_35_1[(1 + REM_INT( QUO_INT( deduped_1_2, hoisted_33_1 ), hoisted_23_1 ))] * hoisted_36_1;
        end );
    hoisted_19_1 := [ 0 .. deduped_234_1 - 1 ];
    hoisted_38_1 := List( deduped_218_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_19_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_18_1 ^ j_3 ), hoisted_18_1 );
                end );
            return Sum( List( hoisted_20_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_37_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_20_1[(1 + k_3)] ))])] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_32_1 := List( deduped_219_1, function ( i_2 )
            return Sum( List( hoisted_20_1, function ( k_3 )
                      return hoisted_30_1[(1 + REM_INT( QUO_INT( i_2, hoisted_29_1 ^ CAP_JIT_INCOMPLETE_LOGIC( hoisted_20_1[(1 + k_3)] ) ), hoisted_29_1 ))] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_31_1 := deduped_225_1;
    hoisted_25_1 := deduped_244_1[1];
    hoisted_22_1 := deduped_243_1[1];
    hoisted_21_1 := deduped_242_1[1];
    hoisted_26_1 := List( deduped_222_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_20_1[1 + i_2] );
            return hoisted_22_1[1 + REM_INT( deduped_1_2, hoisted_21_1 )] + hoisted_24_1[(1 + REM_INT( QUO_INT( deduped_1_2, hoisted_21_1 ), hoisted_23_1 ))] * hoisted_25_1;
        end );
    hoisted_28_1 := List( deduped_218_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_19_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_18_1 ^ j_3 ), hoisted_18_1 );
                end );
            return Sum( List( hoisted_20_1, function ( k_3 )
                      return hoisted_1_2[(1 + hoisted_26_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_20_1[(1 + k_3)] ))])] * hoisted_18_1 ^ k_3;
                  end ) );
        end );
    hoisted_27_1 := deduped_224_1;
    hoisted_17_1 := Product( [ deduped_226_1, deduped_226_1, deduped_226_1 ] );
    hoisted_16_1 := deduped_226_1 * deduped_226_1;
    hoisted_15_1 := Product( [ deduped_224_1, deduped_225_1, deduped_226_1 ] );
    hoisted_14_1 := deduped_226_1;
    hoisted_13_1 := deduped_224_1 * deduped_225_1;
    hoisted_12_1 := deduped_216_1;
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiver, NTuple( 3, Length( Filtered( deduped_216_1, function ( x_2 )
                  local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2, deduped_5_2;
                  deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_12_1[1 + x_2] );
                  deduped_4_2 := 1 + REM_INT( deduped_5_2, hoisted_27_1 );
                  deduped_3_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_15_1 ), hoisted_14_1 );
                  deduped_2_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_13_1 ), hoisted_14_1 );
                  deduped_1_2 := 1 + REM_INT( QUO_INT( deduped_5_2, hoisted_27_1 ), hoisted_31_1 );
                  return deduped_2_2 + deduped_2_2 * hoisted_14_1 + deduped_3_2 * hoisted_16_1 + deduped_3_2 * hoisted_17_1 = hoisted_28_1[deduped_4_2] + hoisted_32_1[deduped_1_2] * hoisted_14_1 + hoisted_38_1[deduped_4_2] * hoisted_16_1 + hoisted_40_1[deduped_1_2] * hoisted_17_1;
              end ) ), Length( Filtered( deduped_217_1, function ( x_2 )
                  local deduped_1_2, deduped_2_2, deduped_3_2, deduped_4_2, deduped_5_2;
                  deduped_5_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_41_1[1 + x_2] );
                  deduped_4_2 := 1 + REM_INT( deduped_5_2, hoisted_53_1 );
                  deduped_3_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_44_1 ), hoisted_43_1 );
                  deduped_2_2 := REM_INT( QUO_INT( deduped_5_2, hoisted_42_1 ), hoisted_43_1 );
                  deduped_1_2 := 1 + REM_INT( QUO_INT( deduped_5_2, hoisted_53_1 ), hoisted_55_1 );
                  return deduped_2_2 + deduped_2_2 * hoisted_43_1 + deduped_3_2 * hoisted_45_1 + deduped_3_2 * hoisted_46_1 = hoisted_54_1[deduped_4_2] + hoisted_56_1[deduped_1_2] * hoisted_43_1 + hoisted_61_1[deduped_4_2] * hoisted_45_1 + hoisted_62_1[deduped_1_2] * hoisted_46_1;
              end ) ), ListN( List( deduped_230_1, function ( x_2 )
                  local deduped_1_2;
                  deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_64_1[1 + hoisted_137_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_136_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_136_1[(1 + x_2)] ))] ))]] );
                  return -1 + SafePosition( hoisted_139_1, hoisted_138_1[(1 + (REM_INT( deduped_1_2, hoisted_80_1 ) + REM_INT( QUO_INT( deduped_1_2, hoisted_80_1 ), hoisted_82_1 ) * hoisted_80_1))] );
              end ), List( deduped_231_1, function ( x_2 )
                  local deduped_1_2;
                  deduped_1_2 := CAP_JIT_INCOMPLETE_LOGIC( hoisted_141_1[1 + hoisted_213_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_212_1[(1 + CAP_JIT_INCOMPLETE_LOGIC( hoisted_212_1[(1 + x_2)] ))] ))]] );
                  return -1 + SafePosition( hoisted_215_1, hoisted_214_1[(1 + (REM_INT( deduped_1_2, hoisted_157_1 ) + REM_INT( QUO_INT( deduped_1_2, hoisted_157_1 ), hoisted_159_1 ) * hoisted_157_1))] );
              end ), function ( s_2, t_2 )
                return NTuple( 2, s_2, t_2 );
            end ) ) );
end
########
        
    , 100 );
    
    if IsBound( cat!.precompiled_functions_added ) then
        
        # COVERAGE_IGNORE_NEXT_LINE
        #Error( "precompiled functions have already been added before" );
        
    fi;
    
    cat!.precompiled_functions_added := true;
    
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

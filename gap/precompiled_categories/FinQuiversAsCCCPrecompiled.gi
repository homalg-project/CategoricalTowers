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
    hoisted_51_1, hoisted_52_1, hoisted_53_1, hoisted_54_1, hoisted_55_1, hoisted_56_1, hoisted_57_1, hoisted_58_1, hoisted_59_1, hoisted_60_1, hoisted_61_1, hoisted_62_1, hoisted_63_1, hoisted_64_1, hoisted_65_1, hoisted_66_1, hoisted_67_1, hoisted_68_1, hoisted_69_1, hoisted_70_1, hoisted_71_1, hoisted_72_1, hoisted_73_1, hoisted_74_1, hoisted_75_1, hoisted_76_1, hoisted_77_1, hoisted_78_1, hoisted_79_1, hoisted_80_1, hoisted_81_1, hoisted_82_1, hoisted_83_1, hoisted_84_1, hoisted_85_1, hoisted_86_1, hoisted_87_1, hoisted_88_1, hoisted_89_1, hoisted_90_1, hoisted_91_1, hoisted_92_1, hoisted_93_1, hoisted_94_1, hoisted_95_1, hoisted_96_1, hoisted_97_1, hoisted_98_1, hoisted_99_1, hoisted_100_1, hoisted_101_1, hoisted_102_1, hoisted_103_1, hoisted_104_1, hoisted_105_1, hoisted_106_1, hoisted_107_1, hoisted_108_1, hoisted_109_1, hoisted_110_1, hoisted_111_1, hoisted_112_1, hoisted_113_1, hoisted_114_1, hoisted_115_1, hoisted_116_1, hoisted_117_1, hoisted_118_1, hoisted_119_1, hoisted_120_1, hoisted_121_1, hoisted_122_1, hoisted_123_1, hoisted_124_1, hoisted_125_1, hoisted_126_1, hoisted_127_1, hoisted_128_1, hoisted_129_1, hoisted_130_1, hoisted_131_1, hoisted_132_1, hoisted_133_1, hoisted_134_1, hoisted_135_1, hoisted_136_1, hoisted_137_1, hoisted_138_1, hoisted_139_1, hoisted_140_1, hoisted_141_1, hoisted_142_1, hoisted_143_1, hoisted_144_1, hoisted_145_1, hoisted_146_1, hoisted_147_1, hoisted_148_1, hoisted_149_1, hoisted_150_1, hoisted_151_1, hoisted_152_1, hoisted_153_1, hoisted_154_1, hoisted_155_1, hoisted_156_1, hoisted_157_1, hoisted_158_1, hoisted_159_1, hoisted_160_1, hoisted_161_1, hoisted_162_1, hoisted_163_1, hoisted_164_1, hoisted_165_1, hoisted_166_1, hoisted_167_1, hoisted_168_1, hoisted_169_1, hoisted_170_1, hoisted_171_1, hoisted_172_1, hoisted_173_1, hoisted_174_1, hoisted_175_1, hoisted_176_1, hoisted_177_1, hoisted_178_1, hoisted_179_1, hoisted_180_1, hoisted_181_1, hoisted_182_1, hoisted_183_1, hoisted_184_1, hoisted_185_1, hoisted_186_1, hoisted_187_1, hoisted_188_1, hoisted_189_1, hoisted_190_1, hoisted_191_1, hoisted_192_1, hoisted_193_1, hoisted_194_1, hoisted_195_1, hoisted_196_1, hoisted_197_1, hoisted_198_1, hoisted_199_1, hoisted_200_1, hoisted_201_1, hoisted_202_1, hoisted_203_1, hoisted_204_1, hoisted_205_1, hoisted_206_1, hoisted_207_1, hoisted_208_1, hoisted_209_1, hoisted_210_1, hoisted_211_1, hoisted_212_1, hoisted_213_1, hoisted_214_1, hoisted_215_1, hoisted_216_1, hoisted_217_1, hoisted_218_1, hoisted_219_1, hoisted_220_1, hoisted_221_1, hoisted_222_1, hoisted_223_1, hoisted_224_1, hoisted_225_1, hoisted_226_1, hoisted_227_1, hoisted_228_1, hoisted_229_1, hoisted_230_1, hoisted_231_1, hoisted_232_1, hoisted_233_1, hoisted_234_1, hoisted_235_1, hoisted_236_1, hoisted_237_1, hoisted_238_1, hoisted_239_1, hoisted_240_1, hoisted_241_1, hoisted_242_1, hoisted_243_1, hoisted_244_1, hoisted_245_1, hoisted_246_1, hoisted_247_1, hoisted_248_1, hoisted_249_1, hoisted_250_1, hoisted_251_1, hoisted_252_1, hoisted_253_1, hoisted_254_1, hoisted_255_1, hoisted_256_1, hoisted_257_1, hoisted_258_1, hoisted_259_1, hoisted_260_1, hoisted_261_1, hoisted_262_1, hoisted_263_1, hoisted_264_1, hoisted_265_1, hoisted_266_1, hoisted_267_1, hoisted_268_1, hoisted_269_1, hoisted_270_1, hoisted_271_1, hoisted_272_1, hoisted_273_1, hoisted_274_1, hoisted_275_1, hoisted_276_1, hoisted_277_1, hoisted_278_1, deduped_279_1, deduped_280_1, deduped_281_1, deduped_282_1, deduped_283_1, deduped_284_1, deduped_285_1, deduped_286_1, deduped_287_1, deduped_288_1, deduped_289_1, deduped_290_1, deduped_291_1, deduped_292_1, deduped_293_1, deduped_294_1, deduped_295_1, deduped_296_1, deduped_297_1, deduped_298_1, deduped_299_1, deduped_300_1, deduped_301_1, deduped_302_1, deduped_303_1, deduped_304_1, deduped_305_1, deduped_306_1, deduped_307_1, deduped_308_1, deduped_309_1, deduped_310_1, deduped_311_1, deduped_312_1, deduped_313_1, deduped_314_1, deduped_315_1, deduped_316_1, deduped_317_1, deduped_318_1, deduped_319_1, deduped_320_1, deduped_321_1, deduped_322_1, deduped_323_1, deduped_324_1, deduped_325_1, 
    deduped_326_1, deduped_327_1, deduped_328_1, deduped_329_1, deduped_330_1, deduped_331_1, deduped_332_1, deduped_333_1, deduped_334_1, deduped_335_1, deduped_336_1, deduped_337_1, deduped_338_1, deduped_339_1, deduped_340_1, deduped_341_1, deduped_342_1, deduped_343_1, deduped_344_1, deduped_345_1, deduped_346_1, deduped_347_1, deduped_348_1, deduped_349_1, deduped_350_1, deduped_351_1, deduped_352_1, deduped_353_1, deduped_354_1, deduped_355_1, deduped_356_1, deduped_357_1, deduped_358_1, deduped_359_1, deduped_360_1, deduped_361_1, deduped_362_1, deduped_363_1, deduped_364_1, deduped_365_1, deduped_366_1, deduped_367_1, deduped_368_1, deduped_369_1, deduped_370_1, deduped_371_1, deduped_372_1, deduped_373_1, deduped_374_1, deduped_375_1, deduped_376_1, deduped_377_1, deduped_378_1, deduped_379_1, deduped_380_1, deduped_381_1, deduped_382_1, deduped_383_1, deduped_384_1, deduped_385_1, deduped_386_1, deduped_387_1, deduped_388_1, deduped_389_1, deduped_390_1, deduped_391_1, deduped_392_1, deduped_393_1, deduped_394_1, deduped_395_1, deduped_396_1, deduped_397_1, deduped_398_1, deduped_399_1, deduped_400_1, deduped_401_1, deduped_402_1, deduped_403_1, deduped_404_1, deduped_405_1, deduped_406_1, deduped_407_1, deduped_408_1, deduped_409_1, deduped_410_1, deduped_411_1, deduped_412_1, deduped_413_1, deduped_414_1, deduped_415_1, deduped_416_1, deduped_417_1, deduped_418_1;
    deduped_418_1 := DefiningTripleOfQuiver( a_1 );
    deduped_417_1 := DefiningTripleOfQuiver( b_1 );
    deduped_416_1 := deduped_417_1[3];
    deduped_415_1 := deduped_418_1[3];
    deduped_414_1 := deduped_418_1[2];
    deduped_413_1 := deduped_417_1[2];
    deduped_412_1 := deduped_418_1[1];
    deduped_411_1 := ModelingCategory( ModelingCategory( cat_1 ) );
    deduped_410_1 := deduped_417_1[1];
    deduped_409_1 := SetOfGeneratingMorphisms( deduped_411_1 );
    deduped_408_1 := Source( deduped_411_1 );
    deduped_407_1 := SetOfObjects( deduped_411_1 );
    deduped_406_1 := List( deduped_409_1, function ( logic_new_func_x_2 )
            return BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) );
        end );
    deduped_405_1 := Length( deduped_407_1 );
    deduped_404_1 := BasisPathsByVertexIndex( deduped_408_1 );
    deduped_403_1 := [ 1 .. deduped_405_1 ];
    deduped_402_1 := List( deduped_409_1, function ( logic_new_func_x_2 )
            return QuiverVertexAsIdentityPath( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
        end );
    deduped_401_1 := List( deduped_409_1, function ( logic_new_func_x_2 )
            return VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
        end );
    deduped_400_1 := List( deduped_409_1, function ( logic_new_func_x_2 )
            return QuiverVertexAsIdentityPath( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
        end );
    deduped_399_1 := List( deduped_409_1, function ( logic_new_func_x_2 )
            return VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
        end );
    deduped_398_1 := [ 0 .. deduped_405_1 - 1 ];
    deduped_393_1 := deduped_399_1[2];
    hoisted_180_1 := deduped_393_1;
    hoisted_1_1 := List( deduped_404_1, function ( logic_new_func_list_2 )
            return List( logic_new_func_list_2, Length );
        end );
    deduped_389_1 := List( deduped_407_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_180_1];
        end );
    deduped_372_1 := deduped_389_1[2];
    deduped_371_1 := deduped_389_1[1];
    deduped_361_1 := deduped_372_1 * deduped_414_1;
    deduped_360_1 := deduped_371_1 * deduped_412_1;
    hoisted_249_1 := [ deduped_360_1, deduped_361_1 ];
    hoisted_146_1 := [ deduped_410_1, deduped_413_1 ];
    deduped_397_1 := List( deduped_403_1, function ( logic_new_func_x_2 )
            return hoisted_146_1[logic_new_func_x_2] ^ hoisted_249_1[logic_new_func_x_2];
        end );
    deduped_390_1 := deduped_399_1[1];
    hoisted_76_1 := deduped_390_1;
    deduped_388_1 := List( deduped_407_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_76_1];
        end );
    deduped_370_1 := deduped_388_1[2];
    deduped_369_1 := deduped_388_1[1];
    deduped_359_1 := deduped_370_1 * deduped_414_1;
    deduped_358_1 := deduped_369_1 * deduped_412_1;
    hoisted_147_1 := [ deduped_358_1, deduped_359_1 ];
    deduped_396_1 := List( deduped_403_1, function ( logic_new_func_x_2 )
            return hoisted_146_1[logic_new_func_x_2] ^ hoisted_147_1[logic_new_func_x_2];
        end );
    deduped_394_1 := deduped_401_1[2];
    hoisted_211_1 := deduped_394_1;
    deduped_395_1 := List( deduped_407_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_211_1];
        end );
    deduped_391_1 := deduped_401_1[1];
    hoisted_107_1 := deduped_391_1;
    deduped_392_1 := List( deduped_407_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( logic_new_func_x_2 ) )][hoisted_107_1];
        end );
    deduped_387_1 := Length( deduped_398_1 );
    deduped_386_1 := List( deduped_409_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_211_1];
        end );
    deduped_385_1 := List( deduped_409_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_211_1];
        end );
    deduped_384_1 := deduped_404_1[deduped_394_1];
    deduped_383_1 := deduped_395_1[2];
    deduped_382_1 := deduped_395_1[1];
    deduped_381_1 := List( deduped_409_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_180_1];
        end );
    deduped_380_1 := List( deduped_409_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_180_1];
        end );
    deduped_379_1 := List( deduped_409_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_107_1];
        end );
    deduped_378_1 := List( deduped_409_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_107_1];
        end );
    deduped_377_1 := deduped_404_1[deduped_391_1];
    deduped_376_1 := deduped_392_1[2];
    deduped_375_1 := deduped_392_1[1];
    deduped_374_1 := List( deduped_409_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) )][hoisted_76_1];
        end );
    deduped_373_1 := List( deduped_409_1, function ( logic_new_func_x_2 )
            return hoisted_1_1[VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) )][hoisted_76_1];
        end );
    deduped_368_1 := [ 0 .. Product( deduped_397_1 ) - 1 ];
    deduped_367_1 := [ 0 .. Product( deduped_396_1 ) - 1 ];
    deduped_366_1 := [ 0 .. deduped_387_1 - 1 ];
    deduped_365_1 := deduped_383_1 * deduped_414_1;
    deduped_364_1 := deduped_382_1 * deduped_412_1;
    deduped_363_1 := deduped_376_1 * deduped_414_1;
    deduped_362_1 := deduped_375_1 * deduped_412_1;
    deduped_357_1 := deduped_410_1 ^ deduped_365_1;
    deduped_356_1 := deduped_413_1 ^ deduped_365_1;
    deduped_355_1 := deduped_410_1 ^ deduped_364_1;
    deduped_354_1 := deduped_410_1 ^ deduped_363_1;
    deduped_353_1 := deduped_413_1 ^ deduped_363_1;
    deduped_352_1 := deduped_410_1 ^ deduped_362_1;
    deduped_351_1 := deduped_410_1 ^ deduped_361_1;
    deduped_350_1 := deduped_413_1 ^ deduped_361_1;
    deduped_349_1 := deduped_410_1 ^ deduped_360_1;
    deduped_348_1 := deduped_410_1 ^ deduped_359_1;
    deduped_347_1 := deduped_413_1 ^ deduped_359_1;
    deduped_346_1 := deduped_410_1 ^ deduped_358_1;
    deduped_345_1 := [ 0 .. deduped_365_1 - 1 ];
    deduped_344_1 := [ 0 .. deduped_364_1 - 1 ];
    deduped_343_1 := [ 0 .. deduped_361_1 - 1 ];
    deduped_342_1 := [ 0 .. deduped_363_1 - 1 ];
    deduped_341_1 := [ 0 .. deduped_362_1 - 1 ];
    deduped_340_1 := [ 0 .. deduped_359_1 - 1 ];
    deduped_339_1 := [ deduped_355_1, deduped_356_1, deduped_357_1, deduped_357_1 ];
    deduped_338_1 := [ deduped_352_1, deduped_353_1, deduped_354_1, deduped_354_1 ];
    deduped_337_1 := [ deduped_349_1, deduped_350_1, deduped_351_1, deduped_351_1 ];
    deduped_336_1 := [ deduped_346_1, deduped_347_1, deduped_348_1, deduped_348_1 ];
    hoisted_251_1 := SafePosition( deduped_384_1[deduped_393_1], deduped_406_1[2] );
    hoisted_5_1 := deduped_404_1;
    hoisted_4_1 := HomStructureOnBasisPaths( deduped_408_1 );
    deduped_335_1 := List( deduped_407_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := UnderlyingVertex( logic_new_func_x_2 );
            deduped_2_2 := VertexIndex( deduped_3_2 );
            hoisted_1_2 := hoisted_4_1[deduped_2_2][hoisted_211_1][deduped_2_2][hoisted_180_1][SafePosition( hoisted_5_1[deduped_2_2][deduped_2_2], QuiverVertexAsIdentityPath( deduped_3_2 ) )][hoisted_251_1];
            return List( [ 1 .. hoisted_1_1[deduped_2_2][hoisted_211_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_150_1 := SafePosition( deduped_377_1[deduped_390_1], deduped_406_1[1] );
    deduped_334_1 := List( deduped_407_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := UnderlyingVertex( logic_new_func_x_2 );
            deduped_2_2 := VertexIndex( deduped_3_2 );
            hoisted_1_2 := hoisted_4_1[deduped_2_2][hoisted_107_1][deduped_2_2][hoisted_76_1][SafePosition( hoisted_5_1[deduped_2_2][deduped_2_2], QuiverVertexAsIdentityPath( deduped_3_2 ) )][hoisted_150_1];
            return List( [ 1 .. hoisted_1_1[deduped_2_2][hoisted_107_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    deduped_333_1 := [ 0 .. deduped_356_1 - 1 ];
    deduped_332_1 := [ 0 .. deduped_355_1 - 1 ];
    deduped_331_1 := [ 0 .. deduped_350_1 - 1 ];
    deduped_330_1 := [ 0 .. deduped_349_1 - 1 ];
    deduped_329_1 := [ 0 .. deduped_353_1 - 1 ];
    deduped_328_1 := [ 0 .. deduped_352_1 - 1 ];
    deduped_327_1 := [ 0 .. deduped_347_1 - 1 ];
    deduped_326_1 := [ 0 .. deduped_346_1 - 1 ];
    hoisted_220_1 := SafePosition( deduped_384_1[deduped_394_1], deduped_402_1[2] );
    deduped_325_1 := List( deduped_409_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_4_1[deduped_2_2][hoisted_211_1][deduped_3_2][hoisted_211_1][SafePosition( hoisted_5_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_220_1];
            return List( [ 1 .. hoisted_1_1[deduped_2_2][hoisted_211_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_189_1 := SafePosition( deduped_404_1[deduped_393_1][deduped_393_1], deduped_400_1[2] );
    deduped_324_1 := List( deduped_409_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_4_1[deduped_2_2][hoisted_180_1][deduped_3_2][hoisted_180_1][SafePosition( hoisted_5_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_189_1];
            return List( [ 1 .. hoisted_1_1[deduped_2_2][hoisted_180_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_116_1 := SafePosition( deduped_377_1[deduped_391_1], deduped_402_1[1] );
    deduped_323_1 := List( deduped_409_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_4_1[deduped_2_2][hoisted_107_1][deduped_3_2][hoisted_107_1][SafePosition( hoisted_5_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_116_1];
            return List( [ 1 .. hoisted_1_1[deduped_2_2][hoisted_107_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    hoisted_85_1 := SafePosition( deduped_404_1[deduped_390_1][deduped_390_1], deduped_400_1[1] );
    deduped_322_1 := List( deduped_409_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := VertexIndex( UnderlyingVertex( Source( logic_new_func_x_2 ) ) );
            deduped_2_2 := VertexIndex( UnderlyingVertex( Range( logic_new_func_x_2 ) ) );
            hoisted_1_2 := hoisted_4_1[deduped_2_2][hoisted_76_1][deduped_3_2][hoisted_76_1][SafePosition( hoisted_5_1[deduped_3_2][deduped_2_2], BasisPathOfPathAlgebraBasisElement( UnderlyingQuiverAlgebraElement( logic_new_func_x_2 ) ) )][hoisted_85_1];
            return List( [ 1 .. hoisted_1_1[deduped_2_2][hoisted_76_1] ], function ( phi_index_3 )
                    return hoisted_1_2[phi_index_3];
                end );
        end );
    deduped_321_1 := [ 0 .. Product( deduped_339_1 ) - 1 ];
    deduped_320_1 := [ 0 .. Product( deduped_338_1 ) - 1 ];
    deduped_319_1 := [ 0 .. Product( deduped_337_1 ) - 1 ];
    deduped_318_1 := [ 0 .. Product( deduped_336_1 ) - 1 ];
    hoisted_226_1 := deduped_345_1;
    hoisted_42_1 := List( deduped_416_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_28_1 := deduped_413_1;
    hoisted_14_1 := deduped_410_1;
    hoisted_240_1 := List( deduped_333_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_226_1, function ( logic_new_func_x_3 )
                    return hoisted_42_1[1 + REM_INT( QUO_INT( i_2, hoisted_28_1 ^ logic_new_func_x_3 ), hoisted_28_1 )];
                end );
            return Sum( List( hoisted_226_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_230_1 := deduped_356_1;
    hoisted_227_1 := deduped_355_1;
    hoisted_241_1 := List( deduped_321_1, function ( logic_new_func_x_2 )
            return hoisted_240_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_227_1 ), hoisted_230_1 )];
        end );
    hoisted_237_1 := deduped_386_1[2];
    hoisted_233_1 := deduped_385_1[2];
    hoisted_36_1 := List( deduped_415_1, function ( a_2 )
            return a_2[2];
        end );
    hoisted_19_1 := deduped_414_1;
    hoisted_236_1 := List( deduped_345_1, function ( logic_new_func_x_2 )
            return hoisted_36_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_233_1 ), hoisted_19_1 )];
        end );
    hoisted_234_1 := deduped_325_1[2];
    hoisted_235_1 := List( deduped_345_1, function ( logic_new_func_x_2 )
            return hoisted_234_1[1 + REM_INT( logic_new_func_x_2, hoisted_233_1 )];
        end );
    hoisted_219_1 := deduped_344_1;
    hoisted_238_1 := List( deduped_332_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_219_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_14_1 ^ j_3 ), hoisted_14_1 );
                end );
            hoisted_2_2 := List( hoisted_226_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_235_1[deduped_1_3] + hoisted_236_1[deduped_1_3] * hoisted_237_1)];
                end );
            return Sum( List( hoisted_226_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_239_1 := List( deduped_321_1, function ( logic_new_func_x_2 )
            return hoisted_238_1[1 + REM_INT( logic_new_func_x_2, hoisted_227_1 )];
        end );
    hoisted_29_1 := List( deduped_416_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_231_1 := List( deduped_333_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_226_1, function ( logic_new_func_x_3 )
                    return hoisted_29_1[1 + REM_INT( QUO_INT( i_2, hoisted_28_1 ^ logic_new_func_x_3 ), hoisted_28_1 )];
                end );
            return Sum( List( hoisted_226_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_232_1 := List( deduped_321_1, function ( logic_new_func_x_2 )
            return hoisted_231_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_227_1 ), hoisted_230_1 )];
        end );
    hoisted_225_1 := deduped_386_1[1];
    hoisted_221_1 := deduped_385_1[1];
    hoisted_20_1 := List( deduped_415_1, function ( a_2 )
            return a_2[1];
        end );
    hoisted_224_1 := List( deduped_345_1, function ( logic_new_func_x_2 )
            return hoisted_20_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_221_1 ), hoisted_19_1 )];
        end );
    hoisted_222_1 := deduped_325_1[1];
    hoisted_223_1 := List( deduped_345_1, function ( logic_new_func_x_2 )
            return hoisted_222_1[1 + REM_INT( logic_new_func_x_2, hoisted_221_1 )];
        end );
    hoisted_228_1 := List( deduped_332_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_219_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_14_1 ^ j_3 ), hoisted_14_1 );
                end );
            hoisted_2_2 := List( hoisted_226_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_223_1[deduped_1_3] + hoisted_224_1[deduped_1_3] * hoisted_225_1)];
                end );
            return Sum( List( hoisted_226_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_229_1 := List( deduped_321_1, function ( logic_new_func_x_2 )
            return hoisted_228_1[1 + REM_INT( logic_new_func_x_2, hoisted_227_1 )];
        end );
    hoisted_218_1 := Product( [ deduped_357_1, deduped_357_1, deduped_357_1 ] );
    hoisted_217_1 := deduped_357_1 * deduped_357_1;
    hoisted_215_1 := Product( [ deduped_355_1, deduped_356_1, deduped_357_1 ] );
    hoisted_213_1 := deduped_357_1;
    hoisted_216_1 := List( deduped_321_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_215_1 ), hoisted_213_1 );
        end );
    hoisted_212_1 := deduped_355_1 * deduped_356_1;
    hoisted_214_1 := List( deduped_321_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_212_1 ), hoisted_213_1 );
        end );
    deduped_317_1 := Filtered( deduped_321_1, function ( x_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := 1 + x_2;
            deduped_2_2 := hoisted_216_1[deduped_3_2];
            deduped_1_2 := hoisted_214_1[deduped_3_2];
            return deduped_1_2 + deduped_1_2 * hoisted_213_1 + deduped_2_2 * hoisted_217_1 + deduped_2_2 * hoisted_218_1 = hoisted_229_1[deduped_3_2] + hoisted_232_1[deduped_3_2] * hoisted_213_1 + hoisted_239_1[deduped_3_2] * hoisted_217_1 + hoisted_241_1[deduped_3_2] * hoisted_218_1;
        end );
    hoisted_122_1 := deduped_342_1;
    hoisted_136_1 := List( deduped_329_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_122_1, function ( logic_new_func_x_3 )
                    return hoisted_42_1[1 + REM_INT( QUO_INT( i_2, hoisted_28_1 ^ logic_new_func_x_3 ), hoisted_28_1 )];
                end );
            return Sum( List( hoisted_122_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_126_1 := deduped_353_1;
    hoisted_123_1 := deduped_352_1;
    hoisted_137_1 := List( deduped_320_1, function ( logic_new_func_x_2 )
            return hoisted_136_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_123_1 ), hoisted_126_1 )];
        end );
    hoisted_133_1 := deduped_379_1[2];
    hoisted_129_1 := deduped_378_1[2];
    hoisted_132_1 := List( deduped_342_1, function ( logic_new_func_x_2 )
            return hoisted_36_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_129_1 ), hoisted_19_1 )];
        end );
    hoisted_130_1 := deduped_323_1[2];
    hoisted_131_1 := List( deduped_342_1, function ( logic_new_func_x_2 )
            return hoisted_130_1[1 + REM_INT( logic_new_func_x_2, hoisted_129_1 )];
        end );
    hoisted_115_1 := deduped_341_1;
    hoisted_134_1 := List( deduped_328_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_115_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_14_1 ^ j_3 ), hoisted_14_1 );
                end );
            hoisted_2_2 := List( hoisted_122_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_131_1[deduped_1_3] + hoisted_132_1[deduped_1_3] * hoisted_133_1)];
                end );
            return Sum( List( hoisted_122_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_135_1 := List( deduped_320_1, function ( logic_new_func_x_2 )
            return hoisted_134_1[1 + REM_INT( logic_new_func_x_2, hoisted_123_1 )];
        end );
    hoisted_127_1 := List( deduped_329_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_122_1, function ( logic_new_func_x_3 )
                    return hoisted_29_1[1 + REM_INT( QUO_INT( i_2, hoisted_28_1 ^ logic_new_func_x_3 ), hoisted_28_1 )];
                end );
            return Sum( List( hoisted_122_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_128_1 := List( deduped_320_1, function ( logic_new_func_x_2 )
            return hoisted_127_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_123_1 ), hoisted_126_1 )];
        end );
    hoisted_121_1 := deduped_379_1[1];
    hoisted_117_1 := deduped_378_1[1];
    hoisted_120_1 := List( deduped_342_1, function ( logic_new_func_x_2 )
            return hoisted_20_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_117_1 ), hoisted_19_1 )];
        end );
    hoisted_118_1 := deduped_323_1[1];
    hoisted_119_1 := List( deduped_342_1, function ( logic_new_func_x_2 )
            return hoisted_118_1[1 + REM_INT( logic_new_func_x_2, hoisted_117_1 )];
        end );
    hoisted_124_1 := List( deduped_328_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_115_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_14_1 ^ j_3 ), hoisted_14_1 );
                end );
            hoisted_2_2 := List( hoisted_122_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_119_1[deduped_1_3] + hoisted_120_1[deduped_1_3] * hoisted_121_1)];
                end );
            return Sum( List( hoisted_122_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_125_1 := List( deduped_320_1, function ( logic_new_func_x_2 )
            return hoisted_124_1[1 + REM_INT( logic_new_func_x_2, hoisted_123_1 )];
        end );
    hoisted_114_1 := Product( [ deduped_354_1, deduped_354_1, deduped_354_1 ] );
    hoisted_113_1 := deduped_354_1 * deduped_354_1;
    hoisted_111_1 := Product( [ deduped_352_1, deduped_353_1, deduped_354_1 ] );
    hoisted_109_1 := deduped_354_1;
    hoisted_112_1 := List( deduped_320_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_111_1 ), hoisted_109_1 );
        end );
    hoisted_108_1 := deduped_352_1 * deduped_353_1;
    hoisted_110_1 := List( deduped_320_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_108_1 ), hoisted_109_1 );
        end );
    deduped_316_1 := Filtered( deduped_320_1, function ( x_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := 1 + x_2;
            deduped_2_2 := hoisted_112_1[deduped_3_2];
            deduped_1_2 := hoisted_110_1[deduped_3_2];
            return deduped_1_2 + deduped_1_2 * hoisted_109_1 + deduped_2_2 * hoisted_113_1 + deduped_2_2 * hoisted_114_1 = hoisted_125_1[deduped_3_2] + hoisted_128_1[deduped_3_2] * hoisted_109_1 + hoisted_135_1[deduped_3_2] * hoisted_113_1 + hoisted_137_1[deduped_3_2] * hoisted_114_1;
        end );
    hoisted_195_1 := deduped_343_1;
    hoisted_209_1 := List( deduped_331_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_195_1, function ( logic_new_func_x_3 )
                    return hoisted_42_1[1 + REM_INT( QUO_INT( i_2, hoisted_28_1 ^ logic_new_func_x_3 ), hoisted_28_1 )];
                end );
            return Sum( List( hoisted_195_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_199_1 := deduped_350_1;
    hoisted_196_1 := deduped_349_1;
    hoisted_210_1 := List( deduped_319_1, function ( logic_new_func_x_2 )
            return hoisted_209_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_196_1 ), hoisted_199_1 )];
        end );
    hoisted_206_1 := deduped_381_1[2];
    hoisted_202_1 := deduped_380_1[2];
    hoisted_205_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_36_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_202_1 ), hoisted_19_1 )];
        end );
    hoisted_203_1 := deduped_324_1[2];
    hoisted_204_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_203_1[1 + REM_INT( logic_new_func_x_2, hoisted_202_1 )];
        end );
    hoisted_188_1 := [ 0 .. deduped_360_1 - 1 ];
    hoisted_207_1 := List( deduped_330_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_188_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_14_1 ^ j_3 ), hoisted_14_1 );
                end );
            hoisted_2_2 := List( hoisted_195_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_204_1[deduped_1_3] + hoisted_205_1[deduped_1_3] * hoisted_206_1)];
                end );
            return Sum( List( hoisted_195_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_208_1 := List( deduped_319_1, function ( logic_new_func_x_2 )
            return hoisted_207_1[1 + REM_INT( logic_new_func_x_2, hoisted_196_1 )];
        end );
    hoisted_200_1 := List( deduped_331_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_195_1, function ( logic_new_func_x_3 )
                    return hoisted_29_1[1 + REM_INT( QUO_INT( i_2, hoisted_28_1 ^ logic_new_func_x_3 ), hoisted_28_1 )];
                end );
            return Sum( List( hoisted_195_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_201_1 := List( deduped_319_1, function ( logic_new_func_x_2 )
            return hoisted_200_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_196_1 ), hoisted_199_1 )];
        end );
    hoisted_194_1 := deduped_381_1[1];
    hoisted_190_1 := deduped_380_1[1];
    hoisted_193_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_20_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_190_1 ), hoisted_19_1 )];
        end );
    hoisted_191_1 := deduped_324_1[1];
    hoisted_192_1 := List( deduped_343_1, function ( logic_new_func_x_2 )
            return hoisted_191_1[1 + REM_INT( logic_new_func_x_2, hoisted_190_1 )];
        end );
    hoisted_197_1 := List( deduped_330_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_188_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_14_1 ^ j_3 ), hoisted_14_1 );
                end );
            hoisted_2_2 := List( hoisted_195_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_192_1[deduped_1_3] + hoisted_193_1[deduped_1_3] * hoisted_194_1)];
                end );
            return Sum( List( hoisted_195_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_198_1 := List( deduped_319_1, function ( logic_new_func_x_2 )
            return hoisted_197_1[1 + REM_INT( logic_new_func_x_2, hoisted_196_1 )];
        end );
    hoisted_187_1 := Product( [ deduped_351_1, deduped_351_1, deduped_351_1 ] );
    hoisted_186_1 := deduped_351_1 * deduped_351_1;
    hoisted_184_1 := Product( [ deduped_349_1, deduped_350_1, deduped_351_1 ] );
    hoisted_182_1 := deduped_351_1;
    hoisted_185_1 := List( deduped_319_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_184_1 ), hoisted_182_1 );
        end );
    hoisted_181_1 := deduped_349_1 * deduped_350_1;
    hoisted_183_1 := List( deduped_319_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_181_1 ), hoisted_182_1 );
        end );
    deduped_315_1 := Filtered( deduped_319_1, function ( x_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := 1 + x_2;
            deduped_2_2 := hoisted_185_1[deduped_3_2];
            deduped_1_2 := hoisted_183_1[deduped_3_2];
            return deduped_1_2 + deduped_1_2 * hoisted_182_1 + deduped_2_2 * hoisted_186_1 + deduped_2_2 * hoisted_187_1 = hoisted_198_1[deduped_3_2] + hoisted_201_1[deduped_3_2] * hoisted_182_1 + hoisted_208_1[deduped_3_2] * hoisted_186_1 + hoisted_210_1[deduped_3_2] * hoisted_187_1;
        end );
    hoisted_91_1 := deduped_340_1;
    hoisted_105_1 := List( deduped_327_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_91_1, function ( logic_new_func_x_3 )
                    return hoisted_42_1[1 + REM_INT( QUO_INT( i_2, hoisted_28_1 ^ logic_new_func_x_3 ), hoisted_28_1 )];
                end );
            return Sum( List( hoisted_91_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_95_1 := deduped_347_1;
    hoisted_92_1 := deduped_346_1;
    hoisted_106_1 := List( deduped_318_1, function ( logic_new_func_x_2 )
            return hoisted_105_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_92_1 ), hoisted_95_1 )];
        end );
    hoisted_102_1 := deduped_374_1[2];
    hoisted_98_1 := deduped_373_1[2];
    hoisted_101_1 := List( deduped_340_1, function ( logic_new_func_x_2 )
            return hoisted_36_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_98_1 ), hoisted_19_1 )];
        end );
    hoisted_99_1 := deduped_322_1[2];
    hoisted_100_1 := List( deduped_340_1, function ( logic_new_func_x_2 )
            return hoisted_99_1[1 + REM_INT( logic_new_func_x_2, hoisted_98_1 )];
        end );
    hoisted_84_1 := [ 0 .. deduped_358_1 - 1 ];
    hoisted_103_1 := List( deduped_326_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_84_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_14_1 ^ j_3 ), hoisted_14_1 );
                end );
            hoisted_2_2 := List( hoisted_91_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_100_1[deduped_1_3] + hoisted_101_1[deduped_1_3] * hoisted_102_1)];
                end );
            return Sum( List( hoisted_91_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_104_1 := List( deduped_318_1, function ( logic_new_func_x_2 )
            return hoisted_103_1[1 + REM_INT( logic_new_func_x_2, hoisted_92_1 )];
        end );
    hoisted_96_1 := List( deduped_327_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_91_1, function ( logic_new_func_x_3 )
                    return hoisted_29_1[1 + REM_INT( QUO_INT( i_2, hoisted_28_1 ^ logic_new_func_x_3 ), hoisted_28_1 )];
                end );
            return Sum( List( hoisted_91_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_97_1 := List( deduped_318_1, function ( logic_new_func_x_2 )
            return hoisted_96_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_92_1 ), hoisted_95_1 )];
        end );
    hoisted_90_1 := deduped_374_1[1];
    hoisted_86_1 := deduped_373_1[1];
    hoisted_89_1 := List( deduped_340_1, function ( logic_new_func_x_2 )
            return hoisted_20_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_86_1 ), hoisted_19_1 )];
        end );
    hoisted_87_1 := deduped_322_1[1];
    hoisted_88_1 := List( deduped_340_1, function ( logic_new_func_x_2 )
            return hoisted_87_1[1 + REM_INT( logic_new_func_x_2, hoisted_86_1 )];
        end );
    hoisted_93_1 := List( deduped_326_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_84_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_14_1 ^ j_3 ), hoisted_14_1 );
                end );
            hoisted_2_2 := List( hoisted_91_1, function ( logic_new_func_x_3 )
                    local deduped_1_3;
                    deduped_1_3 := 1 + logic_new_func_x_3;
                    return hoisted_1_2[1 + (hoisted_88_1[deduped_1_3] + hoisted_89_1[deduped_1_3] * hoisted_90_1)];
                end );
            return Sum( List( hoisted_91_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_94_1 := List( deduped_318_1, function ( logic_new_func_x_2 )
            return hoisted_93_1[1 + REM_INT( logic_new_func_x_2, hoisted_92_1 )];
        end );
    hoisted_83_1 := Product( [ deduped_348_1, deduped_348_1, deduped_348_1 ] );
    hoisted_82_1 := deduped_348_1 * deduped_348_1;
    hoisted_80_1 := Product( [ deduped_346_1, deduped_347_1, deduped_348_1 ] );
    hoisted_78_1 := deduped_348_1;
    hoisted_81_1 := List( deduped_318_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_80_1 ), hoisted_78_1 );
        end );
    hoisted_77_1 := deduped_346_1 * deduped_347_1;
    hoisted_79_1 := List( deduped_318_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_77_1 ), hoisted_78_1 );
        end );
    deduped_314_1 := Filtered( deduped_318_1, function ( x_2 )
            local deduped_1_2, deduped_2_2, deduped_3_2;
            deduped_3_2 := 1 + x_2;
            deduped_2_2 := hoisted_81_1[deduped_3_2];
            deduped_1_2 := hoisted_79_1[deduped_3_2];
            return deduped_1_2 + deduped_1_2 * hoisted_78_1 + deduped_2_2 * hoisted_82_1 + deduped_2_2 * hoisted_83_1 = hoisted_94_1[deduped_3_2] + hoisted_97_1[deduped_3_2] * hoisted_78_1 + hoisted_104_1[deduped_3_2] * hoisted_82_1 + hoisted_106_1[deduped_3_2] * hoisted_83_1;
        end );
    hoisted_6_1 := deduped_409_1;
    hoisted_3_1 := deduped_407_1;
    hoisted_2_1 := RangeCategoryOfHomomorphismStructure( cat_1 );
    deduped_313_1 := List( deduped_407_1, function ( logic_new_func_x_2 )
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
    deduped_312_1 := deduped_313_1[2];
    deduped_311_1 := deduped_313_1[1];
    deduped_310_1 := [ 0 .. Length( deduped_317_1 ) - 1 ];
    deduped_309_1 := [ 0 .. Length( deduped_316_1 ) - 1 ];
    deduped_308_1 := [ 0 .. Length( deduped_315_1 ) - 1 ];
    deduped_307_1 := [ 0 .. Length( deduped_314_1 ) - 1 ];
    deduped_306_1 := deduped_312_1[2];
    deduped_305_1 := deduped_311_1[2];
    deduped_304_1 := List( deduped_306_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_303_1 := List( deduped_306_1, AsList );
    deduped_302_1 := List( deduped_306_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_301_1 := List( deduped_305_1, function ( logic_new_func_x_2 )
            return Length( Range( logic_new_func_x_2 ) );
        end );
    deduped_300_1 := List( deduped_305_1, AsList );
    deduped_299_1 := List( deduped_305_1, function ( logic_new_func_x_2 )
            return Length( Source( logic_new_func_x_2 ) );
        end );
    deduped_298_1 := List( deduped_312_1[1], Length );
    deduped_297_1 := List( deduped_311_1[1], Length );
    deduped_296_1 := deduped_298_1[2] * deduped_414_1;
    deduped_295_1 := deduped_298_1[1] * deduped_412_1;
    deduped_294_1 := deduped_297_1[2] * deduped_414_1;
    deduped_293_1 := deduped_297_1[1] * deduped_412_1;
    deduped_292_1 := deduped_410_1 ^ deduped_296_1;
    deduped_291_1 := deduped_413_1 ^ deduped_296_1;
    deduped_290_1 := deduped_410_1 ^ deduped_295_1;
    deduped_289_1 := deduped_410_1 ^ deduped_294_1;
    deduped_288_1 := deduped_413_1 ^ deduped_294_1;
    deduped_287_1 := deduped_410_1 ^ deduped_293_1;
    deduped_286_1 := [ 0 .. deduped_296_1 - 1 ];
    deduped_285_1 := [ 0 .. deduped_294_1 - 1 ];
    deduped_284_1 := [ 0 .. deduped_291_1 - 1 ];
    deduped_283_1 := [ 0 .. deduped_290_1 - 1 ];
    deduped_282_1 := [ 0 .. deduped_288_1 - 1 ];
    deduped_281_1 := [ 0 .. deduped_287_1 - 1 ];
    deduped_280_1 := [ 0 .. Product( [ deduped_290_1, deduped_291_1, deduped_292_1, deduped_292_1 ] ) - 1 ];
    deduped_279_1 := [ 0 .. Product( [ deduped_287_1, deduped_288_1, deduped_289_1, deduped_289_1 ] ) - 1 ];
    hoisted_242_1 := deduped_339_1;
    hoisted_247_1 := List( deduped_398_1, function ( logic_new_func_x_2 )
            return hoisted_242_1[1 + logic_new_func_x_2];
        end );
    hoisted_248_1 := List( deduped_366_1, function ( j_2 )
            return Product( hoisted_247_1{[ 1 .. j_2 ]} );
        end );
    hoisted_245_1 := deduped_310_1;
    hoisted_244_1 := deduped_317_1;
    hoisted_243_1 := deduped_321_1;
    hoisted_246_1 := List( deduped_398_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_242_1[1 + logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_242_1{[ 1 .. logic_new_func_x_2 ]} );
            hoisted_3_2 := List( hoisted_243_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_245_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_244_1[(1 + i_3)]];
                end );
        end );
    hoisted_145_1 := [ 1 .. deduped_387_1 ];
    hoisted_278_1 := List( deduped_310_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_145_1, function ( j_3 )
                    return hoisted_246_1[j_3][hoisted_1_2] * hoisted_248_1[j_3];
                end );
        end );
    hoisted_250_1 := [ deduped_364_1, deduped_365_1 ];
    hoisted_267_1 := List( deduped_403_1, function ( logic_new_func_x_2 )
            return hoisted_146_1[logic_new_func_x_2] ^ hoisted_250_1[logic_new_func_x_2];
        end );
    hoisted_268_1 := List( deduped_398_1, function ( j_2 )
            return Product( hoisted_267_1{[ 1 .. j_2 ]} );
        end );
    hoisted_265_1 := deduped_368_1;
    hoisted_264_1 := deduped_397_1;
    hoisted_261_1 := deduped_372_1;
    hoisted_257_1 := deduped_383_1;
    hoisted_260_1 := List( deduped_345_1, function ( logic_new_func_x_2 )
            return REM_INT( QUO_INT( logic_new_func_x_2, hoisted_257_1 ), hoisted_19_1 );
        end );
    hoisted_258_1 := deduped_335_1[2];
    hoisted_259_1 := List( deduped_345_1, function ( logic_new_func_x_2 )
            return hoisted_258_1[1 + REM_INT( logic_new_func_x_2, hoisted_257_1 )];
        end );
    hoisted_256_1 := deduped_371_1;
    hoisted_252_1 := deduped_382_1;
    hoisted_154_1 := deduped_412_1;
    hoisted_255_1 := List( deduped_344_1, function ( logic_new_func_x_2 )
            return REM_INT( QUO_INT( logic_new_func_x_2, hoisted_252_1 ), hoisted_154_1 );
        end );
    hoisted_253_1 := deduped_335_1[1];
    hoisted_254_1 := List( deduped_344_1, function ( logic_new_func_x_2 )
            return hoisted_253_1[1 + REM_INT( logic_new_func_x_2, hoisted_252_1 )];
        end );
    hoisted_262_1 := [ List( deduped_344_1, function ( i_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + i_2;
                return hoisted_254_1[deduped_1_2] + hoisted_255_1[deduped_1_2] * hoisted_256_1;
            end ), List( deduped_345_1, function ( i_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + i_2;
                return hoisted_259_1[deduped_1_2] + hoisted_260_1[deduped_1_2] * hoisted_261_1;
            end ) ];
    hoisted_149_1 := [ [ 0 .. deduped_410_1 - 1 ], [ 0 .. deduped_413_1 - 1 ] ];
    hoisted_263_1 := List( deduped_403_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := hoisted_249_1[logic_new_func_x_2];
            deduped_6_2 := hoisted_146_1[logic_new_func_x_2];
            hoisted_5_2 := [ 0 .. hoisted_250_1[logic_new_func_x_2] - 1 ];
            hoisted_4_2 := hoisted_149_1[logic_new_func_x_2];
            hoisted_3_2 := hoisted_262_1[logic_new_func_x_2];
            hoisted_2_2 := [ 0 .. deduped_7_2 - 1 ];
            hoisted_1_2 := deduped_6_2;
            return List( [ 0 .. deduped_6_2 ^ deduped_7_2 - 1 ], function ( i_3 )
                    local hoisted_1_3, hoisted_2_3;
                    hoisted_1_3 := List( hoisted_2_2, function ( j_4 )
                            return REM_INT( QUO_INT( i_3, hoisted_1_2 ^ j_4 ), hoisted_1_2 );
                        end );
                    hoisted_2_3 := List( hoisted_5_2, function ( logic_new_func_x_4 )
                            return hoisted_4_2[1 + hoisted_1_3[(1 + hoisted_3_2[(1 + logic_new_func_x_4)])]];
                        end );
                    return Sum( List( hoisted_5_2, function ( k_4 )
                              return hoisted_2_3[(1 + k_4)] * hoisted_1_2 ^ k_4;
                          end ) );
                end );
        end );
    hoisted_266_1 := List( deduped_403_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_263_1[logic_new_func_x_2];
            hoisted_2_2 := hoisted_264_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_264_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_265_1, function ( logic_new_func_x_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( logic_new_func_x_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_169_1 := deduped_403_1;
    hoisted_276_1 := List( deduped_368_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_169_1, function ( j_3 )
                    return hoisted_266_1[j_3][hoisted_1_2] * hoisted_268_1[j_3];
                end );
        end );
    hoisted_269_1 := deduped_337_1;
    hoisted_274_1 := List( deduped_398_1, function ( logic_new_func_x_2 )
            return hoisted_269_1[1 + logic_new_func_x_2];
        end );
    hoisted_275_1 := List( deduped_366_1, function ( j_2 )
            return Product( hoisted_274_1{[ 1 .. j_2 ]} );
        end );
    hoisted_272_1 := deduped_308_1;
    hoisted_271_1 := deduped_315_1;
    hoisted_270_1 := deduped_319_1;
    hoisted_273_1 := List( deduped_398_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_269_1[1 + logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_269_1{[ 1 .. logic_new_func_x_2 ]} );
            hoisted_3_2 := List( hoisted_270_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_272_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_271_1[(1 + i_3)]];
                end );
        end );
    hoisted_277_1 := List( deduped_308_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + logic_new_func_x_2;
            return hoisted_276_1[1 + Sum( hoisted_145_1, function ( j_3 )
                       return hoisted_273_1[j_3][hoisted_1_2] * hoisted_275_1[j_3];
                   end )];
        end );
    hoisted_138_1 := deduped_338_1;
    hoisted_143_1 := List( deduped_398_1, function ( logic_new_func_x_2 )
            return hoisted_138_1[1 + logic_new_func_x_2];
        end );
    hoisted_144_1 := List( deduped_366_1, function ( j_2 )
            return Product( hoisted_143_1{[ 1 .. j_2 ]} );
        end );
    hoisted_141_1 := deduped_309_1;
    hoisted_140_1 := deduped_316_1;
    hoisted_139_1 := deduped_320_1;
    hoisted_142_1 := List( deduped_398_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_138_1[1 + logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_138_1{[ 1 .. logic_new_func_x_2 ]} );
            hoisted_3_2 := List( hoisted_139_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_141_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_140_1[(1 + i_3)]];
                end );
        end );
    hoisted_179_1 := List( deduped_309_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_145_1, function ( j_3 )
                    return hoisted_142_1[j_3][hoisted_1_2] * hoisted_144_1[j_3];
                end );
        end );
    hoisted_148_1 := [ deduped_362_1, deduped_363_1 ];
    hoisted_167_1 := List( deduped_403_1, function ( logic_new_func_x_2 )
            return hoisted_146_1[logic_new_func_x_2] ^ hoisted_148_1[logic_new_func_x_2];
        end );
    hoisted_168_1 := List( deduped_398_1, function ( j_2 )
            return Product( hoisted_167_1{[ 1 .. j_2 ]} );
        end );
    hoisted_165_1 := deduped_367_1;
    hoisted_164_1 := deduped_396_1;
    hoisted_161_1 := deduped_370_1;
    hoisted_157_1 := deduped_376_1;
    hoisted_160_1 := List( deduped_342_1, function ( logic_new_func_x_2 )
            return REM_INT( QUO_INT( logic_new_func_x_2, hoisted_157_1 ), hoisted_19_1 );
        end );
    hoisted_158_1 := deduped_334_1[2];
    hoisted_159_1 := List( deduped_342_1, function ( logic_new_func_x_2 )
            return hoisted_158_1[1 + REM_INT( logic_new_func_x_2, hoisted_157_1 )];
        end );
    hoisted_156_1 := deduped_369_1;
    hoisted_151_1 := deduped_375_1;
    hoisted_155_1 := List( deduped_341_1, function ( logic_new_func_x_2 )
            return REM_INT( QUO_INT( logic_new_func_x_2, hoisted_151_1 ), hoisted_154_1 );
        end );
    hoisted_152_1 := deduped_334_1[1];
    hoisted_153_1 := List( deduped_341_1, function ( logic_new_func_x_2 )
            return hoisted_152_1[1 + REM_INT( logic_new_func_x_2, hoisted_151_1 )];
        end );
    hoisted_162_1 := [ List( deduped_341_1, function ( i_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + i_2;
                return hoisted_153_1[deduped_1_2] + hoisted_155_1[deduped_1_2] * hoisted_156_1;
            end ), List( deduped_342_1, function ( i_2 )
                local deduped_1_2;
                deduped_1_2 := 1 + i_2;
                return hoisted_159_1[deduped_1_2] + hoisted_160_1[deduped_1_2] * hoisted_161_1;
            end ) ];
    hoisted_163_1 := List( deduped_403_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2, hoisted_4_2, hoisted_5_2, deduped_6_2, deduped_7_2;
            deduped_7_2 := hoisted_147_1[logic_new_func_x_2];
            deduped_6_2 := hoisted_146_1[logic_new_func_x_2];
            hoisted_5_2 := [ 0 .. hoisted_148_1[logic_new_func_x_2] - 1 ];
            hoisted_4_2 := hoisted_149_1[logic_new_func_x_2];
            hoisted_3_2 := hoisted_162_1[logic_new_func_x_2];
            hoisted_2_2 := [ 0 .. deduped_7_2 - 1 ];
            hoisted_1_2 := deduped_6_2;
            return List( [ 0 .. deduped_6_2 ^ deduped_7_2 - 1 ], function ( i_3 )
                    local hoisted_1_3, hoisted_2_3;
                    hoisted_1_3 := List( hoisted_2_2, function ( j_4 )
                            return REM_INT( QUO_INT( i_3, hoisted_1_2 ^ j_4 ), hoisted_1_2 );
                        end );
                    hoisted_2_3 := List( hoisted_5_2, function ( logic_new_func_x_4 )
                            return hoisted_4_2[1 + hoisted_1_3[(1 + hoisted_3_2[(1 + logic_new_func_x_4)])]];
                        end );
                    return Sum( List( hoisted_5_2, function ( k_4 )
                              return hoisted_2_3[(1 + k_4)] * hoisted_1_2 ^ k_4;
                          end ) );
                end );
        end );
    hoisted_166_1 := List( deduped_403_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_3_2 := hoisted_163_1[logic_new_func_x_2];
            hoisted_2_2 := hoisted_164_1[logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_164_1{[ 1 .. logic_new_func_x_2 - 1 ]} );
            return List( hoisted_165_1, function ( logic_new_func_x_3 )
                    return hoisted_3_2[1 + REM_INT( QUO_INT( logic_new_func_x_3, hoisted_1_2 ), hoisted_2_2 )];
                end );
        end );
    hoisted_177_1 := List( deduped_367_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + i_2;
            return Sum( hoisted_169_1, function ( j_3 )
                    return hoisted_166_1[j_3][hoisted_1_2] * hoisted_168_1[j_3];
                end );
        end );
    hoisted_170_1 := deduped_336_1;
    hoisted_175_1 := List( deduped_398_1, function ( logic_new_func_x_2 )
            return hoisted_170_1[1 + logic_new_func_x_2];
        end );
    hoisted_176_1 := List( deduped_366_1, function ( j_2 )
            return Product( hoisted_175_1{[ 1 .. j_2 ]} );
        end );
    hoisted_173_1 := deduped_307_1;
    hoisted_172_1 := deduped_314_1;
    hoisted_171_1 := deduped_318_1;
    hoisted_174_1 := List( deduped_398_1, function ( logic_new_func_x_2 )
            local hoisted_1_2, hoisted_2_2, hoisted_3_2;
            hoisted_2_2 := hoisted_170_1[1 + logic_new_func_x_2];
            hoisted_1_2 := Product( hoisted_170_1{[ 1 .. logic_new_func_x_2 ]} );
            hoisted_3_2 := List( hoisted_171_1, function ( i_3 )
                    return REM_INT( QUO_INT( i_3, hoisted_1_2 ), hoisted_2_2 );
                end );
            return List( hoisted_173_1, function ( i_3 )
                    return hoisted_3_2[1 + hoisted_172_1[(1 + i_3)]];
                end );
        end );
    hoisted_178_1 := List( deduped_307_1, function ( logic_new_func_x_2 )
            local hoisted_1_2;
            hoisted_1_2 := 1 + logic_new_func_x_2;
            return hoisted_177_1[1 + Sum( hoisted_145_1, function ( j_3 )
                       return hoisted_174_1[j_3][hoisted_1_2] * hoisted_176_1[j_3];
                   end )];
        end );
    hoisted_59_1 := deduped_286_1;
    hoisted_74_1 := List( deduped_284_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_59_1, function ( logic_new_func_x_3 )
                    return hoisted_42_1[1 + REM_INT( QUO_INT( i_2, hoisted_28_1 ^ logic_new_func_x_3 ), hoisted_28_1 )];
                end );
            return Sum( List( hoisted_59_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_63_1 := deduped_291_1;
    hoisted_60_1 := deduped_290_1;
    hoisted_75_1 := List( deduped_280_1, function ( logic_new_func_x_2 )
            return hoisted_74_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_60_1 ), hoisted_63_1 )];
        end );
    hoisted_70_1 := deduped_304_1[2];
    hoisted_66_1 := deduped_302_1[2];
    hoisted_69_1 := List( deduped_286_1, function ( logic_new_func_x_2 )
            return hoisted_36_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_66_1 ), hoisted_19_1 )];
        end );
    hoisted_67_1 := deduped_303_1[2];
    hoisted_68_1 := List( deduped_286_1, function ( logic_new_func_x_2 )
            return hoisted_67_1[1 + REM_INT( logic_new_func_x_2, hoisted_66_1 )];
        end );
    hoisted_71_1 := List( deduped_286_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return hoisted_68_1[deduped_1_2] + hoisted_69_1[deduped_1_2] * hoisted_70_1;
        end );
    hoisted_52_1 := [ 0 .. deduped_295_1 - 1 ];
    hoisted_72_1 := List( deduped_283_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_52_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_14_1 ^ j_3 ), hoisted_14_1 );
                end );
            hoisted_2_2 := List( hoisted_59_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[1 + hoisted_71_1[(1 + logic_new_func_x_3)]];
                end );
            return Sum( List( hoisted_59_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_73_1 := List( deduped_280_1, function ( logic_new_func_x_2 )
            return hoisted_72_1[1 + REM_INT( logic_new_func_x_2, hoisted_60_1 )];
        end );
    hoisted_64_1 := List( deduped_284_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_59_1, function ( logic_new_func_x_3 )
                    return hoisted_29_1[1 + REM_INT( QUO_INT( i_2, hoisted_28_1 ^ logic_new_func_x_3 ), hoisted_28_1 )];
                end );
            return Sum( List( hoisted_59_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_65_1 := List( deduped_280_1, function ( logic_new_func_x_2 )
            return hoisted_64_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_60_1 ), hoisted_63_1 )];
        end );
    hoisted_57_1 := deduped_304_1[1];
    hoisted_53_1 := deduped_302_1[1];
    hoisted_56_1 := List( deduped_286_1, function ( logic_new_func_x_2 )
            return hoisted_20_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_53_1 ), hoisted_19_1 )];
        end );
    hoisted_54_1 := deduped_303_1[1];
    hoisted_55_1 := List( deduped_286_1, function ( logic_new_func_x_2 )
            return hoisted_54_1[1 + REM_INT( logic_new_func_x_2, hoisted_53_1 )];
        end );
    hoisted_58_1 := List( deduped_286_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return hoisted_55_1[deduped_1_2] + hoisted_56_1[deduped_1_2] * hoisted_57_1;
        end );
    hoisted_61_1 := List( deduped_283_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_52_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_14_1 ^ j_3 ), hoisted_14_1 );
                end );
            hoisted_2_2 := List( hoisted_59_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[1 + hoisted_58_1[(1 + logic_new_func_x_3)]];
                end );
            return Sum( List( hoisted_59_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_62_1 := List( deduped_280_1, function ( logic_new_func_x_2 )
            return hoisted_61_1[1 + REM_INT( logic_new_func_x_2, hoisted_60_1 )];
        end );
    hoisted_51_1 := Product( [ deduped_292_1, deduped_292_1, deduped_292_1 ] );
    hoisted_50_1 := deduped_292_1 * deduped_292_1;
    hoisted_48_1 := Product( [ deduped_290_1, deduped_291_1, deduped_292_1 ] );
    hoisted_46_1 := deduped_292_1;
    hoisted_49_1 := List( deduped_280_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_48_1 ), hoisted_46_1 );
        end );
    hoisted_45_1 := deduped_290_1 * deduped_291_1;
    hoisted_47_1 := List( deduped_280_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_45_1 ), hoisted_46_1 );
        end );
    hoisted_24_1 := deduped_285_1;
    hoisted_43_1 := List( deduped_282_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_24_1, function ( logic_new_func_x_3 )
                    return hoisted_42_1[1 + REM_INT( QUO_INT( i_2, hoisted_28_1 ^ logic_new_func_x_3 ), hoisted_28_1 )];
                end );
            return Sum( List( hoisted_24_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_30_1 := deduped_288_1;
    hoisted_25_1 := deduped_287_1;
    hoisted_44_1 := List( deduped_279_1, function ( logic_new_func_x_2 )
            return hoisted_43_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_25_1 ), hoisted_30_1 )];
        end );
    hoisted_38_1 := deduped_301_1[2];
    hoisted_33_1 := deduped_299_1[2];
    hoisted_37_1 := List( deduped_285_1, function ( logic_new_func_x_2 )
            return hoisted_36_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_33_1 ), hoisted_19_1 )];
        end );
    hoisted_34_1 := deduped_300_1[2];
    hoisted_35_1 := List( deduped_285_1, function ( logic_new_func_x_2 )
            return hoisted_34_1[1 + REM_INT( logic_new_func_x_2, hoisted_33_1 )];
        end );
    hoisted_39_1 := List( deduped_285_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return hoisted_35_1[deduped_1_2] + hoisted_37_1[deduped_1_2] * hoisted_38_1;
        end );
    hoisted_15_1 := [ 0 .. deduped_293_1 - 1 ];
    hoisted_40_1 := List( deduped_281_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_15_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_14_1 ^ j_3 ), hoisted_14_1 );
                end );
            hoisted_2_2 := List( hoisted_24_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[1 + hoisted_39_1[(1 + logic_new_func_x_3)]];
                end );
            return Sum( List( hoisted_24_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_41_1 := List( deduped_279_1, function ( logic_new_func_x_2 )
            return hoisted_40_1[1 + REM_INT( logic_new_func_x_2, hoisted_25_1 )];
        end );
    hoisted_31_1 := List( deduped_282_1, function ( i_2 )
            local hoisted_1_2;
            hoisted_1_2 := List( hoisted_24_1, function ( logic_new_func_x_3 )
                    return hoisted_29_1[1 + REM_INT( QUO_INT( i_2, hoisted_28_1 ^ logic_new_func_x_3 ), hoisted_28_1 )];
                end );
            return Sum( List( hoisted_24_1, function ( k_3 )
                      return hoisted_1_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_32_1 := List( deduped_279_1, function ( logic_new_func_x_2 )
            return hoisted_31_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_25_1 ), hoisted_30_1 )];
        end );
    hoisted_22_1 := deduped_301_1[1];
    hoisted_16_1 := deduped_299_1[1];
    hoisted_21_1 := List( deduped_285_1, function ( logic_new_func_x_2 )
            return hoisted_20_1[1 + REM_INT( QUO_INT( logic_new_func_x_2, hoisted_16_1 ), hoisted_19_1 )];
        end );
    hoisted_17_1 := deduped_300_1[1];
    hoisted_18_1 := List( deduped_285_1, function ( logic_new_func_x_2 )
            return hoisted_17_1[1 + REM_INT( logic_new_func_x_2, hoisted_16_1 )];
        end );
    hoisted_23_1 := List( deduped_285_1, function ( i_2 )
            local deduped_1_2;
            deduped_1_2 := 1 + i_2;
            return hoisted_18_1[deduped_1_2] + hoisted_21_1[deduped_1_2] * hoisted_22_1;
        end );
    hoisted_26_1 := List( deduped_281_1, function ( i_2 )
            local hoisted_1_2, hoisted_2_2;
            hoisted_1_2 := List( hoisted_15_1, function ( j_3 )
                    return REM_INT( QUO_INT( i_2, hoisted_14_1 ^ j_3 ), hoisted_14_1 );
                end );
            hoisted_2_2 := List( hoisted_24_1, function ( logic_new_func_x_3 )
                    return hoisted_1_2[1 + hoisted_23_1[(1 + logic_new_func_x_3)]];
                end );
            return Sum( List( hoisted_24_1, function ( k_3 )
                      return hoisted_2_2[(1 + k_3)] * hoisted_14_1 ^ k_3;
                  end ) );
        end );
    hoisted_27_1 := List( deduped_279_1, function ( logic_new_func_x_2 )
            return hoisted_26_1[1 + REM_INT( logic_new_func_x_2, hoisted_25_1 )];
        end );
    hoisted_13_1 := Product( [ deduped_289_1, deduped_289_1, deduped_289_1 ] );
    hoisted_12_1 := deduped_289_1 * deduped_289_1;
    hoisted_10_1 := Product( [ deduped_287_1, deduped_288_1, deduped_289_1 ] );
    hoisted_8_1 := deduped_289_1;
    hoisted_11_1 := List( deduped_279_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_10_1 ), hoisted_8_1 );
        end );
    hoisted_7_1 := deduped_287_1 * deduped_288_1;
    hoisted_9_1 := List( deduped_279_1, function ( i_2 )
            return REM_INT( QUO_INT( i_2, hoisted_7_1 ), hoisted_8_1 );
        end );
    return CreateCapCategoryObjectWithAttributes( cat_1, DefiningTripleOfQuiver, NTuple( 3, Length( Filtered( deduped_279_1, function ( x_2 )
                  local deduped_1_2, deduped_2_2, deduped_3_2;
                  deduped_3_2 := 1 + x_2;
                  deduped_2_2 := hoisted_11_1[deduped_3_2];
                  deduped_1_2 := hoisted_9_1[deduped_3_2];
                  return deduped_1_2 + deduped_1_2 * hoisted_8_1 + deduped_2_2 * hoisted_12_1 + deduped_2_2 * hoisted_13_1 = hoisted_27_1[deduped_3_2] + hoisted_32_1[deduped_3_2] * hoisted_8_1 + hoisted_41_1[deduped_3_2] * hoisted_12_1 + hoisted_44_1[deduped_3_2] * hoisted_13_1;
              end ) ), Length( Filtered( deduped_280_1, function ( x_2 )
                  local deduped_1_2, deduped_2_2, deduped_3_2;
                  deduped_3_2 := 1 + x_2;
                  deduped_2_2 := hoisted_49_1[deduped_3_2];
                  deduped_1_2 := hoisted_47_1[deduped_3_2];
                  return deduped_1_2 + deduped_1_2 * hoisted_46_1 + deduped_2_2 * hoisted_50_1 + deduped_2_2 * hoisted_51_1 = hoisted_62_1[deduped_3_2] + hoisted_65_1[deduped_3_2] * hoisted_46_1 + hoisted_73_1[deduped_3_2] * hoisted_50_1 + hoisted_75_1[deduped_3_2] * hoisted_51_1;
              end ) ), ListN( List( deduped_307_1, function ( x_2 )
                  return -1 + SafePosition( hoisted_179_1, hoisted_178_1[(1 + x_2)] );
              end ), List( deduped_308_1, function ( x_2 )
                  return -1 + SafePosition( hoisted_278_1, hoisted_277_1[(1 + x_2)] );
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

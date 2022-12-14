-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from fp_Add_Sub_0002
-- VHDL created on Mon Nov 28 21:39:20 2022


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity fp_Add_Sub_0002 is
    port (
        a : in std_logic_vector(15 downto 0);  -- float16_m10
        b : in std_logic_vector(15 downto 0);  -- float16_m10
        opSel : in std_logic_vector(0 downto 0);  -- ufix1
        q : out std_logic_vector(15 downto 0);  -- float16_m10
        clk : in std_logic;
        areset : in std_logic
    );
end fp_Add_Sub_0002;

architecture normal of fp_Add_Sub_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signB_uid6_fpAddSubTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal restB_uid7_fpAddSubTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal invSignB_uid8_fpAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal muxSignB_uid9_fpAddSubTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal muxSignB_uid9_fpAddSubTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bOperand_uid10_fpAddSubTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal expFracX_uid15_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (14 downto 0);
    signal expFracY_uid16_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (14 downto 0);
    signal xGTEy_uid17_fpAddSubTest_ieeeAdd_a : STD_LOGIC_VECTOR (16 downto 0);
    signal xGTEy_uid17_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (16 downto 0);
    signal xGTEy_uid17_fpAddSubTest_ieeeAdd_o : STD_LOGIC_VECTOR (16 downto 0);
    signal xGTEy_uid17_fpAddSubTest_ieeeAdd_n : STD_LOGIC_VECTOR (0 downto 0);
    signal sigY_uid18_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracY_uid19_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expY_uid20_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (4 downto 0);
    signal ypn_uid21_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (15 downto 0);
    signal aSig_uid25_fpAddSubTest_ieeeAdd_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aSig_uid25_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (15 downto 0);
    signal bSig_uid26_fpAddSubTest_ieeeAdd_s : STD_LOGIC_VECTOR (0 downto 0);
    signal bSig_uid26_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (15 downto 0);
    signal cstAllOWE_uid27_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstZeroWF_uid28_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (9 downto 0);
    signal cstAllZWE_uid29_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (4 downto 0);
    signal exp_aSig_uid30_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (14 downto 0);
    signal exp_aSig_uid30_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (4 downto 0);
    signal frac_aSig_uid31_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (9 downto 0);
    signal frac_aSig_uid31_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (9 downto 0);
    signal excZ_aSig_uid25_uid32_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid33_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid34_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid35_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_aSig_uid36_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid37_fpAddSubTest_ieeeAdd_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_aSig_uid37_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid38_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid39_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_aSig_uid40_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_bSig_uid44_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (14 downto 0);
    signal exp_bSig_uid44_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (4 downto 0);
    signal frac_bSig_uid45_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (9 downto 0);
    signal frac_bSig_uid45_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (9 downto 0);
    signal excZ_bSig_uid26_uid46_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid47_fpAddSubTest_ieeeAdd_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid47_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid48_fpAddSubTest_ieeeAdd_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid48_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid49_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_bSig_uid50_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid51_fpAddSubTest_ieeeAdd_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_bSig_uid51_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid52_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid53_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_bSig_uid54_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigA_uid59_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sigB_uid60_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid61_fpAddSubTest_ieeeAdd_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal effSub_uid61_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid65_fpAddSubTest_ieeeAdd_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracBz_uid65_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (9 downto 0);
    signal oFracB_uid68_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expAmExpB_uid69_fpAddSubTest_ieeeAdd_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpB_uid69_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpB_uid69_fpAddSubTest_ieeeAdd_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expAmExpB_uid69_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (5 downto 0);
    signal cWFP2_uid70_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (3 downto 0);
    signal shiftedOut_uid72_fpAddSubTest_ieeeAdd_a : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid72_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid72_fpAddSubTest_ieeeAdd_o : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid72_fpAddSubTest_ieeeAdd_c : STD_LOGIC_VECTOR (0 downto 0);
    signal padConst_uid73_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightPaddedIn_uid74_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (22 downto 0);
    signal iShiftedOut_uid76_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal alignFracBPostShiftOut_uid77_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (22 downto 0);
    signal alignFracBPostShiftOut_uid77_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cmpEQ_stickyBits_cZwF_uid80_fpAddSubTest_ieeeAdd_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal cmpEQ_stickyBits_cZwF_uid80_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invCmpEQ_stickyBits_cZwF_uid81_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal effSubInvSticky_uid83_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal zocst_uid85_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracAAddOp_uid86_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (13 downto 0);
    signal fracBAddOp_uid89_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (13 downto 0);
    signal fracBAddOpPostXor_uid90_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (13 downto 0);
    signal fracBAddOpPostXor_uid90_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (13 downto 0);
    signal fracAddResult_uid91_fpAddSubTest_ieeeAdd_a : STD_LOGIC_VECTOR (14 downto 0);
    signal fracAddResult_uid91_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (14 downto 0);
    signal fracAddResult_uid91_fpAddSubTest_ieeeAdd_o : STD_LOGIC_VECTOR (14 downto 0);
    signal fracAddResult_uid91_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (14 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid92_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (13 downto 0);
    signal rangeFracAddResultMwfp3Dto0_uid92_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (13 downto 0);
    signal fracGRS_uid93_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (14 downto 0);
    signal cAmA_uid95_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (3 downto 0);
    signal aMinusA_uid96_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNorm_uid98_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (13 downto 0);
    signal oneCST_uid99_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (4 downto 0);
    signal expInc_uid100_fpAddSubTest_ieeeAdd_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expInc_uid100_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expInc_uid100_fpAddSubTest_ieeeAdd_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expInc_uid100_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expPostNorm_uid101_fpAddSubTest_ieeeAdd_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNorm_uid101_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNorm_uid101_fpAddSubTest_ieeeAdd_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expPostNorm_uid101_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (6 downto 0);
    signal Sticky0_uid102_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky0_uid102_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Sticky1_uid103_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (1 downto 0);
    signal Sticky1_uid103_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Round_uid104_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (2 downto 0);
    signal Round_uid104_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal Guard_uid105_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (3 downto 0);
    signal Guard_uid105_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal LSB_uid106_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (4 downto 0);
    signal LSB_uid106_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rndBitCond_uid107_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cRBit_uid108_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (4 downto 0);
    signal rBi_uid109_fpAddSubTest_ieeeAdd_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal rBi_uid109_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal roundBit_uid110_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracPostNormRndRange_uid111_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (12 downto 0);
    signal fracPostNormRndRange_uid111_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expFracR_uid112_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (17 downto 0);
    signal rndExpFrac_uid113_fpAddSubTest_ieeeAdd_a : STD_LOGIC_VECTOR (18 downto 0);
    signal rndExpFrac_uid113_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (18 downto 0);
    signal rndExpFrac_uid113_fpAddSubTest_ieeeAdd_o : STD_LOGIC_VECTOR (18 downto 0);
    signal rndExpFrac_uid113_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (18 downto 0);
    signal wEP2AllOwE_uid114_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (6 downto 0);
    signal rndExp_uid115_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (17 downto 0);
    signal rndExp_uid115_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rOvfEQMax_uid116_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rndExpFracOvfBits_uid118_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (17 downto 0);
    signal rndExpFracOvfBits_uid118_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rOvfExtraBits_uid119_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rOvf_uid120_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal wEP2AllZ_uid121_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (6 downto 0);
    signal rUdfEQMin_uid122_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdfExtraBit_uid123_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (17 downto 0);
    signal rUdfExtraBit_uid123_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rUdf_uid124_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPreExc_uid125_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPreExc_uid125_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expRPreExc_uid126_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (15 downto 0);
    signal expRPreExc_uid126_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (4 downto 0);
    signal regInputs_uid127_fpAddSubTest_ieeeAdd_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal regInputs_uid127_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZeroVInC_uid128_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (4 downto 0);
    signal excRZero_uid129_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rInfOvf_uid130_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInfVInC_uid131_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (5 downto 0);
    signal excRInf_uid132_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN2_uid133_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAIBISub_uid134_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid135_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid136_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid137_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (1 downto 0);
    signal invAMinusA_uid138_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRReg_uid139_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigBBInf_uid140_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sigAAInf_uid141_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInf_uid142_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excAZBZSigASigB_uid143_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excBZARSigA_uid144_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRZero_uid145_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid146_fpAddSubTest_ieeeAdd_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRInfRZRReg_uid146_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid147_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid148_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneFracRPostExc2_uid149_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (9 downto 0);
    signal fracRPostExc_uid152_fpAddSubTest_ieeeAdd_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid152_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRPostExc_uid156_fpAddSubTest_ieeeAdd_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid156_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (4 downto 0);
    signal R_uid157_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (15 downto 0);
    signal zs_uid159_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid160_lzCountVal_uid94_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid161_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal mO_uid162_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStage_uid163_lzCountVal_uid94_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (6 downto 0);
    signal vStage_uid163_lzCountVal_uid94_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (6 downto 0);
    signal cStage_uid164_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (7 downto 0);
    signal vStagei_uid166_lzCountVal_uid94_fpAddSubTest_ieeeAdd_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid166_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid167_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid169_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid172_lzCountVal_uid94_fpAddSubTest_ieeeAdd_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid172_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid173_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid175_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid178_lzCountVal_uid94_fpAddSubTest_ieeeAdd_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid178_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid180_lzCountVal_uid94_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid181_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid182_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (3 downto 0);
    signal wIntCst_uid186_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (4 downto 0);
    signal shiftedOut_uid187_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_a : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid187_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid187_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_o : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid187_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_n : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng8_uid188_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (14 downto 0);
    signal rightShiftStage0Idx1_uid190_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage0Idx2Rng16_uid191_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rightShiftStage0Idx2Pad16_uid192_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (15 downto 0);
    signal rightShiftStage0Idx2_uid193_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage0Idx3_uid194_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage0_uid196_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid196_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage1Idx1Rng2_uid197_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (20 downto 0);
    signal rightShiftStage1Idx1_uid199_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage1Idx2Rng4_uid200_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (18 downto 0);
    signal rightShiftStage1Idx2_uid202_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage1Idx3Rng6_uid203_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (16 downto 0);
    signal rightShiftStage1Idx3Pad6_uid204_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage1Idx3_uid205_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage1_uid207_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid207_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage2Idx1Rng1_uid208_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (21 downto 0);
    signal rightShiftStage2Idx1_uid210_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage2_uid212_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage2_uid212_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (22 downto 0);
    signal r_uid214_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid214_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (22 downto 0);
    signal leftShiftStage0Idx1Rng4_uid219_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (10 downto 0);
    signal leftShiftStage0Idx1Rng4_uid219_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (10 downto 0);
    signal leftShiftStage0Idx1_uid220_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage0Idx2_uid223_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage0Idx3Rng12_uid225_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0Idx3Rng12_uid225_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage0Idx3_uid226_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage0_uid228_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage0_uid228_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage1Idx1Rng1_uid230_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage1Idx1Rng1_uid230_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (13 downto 0);
    signal leftShiftStage1Idx1_uid231_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage1Idx2Rng2_uid233_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (12 downto 0);
    signal leftShiftStage1Idx2Rng2_uid233_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (12 downto 0);
    signal leftShiftStage1Idx2_uid234_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage1Idx3Pad3_uid235_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (2 downto 0);
    signal leftShiftStage1Idx3Rng3_uid236_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_in : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage1Idx3Rng3_uid236_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_b : STD_LOGIC_VECTOR (11 downto 0);
    signal leftShiftStage1Idx3_uid237_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (14 downto 0);
    signal leftShiftStage1_uid239_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_s : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStage1_uid239_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q : STD_LOGIC_VECTOR (14 downto 0);
    signal rightShiftStageSel4Dto3_uid195_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_merged_bit_select_in : STD_LOGIC_VECTOR (4 downto 0);
    signal rightShiftStageSel4Dto3_uid195_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel4Dto3_uid195_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel4Dto3_uid195_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_merged_bit_select_d : STD_LOGIC_VECTOR (0 downto 0);
    signal stickyBits_uid78_fpAddSubTest_ieeeAdd_merged_bit_select_b : STD_LOGIC_VECTOR (9 downto 0);
    signal stickyBits_uid78_fpAddSubTest_ieeeAdd_merged_bit_select_c : STD_LOGIC_VECTOR (12 downto 0);
    signal rVStage_uid168_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid168_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal rVStage_uid174_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rVStage_uid174_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel3Dto2_uid227_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_merged_bit_select_b : STD_LOGIC_VECTOR (1 downto 0);
    signal leftShiftStageSel3Dto2_uid227_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_stickyBits_uid78_fpAddSubTest_ieeeAdd_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist1_fracPostNormRndRange_uid111_fpAddSubTest_ieeeAdd_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist2_aMinusA_uid96_fpAddSubTest_ieeeAdd_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_effSub_uid61_fpAddSubTest_ieeeAdd_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sigB_uid60_fpAddSubTest_ieeeAdd_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_sigA_uid59_fpAddSubTest_ieeeAdd_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_InvExpXIsZero_uid53_fpAddSubTest_ieeeAdd_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_excI_bSig_uid50_fpAddSubTest_ieeeAdd_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_excZ_bSig_uid26_uid46_fpAddSubTest_ieeeAdd_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_excZ_bSig_uid26_uid46_fpAddSubTest_ieeeAdd_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_excI_aSig_uid36_fpAddSubTest_ieeeAdd_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_excZ_aSig_uid25_uid32_fpAddSubTest_ieeeAdd_q_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_frac_aSig_uid31_fpAddSubTest_ieeeAdd_b_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist13_exp_aSig_uid30_fpAddSubTest_ieeeAdd_b_1_q : STD_LOGIC_VECTOR (4 downto 0);

begin


    -- cAmA_uid95_fpAddSubTest_ieeeAdd(CONSTANT,94)
    cAmA_uid95_fpAddSubTest_ieeeAdd_q <= "1111";

    -- zs_uid159_lzCountVal_uid94_fpAddSubTest_ieeeAdd(CONSTANT,158)
    zs_uid159_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= "00000000";

    -- signB_uid6_fpAddSubTest(BITSELECT,5)@0
    signB_uid6_fpAddSubTest_b <= STD_LOGIC_VECTOR(b(15 downto 15));

    -- invSignB_uid8_fpAddSubTest(LOGICAL,7)@0
    invSignB_uid8_fpAddSubTest_q <= not (signB_uid6_fpAddSubTest_b);

    -- muxSignB_uid9_fpAddSubTest(MUX,8)@0
    muxSignB_uid9_fpAddSubTest_s <= opSel;
    muxSignB_uid9_fpAddSubTest_combproc: PROCESS (muxSignB_uid9_fpAddSubTest_s, invSignB_uid8_fpAddSubTest_q, signB_uid6_fpAddSubTest_b)
    BEGIN
        CASE (muxSignB_uid9_fpAddSubTest_s) IS
            WHEN "0" => muxSignB_uid9_fpAddSubTest_q <= invSignB_uid8_fpAddSubTest_q;
            WHEN "1" => muxSignB_uid9_fpAddSubTest_q <= signB_uid6_fpAddSubTest_b;
            WHEN OTHERS => muxSignB_uid9_fpAddSubTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- restB_uid7_fpAddSubTest(BITSELECT,6)@0
    restB_uid7_fpAddSubTest_b <= b(14 downto 0);

    -- bOperand_uid10_fpAddSubTest(BITJOIN,9)@0
    bOperand_uid10_fpAddSubTest_q <= muxSignB_uid9_fpAddSubTest_q & restB_uid7_fpAddSubTest_b;

    -- sigY_uid18_fpAddSubTest_ieeeAdd(BITSELECT,17)@0
    sigY_uid18_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR(bOperand_uid10_fpAddSubTest_q(15 downto 15));

    -- expY_uid20_fpAddSubTest_ieeeAdd(BITSELECT,19)@0
    expY_uid20_fpAddSubTest_ieeeAdd_b <= bOperand_uid10_fpAddSubTest_q(14 downto 10);

    -- fracY_uid19_fpAddSubTest_ieeeAdd(BITSELECT,18)@0
    fracY_uid19_fpAddSubTest_ieeeAdd_b <= bOperand_uid10_fpAddSubTest_q(9 downto 0);

    -- ypn_uid21_fpAddSubTest_ieeeAdd(BITJOIN,20)@0
    ypn_uid21_fpAddSubTest_ieeeAdd_q <= sigY_uid18_fpAddSubTest_ieeeAdd_b & expY_uid20_fpAddSubTest_ieeeAdd_b & fracY_uid19_fpAddSubTest_ieeeAdd_b;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- expFracY_uid16_fpAddSubTest_ieeeAdd(BITSELECT,15)@0
    expFracY_uid16_fpAddSubTest_ieeeAdd_b <= bOperand_uid10_fpAddSubTest_q(14 downto 0);

    -- expFracX_uid15_fpAddSubTest_ieeeAdd(BITSELECT,14)@0
    expFracX_uid15_fpAddSubTest_ieeeAdd_b <= a(14 downto 0);

    -- xGTEy_uid17_fpAddSubTest_ieeeAdd(COMPARE,16)@0
    xGTEy_uid17_fpAddSubTest_ieeeAdd_a <= STD_LOGIC_VECTOR("00" & expFracX_uid15_fpAddSubTest_ieeeAdd_b);
    xGTEy_uid17_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR("00" & expFracY_uid16_fpAddSubTest_ieeeAdd_b);
    xGTEy_uid17_fpAddSubTest_ieeeAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid17_fpAddSubTest_ieeeAdd_a) - UNSIGNED(xGTEy_uid17_fpAddSubTest_ieeeAdd_b));
    xGTEy_uid17_fpAddSubTest_ieeeAdd_n(0) <= not (xGTEy_uid17_fpAddSubTest_ieeeAdd_o(16));

    -- bSig_uid26_fpAddSubTest_ieeeAdd(MUX,25)@0
    bSig_uid26_fpAddSubTest_ieeeAdd_s <= xGTEy_uid17_fpAddSubTest_ieeeAdd_n;
    bSig_uid26_fpAddSubTest_ieeeAdd_combproc: PROCESS (bSig_uid26_fpAddSubTest_ieeeAdd_s, a, ypn_uid21_fpAddSubTest_ieeeAdd_q)
    BEGIN
        CASE (bSig_uid26_fpAddSubTest_ieeeAdd_s) IS
            WHEN "0" => bSig_uid26_fpAddSubTest_ieeeAdd_q <= a;
            WHEN "1" => bSig_uid26_fpAddSubTest_ieeeAdd_q <= ypn_uid21_fpAddSubTest_ieeeAdd_q;
            WHEN OTHERS => bSig_uid26_fpAddSubTest_ieeeAdd_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigB_uid60_fpAddSubTest_ieeeAdd(BITSELECT,59)@0
    sigB_uid60_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR(bSig_uid26_fpAddSubTest_ieeeAdd_q(15 downto 15));

    -- aSig_uid25_fpAddSubTest_ieeeAdd(MUX,24)@0
    aSig_uid25_fpAddSubTest_ieeeAdd_s <= xGTEy_uid17_fpAddSubTest_ieeeAdd_n;
    aSig_uid25_fpAddSubTest_ieeeAdd_combproc: PROCESS (aSig_uid25_fpAddSubTest_ieeeAdd_s, ypn_uid21_fpAddSubTest_ieeeAdd_q, a)
    BEGIN
        CASE (aSig_uid25_fpAddSubTest_ieeeAdd_s) IS
            WHEN "0" => aSig_uid25_fpAddSubTest_ieeeAdd_q <= ypn_uid21_fpAddSubTest_ieeeAdd_q;
            WHEN "1" => aSig_uid25_fpAddSubTest_ieeeAdd_q <= a;
            WHEN OTHERS => aSig_uid25_fpAddSubTest_ieeeAdd_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sigA_uid59_fpAddSubTest_ieeeAdd(BITSELECT,58)@0
    sigA_uid59_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR(aSig_uid25_fpAddSubTest_ieeeAdd_q(15 downto 15));

    -- effSub_uid61_fpAddSubTest_ieeeAdd(LOGICAL,60)@0 + 1
    effSub_uid61_fpAddSubTest_ieeeAdd_qi <= sigA_uid59_fpAddSubTest_ieeeAdd_b xor sigB_uid60_fpAddSubTest_ieeeAdd_b;
    effSub_uid61_fpAddSubTest_ieeeAdd_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid61_fpAddSubTest_ieeeAdd_qi, xout => effSub_uid61_fpAddSubTest_ieeeAdd_q, clk => clk, aclr => areset );

    -- exp_bSig_uid44_fpAddSubTest_ieeeAdd(BITSELECT,43)@0
    exp_bSig_uid44_fpAddSubTest_ieeeAdd_in <= bSig_uid26_fpAddSubTest_ieeeAdd_q(14 downto 0);
    exp_bSig_uid44_fpAddSubTest_ieeeAdd_b <= exp_bSig_uid44_fpAddSubTest_ieeeAdd_in(14 downto 10);

    -- exp_aSig_uid30_fpAddSubTest_ieeeAdd(BITSELECT,29)@0
    exp_aSig_uid30_fpAddSubTest_ieeeAdd_in <= aSig_uid25_fpAddSubTest_ieeeAdd_q(14 downto 0);
    exp_aSig_uid30_fpAddSubTest_ieeeAdd_b <= exp_aSig_uid30_fpAddSubTest_ieeeAdd_in(14 downto 10);

    -- expAmExpB_uid69_fpAddSubTest_ieeeAdd(SUB,68)@0
    expAmExpB_uid69_fpAddSubTest_ieeeAdd_a <= STD_LOGIC_VECTOR("0" & exp_aSig_uid30_fpAddSubTest_ieeeAdd_b);
    expAmExpB_uid69_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR("0" & exp_bSig_uid44_fpAddSubTest_ieeeAdd_b);
    expAmExpB_uid69_fpAddSubTest_ieeeAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid69_fpAddSubTest_ieeeAdd_a) - UNSIGNED(expAmExpB_uid69_fpAddSubTest_ieeeAdd_b));
    expAmExpB_uid69_fpAddSubTest_ieeeAdd_q <= expAmExpB_uid69_fpAddSubTest_ieeeAdd_o(5 downto 0);

    -- cWFP2_uid70_fpAddSubTest_ieeeAdd(CONSTANT,69)
    cWFP2_uid70_fpAddSubTest_ieeeAdd_q <= "1100";

    -- shiftedOut_uid72_fpAddSubTest_ieeeAdd(COMPARE,71)@0
    shiftedOut_uid72_fpAddSubTest_ieeeAdd_a <= STD_LOGIC_VECTOR("0000" & cWFP2_uid70_fpAddSubTest_ieeeAdd_q);
    shiftedOut_uid72_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR("00" & expAmExpB_uid69_fpAddSubTest_ieeeAdd_q);
    shiftedOut_uid72_fpAddSubTest_ieeeAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid72_fpAddSubTest_ieeeAdd_a) - UNSIGNED(shiftedOut_uid72_fpAddSubTest_ieeeAdd_b));
    shiftedOut_uid72_fpAddSubTest_ieeeAdd_c(0) <= shiftedOut_uid72_fpAddSubTest_ieeeAdd_o(7);

    -- iShiftedOut_uid76_fpAddSubTest_ieeeAdd(LOGICAL,75)@0
    iShiftedOut_uid76_fpAddSubTest_ieeeAdd_q <= not (shiftedOut_uid72_fpAddSubTest_ieeeAdd_c);

    -- rightShiftStage0Idx3_uid194_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(CONSTANT,193)
    rightShiftStage0Idx3_uid194_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= "00000000000000000000000";

    -- rightShiftStage2Idx1Rng1_uid208_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(BITSELECT,207)@0
    rightShiftStage2Idx1Rng1_uid208_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b <= rightShiftStage1_uid207_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q(22 downto 1);

    -- rightShiftStage2Idx1_uid210_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(BITJOIN,209)@0
    rightShiftStage2Idx1_uid210_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= GND_q & rightShiftStage2Idx1Rng1_uid208_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b;

    -- rightShiftStage1Idx3Pad6_uid204_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(CONSTANT,203)
    rightShiftStage1Idx3Pad6_uid204_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= "000000";

    -- rightShiftStage1Idx3Rng6_uid203_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(BITSELECT,202)@0
    rightShiftStage1Idx3Rng6_uid203_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b <= rightShiftStage0_uid196_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q(22 downto 6);

    -- rightShiftStage1Idx3_uid205_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(BITJOIN,204)@0
    rightShiftStage1Idx3_uid205_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= rightShiftStage1Idx3Pad6_uid204_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q & rightShiftStage1Idx3Rng6_uid203_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b;

    -- zs_uid167_lzCountVal_uid94_fpAddSubTest_ieeeAdd(CONSTANT,166)
    zs_uid167_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= "0000";

    -- rightShiftStage1Idx2Rng4_uid200_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(BITSELECT,199)@0
    rightShiftStage1Idx2Rng4_uid200_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b <= rightShiftStage0_uid196_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q(22 downto 4);

    -- rightShiftStage1Idx2_uid202_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(BITJOIN,201)@0
    rightShiftStage1Idx2_uid202_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= zs_uid167_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q & rightShiftStage1Idx2Rng4_uid200_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b;

    -- zs_uid173_lzCountVal_uid94_fpAddSubTest_ieeeAdd(CONSTANT,172)
    zs_uid173_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= "00";

    -- rightShiftStage1Idx1Rng2_uid197_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(BITSELECT,196)@0
    rightShiftStage1Idx1Rng2_uid197_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b <= rightShiftStage0_uid196_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q(22 downto 2);

    -- rightShiftStage1Idx1_uid199_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(BITJOIN,198)@0
    rightShiftStage1Idx1_uid199_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= zs_uid173_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q & rightShiftStage1Idx1Rng2_uid197_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b;

    -- rightShiftStage0Idx2Pad16_uid192_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(CONSTANT,191)
    rightShiftStage0Idx2Pad16_uid192_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= "0000000000000000";

    -- rightShiftStage0Idx2Rng16_uid191_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(BITSELECT,190)@0
    rightShiftStage0Idx2Rng16_uid191_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b <= rightPaddedIn_uid74_fpAddSubTest_ieeeAdd_q(22 downto 16);

    -- rightShiftStage0Idx2_uid193_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(BITJOIN,192)@0
    rightShiftStage0Idx2_uid193_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx2Pad16_uid192_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q & rightShiftStage0Idx2Rng16_uid191_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b;

    -- rightShiftStage0Idx1Rng8_uid188_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(BITSELECT,187)@0
    rightShiftStage0Idx1Rng8_uid188_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b <= rightPaddedIn_uid74_fpAddSubTest_ieeeAdd_q(22 downto 8);

    -- rightShiftStage0Idx1_uid190_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(BITJOIN,189)@0
    rightShiftStage0Idx1_uid190_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= zs_uid159_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q & rightShiftStage0Idx1Rng8_uid188_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b;

    -- cstAllZWE_uid29_fpAddSubTest_ieeeAdd(CONSTANT,28)
    cstAllZWE_uid29_fpAddSubTest_ieeeAdd_q <= "00000";

    -- excZ_bSig_uid26_uid46_fpAddSubTest_ieeeAdd(LOGICAL,45)@0
    excZ_bSig_uid26_uid46_fpAddSubTest_ieeeAdd_q <= "1" WHEN exp_bSig_uid44_fpAddSubTest_ieeeAdd_b = cstAllZWE_uid29_fpAddSubTest_ieeeAdd_q ELSE "0";

    -- InvExpXIsZero_uid53_fpAddSubTest_ieeeAdd(LOGICAL,52)@0
    InvExpXIsZero_uid53_fpAddSubTest_ieeeAdd_q <= not (excZ_bSig_uid26_uid46_fpAddSubTest_ieeeAdd_q);

    -- cstZeroWF_uid28_fpAddSubTest_ieeeAdd(CONSTANT,27)
    cstZeroWF_uid28_fpAddSubTest_ieeeAdd_q <= "0000000000";

    -- frac_bSig_uid45_fpAddSubTest_ieeeAdd(BITSELECT,44)@0
    frac_bSig_uid45_fpAddSubTest_ieeeAdd_in <= bSig_uid26_fpAddSubTest_ieeeAdd_q(9 downto 0);
    frac_bSig_uid45_fpAddSubTest_ieeeAdd_b <= frac_bSig_uid45_fpAddSubTest_ieeeAdd_in(9 downto 0);

    -- fracBz_uid65_fpAddSubTest_ieeeAdd(MUX,64)@0
    fracBz_uid65_fpAddSubTest_ieeeAdd_s <= excZ_bSig_uid26_uid46_fpAddSubTest_ieeeAdd_q;
    fracBz_uid65_fpAddSubTest_ieeeAdd_combproc: PROCESS (fracBz_uid65_fpAddSubTest_ieeeAdd_s, frac_bSig_uid45_fpAddSubTest_ieeeAdd_b, cstZeroWF_uid28_fpAddSubTest_ieeeAdd_q)
    BEGIN
        CASE (fracBz_uid65_fpAddSubTest_ieeeAdd_s) IS
            WHEN "0" => fracBz_uid65_fpAddSubTest_ieeeAdd_q <= frac_bSig_uid45_fpAddSubTest_ieeeAdd_b;
            WHEN "1" => fracBz_uid65_fpAddSubTest_ieeeAdd_q <= cstZeroWF_uid28_fpAddSubTest_ieeeAdd_q;
            WHEN OTHERS => fracBz_uid65_fpAddSubTest_ieeeAdd_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oFracB_uid68_fpAddSubTest_ieeeAdd(BITJOIN,67)@0
    oFracB_uid68_fpAddSubTest_ieeeAdd_q <= InvExpXIsZero_uid53_fpAddSubTest_ieeeAdd_q & fracBz_uid65_fpAddSubTest_ieeeAdd_q;

    -- padConst_uid73_fpAddSubTest_ieeeAdd(CONSTANT,72)
    padConst_uid73_fpAddSubTest_ieeeAdd_q <= "000000000000";

    -- rightPaddedIn_uid74_fpAddSubTest_ieeeAdd(BITJOIN,73)@0
    rightPaddedIn_uid74_fpAddSubTest_ieeeAdd_q <= oFracB_uid68_fpAddSubTest_ieeeAdd_q & padConst_uid73_fpAddSubTest_ieeeAdd_q;

    -- rightShiftStage0_uid196_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(MUX,195)@0
    rightShiftStage0_uid196_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_s <= rightShiftStageSel4Dto3_uid195_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_merged_bit_select_b;
    rightShiftStage0_uid196_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_combproc: PROCESS (rightShiftStage0_uid196_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_s, rightPaddedIn_uid74_fpAddSubTest_ieeeAdd_q, rightShiftStage0Idx1_uid190_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q, rightShiftStage0Idx2_uid193_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q, rightShiftStage0Idx3_uid194_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q)
    BEGIN
        CASE (rightShiftStage0_uid196_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_s) IS
            WHEN "00" => rightShiftStage0_uid196_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= rightPaddedIn_uid74_fpAddSubTest_ieeeAdd_q;
            WHEN "01" => rightShiftStage0_uid196_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx1_uid190_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q;
            WHEN "10" => rightShiftStage0_uid196_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx2_uid193_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q;
            WHEN "11" => rightShiftStage0_uid196_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx3_uid194_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q;
            WHEN OTHERS => rightShiftStage0_uid196_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid207_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(MUX,206)@0
    rightShiftStage1_uid207_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_s <= rightShiftStageSel4Dto3_uid195_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_merged_bit_select_c;
    rightShiftStage1_uid207_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_combproc: PROCESS (rightShiftStage1_uid207_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_s, rightShiftStage0_uid196_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q, rightShiftStage1Idx1_uid199_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q, rightShiftStage1Idx2_uid202_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q, rightShiftStage1Idx3_uid205_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q)
    BEGIN
        CASE (rightShiftStage1_uid207_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_s) IS
            WHEN "00" => rightShiftStage1_uid207_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= rightShiftStage0_uid196_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q;
            WHEN "01" => rightShiftStage1_uid207_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= rightShiftStage1Idx1_uid199_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q;
            WHEN "10" => rightShiftStage1_uid207_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= rightShiftStage1Idx2_uid202_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q;
            WHEN "11" => rightShiftStage1_uid207_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= rightShiftStage1Idx3_uid205_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q;
            WHEN OTHERS => rightShiftStage1_uid207_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStageSel4Dto3_uid195_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_merged_bit_select(BITSELECT,240)@0
    rightShiftStageSel4Dto3_uid195_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_merged_bit_select_in <= expAmExpB_uid69_fpAddSubTest_ieeeAdd_q(4 downto 0);
    rightShiftStageSel4Dto3_uid195_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_merged_bit_select_b <= rightShiftStageSel4Dto3_uid195_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_merged_bit_select_in(4 downto 3);
    rightShiftStageSel4Dto3_uid195_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_merged_bit_select_c <= rightShiftStageSel4Dto3_uid195_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_merged_bit_select_in(2 downto 1);
    rightShiftStageSel4Dto3_uid195_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_merged_bit_select_d <= rightShiftStageSel4Dto3_uid195_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_merged_bit_select_in(0 downto 0);

    -- rightShiftStage2_uid212_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(MUX,211)@0
    rightShiftStage2_uid212_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_s <= rightShiftStageSel4Dto3_uid195_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_merged_bit_select_d;
    rightShiftStage2_uid212_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_combproc: PROCESS (rightShiftStage2_uid212_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_s, rightShiftStage1_uid207_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q, rightShiftStage2Idx1_uid210_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q)
    BEGIN
        CASE (rightShiftStage2_uid212_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_s) IS
            WHEN "0" => rightShiftStage2_uid212_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= rightShiftStage1_uid207_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q;
            WHEN "1" => rightShiftStage2_uid212_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= rightShiftStage2Idx1_uid210_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q;
            WHEN OTHERS => rightShiftStage2_uid212_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- wIntCst_uid186_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(CONSTANT,185)
    wIntCst_uid186_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= "10111";

    -- shiftedOut_uid187_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(COMPARE,186)@0
    shiftedOut_uid187_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_a <= STD_LOGIC_VECTOR("00" & expAmExpB_uid69_fpAddSubTest_ieeeAdd_q);
    shiftedOut_uid187_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR("000" & wIntCst_uid186_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q);
    shiftedOut_uid187_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid187_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_a) - UNSIGNED(shiftedOut_uid187_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_b));
    shiftedOut_uid187_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_n(0) <= not (shiftedOut_uid187_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_o(7));

    -- r_uid214_alignmentShifter_uid73_fpAddSubTest_ieeeAdd(MUX,213)@0
    r_uid214_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_s <= shiftedOut_uid187_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_n;
    r_uid214_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_combproc: PROCESS (r_uid214_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_s, rightShiftStage2_uid212_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q, rightShiftStage0Idx3_uid194_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q)
    BEGIN
        CASE (r_uid214_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_s) IS
            WHEN "0" => r_uid214_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= rightShiftStage2_uid212_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q;
            WHEN "1" => r_uid214_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx3_uid194_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q;
            WHEN OTHERS => r_uid214_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- alignFracBPostShiftOut_uid77_fpAddSubTest_ieeeAdd(LOGICAL,76)@0
    alignFracBPostShiftOut_uid77_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 1 => iShiftedOut_uid76_fpAddSubTest_ieeeAdd_q(0)) & iShiftedOut_uid76_fpAddSubTest_ieeeAdd_q));
    alignFracBPostShiftOut_uid77_fpAddSubTest_ieeeAdd_q <= r_uid214_alignmentShifter_uid73_fpAddSubTest_ieeeAdd_q and alignFracBPostShiftOut_uid77_fpAddSubTest_ieeeAdd_b;

    -- stickyBits_uid78_fpAddSubTest_ieeeAdd_merged_bit_select(BITSELECT,241)@0
    stickyBits_uid78_fpAddSubTest_ieeeAdd_merged_bit_select_b <= alignFracBPostShiftOut_uid77_fpAddSubTest_ieeeAdd_q(9 downto 0);
    stickyBits_uid78_fpAddSubTest_ieeeAdd_merged_bit_select_c <= alignFracBPostShiftOut_uid77_fpAddSubTest_ieeeAdd_q(22 downto 10);

    -- redist0_stickyBits_uid78_fpAddSubTest_ieeeAdd_merged_bit_select_c_1(DELAY,245)
    redist0_stickyBits_uid78_fpAddSubTest_ieeeAdd_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => stickyBits_uid78_fpAddSubTest_ieeeAdd_merged_bit_select_c, xout => redist0_stickyBits_uid78_fpAddSubTest_ieeeAdd_merged_bit_select_c_1_q, clk => clk, aclr => areset );

    -- fracBAddOp_uid89_fpAddSubTest_ieeeAdd(BITJOIN,88)@1
    fracBAddOp_uid89_fpAddSubTest_ieeeAdd_q <= GND_q & redist0_stickyBits_uid78_fpAddSubTest_ieeeAdd_merged_bit_select_c_1_q;

    -- fracBAddOpPostXor_uid90_fpAddSubTest_ieeeAdd(LOGICAL,89)@1
    fracBAddOpPostXor_uid90_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 1 => effSub_uid61_fpAddSubTest_ieeeAdd_q(0)) & effSub_uid61_fpAddSubTest_ieeeAdd_q));
    fracBAddOpPostXor_uid90_fpAddSubTest_ieeeAdd_q <= fracBAddOp_uid89_fpAddSubTest_ieeeAdd_q xor fracBAddOpPostXor_uid90_fpAddSubTest_ieeeAdd_b;

    -- zocst_uid85_fpAddSubTest_ieeeAdd(CONSTANT,84)
    zocst_uid85_fpAddSubTest_ieeeAdd_q <= "01";

    -- frac_aSig_uid31_fpAddSubTest_ieeeAdd(BITSELECT,30)@0
    frac_aSig_uid31_fpAddSubTest_ieeeAdd_in <= aSig_uid25_fpAddSubTest_ieeeAdd_q(9 downto 0);
    frac_aSig_uid31_fpAddSubTest_ieeeAdd_b <= frac_aSig_uid31_fpAddSubTest_ieeeAdd_in(9 downto 0);

    -- redist12_frac_aSig_uid31_fpAddSubTest_ieeeAdd_b_1(DELAY,257)
    redist12_frac_aSig_uid31_fpAddSubTest_ieeeAdd_b_1 : dspba_delay
    GENERIC MAP ( width => 10, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => frac_aSig_uid31_fpAddSubTest_ieeeAdd_b, xout => redist12_frac_aSig_uid31_fpAddSubTest_ieeeAdd_b_1_q, clk => clk, aclr => areset );

    -- cmpEQ_stickyBits_cZwF_uid80_fpAddSubTest_ieeeAdd(LOGICAL,79)@0 + 1
    cmpEQ_stickyBits_cZwF_uid80_fpAddSubTest_ieeeAdd_qi <= "1" WHEN stickyBits_uid78_fpAddSubTest_ieeeAdd_merged_bit_select_b = cstZeroWF_uid28_fpAddSubTest_ieeeAdd_q ELSE "0";
    cmpEQ_stickyBits_cZwF_uid80_fpAddSubTest_ieeeAdd_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => cmpEQ_stickyBits_cZwF_uid80_fpAddSubTest_ieeeAdd_qi, xout => cmpEQ_stickyBits_cZwF_uid80_fpAddSubTest_ieeeAdd_q, clk => clk, aclr => areset );

    -- effSubInvSticky_uid83_fpAddSubTest_ieeeAdd(LOGICAL,82)@1
    effSubInvSticky_uid83_fpAddSubTest_ieeeAdd_q <= effSub_uid61_fpAddSubTest_ieeeAdd_q and cmpEQ_stickyBits_cZwF_uid80_fpAddSubTest_ieeeAdd_q;

    -- fracAAddOp_uid86_fpAddSubTest_ieeeAdd(BITJOIN,85)@1
    fracAAddOp_uid86_fpAddSubTest_ieeeAdd_q <= zocst_uid85_fpAddSubTest_ieeeAdd_q & redist12_frac_aSig_uid31_fpAddSubTest_ieeeAdd_b_1_q & GND_q & effSubInvSticky_uid83_fpAddSubTest_ieeeAdd_q;

    -- fracAddResult_uid91_fpAddSubTest_ieeeAdd(ADD,90)@1
    fracAddResult_uid91_fpAddSubTest_ieeeAdd_a <= STD_LOGIC_VECTOR("0" & fracAAddOp_uid86_fpAddSubTest_ieeeAdd_q);
    fracAddResult_uid91_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR("0" & fracBAddOpPostXor_uid90_fpAddSubTest_ieeeAdd_q);
    fracAddResult_uid91_fpAddSubTest_ieeeAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(fracAddResult_uid91_fpAddSubTest_ieeeAdd_a) + UNSIGNED(fracAddResult_uid91_fpAddSubTest_ieeeAdd_b));
    fracAddResult_uid91_fpAddSubTest_ieeeAdd_q <= fracAddResult_uid91_fpAddSubTest_ieeeAdd_o(14 downto 0);

    -- rangeFracAddResultMwfp3Dto0_uid92_fpAddSubTest_ieeeAdd(BITSELECT,91)@1
    rangeFracAddResultMwfp3Dto0_uid92_fpAddSubTest_ieeeAdd_in <= fracAddResult_uid91_fpAddSubTest_ieeeAdd_q(13 downto 0);
    rangeFracAddResultMwfp3Dto0_uid92_fpAddSubTest_ieeeAdd_b <= rangeFracAddResultMwfp3Dto0_uid92_fpAddSubTest_ieeeAdd_in(13 downto 0);

    -- invCmpEQ_stickyBits_cZwF_uid81_fpAddSubTest_ieeeAdd(LOGICAL,80)@1
    invCmpEQ_stickyBits_cZwF_uid81_fpAddSubTest_ieeeAdd_q <= not (cmpEQ_stickyBits_cZwF_uid80_fpAddSubTest_ieeeAdd_q);

    -- fracGRS_uid93_fpAddSubTest_ieeeAdd(BITJOIN,92)@1
    fracGRS_uid93_fpAddSubTest_ieeeAdd_q <= rangeFracAddResultMwfp3Dto0_uid92_fpAddSubTest_ieeeAdd_b & invCmpEQ_stickyBits_cZwF_uid81_fpAddSubTest_ieeeAdd_q;

    -- rVStage_uid160_lzCountVal_uid94_fpAddSubTest_ieeeAdd(BITSELECT,159)@1
    rVStage_uid160_lzCountVal_uid94_fpAddSubTest_ieeeAdd_b <= fracGRS_uid93_fpAddSubTest_ieeeAdd_q(14 downto 7);

    -- vCount_uid161_lzCountVal_uid94_fpAddSubTest_ieeeAdd(LOGICAL,160)@1
    vCount_uid161_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= "1" WHEN rVStage_uid160_lzCountVal_uid94_fpAddSubTest_ieeeAdd_b = zs_uid159_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q ELSE "0";

    -- vStage_uid163_lzCountVal_uid94_fpAddSubTest_ieeeAdd(BITSELECT,162)@1
    vStage_uid163_lzCountVal_uid94_fpAddSubTest_ieeeAdd_in <= fracGRS_uid93_fpAddSubTest_ieeeAdd_q(6 downto 0);
    vStage_uid163_lzCountVal_uid94_fpAddSubTest_ieeeAdd_b <= vStage_uid163_lzCountVal_uid94_fpAddSubTest_ieeeAdd_in(6 downto 0);

    -- mO_uid162_lzCountVal_uid94_fpAddSubTest_ieeeAdd(CONSTANT,161)
    mO_uid162_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= "1";

    -- cStage_uid164_lzCountVal_uid94_fpAddSubTest_ieeeAdd(BITJOIN,163)@1
    cStage_uid164_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= vStage_uid163_lzCountVal_uid94_fpAddSubTest_ieeeAdd_b & mO_uid162_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q;

    -- vStagei_uid166_lzCountVal_uid94_fpAddSubTest_ieeeAdd(MUX,165)@1
    vStagei_uid166_lzCountVal_uid94_fpAddSubTest_ieeeAdd_s <= vCount_uid161_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q;
    vStagei_uid166_lzCountVal_uid94_fpAddSubTest_ieeeAdd_combproc: PROCESS (vStagei_uid166_lzCountVal_uid94_fpAddSubTest_ieeeAdd_s, rVStage_uid160_lzCountVal_uid94_fpAddSubTest_ieeeAdd_b, cStage_uid164_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q)
    BEGIN
        CASE (vStagei_uid166_lzCountVal_uid94_fpAddSubTest_ieeeAdd_s) IS
            WHEN "0" => vStagei_uid166_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= rVStage_uid160_lzCountVal_uid94_fpAddSubTest_ieeeAdd_b;
            WHEN "1" => vStagei_uid166_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= cStage_uid164_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q;
            WHEN OTHERS => vStagei_uid166_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid168_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select(BITSELECT,242)@1
    rVStage_uid168_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select_b <= vStagei_uid166_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q(7 downto 4);
    rVStage_uid168_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select_c <= vStagei_uid166_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q(3 downto 0);

    -- vCount_uid169_lzCountVal_uid94_fpAddSubTest_ieeeAdd(LOGICAL,168)@1
    vCount_uid169_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= "1" WHEN rVStage_uid168_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select_b = zs_uid167_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q ELSE "0";

    -- vStagei_uid172_lzCountVal_uid94_fpAddSubTest_ieeeAdd(MUX,171)@1
    vStagei_uid172_lzCountVal_uid94_fpAddSubTest_ieeeAdd_s <= vCount_uid169_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q;
    vStagei_uid172_lzCountVal_uid94_fpAddSubTest_ieeeAdd_combproc: PROCESS (vStagei_uid172_lzCountVal_uid94_fpAddSubTest_ieeeAdd_s, rVStage_uid168_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select_b, rVStage_uid168_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid172_lzCountVal_uid94_fpAddSubTest_ieeeAdd_s) IS
            WHEN "0" => vStagei_uid172_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= rVStage_uid168_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select_b;
            WHEN "1" => vStagei_uid172_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= rVStage_uid168_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid172_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid174_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select(BITSELECT,243)@1
    rVStage_uid174_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select_b <= vStagei_uid172_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q(3 downto 2);
    rVStage_uid174_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select_c <= vStagei_uid172_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q(1 downto 0);

    -- vCount_uid175_lzCountVal_uid94_fpAddSubTest_ieeeAdd(LOGICAL,174)@1
    vCount_uid175_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= "1" WHEN rVStage_uid174_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select_b = zs_uid173_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q ELSE "0";

    -- vStagei_uid178_lzCountVal_uid94_fpAddSubTest_ieeeAdd(MUX,177)@1
    vStagei_uid178_lzCountVal_uid94_fpAddSubTest_ieeeAdd_s <= vCount_uid175_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q;
    vStagei_uid178_lzCountVal_uid94_fpAddSubTest_ieeeAdd_combproc: PROCESS (vStagei_uid178_lzCountVal_uid94_fpAddSubTest_ieeeAdd_s, rVStage_uid174_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select_b, rVStage_uid174_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select_c)
    BEGIN
        CASE (vStagei_uid178_lzCountVal_uid94_fpAddSubTest_ieeeAdd_s) IS
            WHEN "0" => vStagei_uid178_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= rVStage_uid174_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select_b;
            WHEN "1" => vStagei_uid178_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= rVStage_uid174_lzCountVal_uid94_fpAddSubTest_ieeeAdd_merged_bit_select_c;
            WHEN OTHERS => vStagei_uid178_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid180_lzCountVal_uid94_fpAddSubTest_ieeeAdd(BITSELECT,179)@1
    rVStage_uid180_lzCountVal_uid94_fpAddSubTest_ieeeAdd_b <= vStagei_uid178_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q(1 downto 1);

    -- vCount_uid181_lzCountVal_uid94_fpAddSubTest_ieeeAdd(LOGICAL,180)@1
    vCount_uid181_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= "1" WHEN rVStage_uid180_lzCountVal_uid94_fpAddSubTest_ieeeAdd_b = GND_q ELSE "0";

    -- r_uid182_lzCountVal_uid94_fpAddSubTest_ieeeAdd(BITJOIN,181)@1
    r_uid182_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q <= vCount_uid161_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q & vCount_uid169_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q & vCount_uid175_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q & vCount_uid181_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q;

    -- aMinusA_uid96_fpAddSubTest_ieeeAdd(LOGICAL,95)@1
    aMinusA_uid96_fpAddSubTest_ieeeAdd_q <= "1" WHEN r_uid182_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q = cAmA_uid95_fpAddSubTest_ieeeAdd_q ELSE "0";

    -- invAMinusA_uid138_fpAddSubTest_ieeeAdd(LOGICAL,137)@1
    invAMinusA_uid138_fpAddSubTest_ieeeAdd_q <= not (aMinusA_uid96_fpAddSubTest_ieeeAdd_q);

    -- redist5_sigA_uid59_fpAddSubTest_ieeeAdd_b_1(DELAY,250)
    redist5_sigA_uid59_fpAddSubTest_ieeeAdd_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigA_uid59_fpAddSubTest_ieeeAdd_b, xout => redist5_sigA_uid59_fpAddSubTest_ieeeAdd_b_1_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid27_fpAddSubTest_ieeeAdd(CONSTANT,26)
    cstAllOWE_uid27_fpAddSubTest_ieeeAdd_q <= "11111";

    -- expXIsMax_uid47_fpAddSubTest_ieeeAdd(LOGICAL,46)@0 + 1
    expXIsMax_uid47_fpAddSubTest_ieeeAdd_qi <= "1" WHEN exp_bSig_uid44_fpAddSubTest_ieeeAdd_b = cstAllOWE_uid27_fpAddSubTest_ieeeAdd_q ELSE "0";
    expXIsMax_uid47_fpAddSubTest_ieeeAdd_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid47_fpAddSubTest_ieeeAdd_qi, xout => expXIsMax_uid47_fpAddSubTest_ieeeAdd_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid52_fpAddSubTest_ieeeAdd(LOGICAL,51)@1
    invExpXIsMax_uid52_fpAddSubTest_ieeeAdd_q <= not (expXIsMax_uid47_fpAddSubTest_ieeeAdd_q);

    -- redist6_InvExpXIsZero_uid53_fpAddSubTest_ieeeAdd_q_1(DELAY,251)
    redist6_InvExpXIsZero_uid53_fpAddSubTest_ieeeAdd_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => InvExpXIsZero_uid53_fpAddSubTest_ieeeAdd_q, xout => redist6_InvExpXIsZero_uid53_fpAddSubTest_ieeeAdd_q_1_q, clk => clk, aclr => areset );

    -- excR_bSig_uid54_fpAddSubTest_ieeeAdd(LOGICAL,53)@1
    excR_bSig_uid54_fpAddSubTest_ieeeAdd_q <= redist6_InvExpXIsZero_uid53_fpAddSubTest_ieeeAdd_q_1_q and invExpXIsMax_uid52_fpAddSubTest_ieeeAdd_q;

    -- redist13_exp_aSig_uid30_fpAddSubTest_ieeeAdd_b_1(DELAY,258)
    redist13_exp_aSig_uid30_fpAddSubTest_ieeeAdd_b_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => exp_aSig_uid30_fpAddSubTest_ieeeAdd_b, xout => redist13_exp_aSig_uid30_fpAddSubTest_ieeeAdd_b_1_q, clk => clk, aclr => areset );

    -- expXIsMax_uid33_fpAddSubTest_ieeeAdd(LOGICAL,32)@1
    expXIsMax_uid33_fpAddSubTest_ieeeAdd_q <= "1" WHEN redist13_exp_aSig_uid30_fpAddSubTest_ieeeAdd_b_1_q = cstAllOWE_uid27_fpAddSubTest_ieeeAdd_q ELSE "0";

    -- invExpXIsMax_uid38_fpAddSubTest_ieeeAdd(LOGICAL,37)@1
    invExpXIsMax_uid38_fpAddSubTest_ieeeAdd_q <= not (expXIsMax_uid33_fpAddSubTest_ieeeAdd_q);

    -- excZ_aSig_uid25_uid32_fpAddSubTest_ieeeAdd(LOGICAL,31)@1
    excZ_aSig_uid25_uid32_fpAddSubTest_ieeeAdd_q <= "1" WHEN redist13_exp_aSig_uid30_fpAddSubTest_ieeeAdd_b_1_q = cstAllZWE_uid29_fpAddSubTest_ieeeAdd_q ELSE "0";

    -- InvExpXIsZero_uid39_fpAddSubTest_ieeeAdd(LOGICAL,38)@1
    InvExpXIsZero_uid39_fpAddSubTest_ieeeAdd_q <= not (excZ_aSig_uid25_uid32_fpAddSubTest_ieeeAdd_q);

    -- excR_aSig_uid40_fpAddSubTest_ieeeAdd(LOGICAL,39)@1
    excR_aSig_uid40_fpAddSubTest_ieeeAdd_q <= InvExpXIsZero_uid39_fpAddSubTest_ieeeAdd_q and invExpXIsMax_uid38_fpAddSubTest_ieeeAdd_q;

    -- signRReg_uid139_fpAddSubTest_ieeeAdd(LOGICAL,138)@1
    signRReg_uid139_fpAddSubTest_ieeeAdd_q <= excR_aSig_uid40_fpAddSubTest_ieeeAdd_q and excR_bSig_uid54_fpAddSubTest_ieeeAdd_q and redist5_sigA_uid59_fpAddSubTest_ieeeAdd_b_1_q and invAMinusA_uid138_fpAddSubTest_ieeeAdd_q;

    -- redist4_sigB_uid60_fpAddSubTest_ieeeAdd_b_1(DELAY,249)
    redist4_sigB_uid60_fpAddSubTest_ieeeAdd_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sigB_uid60_fpAddSubTest_ieeeAdd_b, xout => redist4_sigB_uid60_fpAddSubTest_ieeeAdd_b_1_q, clk => clk, aclr => areset );

    -- redist8_excZ_bSig_uid26_uid46_fpAddSubTest_ieeeAdd_q_1(DELAY,253)
    redist8_excZ_bSig_uid26_uid46_fpAddSubTest_ieeeAdd_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_bSig_uid26_uid46_fpAddSubTest_ieeeAdd_q, xout => redist8_excZ_bSig_uid26_uid46_fpAddSubTest_ieeeAdd_q_1_q, clk => clk, aclr => areset );

    -- excAZBZSigASigB_uid143_fpAddSubTest_ieeeAdd(LOGICAL,142)@1
    excAZBZSigASigB_uid143_fpAddSubTest_ieeeAdd_q <= excZ_aSig_uid25_uid32_fpAddSubTest_ieeeAdd_q and redist8_excZ_bSig_uid26_uid46_fpAddSubTest_ieeeAdd_q_1_q and redist5_sigA_uid59_fpAddSubTest_ieeeAdd_b_1_q and redist4_sigB_uid60_fpAddSubTest_ieeeAdd_b_1_q;

    -- excBZARSigA_uid144_fpAddSubTest_ieeeAdd(LOGICAL,143)@1
    excBZARSigA_uid144_fpAddSubTest_ieeeAdd_q <= redist8_excZ_bSig_uid26_uid46_fpAddSubTest_ieeeAdd_q_1_q and excR_aSig_uid40_fpAddSubTest_ieeeAdd_q and redist5_sigA_uid59_fpAddSubTest_ieeeAdd_b_1_q;

    -- signRZero_uid145_fpAddSubTest_ieeeAdd(LOGICAL,144)@1
    signRZero_uid145_fpAddSubTest_ieeeAdd_q <= excBZARSigA_uid144_fpAddSubTest_ieeeAdd_q or excAZBZSigASigB_uid143_fpAddSubTest_ieeeAdd_q;

    -- fracXIsZero_uid48_fpAddSubTest_ieeeAdd(LOGICAL,47)@0 + 1
    fracXIsZero_uid48_fpAddSubTest_ieeeAdd_qi <= "1" WHEN cstZeroWF_uid28_fpAddSubTest_ieeeAdd_q = frac_bSig_uid45_fpAddSubTest_ieeeAdd_b ELSE "0";
    fracXIsZero_uid48_fpAddSubTest_ieeeAdd_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid48_fpAddSubTest_ieeeAdd_qi, xout => fracXIsZero_uid48_fpAddSubTest_ieeeAdd_q, clk => clk, aclr => areset );

    -- excI_bSig_uid50_fpAddSubTest_ieeeAdd(LOGICAL,49)@1
    excI_bSig_uid50_fpAddSubTest_ieeeAdd_q <= expXIsMax_uid47_fpAddSubTest_ieeeAdd_q and fracXIsZero_uid48_fpAddSubTest_ieeeAdd_q;

    -- sigBBInf_uid140_fpAddSubTest_ieeeAdd(LOGICAL,139)@1
    sigBBInf_uid140_fpAddSubTest_ieeeAdd_q <= redist4_sigB_uid60_fpAddSubTest_ieeeAdd_b_1_q and excI_bSig_uid50_fpAddSubTest_ieeeAdd_q;

    -- fracXIsZero_uid34_fpAddSubTest_ieeeAdd(LOGICAL,33)@1
    fracXIsZero_uid34_fpAddSubTest_ieeeAdd_q <= "1" WHEN cstZeroWF_uid28_fpAddSubTest_ieeeAdd_q = redist12_frac_aSig_uid31_fpAddSubTest_ieeeAdd_b_1_q ELSE "0";

    -- excI_aSig_uid36_fpAddSubTest_ieeeAdd(LOGICAL,35)@1
    excI_aSig_uid36_fpAddSubTest_ieeeAdd_q <= expXIsMax_uid33_fpAddSubTest_ieeeAdd_q and fracXIsZero_uid34_fpAddSubTest_ieeeAdd_q;

    -- sigAAInf_uid141_fpAddSubTest_ieeeAdd(LOGICAL,140)@1
    sigAAInf_uid141_fpAddSubTest_ieeeAdd_q <= redist5_sigA_uid59_fpAddSubTest_ieeeAdd_b_1_q and excI_aSig_uid36_fpAddSubTest_ieeeAdd_q;

    -- signRInf_uid142_fpAddSubTest_ieeeAdd(LOGICAL,141)@1
    signRInf_uid142_fpAddSubTest_ieeeAdd_q <= sigAAInf_uid141_fpAddSubTest_ieeeAdd_q or sigBBInf_uid140_fpAddSubTest_ieeeAdd_q;

    -- signRInfRZRReg_uid146_fpAddSubTest_ieeeAdd(LOGICAL,145)@1 + 1
    signRInfRZRReg_uid146_fpAddSubTest_ieeeAdd_qi <= signRInf_uid142_fpAddSubTest_ieeeAdd_q or signRZero_uid145_fpAddSubTest_ieeeAdd_q or signRReg_uid139_fpAddSubTest_ieeeAdd_q;
    signRInfRZRReg_uid146_fpAddSubTest_ieeeAdd_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRInfRZRReg_uid146_fpAddSubTest_ieeeAdd_qi, xout => signRInfRZRReg_uid146_fpAddSubTest_ieeeAdd_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid49_fpAddSubTest_ieeeAdd(LOGICAL,48)@1
    fracXIsNotZero_uid49_fpAddSubTest_ieeeAdd_q <= not (fracXIsZero_uid48_fpAddSubTest_ieeeAdd_q);

    -- excN_bSig_uid51_fpAddSubTest_ieeeAdd(LOGICAL,50)@1 + 1
    excN_bSig_uid51_fpAddSubTest_ieeeAdd_qi <= expXIsMax_uid47_fpAddSubTest_ieeeAdd_q and fracXIsNotZero_uid49_fpAddSubTest_ieeeAdd_q;
    excN_bSig_uid51_fpAddSubTest_ieeeAdd_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_bSig_uid51_fpAddSubTest_ieeeAdd_qi, xout => excN_bSig_uid51_fpAddSubTest_ieeeAdd_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid35_fpAddSubTest_ieeeAdd(LOGICAL,34)@1
    fracXIsNotZero_uid35_fpAddSubTest_ieeeAdd_q <= not (fracXIsZero_uid34_fpAddSubTest_ieeeAdd_q);

    -- excN_aSig_uid37_fpAddSubTest_ieeeAdd(LOGICAL,36)@1 + 1
    excN_aSig_uid37_fpAddSubTest_ieeeAdd_qi <= expXIsMax_uid33_fpAddSubTest_ieeeAdd_q and fracXIsNotZero_uid35_fpAddSubTest_ieeeAdd_q;
    excN_aSig_uid37_fpAddSubTest_ieeeAdd_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_aSig_uid37_fpAddSubTest_ieeeAdd_qi, xout => excN_aSig_uid37_fpAddSubTest_ieeeAdd_q, clk => clk, aclr => areset );

    -- excRNaN2_uid133_fpAddSubTest_ieeeAdd(LOGICAL,132)@2
    excRNaN2_uid133_fpAddSubTest_ieeeAdd_q <= excN_aSig_uid37_fpAddSubTest_ieeeAdd_q or excN_bSig_uid51_fpAddSubTest_ieeeAdd_q;

    -- redist3_effSub_uid61_fpAddSubTest_ieeeAdd_q_2(DELAY,248)
    redist3_effSub_uid61_fpAddSubTest_ieeeAdd_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => effSub_uid61_fpAddSubTest_ieeeAdd_q, xout => redist3_effSub_uid61_fpAddSubTest_ieeeAdd_q_2_q, clk => clk, aclr => areset );

    -- redist7_excI_bSig_uid50_fpAddSubTest_ieeeAdd_q_1(DELAY,252)
    redist7_excI_bSig_uid50_fpAddSubTest_ieeeAdd_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_bSig_uid50_fpAddSubTest_ieeeAdd_q, xout => redist7_excI_bSig_uid50_fpAddSubTest_ieeeAdd_q_1_q, clk => clk, aclr => areset );

    -- redist10_excI_aSig_uid36_fpAddSubTest_ieeeAdd_q_1(DELAY,255)
    redist10_excI_aSig_uid36_fpAddSubTest_ieeeAdd_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_aSig_uid36_fpAddSubTest_ieeeAdd_q, xout => redist10_excI_aSig_uid36_fpAddSubTest_ieeeAdd_q_1_q, clk => clk, aclr => areset );

    -- excAIBISub_uid134_fpAddSubTest_ieeeAdd(LOGICAL,133)@2
    excAIBISub_uid134_fpAddSubTest_ieeeAdd_q <= redist10_excI_aSig_uid36_fpAddSubTest_ieeeAdd_q_1_q and redist7_excI_bSig_uid50_fpAddSubTest_ieeeAdd_q_1_q and redist3_effSub_uid61_fpAddSubTest_ieeeAdd_q_2_q;

    -- excRNaN_uid135_fpAddSubTest_ieeeAdd(LOGICAL,134)@2
    excRNaN_uid135_fpAddSubTest_ieeeAdd_q <= excAIBISub_uid134_fpAddSubTest_ieeeAdd_q or excRNaN2_uid133_fpAddSubTest_ieeeAdd_q;

    -- invExcRNaN_uid147_fpAddSubTest_ieeeAdd(LOGICAL,146)@2
    invExcRNaN_uid147_fpAddSubTest_ieeeAdd_q <= not (excRNaN_uid135_fpAddSubTest_ieeeAdd_q);

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- signRPostExc_uid148_fpAddSubTest_ieeeAdd(LOGICAL,147)@2
    signRPostExc_uid148_fpAddSubTest_ieeeAdd_q <= invExcRNaN_uid147_fpAddSubTest_ieeeAdd_q and signRInfRZRReg_uid146_fpAddSubTest_ieeeAdd_q;

    -- cRBit_uid108_fpAddSubTest_ieeeAdd(CONSTANT,107)
    cRBit_uid108_fpAddSubTest_ieeeAdd_q <= "01000";

    -- leftShiftStage1Idx3Rng3_uid236_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd(BITSELECT,235)@1
    leftShiftStage1Idx3Rng3_uid236_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_in <= leftShiftStage0_uid228_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q(11 downto 0);
    leftShiftStage1Idx3Rng3_uid236_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_b <= leftShiftStage1Idx3Rng3_uid236_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_in(11 downto 0);

    -- leftShiftStage1Idx3Pad3_uid235_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd(CONSTANT,234)
    leftShiftStage1Idx3Pad3_uid235_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q <= "000";

    -- leftShiftStage1Idx3_uid237_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd(BITJOIN,236)@1
    leftShiftStage1Idx3_uid237_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q <= leftShiftStage1Idx3Rng3_uid236_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_b & leftShiftStage1Idx3Pad3_uid235_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q;

    -- leftShiftStage1Idx2Rng2_uid233_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd(BITSELECT,232)@1
    leftShiftStage1Idx2Rng2_uid233_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_in <= leftShiftStage0_uid228_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q(12 downto 0);
    leftShiftStage1Idx2Rng2_uid233_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_b <= leftShiftStage1Idx2Rng2_uid233_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_in(12 downto 0);

    -- leftShiftStage1Idx2_uid234_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd(BITJOIN,233)@1
    leftShiftStage1Idx2_uid234_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q <= leftShiftStage1Idx2Rng2_uid233_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_b & zs_uid173_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q;

    -- leftShiftStage1Idx1Rng1_uid230_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd(BITSELECT,229)@1
    leftShiftStage1Idx1Rng1_uid230_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_in <= leftShiftStage0_uid228_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q(13 downto 0);
    leftShiftStage1Idx1Rng1_uid230_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_b <= leftShiftStage1Idx1Rng1_uid230_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_in(13 downto 0);

    -- leftShiftStage1Idx1_uid231_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd(BITJOIN,230)@1
    leftShiftStage1Idx1_uid231_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q <= leftShiftStage1Idx1Rng1_uid230_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_b & GND_q;

    -- leftShiftStage0Idx3Rng12_uid225_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd(BITSELECT,224)@1
    leftShiftStage0Idx3Rng12_uid225_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_in <= fracGRS_uid93_fpAddSubTest_ieeeAdd_q(2 downto 0);
    leftShiftStage0Idx3Rng12_uid225_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_b <= leftShiftStage0Idx3Rng12_uid225_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_in(2 downto 0);

    -- leftShiftStage0Idx3_uid226_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd(BITJOIN,225)@1
    leftShiftStage0Idx3_uid226_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q <= leftShiftStage0Idx3Rng12_uid225_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_b & padConst_uid73_fpAddSubTest_ieeeAdd_q;

    -- leftShiftStage0Idx2_uid223_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd(BITJOIN,222)@1
    leftShiftStage0Idx2_uid223_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q <= vStage_uid163_lzCountVal_uid94_fpAddSubTest_ieeeAdd_b & zs_uid159_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q;

    -- leftShiftStage0Idx1Rng4_uid219_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd(BITSELECT,218)@1
    leftShiftStage0Idx1Rng4_uid219_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_in <= fracGRS_uid93_fpAddSubTest_ieeeAdd_q(10 downto 0);
    leftShiftStage0Idx1Rng4_uid219_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_b <= leftShiftStage0Idx1Rng4_uid219_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_in(10 downto 0);

    -- leftShiftStage0Idx1_uid220_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd(BITJOIN,219)@1
    leftShiftStage0Idx1_uid220_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q <= leftShiftStage0Idx1Rng4_uid219_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_b & zs_uid167_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q;

    -- leftShiftStage0_uid228_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd(MUX,227)@1
    leftShiftStage0_uid228_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_s <= leftShiftStageSel3Dto2_uid227_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_merged_bit_select_b;
    leftShiftStage0_uid228_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_combproc: PROCESS (leftShiftStage0_uid228_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_s, fracGRS_uid93_fpAddSubTest_ieeeAdd_q, leftShiftStage0Idx1_uid220_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q, leftShiftStage0Idx2_uid223_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q, leftShiftStage0Idx3_uid226_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q)
    BEGIN
        CASE (leftShiftStage0_uid228_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_s) IS
            WHEN "00" => leftShiftStage0_uid228_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q <= fracGRS_uid93_fpAddSubTest_ieeeAdd_q;
            WHEN "01" => leftShiftStage0_uid228_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q <= leftShiftStage0Idx1_uid220_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q;
            WHEN "10" => leftShiftStage0_uid228_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q <= leftShiftStage0Idx2_uid223_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q;
            WHEN "11" => leftShiftStage0_uid228_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q <= leftShiftStage0Idx3_uid226_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q;
            WHEN OTHERS => leftShiftStage0_uid228_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- leftShiftStageSel3Dto2_uid227_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_merged_bit_select(BITSELECT,244)@1
    leftShiftStageSel3Dto2_uid227_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_merged_bit_select_b <= r_uid182_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q(3 downto 2);
    leftShiftStageSel3Dto2_uid227_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_merged_bit_select_c <= r_uid182_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q(1 downto 0);

    -- leftShiftStage1_uid239_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd(MUX,238)@1
    leftShiftStage1_uid239_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_s <= leftShiftStageSel3Dto2_uid227_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_merged_bit_select_c;
    leftShiftStage1_uid239_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_combproc: PROCESS (leftShiftStage1_uid239_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_s, leftShiftStage0_uid228_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q, leftShiftStage1Idx1_uid231_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q, leftShiftStage1Idx2_uid234_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q, leftShiftStage1Idx3_uid237_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q)
    BEGIN
        CASE (leftShiftStage1_uid239_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_s) IS
            WHEN "00" => leftShiftStage1_uid239_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q <= leftShiftStage0_uid228_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q;
            WHEN "01" => leftShiftStage1_uid239_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q <= leftShiftStage1Idx1_uid231_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q;
            WHEN "10" => leftShiftStage1_uid239_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q <= leftShiftStage1Idx2_uid234_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q;
            WHEN "11" => leftShiftStage1_uid239_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q <= leftShiftStage1Idx3_uid237_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q;
            WHEN OTHERS => leftShiftStage1_uid239_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- LSB_uid106_fpAddSubTest_ieeeAdd(BITSELECT,105)@1
    LSB_uid106_fpAddSubTest_ieeeAdd_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid239_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q(4 downto 0));
    LSB_uid106_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR(LSB_uid106_fpAddSubTest_ieeeAdd_in(4 downto 4));

    -- Guard_uid105_fpAddSubTest_ieeeAdd(BITSELECT,104)@1
    Guard_uid105_fpAddSubTest_ieeeAdd_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid239_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q(3 downto 0));
    Guard_uid105_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR(Guard_uid105_fpAddSubTest_ieeeAdd_in(3 downto 3));

    -- Round_uid104_fpAddSubTest_ieeeAdd(BITSELECT,103)@1
    Round_uid104_fpAddSubTest_ieeeAdd_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid239_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q(2 downto 0));
    Round_uid104_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR(Round_uid104_fpAddSubTest_ieeeAdd_in(2 downto 2));

    -- Sticky1_uid103_fpAddSubTest_ieeeAdd(BITSELECT,102)@1
    Sticky1_uid103_fpAddSubTest_ieeeAdd_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid239_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q(1 downto 0));
    Sticky1_uid103_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR(Sticky1_uid103_fpAddSubTest_ieeeAdd_in(1 downto 1));

    -- Sticky0_uid102_fpAddSubTest_ieeeAdd(BITSELECT,101)@1
    Sticky0_uid102_fpAddSubTest_ieeeAdd_in <= STD_LOGIC_VECTOR(leftShiftStage1_uid239_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q(0 downto 0));
    Sticky0_uid102_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR(Sticky0_uid102_fpAddSubTest_ieeeAdd_in(0 downto 0));

    -- rndBitCond_uid107_fpAddSubTest_ieeeAdd(BITJOIN,106)@1
    rndBitCond_uid107_fpAddSubTest_ieeeAdd_q <= LSB_uid106_fpAddSubTest_ieeeAdd_b & Guard_uid105_fpAddSubTest_ieeeAdd_b & Round_uid104_fpAddSubTest_ieeeAdd_b & Sticky1_uid103_fpAddSubTest_ieeeAdd_b & Sticky0_uid102_fpAddSubTest_ieeeAdd_b;

    -- rBi_uid109_fpAddSubTest_ieeeAdd(LOGICAL,108)@1 + 1
    rBi_uid109_fpAddSubTest_ieeeAdd_qi <= "1" WHEN rndBitCond_uid107_fpAddSubTest_ieeeAdd_q = cRBit_uid108_fpAddSubTest_ieeeAdd_q ELSE "0";
    rBi_uid109_fpAddSubTest_ieeeAdd_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => rBi_uid109_fpAddSubTest_ieeeAdd_qi, xout => rBi_uid109_fpAddSubTest_ieeeAdd_q, clk => clk, aclr => areset );

    -- roundBit_uid110_fpAddSubTest_ieeeAdd(LOGICAL,109)@2
    roundBit_uid110_fpAddSubTest_ieeeAdd_q <= not (rBi_uid109_fpAddSubTest_ieeeAdd_q);

    -- oneCST_uid99_fpAddSubTest_ieeeAdd(CONSTANT,98)
    oneCST_uid99_fpAddSubTest_ieeeAdd_q <= "00001";

    -- expInc_uid100_fpAddSubTest_ieeeAdd(ADD,99)@1
    expInc_uid100_fpAddSubTest_ieeeAdd_a <= STD_LOGIC_VECTOR("0" & redist13_exp_aSig_uid30_fpAddSubTest_ieeeAdd_b_1_q);
    expInc_uid100_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR("0" & oneCST_uid99_fpAddSubTest_ieeeAdd_q);
    expInc_uid100_fpAddSubTest_ieeeAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid100_fpAddSubTest_ieeeAdd_a) + UNSIGNED(expInc_uid100_fpAddSubTest_ieeeAdd_b));
    expInc_uid100_fpAddSubTest_ieeeAdd_q <= expInc_uid100_fpAddSubTest_ieeeAdd_o(5 downto 0);

    -- expPostNorm_uid101_fpAddSubTest_ieeeAdd(SUB,100)@1 + 1
    expPostNorm_uid101_fpAddSubTest_ieeeAdd_a <= STD_LOGIC_VECTOR("0" & expInc_uid100_fpAddSubTest_ieeeAdd_q);
    expPostNorm_uid101_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR("000" & r_uid182_lzCountVal_uid94_fpAddSubTest_ieeeAdd_q);
    expPostNorm_uid101_fpAddSubTest_ieeeAdd_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expPostNorm_uid101_fpAddSubTest_ieeeAdd_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expPostNorm_uid101_fpAddSubTest_ieeeAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid101_fpAddSubTest_ieeeAdd_a) - UNSIGNED(expPostNorm_uid101_fpAddSubTest_ieeeAdd_b));
        END IF;
    END PROCESS;
    expPostNorm_uid101_fpAddSubTest_ieeeAdd_q <= expPostNorm_uid101_fpAddSubTest_ieeeAdd_o(6 downto 0);

    -- fracPostNorm_uid98_fpAddSubTest_ieeeAdd(BITSELECT,97)@1
    fracPostNorm_uid98_fpAddSubTest_ieeeAdd_b <= leftShiftStage1_uid239_fracPostNormExt_uid97_fpAddSubTest_ieeeAdd_q(14 downto 1);

    -- fracPostNormRndRange_uid111_fpAddSubTest_ieeeAdd(BITSELECT,110)@1
    fracPostNormRndRange_uid111_fpAddSubTest_ieeeAdd_in <= fracPostNorm_uid98_fpAddSubTest_ieeeAdd_b(12 downto 0);
    fracPostNormRndRange_uid111_fpAddSubTest_ieeeAdd_b <= fracPostNormRndRange_uid111_fpAddSubTest_ieeeAdd_in(12 downto 2);

    -- redist1_fracPostNormRndRange_uid111_fpAddSubTest_ieeeAdd_b_1(DELAY,246)
    redist1_fracPostNormRndRange_uid111_fpAddSubTest_ieeeAdd_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracPostNormRndRange_uid111_fpAddSubTest_ieeeAdd_b, xout => redist1_fracPostNormRndRange_uid111_fpAddSubTest_ieeeAdd_b_1_q, clk => clk, aclr => areset );

    -- expFracR_uid112_fpAddSubTest_ieeeAdd(BITJOIN,111)@2
    expFracR_uid112_fpAddSubTest_ieeeAdd_q <= expPostNorm_uid101_fpAddSubTest_ieeeAdd_q & redist1_fracPostNormRndRange_uid111_fpAddSubTest_ieeeAdd_b_1_q;

    -- rndExpFrac_uid113_fpAddSubTest_ieeeAdd(ADD,112)@2
    rndExpFrac_uid113_fpAddSubTest_ieeeAdd_a <= STD_LOGIC_VECTOR("0" & expFracR_uid112_fpAddSubTest_ieeeAdd_q);
    rndExpFrac_uid113_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR("000000000000000000" & roundBit_uid110_fpAddSubTest_ieeeAdd_q);
    rndExpFrac_uid113_fpAddSubTest_ieeeAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(rndExpFrac_uid113_fpAddSubTest_ieeeAdd_a) + UNSIGNED(rndExpFrac_uid113_fpAddSubTest_ieeeAdd_b));
    rndExpFrac_uid113_fpAddSubTest_ieeeAdd_q <= rndExpFrac_uid113_fpAddSubTest_ieeeAdd_o(18 downto 0);

    -- expRPreExc_uid126_fpAddSubTest_ieeeAdd(BITSELECT,125)@2
    expRPreExc_uid126_fpAddSubTest_ieeeAdd_in <= rndExpFrac_uid113_fpAddSubTest_ieeeAdd_q(15 downto 0);
    expRPreExc_uid126_fpAddSubTest_ieeeAdd_b <= expRPreExc_uid126_fpAddSubTest_ieeeAdd_in(15 downto 11);

    -- rndExpFracOvfBits_uid118_fpAddSubTest_ieeeAdd(BITSELECT,117)@2
    rndExpFracOvfBits_uid118_fpAddSubTest_ieeeAdd_in <= rndExpFrac_uid113_fpAddSubTest_ieeeAdd_q(17 downto 0);
    rndExpFracOvfBits_uid118_fpAddSubTest_ieeeAdd_b <= rndExpFracOvfBits_uid118_fpAddSubTest_ieeeAdd_in(17 downto 16);

    -- rOvfExtraBits_uid119_fpAddSubTest_ieeeAdd(LOGICAL,118)@2
    rOvfExtraBits_uid119_fpAddSubTest_ieeeAdd_q <= "1" WHEN rndExpFracOvfBits_uid118_fpAddSubTest_ieeeAdd_b = zocst_uid85_fpAddSubTest_ieeeAdd_q ELSE "0";

    -- wEP2AllOwE_uid114_fpAddSubTest_ieeeAdd(CONSTANT,113)
    wEP2AllOwE_uid114_fpAddSubTest_ieeeAdd_q <= "0011111";

    -- rndExp_uid115_fpAddSubTest_ieeeAdd(BITSELECT,114)@2
    rndExp_uid115_fpAddSubTest_ieeeAdd_in <= rndExpFrac_uid113_fpAddSubTest_ieeeAdd_q(17 downto 0);
    rndExp_uid115_fpAddSubTest_ieeeAdd_b <= rndExp_uid115_fpAddSubTest_ieeeAdd_in(17 downto 11);

    -- rOvfEQMax_uid116_fpAddSubTest_ieeeAdd(LOGICAL,115)@2
    rOvfEQMax_uid116_fpAddSubTest_ieeeAdd_q <= "1" WHEN rndExp_uid115_fpAddSubTest_ieeeAdd_b = wEP2AllOwE_uid114_fpAddSubTest_ieeeAdd_q ELSE "0";

    -- rOvf_uid120_fpAddSubTest_ieeeAdd(LOGICAL,119)@2
    rOvf_uid120_fpAddSubTest_ieeeAdd_q <= rOvfEQMax_uid116_fpAddSubTest_ieeeAdd_q or rOvfExtraBits_uid119_fpAddSubTest_ieeeAdd_q;

    -- regInputs_uid127_fpAddSubTest_ieeeAdd(LOGICAL,126)@1 + 1
    regInputs_uid127_fpAddSubTest_ieeeAdd_qi <= excR_aSig_uid40_fpAddSubTest_ieeeAdd_q and excR_bSig_uid54_fpAddSubTest_ieeeAdd_q;
    regInputs_uid127_fpAddSubTest_ieeeAdd_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => regInputs_uid127_fpAddSubTest_ieeeAdd_qi, xout => regInputs_uid127_fpAddSubTest_ieeeAdd_q, clk => clk, aclr => areset );

    -- rInfOvf_uid130_fpAddSubTest_ieeeAdd(LOGICAL,129)@2
    rInfOvf_uid130_fpAddSubTest_ieeeAdd_q <= regInputs_uid127_fpAddSubTest_ieeeAdd_q and rOvf_uid120_fpAddSubTest_ieeeAdd_q;

    -- excRInfVInC_uid131_fpAddSubTest_ieeeAdd(BITJOIN,130)@2
    excRInfVInC_uid131_fpAddSubTest_ieeeAdd_q <= rInfOvf_uid130_fpAddSubTest_ieeeAdd_q & excN_bSig_uid51_fpAddSubTest_ieeeAdd_q & excN_aSig_uid37_fpAddSubTest_ieeeAdd_q & redist7_excI_bSig_uid50_fpAddSubTest_ieeeAdd_q_1_q & redist10_excI_aSig_uid36_fpAddSubTest_ieeeAdd_q_1_q & redist3_effSub_uid61_fpAddSubTest_ieeeAdd_q_2_q;

    -- excRInf_uid132_fpAddSubTest_ieeeAdd(LOOKUP,131)@2
    excRInf_uid132_fpAddSubTest_ieeeAdd_combproc: PROCESS (excRInfVInC_uid131_fpAddSubTest_ieeeAdd_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRInfVInC_uid131_fpAddSubTest_ieeeAdd_q) IS
            WHEN "000000" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "000001" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "000010" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "1";
            WHEN "000011" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "1";
            WHEN "000100" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "1";
            WHEN "000101" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "1";
            WHEN "000110" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "1";
            WHEN "000111" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "001000" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "001001" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "001010" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "001011" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "001100" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "001101" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "001110" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "001111" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "010000" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "010001" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "010010" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "010011" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "010100" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "010101" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "010110" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "010111" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "011000" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "011001" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "011010" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "011011" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "011100" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "011101" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "011110" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "011111" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "100000" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "1";
            WHEN "100001" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "100010" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "100011" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "100100" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "100101" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "100110" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "100111" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "101000" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "101001" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "101010" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "101011" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "101100" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "101101" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "101110" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "101111" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "110000" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "110001" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "110010" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "110011" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "110100" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "110101" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "110110" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "110111" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "111000" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "111001" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "111010" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "111011" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "111100" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "111101" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "111110" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "111111" => excRInf_uid132_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRInf_uid132_fpAddSubTest_ieeeAdd_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- redist2_aMinusA_uid96_fpAddSubTest_ieeeAdd_q_1(DELAY,247)
    redist2_aMinusA_uid96_fpAddSubTest_ieeeAdd_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aMinusA_uid96_fpAddSubTest_ieeeAdd_q, xout => redist2_aMinusA_uid96_fpAddSubTest_ieeeAdd_q_1_q, clk => clk, aclr => areset );

    -- rUdfExtraBit_uid123_fpAddSubTest_ieeeAdd(BITSELECT,122)@2
    rUdfExtraBit_uid123_fpAddSubTest_ieeeAdd_in <= STD_LOGIC_VECTOR(rndExpFrac_uid113_fpAddSubTest_ieeeAdd_q(17 downto 0));
    rUdfExtraBit_uid123_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR(rUdfExtraBit_uid123_fpAddSubTest_ieeeAdd_in(17 downto 17));

    -- wEP2AllZ_uid121_fpAddSubTest_ieeeAdd(CONSTANT,120)
    wEP2AllZ_uid121_fpAddSubTest_ieeeAdd_q <= "0000000";

    -- rUdfEQMin_uid122_fpAddSubTest_ieeeAdd(LOGICAL,121)@2
    rUdfEQMin_uid122_fpAddSubTest_ieeeAdd_q <= "1" WHEN rndExp_uid115_fpAddSubTest_ieeeAdd_b = wEP2AllZ_uid121_fpAddSubTest_ieeeAdd_q ELSE "0";

    -- rUdf_uid124_fpAddSubTest_ieeeAdd(LOGICAL,123)@2
    rUdf_uid124_fpAddSubTest_ieeeAdd_q <= rUdfEQMin_uid122_fpAddSubTest_ieeeAdd_q or rUdfExtraBit_uid123_fpAddSubTest_ieeeAdd_b;

    -- redist9_excZ_bSig_uid26_uid46_fpAddSubTest_ieeeAdd_q_2(DELAY,254)
    redist9_excZ_bSig_uid26_uid46_fpAddSubTest_ieeeAdd_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist8_excZ_bSig_uid26_uid46_fpAddSubTest_ieeeAdd_q_1_q, xout => redist9_excZ_bSig_uid26_uid46_fpAddSubTest_ieeeAdd_q_2_q, clk => clk, aclr => areset );

    -- redist11_excZ_aSig_uid25_uid32_fpAddSubTest_ieeeAdd_q_1(DELAY,256)
    redist11_excZ_aSig_uid25_uid32_fpAddSubTest_ieeeAdd_q_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_aSig_uid25_uid32_fpAddSubTest_ieeeAdd_q, xout => redist11_excZ_aSig_uid25_uid32_fpAddSubTest_ieeeAdd_q_1_q, clk => clk, aclr => areset );

    -- excRZeroVInC_uid128_fpAddSubTest_ieeeAdd(BITJOIN,127)@2
    excRZeroVInC_uid128_fpAddSubTest_ieeeAdd_q <= redist2_aMinusA_uid96_fpAddSubTest_ieeeAdd_q_1_q & rUdf_uid124_fpAddSubTest_ieeeAdd_q & regInputs_uid127_fpAddSubTest_ieeeAdd_q & redist9_excZ_bSig_uid26_uid46_fpAddSubTest_ieeeAdd_q_2_q & redist11_excZ_aSig_uid25_uid32_fpAddSubTest_ieeeAdd_q_1_q;

    -- excRZero_uid129_fpAddSubTest_ieeeAdd(LOOKUP,128)@2
    excRZero_uid129_fpAddSubTest_ieeeAdd_combproc: PROCESS (excRZeroVInC_uid128_fpAddSubTest_ieeeAdd_q)
    BEGIN
        -- Begin reserved scope level
        CASE (excRZeroVInC_uid128_fpAddSubTest_ieeeAdd_q) IS
            WHEN "00000" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "00001" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "00010" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "00011" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "1";
            WHEN "00100" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "00101" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "00110" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "00111" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "01000" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "01001" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "01010" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "01011" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "1";
            WHEN "01100" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "1";
            WHEN "01101" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "01110" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "01111" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "10000" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "10001" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "10010" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "10011" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "1";
            WHEN "10100" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "1";
            WHEN "10101" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "10110" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "10111" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "11000" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "11001" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "11010" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "11011" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "1";
            WHEN "11100" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "1";
            WHEN "11101" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "11110" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN "11111" => excRZero_uid129_fpAddSubTest_ieeeAdd_q <= "0";
            WHEN OTHERS => -- unreachable
                           excRZero_uid129_fpAddSubTest_ieeeAdd_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- concExc_uid136_fpAddSubTest_ieeeAdd(BITJOIN,135)@2
    concExc_uid136_fpAddSubTest_ieeeAdd_q <= excRNaN_uid135_fpAddSubTest_ieeeAdd_q & excRInf_uid132_fpAddSubTest_ieeeAdd_q & excRZero_uid129_fpAddSubTest_ieeeAdd_q;

    -- excREnc_uid137_fpAddSubTest_ieeeAdd(LOOKUP,136)@2
    excREnc_uid137_fpAddSubTest_ieeeAdd_combproc: PROCESS (concExc_uid136_fpAddSubTest_ieeeAdd_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid136_fpAddSubTest_ieeeAdd_q) IS
            WHEN "000" => excREnc_uid137_fpAddSubTest_ieeeAdd_q <= "01";
            WHEN "001" => excREnc_uid137_fpAddSubTest_ieeeAdd_q <= "00";
            WHEN "010" => excREnc_uid137_fpAddSubTest_ieeeAdd_q <= "10";
            WHEN "011" => excREnc_uid137_fpAddSubTest_ieeeAdd_q <= "10";
            WHEN "100" => excREnc_uid137_fpAddSubTest_ieeeAdd_q <= "11";
            WHEN "101" => excREnc_uid137_fpAddSubTest_ieeeAdd_q <= "11";
            WHEN "110" => excREnc_uid137_fpAddSubTest_ieeeAdd_q <= "11";
            WHEN "111" => excREnc_uid137_fpAddSubTest_ieeeAdd_q <= "11";
            WHEN OTHERS => -- unreachable
                           excREnc_uid137_fpAddSubTest_ieeeAdd_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid156_fpAddSubTest_ieeeAdd(MUX,155)@2
    expRPostExc_uid156_fpAddSubTest_ieeeAdd_s <= excREnc_uid137_fpAddSubTest_ieeeAdd_q;
    expRPostExc_uid156_fpAddSubTest_ieeeAdd_combproc: PROCESS (expRPostExc_uid156_fpAddSubTest_ieeeAdd_s, cstAllZWE_uid29_fpAddSubTest_ieeeAdd_q, expRPreExc_uid126_fpAddSubTest_ieeeAdd_b, cstAllOWE_uid27_fpAddSubTest_ieeeAdd_q)
    BEGIN
        CASE (expRPostExc_uid156_fpAddSubTest_ieeeAdd_s) IS
            WHEN "00" => expRPostExc_uid156_fpAddSubTest_ieeeAdd_q <= cstAllZWE_uid29_fpAddSubTest_ieeeAdd_q;
            WHEN "01" => expRPostExc_uid156_fpAddSubTest_ieeeAdd_q <= expRPreExc_uid126_fpAddSubTest_ieeeAdd_b;
            WHEN "10" => expRPostExc_uid156_fpAddSubTest_ieeeAdd_q <= cstAllOWE_uid27_fpAddSubTest_ieeeAdd_q;
            WHEN "11" => expRPostExc_uid156_fpAddSubTest_ieeeAdd_q <= cstAllOWE_uid27_fpAddSubTest_ieeeAdd_q;
            WHEN OTHERS => expRPostExc_uid156_fpAddSubTest_ieeeAdd_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid149_fpAddSubTest_ieeeAdd(CONSTANT,148)
    oneFracRPostExc2_uid149_fpAddSubTest_ieeeAdd_q <= "0000000001";

    -- fracRPreExc_uid125_fpAddSubTest_ieeeAdd(BITSELECT,124)@2
    fracRPreExc_uid125_fpAddSubTest_ieeeAdd_in <= rndExpFrac_uid113_fpAddSubTest_ieeeAdd_q(10 downto 0);
    fracRPreExc_uid125_fpAddSubTest_ieeeAdd_b <= fracRPreExc_uid125_fpAddSubTest_ieeeAdd_in(10 downto 1);

    -- fracRPostExc_uid152_fpAddSubTest_ieeeAdd(MUX,151)@2
    fracRPostExc_uid152_fpAddSubTest_ieeeAdd_s <= excREnc_uid137_fpAddSubTest_ieeeAdd_q;
    fracRPostExc_uid152_fpAddSubTest_ieeeAdd_combproc: PROCESS (fracRPostExc_uid152_fpAddSubTest_ieeeAdd_s, cstZeroWF_uid28_fpAddSubTest_ieeeAdd_q, fracRPreExc_uid125_fpAddSubTest_ieeeAdd_b, oneFracRPostExc2_uid149_fpAddSubTest_ieeeAdd_q)
    BEGIN
        CASE (fracRPostExc_uid152_fpAddSubTest_ieeeAdd_s) IS
            WHEN "00" => fracRPostExc_uid152_fpAddSubTest_ieeeAdd_q <= cstZeroWF_uid28_fpAddSubTest_ieeeAdd_q;
            WHEN "01" => fracRPostExc_uid152_fpAddSubTest_ieeeAdd_q <= fracRPreExc_uid125_fpAddSubTest_ieeeAdd_b;
            WHEN "10" => fracRPostExc_uid152_fpAddSubTest_ieeeAdd_q <= cstZeroWF_uid28_fpAddSubTest_ieeeAdd_q;
            WHEN "11" => fracRPostExc_uid152_fpAddSubTest_ieeeAdd_q <= oneFracRPostExc2_uid149_fpAddSubTest_ieeeAdd_q;
            WHEN OTHERS => fracRPostExc_uid152_fpAddSubTest_ieeeAdd_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid157_fpAddSubTest_ieeeAdd(BITJOIN,156)@2
    R_uid157_fpAddSubTest_ieeeAdd_q <= signRPostExc_uid148_fpAddSubTest_ieeeAdd_q & expRPostExc_uid156_fpAddSubTest_ieeeAdd_q & fracRPostExc_uid152_fpAddSubTest_ieeeAdd_q;

    -- xOut(GPOUT,4)@2
    q <= R_uid157_fpAddSubTest_ieeeAdd_q;

END normal;

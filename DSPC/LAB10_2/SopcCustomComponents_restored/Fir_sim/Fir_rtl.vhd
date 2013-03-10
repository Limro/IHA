----------------------------------------------------------------------------- 
-- Altera DSP Builder Advanced Flow Tools Release Version 12.1
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2012 Altera Corporation.  All rights reserved.    
-- Your use of  Altera  Corporation's design tools,  logic functions and other 
-- software and tools,  and its AMPP  partner logic functions, and  any output 
-- files  any of the  foregoing  device programming or simulation files),  and 
-- any associated  documentation or information are expressly subject  to  the 
-- terms and conditions  of the Altera Program License Subscription Agreement, 
-- Altera  MegaCore  Function  License  Agreement, or other applicable license 
-- agreement,  including,  without limitation,  that your use  is for the sole 
-- purpose of  programming  logic  devices  manufactured by Altera and sold by 
-- Altera or its authorized  distributors.  Please  refer  to  the  applicable 
-- agreement for further details.
----------------------------------------------------------------------------- 

-- VHDL created from Fir_rtl
-- VHDL created on Wed Mar 06 11:21:30 2013


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

-- Text written from d:/SJ/nightly/12.1/177/w32/p4/ip/aion/src/mip_common/hw_model.cpp:1240
entity Fir_rtl is
    port (
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xIn_0 : in std_logic_vector(23 downto 0);
        xOut_v : out std_logic_vector(0 downto 0);
        xOut_c : out std_logic_vector(7 downto 0);
        xOut_0 : out std_logic_vector(37 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        h_areset : in std_logic
        );
end;

architecture normal of Fir_rtl is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_memread_q_11_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_memread_q_12_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_memread_q_18_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_16_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr1_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr1_q_14_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr2_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr3_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr3_q_13_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr4_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr4_q_12_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr5_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr5_q_12_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr6_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr7_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr7_q_11_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr8_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr8_q_12_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr9_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr9_q_12_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr10_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr11_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr11_q_11_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr12_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr13_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr13_q_11_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr14_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr15_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr16_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr16_q_11_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr17_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr18_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr18_q_11_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr19_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr20_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr20_q_11_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr21_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr21_q_11_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr22_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr23_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr24_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr25_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr25_q_12_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr26_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr27_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr27_q_11_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr28_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr28_q_12_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr29_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr29_q_12_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr30_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr31_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr31_q_11_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr32_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr32_q_11_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr33_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr33_q_12_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr34_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr35_q : std_logic_vector (23 downto 0);
    signal d_u0_m0_wo0_wi0_delayr35_q_12_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_wi0_delayr36_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_add0_0_a : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_mtree_add0_0_b : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_mtree_add0_0_o : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_add0_0_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_add0_2_a : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_mtree_add0_2_b : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_mtree_add0_2_o : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_add0_2_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_add0_4_a : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_add0_4_b : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_add0_4_o : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_add0_4_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_add0_6_a : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_add0_6_b : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_add0_6_o : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_add0_6_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_add0_8_a : std_logic_vector(32 downto 0);
    signal u0_m0_wo0_mtree_add0_8_b : std_logic_vector(32 downto 0);
    signal u0_m0_wo0_mtree_add0_8_o : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_add0_8_q : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_add0_9_a : std_logic_vector(32 downto 0);
    signal u0_m0_wo0_mtree_add0_9_b : std_logic_vector(32 downto 0);
    signal u0_m0_wo0_mtree_add0_9_o : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_add0_9_q : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_add0_10_a : std_logic_vector(32 downto 0);
    signal u0_m0_wo0_mtree_add0_10_b : std_logic_vector(32 downto 0);
    signal u0_m0_wo0_mtree_add0_10_o : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_add0_10_q : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_add0_12_a : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_add0_12_b : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_add0_12_o : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_add0_12_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_add0_14_a : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_add0_14_b : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_add0_14_o : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_add0_14_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_add0_16_a : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_mtree_add0_16_b : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_mtree_add0_16_o : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_add0_16_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_add1_0_a : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_add1_0_b : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_add1_0_o : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_add1_0_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_add1_1_a : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_add1_1_b : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_add1_1_o : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_add1_1_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_add1_2_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_add1_2_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_add1_2_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_add1_2_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_add1_3_a : std_logic_vector(32 downto 0);
    signal u0_m0_wo0_mtree_add1_3_b : std_logic_vector(32 downto 0);
    signal u0_m0_wo0_mtree_add1_3_o : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_add1_3_q : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_add1_4_a : std_logic_vector(33 downto 0);
    signal u0_m0_wo0_mtree_add1_4_b : std_logic_vector(33 downto 0);
    signal u0_m0_wo0_mtree_add1_4_o : std_logic_vector (33 downto 0);
    signal u0_m0_wo0_mtree_add1_4_q : std_logic_vector (33 downto 0);
    signal u0_m0_wo0_mtree_add1_5_a : std_logic_vector(33 downto 0);
    signal u0_m0_wo0_mtree_add1_5_b : std_logic_vector(33 downto 0);
    signal u0_m0_wo0_mtree_add1_5_o : std_logic_vector (33 downto 0);
    signal u0_m0_wo0_mtree_add1_5_q : std_logic_vector (33 downto 0);
    signal u0_m0_wo0_mtree_add1_6_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_add1_6_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_add1_6_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_add1_6_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_add1_7_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_add1_7_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_add1_7_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_add1_7_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_add1_8_a : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_add1_8_b : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_add1_8_o : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_add1_8_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_add2_0_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_add2_0_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_add2_0_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_add2_0_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_add2_1_a : std_logic_vector(33 downto 0);
    signal u0_m0_wo0_mtree_add2_1_b : std_logic_vector(33 downto 0);
    signal u0_m0_wo0_mtree_add2_1_o : std_logic_vector (33 downto 0);
    signal u0_m0_wo0_mtree_add2_1_q : std_logic_vector (33 downto 0);
    signal u0_m0_wo0_mtree_add2_2_a : std_logic_vector(34 downto 0);
    signal u0_m0_wo0_mtree_add2_2_b : std_logic_vector(34 downto 0);
    signal u0_m0_wo0_mtree_add2_2_o : std_logic_vector (34 downto 0);
    signal u0_m0_wo0_mtree_add2_2_q : std_logic_vector (34 downto 0);
    signal u0_m0_wo0_mtree_add2_3_a : std_logic_vector(32 downto 0);
    signal u0_m0_wo0_mtree_add2_3_b : std_logic_vector(32 downto 0);
    signal u0_m0_wo0_mtree_add2_3_o : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_add2_3_q : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_add2_4_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_add2_4_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_add2_4_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_add2_4_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_add3_0_a : std_logic_vector(34 downto 0);
    signal u0_m0_wo0_mtree_add3_0_b : std_logic_vector(34 downto 0);
    signal u0_m0_wo0_mtree_add3_0_o : std_logic_vector (34 downto 0);
    signal u0_m0_wo0_mtree_add3_0_q : std_logic_vector (34 downto 0);
    signal u0_m0_wo0_mtree_add3_1_a : std_logic_vector(35 downto 0);
    signal u0_m0_wo0_mtree_add3_1_b : std_logic_vector(35 downto 0);
    signal u0_m0_wo0_mtree_add3_1_o : std_logic_vector (35 downto 0);
    signal u0_m0_wo0_mtree_add3_1_q : std_logic_vector (35 downto 0);
    signal u0_m0_wo0_mtree_add4_0_a : std_logic_vector(36 downto 0);
    signal u0_m0_wo0_mtree_add4_0_b : std_logic_vector(36 downto 0);
    signal u0_m0_wo0_mtree_add4_0_o : std_logic_vector (36 downto 0);
    signal u0_m0_wo0_mtree_add4_0_q : std_logic_vector (36 downto 0);
    signal u0_m0_wo0_mtree_add5_0_a : std_logic_vector(37 downto 0);
    signal u0_m0_wo0_mtree_add5_0_b : std_logic_vector(37 downto 0);
    signal u0_m0_wo0_mtree_add5_0_o : std_logic_vector (37 downto 0);
    signal u0_m0_wo0_mtree_add5_0_q : std_logic_vector (37 downto 0);
    signal u0_m0_wo0_oseq_gated_reg_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_replace_add_a : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_replace_add_b : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_replace_add_o : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_replace_add_q : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_add_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_add_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_add_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_add_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_add_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_add_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_add_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_add_q : std_logic_vector (27 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_32_replace_split_high_b_13_q : std_logic_vector (6 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_32_replace_split_low_b_13_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_add_a : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_add_b : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_add_o : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_add_q : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_add_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_add_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_add_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_add_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_add_a : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_add_b : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_add_o : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_add_q : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_replace_add_a : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_replace_add_b : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_replace_add_o : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_replace_add_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_add_a : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_add_b : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_add_o : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_add_q : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_add_a : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_add_b : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_add_o : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_add_q : std_logic_vector (28 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_24_replace_split_high_b_11_q : std_logic_vector (6 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_24_replace_split_low_b_11_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_add_a : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_add_b : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_add_o : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_add_q : std_logic_vector (29 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_23_replace_split_high_b_12_q : std_logic_vector (6 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_23_replace_split_low_b_12_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_add_a : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_add_b : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_add_o : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_add_q : std_logic_vector (29 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_21_replace_split_high_b_11_q : std_logic_vector (6 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_21_replace_split_low_b_11_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_add_a : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_add_b : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_add_o : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_add_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_add_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_add_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_add_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_add_q : std_logic_vector (31 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_19_replace_split_high_b_11_q : std_logic_vector (6 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_19_replace_split_low_b_11_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_add_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_add_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_add_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_add_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_add_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_add_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_add_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_add_q : std_logic_vector (31 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_17_replace_split_high_b_11_q : std_logic_vector (6 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_17_replace_split_low_b_11_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_add_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_add_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_add_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_add_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_add_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_add_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_add_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_add_q : std_logic_vector (31 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_15_replace_split_high_b_12_q : std_logic_vector (6 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_15_replace_split_low_b_12_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_add_a : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_add_b : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_add_o : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_add_q : std_logic_vector (30 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_13_replace_split_high_b_11_q : std_logic_vector (6 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_13_replace_split_low_b_11_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_add_a : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_add_b : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_add_o : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_add_q : std_logic_vector (29 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_12_replace_split_high_b_11_q : std_logic_vector (6 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_12_replace_split_low_b_11_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_add_a : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_add_b : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_add_o : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_add_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_add_a : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_add_b : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_add_o : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_add_q : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_add_a : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_add_b : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_add_o : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_add_q : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_replace_add_a : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_replace_add_b : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_replace_add_o : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_replace_add_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_add_a : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_add_b : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_add_o : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_add_q : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_add_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_add_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_add_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_add_q : std_logic_vector (27 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_4_replace_split_high_b_11_q : std_logic_vector (6 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_4_replace_split_low_b_11_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_add_a : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_add_b : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_add_o : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_add_q : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_add_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_add_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_add_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_add_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_add_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_add_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_add_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_add_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_replace_add_a : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_replace_add_b : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_replace_add_o : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_replace_add_q : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_multhi_add_1_a : std_logic_vector(8 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_multhi_add_1_b : std_logic_vector(8 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_multhi_add_1_o : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_multhi_add_1_q : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_multlo_add_1_a : std_logic_vector(18 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_multlo_add_1_b : std_logic_vector(18 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_multlo_add_1_o : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_multlo_add_1_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_multhi_sub_1_a : std_logic_vector(10 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_multhi_sub_1_b : std_logic_vector(10 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_multhi_sub_1_o : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_multhi_sub_1_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_multlo_sub_1_a : std_logic_vector(20 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_multlo_sub_1_b : std_logic_vector(20 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_multlo_sub_1_o : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_multlo_sub_1_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multhi_add_1_a : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multhi_add_1_b : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multhi_add_1_o : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multhi_add_1_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multhi_sub_3_a : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multhi_sub_3_b : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multhi_sub_3_o : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multhi_sub_3_q : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multlo_add_1_a : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multlo_add_1_b : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multlo_add_1_o : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multlo_add_1_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multlo_sub_3_a : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multlo_sub_3_b : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multlo_sub_3_o : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multlo_sub_3_q : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_multhi_sub_1_a : std_logic_vector(10 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_multhi_sub_1_b : std_logic_vector(10 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_multhi_sub_1_o : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_multhi_sub_1_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_multlo_sub_1_a : std_logic_vector(20 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_multlo_sub_1_b : std_logic_vector(20 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_multlo_sub_1_o : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_multlo_sub_1_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_multhi_add_1_a : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_multhi_add_1_b : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_multhi_add_1_o : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_multhi_add_1_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_multlo_add_1_a : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_multlo_add_1_b : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_multlo_add_1_o : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_multlo_add_1_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_multhi_add_1_a : std_logic_vector(8 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_multhi_add_1_b : std_logic_vector(8 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_multhi_add_1_o : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_multhi_add_1_q : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_multlo_add_1_a : std_logic_vector(18 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_multlo_add_1_b : std_logic_vector(18 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_multlo_add_1_o : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_multlo_add_1_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_multhi_sub_1_a : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_multhi_sub_1_b : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_multhi_sub_1_o : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_multhi_sub_1_q : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_multlo_sub_1_a : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_multlo_sub_1_b : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_multlo_sub_1_o : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_multlo_sub_1_q : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_1_a : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_1_b : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_1_o : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_1_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_3_a : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_3_b : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_3_o : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_3_q : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_1_a : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_1_b : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_1_o : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_1_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_3_a : std_logic_vector(22 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_3_b : std_logic_vector(22 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_3_o : std_logic_vector (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_3_q : std_logic_vector (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multhi_add_1_a : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multhi_add_1_b : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multhi_add_1_o : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multhi_add_1_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multhi_sub_3_a : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multhi_sub_3_b : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multhi_sub_3_o : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multhi_sub_3_q : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multlo_add_1_a : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multlo_add_1_b : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multlo_add_1_o : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multlo_add_1_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multlo_sub_3_a : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multlo_sub_3_b : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multlo_sub_3_o : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multlo_sub_3_q : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multhi_add_1_a : std_logic_vector(8 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multhi_add_1_b : std_logic_vector(8 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multhi_add_1_o : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multhi_add_1_q : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multhi_add_3_a : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multhi_add_3_b : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multhi_add_3_o : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multhi_add_3_q : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multlo_add_1_a : std_logic_vector(18 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multlo_add_1_b : std_logic_vector(18 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multlo_add_1_o : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multlo_add_1_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multlo_add_3_a : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multlo_add_3_b : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multlo_add_3_o : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multlo_add_3_q : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_multhi_add_1_a : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_multhi_add_1_b : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_multhi_add_1_o : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_multhi_add_1_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_multlo_add_1_a : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_multlo_add_1_b : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_multlo_add_1_o : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_multlo_add_1_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multhi_sub_1_a : std_logic_vector(10 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multhi_sub_1_b : std_logic_vector(10 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multhi_sub_1_o : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multhi_sub_1_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multhi_add_3_a : std_logic_vector(13 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multhi_add_3_b : std_logic_vector(13 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multhi_add_3_o : std_logic_vector (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multhi_add_3_q : std_logic_vector (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multlo_sub_1_a : std_logic_vector(20 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multlo_sub_1_b : std_logic_vector(20 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multlo_sub_1_o : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multlo_sub_1_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multlo_add_3_a : std_logic_vector(24 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multlo_add_3_b : std_logic_vector(24 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multlo_add_3_o : std_logic_vector (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multlo_add_3_q : std_logic_vector (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_multhi_sub_1_a : std_logic_vector(14 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_multhi_sub_1_b : std_logic_vector(14 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_multhi_sub_1_o : std_logic_vector (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_multhi_sub_1_q : std_logic_vector (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_multlo_sub_1_a : std_logic_vector(24 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_multlo_sub_1_b : std_logic_vector(24 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_multlo_sub_1_o : std_logic_vector (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_multlo_sub_1_q : std_logic_vector (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multhi_sub_1_a : std_logic_vector(10 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multhi_sub_1_b : std_logic_vector(10 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multhi_sub_1_o : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multhi_sub_1_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multhi_add_3_a : std_logic_vector(13 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multhi_add_3_b : std_logic_vector(13 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multhi_add_3_o : std_logic_vector (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multhi_add_3_q : std_logic_vector (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multlo_sub_1_a : std_logic_vector(20 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multlo_sub_1_b : std_logic_vector(20 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multlo_sub_1_o : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multlo_sub_1_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multlo_add_3_a : std_logic_vector(24 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multlo_add_3_b : std_logic_vector(24 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multlo_add_3_o : std_logic_vector (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multlo_add_3_q : std_logic_vector (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_multhi_add_1_a : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_multhi_add_1_b : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_multhi_add_1_o : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_multhi_add_1_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_multlo_add_1_a : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_multlo_add_1_b : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_multlo_add_1_o : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_multlo_add_1_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multhi_add_1_a : std_logic_vector(8 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multhi_add_1_b : std_logic_vector(8 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multhi_add_1_o : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multhi_add_1_q : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multhi_add_3_a : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multhi_add_3_b : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multhi_add_3_o : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multhi_add_3_q : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multlo_add_1_a : std_logic_vector(18 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multlo_add_1_b : std_logic_vector(18 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multlo_add_1_o : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multlo_add_1_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multlo_add_3_a : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multlo_add_3_b : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multlo_add_3_o : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multlo_add_3_q : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multhi_add_1_a : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multhi_add_1_b : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multhi_add_1_o : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multhi_add_1_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multhi_sub_3_a : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multhi_sub_3_b : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multhi_sub_3_o : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multhi_sub_3_q : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multlo_add_1_a : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multlo_add_1_b : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multlo_add_1_o : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multlo_add_1_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multlo_sub_3_a : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multlo_sub_3_b : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multlo_sub_3_o : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multlo_sub_3_q : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_1_a : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_1_b : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_1_o : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_1_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_3_a : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_3_b : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_3_o : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_3_q : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_1_a : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_1_b : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_1_o : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_1_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_3_a : std_logic_vector(22 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_3_b : std_logic_vector(22 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_3_o : std_logic_vector (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_3_q : std_logic_vector (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_multhi_sub_1_a : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_multhi_sub_1_b : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_multhi_sub_1_o : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_multhi_sub_1_q : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_multlo_sub_1_a : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_multlo_sub_1_b : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_multlo_sub_1_o : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_multlo_sub_1_q : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_multhi_add_1_a : std_logic_vector(8 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_multhi_add_1_b : std_logic_vector(8 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_multhi_add_1_o : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_multhi_add_1_q : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_multlo_add_1_a : std_logic_vector(18 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_multlo_add_1_b : std_logic_vector(18 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_multlo_add_1_o : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_multlo_add_1_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_multhi_add_1_a : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_multhi_add_1_b : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_multhi_add_1_o : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_multhi_add_1_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_multlo_add_1_a : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_multlo_add_1_b : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_multlo_add_1_o : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_multlo_add_1_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_multhi_sub_1_a : std_logic_vector(10 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_multhi_sub_1_b : std_logic_vector(10 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_multhi_sub_1_o : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_multhi_sub_1_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_multlo_sub_1_a : std_logic_vector(20 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_multlo_sub_1_b : std_logic_vector(20 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_multlo_sub_1_o : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_multlo_sub_1_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multhi_add_1_a : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multhi_add_1_b : std_logic_vector(9 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multhi_add_1_o : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multhi_add_1_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multhi_sub_3_a : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multhi_sub_3_b : std_logic_vector(11 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multhi_sub_3_o : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multhi_sub_3_q : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multlo_add_1_a : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multlo_add_1_b : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multlo_add_1_o : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multlo_add_1_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multlo_sub_3_a : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multlo_sub_3_b : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multlo_sub_3_o : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multlo_sub_3_q : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_multhi_sub_1_a : std_logic_vector(10 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_multhi_sub_1_b : std_logic_vector(10 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_multhi_sub_1_o : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_multhi_sub_1_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_multlo_sub_1_a : std_logic_vector(20 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_multlo_sub_1_b : std_logic_vector(20 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_multlo_sub_1_o : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_multlo_sub_1_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_multhi_add_1_a : std_logic_vector(8 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_multhi_add_1_b : std_logic_vector(8 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_multhi_add_1_o : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_multhi_add_1_q : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_multlo_add_1_a : std_logic_vector(18 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_multlo_add_1_b : std_logic_vector(18 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_multlo_add_1_o : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_multlo_add_1_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_replace_split_high_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_replace_split_high_b : std_logic_vector (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_replace_split_low_in : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_replace_split_low_b : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multhi_shift2_q_int : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multhi_shift2_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multlo_shift2_q_int : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multlo_shift2_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multhi_shift2_q_int : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multhi_shift2_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multlo_shift2_q_int : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multlo_shift2_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multhi_shift2_q_int : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multhi_shift2_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multlo_shift2_q_int : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multlo_shift2_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multhi_shift2_q_int : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multhi_shift2_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multlo_shift2_q_int : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multlo_shift2_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multhi_shift2_q_int : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multhi_shift2_q : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multlo_shift2_q_int : std_logic_vector (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multlo_shift2_q : std_logic_vector (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multhi_shift2_q_int : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multhi_shift2_q : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multlo_shift2_q_int : std_logic_vector (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multlo_shift2_q : std_logic_vector (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multhi_shift2_q_int : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multhi_shift2_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multlo_shift2_q_int : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multlo_shift2_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multhi_shift2_q_int : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multhi_shift2_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multlo_shift2_q_int : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multlo_shift2_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multhi_shift2_q_int : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multhi_shift2_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multlo_shift2_q_int : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multlo_shift2_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multhi_shift2_q_int : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multhi_shift2_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multlo_shift2_q_int : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multlo_shift2_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_multhi_shift2_q_int : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_multhi_shift2_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_multlo_shift2_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_multlo_shift2_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_shiftup_q_int : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_shiftup_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_shiftup_q_int : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_shiftup_q : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_shiftup_q_int : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_shiftup_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_multhi_shift2_q_int : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_multhi_shift2_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_multlo_shift2_q_int : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_multlo_shift2_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_multhi_shift2_q_int : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_multhi_shift2_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_multlo_shift2_q_int : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_multlo_shift2_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_shiftup_q_int : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_shiftup_q : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multhi_shift4_q_int : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multhi_shift4_q : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multlo_shift4_q_int : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multlo_shift4_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multhi_shift4_q_int : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multhi_shift4_q : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multlo_shift4_q_int : std_logic_vector (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multlo_shift4_q : std_logic_vector (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multhi_shift4_q_int : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multhi_shift4_q : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multlo_shift4_q_int : std_logic_vector (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multlo_shift4_q : std_logic_vector (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_multhi_shift2_q_int : std_logic_vector (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_multhi_shift2_q : std_logic_vector (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_multlo_shift2_q_int : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_multlo_shift2_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multhi_shift4_q_int : std_logic_vector (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multhi_shift4_q : std_logic_vector (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multlo_shift4_q_int : std_logic_vector (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multlo_shift4_q : std_logic_vector (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_shiftup_q_int : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_shiftup_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multhi_shift4_q_int : std_logic_vector (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multhi_shift4_q : std_logic_vector (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multlo_shift4_q_int : std_logic_vector (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multlo_shift4_q : std_logic_vector (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_multhi_shift2_q_int : std_logic_vector (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_multhi_shift2_q : std_logic_vector (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_multlo_shift2_q_int : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_multlo_shift2_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multhi_shift4_q_int : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multhi_shift4_q : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multlo_shift4_q_int : std_logic_vector (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multlo_shift4_q : std_logic_vector (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multhi_shift4_q_int : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multhi_shift4_q : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multlo_shift4_q_int : std_logic_vector (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multlo_shift4_q : std_logic_vector (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multhi_shift4_q_int : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multhi_shift4_q : std_logic_vector (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multlo_shift4_q_int : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multlo_shift4_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_shiftup_q_int : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_shiftup_q : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_multhi_shift2_q_int : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_multhi_shift2_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_multlo_shift2_q_int : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_multlo_shift2_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_multhi_shift2_q_int : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_multhi_shift2_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_multlo_shift2_q_int : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_multlo_shift2_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_shiftup_q_int : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_shiftup_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_shiftup_q_int : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_shiftup_q : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_shiftup_q_int : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_shiftup_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_multhi_shift2_q_int : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_multhi_shift2_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_multlo_shift2_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_multlo_shift2_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_replace_multhi_shift0_q_int : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_replace_multhi_shift0_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_replace_multlo_shift0_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_replace_multlo_shift0_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_multhi_shift0_q_int : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_multhi_shift0_q : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_multlo_shift0_q_int : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_multlo_shift0_q : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_multhi_shift0_q_int : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_multhi_shift0_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_multlo_shift0_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_replace_multlo_shift0_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multhi_shift0_q_int : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multhi_shift0_q : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multlo_shift0_q_int : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_replace_multlo_shift0_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_multhi_shift0_q_int : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_multhi_shift0_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_multlo_shift0_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_replace_multlo_shift0_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_multhi_shift0_q_int : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_multhi_shift0_q : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_multlo_shift0_q_int : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_multlo_shift0_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_replace_multhi_shift0_q_int : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_replace_multhi_shift0_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_replace_multlo_shift0_q_int : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_replace_multlo_shift0_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_multhi_shift0_q_int : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_multhi_shift0_q : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_multlo_shift0_q_int : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_multlo_shift0_q : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_multhi_shift0_q_int : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_multhi_shift0_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_multlo_shift0_q_int : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_replace_multlo_shift0_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multhi_shift0_q_int : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multhi_shift0_q : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multlo_shift0_q_int : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_multlo_shift0_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multhi_shift0_q_int : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multhi_shift0_q : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multlo_shift0_q_int : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_multlo_shift0_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multhi_shift0_q_int : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multhi_shift0_q : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multlo_shift0_q_int : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multlo_shift0_q : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_multhi_shift0_q_int : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_multhi_shift0_q : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_multlo_shift0_q_int : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_multlo_shift0_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multhi_shift0_q_int : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multhi_shift0_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multlo_shift0_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_multlo_shift0_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_multhi_shift0_q_int : std_logic_vector (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_multhi_shift0_q : std_logic_vector (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_multlo_shift0_q_int : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_replace_multlo_shift0_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multhi_shift0_q_int : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multhi_shift0_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multlo_shift0_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_multlo_shift0_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_multhi_shift0_q_int : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_multhi_shift0_q : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_multlo_shift0_q_int : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_multlo_shift0_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multhi_shift0_q_int : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multhi_shift0_q : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multlo_shift0_q_int : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multlo_shift0_q : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multhi_shift0_q_int : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multhi_shift0_q : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multlo_shift0_q_int : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_multlo_shift0_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multhi_shift0_q_int : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multhi_shift0_q : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multlo_shift0_q_int : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_multlo_shift0_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_multhi_shift0_q_int : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_multhi_shift0_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_multlo_shift0_q_int : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_replace_multlo_shift0_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_multhi_shift0_q_int : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_multhi_shift0_q : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_multlo_shift0_q_int : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_multlo_shift0_q : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_replace_multhi_shift0_q_int : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_replace_multhi_shift0_q : std_logic_vector (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_replace_multlo_shift0_q_int : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_replace_multlo_shift0_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_multhi_shift0_q_int : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_multhi_shift0_q : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_multlo_shift0_q_int : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_multlo_shift0_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_multhi_shift0_q_int : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_multhi_shift0_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_multlo_shift0_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_replace_multlo_shift0_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multhi_shift0_q_int : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multhi_shift0_q : std_logic_vector (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multlo_shift0_q_int : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_replace_multlo_shift0_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_multhi_shift0_q_int : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_multhi_shift0_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_multlo_shift0_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_replace_multlo_shift0_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_multhi_shift0_q_int : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_multhi_shift0_q : std_logic_vector (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_multlo_shift0_q_int : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_multlo_shift0_q : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_replace_multhi_shift0_q_int : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_replace_multhi_shift0_q : std_logic_vector (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_replace_multlo_shift0_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_replace_multlo_shift0_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_shiftup_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_shiftup_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_multlo_final_convert_in : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_replace_multlo_final_convert_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_shiftup_q_int : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_shiftup_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_multlo_final_convert_in : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_replace_multlo_final_convert_q : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_shiftup_q_int : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_shiftup_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_multlo_final_convert_in : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_replace_multlo_final_convert_q : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_shiftup_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_replace_shiftup_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_shiftup_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_replace_shiftup_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_shiftup_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_shiftup_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multlo_final_convert_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_replace_multlo_final_convert_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_shiftup_q_int : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_shiftup_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_multlo_final_convert_in : std_logic_vector (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_replace_multlo_final_convert_q : std_logic_vector (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_shiftup_q_int : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_replace_shiftup_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_shiftup_q_int : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_replace_shiftup_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_shiftup_q_int : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_shiftup_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_multlo_final_convert_in : std_logic_vector (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_replace_multlo_final_convert_q : std_logic_vector (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_shiftup_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_shiftup_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multlo_final_convert_in : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_replace_multlo_final_convert_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_shiftup_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_replace_shiftup_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_shiftup_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_replace_shiftup_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_shiftup_q_int : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_shiftup_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_multlo_final_convert_in : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_replace_multlo_final_convert_q : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_shiftup_q_int : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_shiftup_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_multlo_final_convert_in : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_replace_multlo_final_convert_q : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_shiftup_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_shiftup_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_multlo_final_convert_in : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_replace_multlo_final_convert_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_replace_shiftup_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_replace_shiftup_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_replace_multlo_final_convert_in : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_replace_multlo_final_convert_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_replace_shiftup_q_int : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_replace_shiftup_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_replace_multlo_final_convert_in : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_replace_multlo_final_convert_q : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_replace_shiftup_q_int : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_replace_shiftup_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_replace_multlo_final_convert_in : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_replace_multlo_final_convert_q : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_replace_shiftup_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_replace_shiftup_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_replace_multlo_final_convert_in : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_replace_multlo_final_convert_q : std_logic_vector (20 downto 0);
begin


	--VCC(CONSTANT,1)@0
    VCC_q <= "1";

	--xIn(PORTIN,2)@10

	--d_u0_m0_wo0_wi0_phasedelay0_q_16(DELAY,537)@10
    d_u0_m0_wo0_wi0_phasedelay0_q_16 : dspba_delay
    GENERIC MAP ( width => 24, depth => 6 )
    PORT MAP ( xin => xIn_0, xout => d_u0_m0_wo0_wi0_phasedelay0_q_16_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_36_replace_split_low(BITSELECT,167)@16
    u0_m0_wo0_mtree_mult1_36_replace_split_low_in <= d_u0_m0_wo0_wi0_phasedelay0_q_16_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_36_replace_split_low_b <= u0_m0_wo0_mtree_mult1_36_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_36_replace_multlo_shift0(BITSHIFT,341)@16
    u0_m0_wo0_mtree_mult1_36_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_36_replace_split_low_b & "000";
    u0_m0_wo0_mtree_mult1_36_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_36_replace_multlo_shift0_q_int(19 downto 0);

	--u0_m0_wo0_mtree_mult1_36_replace_multlo_final_convert(ROUND,342)@16
    u0_m0_wo0_mtree_mult1_36_replace_multlo_final_convert_in <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_36_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_36_replace_multlo_final_convert_q <= u0_m0_wo0_mtree_mult1_36_replace_multlo_final_convert_in(20 downto 0);

	--u0_m0_wo0_mtree_mult1_36_replace_split_high(BITSELECT,166)@16
    u0_m0_wo0_mtree_mult1_36_replace_split_high_in <= d_u0_m0_wo0_wi0_phasedelay0_q_16_q;
    u0_m0_wo0_mtree_mult1_36_replace_split_high_b <= u0_m0_wo0_mtree_mult1_36_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_36_replace_multhi_shift0(BITSHIFT,340)@16
    u0_m0_wo0_mtree_mult1_36_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_36_replace_split_high_b & "000";
    u0_m0_wo0_mtree_mult1_36_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_36_replace_multhi_shift0_q_int(9 downto 0);

	--u0_m0_wo0_mtree_mult1_36_replace_shiftup(BITSHIFT,170)@16
    u0_m0_wo0_mtree_mult1_36_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_36_replace_multhi_shift0_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_36_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_36_replace_shiftup_q_int(26 downto 0);

	--u0_m0_wo0_mtree_mult1_36_replace_add(ADD,171)@16
    u0_m0_wo0_mtree_mult1_36_replace_add_a <= STD_LOGIC_VECTOR((28 downto 27 => u0_m0_wo0_mtree_mult1_36_replace_shiftup_q(26)) & u0_m0_wo0_mtree_mult1_36_replace_shiftup_q);
    u0_m0_wo0_mtree_mult1_36_replace_add_b <= STD_LOGIC_VECTOR((28 downto 21 => u0_m0_wo0_mtree_mult1_36_replace_multlo_final_convert_q(20)) & u0_m0_wo0_mtree_mult1_36_replace_multlo_final_convert_q);
    u0_m0_wo0_mtree_mult1_36_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_36_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_36_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_36_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_36_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_36_replace_add_q <= u0_m0_wo0_mtree_mult1_36_replace_add_o(28 downto 0);


	--u0_m0_wo0_mtree_mult1_35_replace_multlo_shift0(BITSHIFT,346)@14
    u0_m0_wo0_mtree_mult1_35_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_35_replace_split_low_b & "0";
    u0_m0_wo0_mtree_mult1_35_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_35_replace_multlo_shift0_q_int(17 downto 0);

	--u0_m0_wo0_wi0_delayr1(DELAY,8)@10
    u0_m0_wo0_wi0_delayr1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => xIn_0, xout => u0_m0_wo0_wi0_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr1_q_14(DELAY,538)@10
    d_u0_m0_wo0_wi0_delayr1_q_14 : dspba_delay
    GENERIC MAP ( width => 24, depth => 4 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr1_q, xout => d_u0_m0_wo0_wi0_delayr1_q_14_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_35_replace_split_low(BITSELECT,173)@14
    u0_m0_wo0_mtree_mult1_35_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr1_q_14_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_35_replace_split_low_b <= u0_m0_wo0_mtree_mult1_35_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_35_replace_multlo_add_1(ADD,347)@14
    u0_m0_wo0_mtree_mult1_35_replace_multlo_add_1_a <= STD_LOGIC_VECTOR("00" & u0_m0_wo0_mtree_mult1_35_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_35_replace_multlo_add_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_35_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_35_replace_multlo_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_35_replace_multlo_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_35_replace_multlo_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_35_replace_multlo_add_1_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_35_replace_multlo_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_35_replace_multlo_add_1_q <= u0_m0_wo0_mtree_mult1_35_replace_multlo_add_1_o(18 downto 0);


	--u0_m0_wo0_mtree_mult1_35_replace_multlo_shift2(BITSHIFT,348)@15
    u0_m0_wo0_mtree_mult1_35_replace_multlo_shift2_q_int <= u0_m0_wo0_mtree_mult1_35_replace_multlo_add_1_q & "0";
    u0_m0_wo0_mtree_mult1_35_replace_multlo_shift2_q <= u0_m0_wo0_mtree_mult1_35_replace_multlo_shift2_q_int(19 downto 0);

	--u0_m0_wo0_mtree_mult1_35_replace_multlo_final_convert(ROUND,349)@15
    u0_m0_wo0_mtree_mult1_35_replace_multlo_final_convert_in <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_35_replace_multlo_shift2_q);
    u0_m0_wo0_mtree_mult1_35_replace_multlo_final_convert_q <= u0_m0_wo0_mtree_mult1_35_replace_multlo_final_convert_in(20 downto 0);

	--u0_m0_wo0_mtree_mult1_35_replace_multhi_shift0(BITSHIFT,343)@14
    u0_m0_wo0_mtree_mult1_35_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_35_replace_split_high_b & "0";
    u0_m0_wo0_mtree_mult1_35_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_35_replace_multhi_shift0_q_int(7 downto 0);

	--u0_m0_wo0_mtree_mult1_35_replace_split_high(BITSELECT,172)@14
    u0_m0_wo0_mtree_mult1_35_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr1_q_14_q;
    u0_m0_wo0_mtree_mult1_35_replace_split_high_b <= u0_m0_wo0_mtree_mult1_35_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_35_replace_multhi_add_1(ADD,344)@14
    u0_m0_wo0_mtree_mult1_35_replace_multhi_add_1_a <= STD_LOGIC_VECTOR((8 downto 7 => u0_m0_wo0_mtree_mult1_35_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_35_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_35_replace_multhi_add_1_b <= STD_LOGIC_VECTOR((8 downto 8 => u0_m0_wo0_mtree_mult1_35_replace_multhi_shift0_q(7)) & u0_m0_wo0_mtree_mult1_35_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_35_replace_multhi_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_35_replace_multhi_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_35_replace_multhi_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_35_replace_multhi_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_35_replace_multhi_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_35_replace_multhi_add_1_q <= u0_m0_wo0_mtree_mult1_35_replace_multhi_add_1_o(8 downto 0);


	--u0_m0_wo0_mtree_mult1_35_replace_multhi_shift2(BITSHIFT,345)@15
    u0_m0_wo0_mtree_mult1_35_replace_multhi_shift2_q_int <= u0_m0_wo0_mtree_mult1_35_replace_multhi_add_1_q & "0";
    u0_m0_wo0_mtree_mult1_35_replace_multhi_shift2_q <= u0_m0_wo0_mtree_mult1_35_replace_multhi_shift2_q_int(9 downto 0);

	--u0_m0_wo0_mtree_mult1_35_replace_shiftup(BITSHIFT,176)@15
    u0_m0_wo0_mtree_mult1_35_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_35_replace_multhi_shift2_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_35_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_35_replace_shiftup_q_int(26 downto 0);

	--u0_m0_wo0_mtree_mult1_35_replace_add(ADD,177)@15
    u0_m0_wo0_mtree_mult1_35_replace_add_a <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_mult1_35_replace_shiftup_q(26)) & u0_m0_wo0_mtree_mult1_35_replace_shiftup_q);
    u0_m0_wo0_mtree_mult1_35_replace_add_b <= STD_LOGIC_VECTOR((27 downto 21 => u0_m0_wo0_mtree_mult1_35_replace_multlo_final_convert_q(20)) & u0_m0_wo0_mtree_mult1_35_replace_multlo_final_convert_q);
    u0_m0_wo0_mtree_mult1_35_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_35_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_35_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_35_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_35_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_35_replace_add_q <= u0_m0_wo0_mtree_mult1_35_replace_add_o(27 downto 0);


	--u0_m0_wo0_mtree_mult1_33_replace_multlo_shift0(BITSHIFT,352)@13
    u0_m0_wo0_mtree_mult1_33_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_33_replace_split_low_b & "000";
    u0_m0_wo0_mtree_mult1_33_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_33_replace_multlo_shift0_q_int(19 downto 0);

	--u0_m0_wo0_wi0_delayr2(DELAY,9)@10
    u0_m0_wo0_wi0_delayr2 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr1_q, xout => u0_m0_wo0_wi0_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_wi0_delayr3(DELAY,10)@10
    u0_m0_wo0_wi0_delayr3 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr2_q, xout => u0_m0_wo0_wi0_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr3_q_13(DELAY,539)@10
    d_u0_m0_wo0_wi0_delayr3_q_13 : dspba_delay
    GENERIC MAP ( width => 24, depth => 3 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr3_q, xout => d_u0_m0_wo0_wi0_delayr3_q_13_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_33_replace_split_low(BITSELECT,179)@13
    u0_m0_wo0_mtree_mult1_33_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr3_q_13_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_33_replace_split_low_b <= u0_m0_wo0_mtree_mult1_33_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_33_replace_multlo_sub_1(SUB,353)@13
    u0_m0_wo0_mtree_mult1_33_replace_multlo_sub_1_a <= STD_LOGIC_VECTOR("0000" & u0_m0_wo0_mtree_mult1_33_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_33_replace_multlo_sub_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_33_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_33_replace_multlo_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_33_replace_multlo_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_33_replace_multlo_sub_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_33_replace_multlo_sub_1_a) - UNSIGNED(u0_m0_wo0_mtree_mult1_33_replace_multlo_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_33_replace_multlo_sub_1_q <= u0_m0_wo0_mtree_mult1_33_replace_multlo_sub_1_o(20 downto 0);


	--u0_m0_wo0_mtree_mult1_33_replace_multhi_shift0(BITSHIFT,350)@13
    u0_m0_wo0_mtree_mult1_33_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_33_replace_split_high_b & "000";
    u0_m0_wo0_mtree_mult1_33_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_33_replace_multhi_shift0_q_int(9 downto 0);

	--u0_m0_wo0_mtree_mult1_33_replace_split_high(BITSELECT,178)@13
    u0_m0_wo0_mtree_mult1_33_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr3_q_13_q;
    u0_m0_wo0_mtree_mult1_33_replace_split_high_b <= u0_m0_wo0_mtree_mult1_33_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_33_replace_multhi_sub_1(SUB,351)@13
    u0_m0_wo0_mtree_mult1_33_replace_multhi_sub_1_a <= STD_LOGIC_VECTOR((10 downto 7 => u0_m0_wo0_mtree_mult1_33_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_33_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_33_replace_multhi_sub_1_b <= STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_33_replace_multhi_shift0_q(9)) & u0_m0_wo0_mtree_mult1_33_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_33_replace_multhi_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_33_replace_multhi_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_33_replace_multhi_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_33_replace_multhi_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_33_replace_multhi_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_33_replace_multhi_sub_1_q <= u0_m0_wo0_mtree_mult1_33_replace_multhi_sub_1_o(10 downto 0);


	--u0_m0_wo0_mtree_mult1_33_replace_shiftup(BITSHIFT,182)@14
    u0_m0_wo0_mtree_mult1_33_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_33_replace_multhi_sub_1_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_33_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_33_replace_shiftup_q_int(27 downto 0);

	--u0_m0_wo0_mtree_mult1_33_replace_add(ADD,183)@14
    u0_m0_wo0_mtree_mult1_33_replace_add_a <= u0_m0_wo0_mtree_mult1_33_replace_shiftup_q;
    u0_m0_wo0_mtree_mult1_33_replace_add_b <= STD_LOGIC_VECTOR((27 downto 21 => u0_m0_wo0_mtree_mult1_33_replace_multlo_sub_1_q(20)) & u0_m0_wo0_mtree_mult1_33_replace_multlo_sub_1_q);
    u0_m0_wo0_mtree_mult1_33_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_33_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_33_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_33_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_33_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_33_replace_add_q <= u0_m0_wo0_mtree_mult1_33_replace_add_o(27 downto 0);


	--u0_m0_wo0_wi0_delayr4(DELAY,11)@10
    u0_m0_wo0_wi0_delayr4 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr3_q, xout => u0_m0_wo0_wi0_delayr4_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr4_q_12(DELAY,540)@10
    d_u0_m0_wo0_wi0_delayr4_q_12 : dspba_delay
    GENERIC MAP ( width => 24, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr4_q, xout => d_u0_m0_wo0_wi0_delayr4_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_32_replace_split_low(BITSELECT,185)@12
    u0_m0_wo0_mtree_mult1_32_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr4_q_12_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_32_replace_split_low_b <= u0_m0_wo0_mtree_mult1_32_replace_split_low_in(16 downto 0);

	--d_u0_m0_wo0_mtree_mult1_32_replace_split_low_b_13(DELAY,560)@12
    d_u0_m0_wo0_mtree_mult1_32_replace_split_low_b_13 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_32_replace_split_low_b, xout => d_u0_m0_wo0_mtree_mult1_32_replace_split_low_b_13_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_32_replace_multlo_shift2(BITSHIFT,360)@13
    u0_m0_wo0_mtree_mult1_32_replace_multlo_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_32_replace_split_low_b_13_q & "0000";
    u0_m0_wo0_mtree_mult1_32_replace_multlo_shift2_q <= u0_m0_wo0_mtree_mult1_32_replace_multlo_shift2_q_int(20 downto 0);

	--u0_m0_wo0_mtree_mult1_32_replace_multlo_shift0(BITSHIFT,358)@12
    u0_m0_wo0_mtree_mult1_32_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_32_replace_split_low_b & "00";
    u0_m0_wo0_mtree_mult1_32_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_32_replace_multlo_shift0_q_int(18 downto 0);

	--u0_m0_wo0_mtree_mult1_32_replace_multlo_add_1(ADD,359)@12
    u0_m0_wo0_mtree_mult1_32_replace_multlo_add_1_a <= STD_LOGIC_VECTOR("000" & u0_m0_wo0_mtree_mult1_32_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_32_replace_multlo_add_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_32_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_32_replace_multlo_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_32_replace_multlo_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_32_replace_multlo_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_32_replace_multlo_add_1_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_32_replace_multlo_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_32_replace_multlo_add_1_q <= u0_m0_wo0_mtree_mult1_32_replace_multlo_add_1_o(19 downto 0);


	--u0_m0_wo0_mtree_mult1_32_replace_multlo_sub_3(SUB,361)@13
    u0_m0_wo0_mtree_mult1_32_replace_multlo_sub_3_a <= STD_LOGIC_VECTOR("00" & u0_m0_wo0_mtree_mult1_32_replace_multlo_add_1_q);
    u0_m0_wo0_mtree_mult1_32_replace_multlo_sub_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_32_replace_multlo_shift2_q);
    u0_m0_wo0_mtree_mult1_32_replace_multlo_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_32_replace_multlo_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_32_replace_multlo_sub_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_32_replace_multlo_sub_3_a) - UNSIGNED(u0_m0_wo0_mtree_mult1_32_replace_multlo_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_32_replace_multlo_sub_3_q <= u0_m0_wo0_mtree_mult1_32_replace_multlo_sub_3_o(21 downto 0);


	--u0_m0_wo0_mtree_mult1_32_replace_split_high(BITSELECT,184)@12
    u0_m0_wo0_mtree_mult1_32_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr4_q_12_q;
    u0_m0_wo0_mtree_mult1_32_replace_split_high_b <= u0_m0_wo0_mtree_mult1_32_replace_split_high_in(23 downto 17);

	--d_u0_m0_wo0_mtree_mult1_32_replace_split_high_b_13(DELAY,559)@12
    d_u0_m0_wo0_mtree_mult1_32_replace_split_high_b_13 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_32_replace_split_high_b, xout => d_u0_m0_wo0_mtree_mult1_32_replace_split_high_b_13_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_32_replace_multhi_shift2(BITSHIFT,356)@13
    u0_m0_wo0_mtree_mult1_32_replace_multhi_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_32_replace_split_high_b_13_q & "0000";
    u0_m0_wo0_mtree_mult1_32_replace_multhi_shift2_q <= u0_m0_wo0_mtree_mult1_32_replace_multhi_shift2_q_int(10 downto 0);

	--u0_m0_wo0_mtree_mult1_32_replace_multhi_shift0(BITSHIFT,354)@12
    u0_m0_wo0_mtree_mult1_32_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_32_replace_split_high_b & "00";
    u0_m0_wo0_mtree_mult1_32_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_32_replace_multhi_shift0_q_int(8 downto 0);

	--u0_m0_wo0_mtree_mult1_32_replace_multhi_add_1(ADD,355)@12
    u0_m0_wo0_mtree_mult1_32_replace_multhi_add_1_a <= STD_LOGIC_VECTOR((9 downto 7 => u0_m0_wo0_mtree_mult1_32_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_32_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_32_replace_multhi_add_1_b <= STD_LOGIC_VECTOR((9 downto 9 => u0_m0_wo0_mtree_mult1_32_replace_multhi_shift0_q(8)) & u0_m0_wo0_mtree_mult1_32_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_32_replace_multhi_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_32_replace_multhi_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_32_replace_multhi_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_32_replace_multhi_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_32_replace_multhi_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_32_replace_multhi_add_1_q <= u0_m0_wo0_mtree_mult1_32_replace_multhi_add_1_o(9 downto 0);


	--u0_m0_wo0_mtree_mult1_32_replace_multhi_sub_3(SUB,357)@13
    u0_m0_wo0_mtree_mult1_32_replace_multhi_sub_3_a <= STD_LOGIC_VECTOR((11 downto 10 => u0_m0_wo0_mtree_mult1_32_replace_multhi_add_1_q(9)) & u0_m0_wo0_mtree_mult1_32_replace_multhi_add_1_q);
    u0_m0_wo0_mtree_mult1_32_replace_multhi_sub_3_b <= STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_32_replace_multhi_shift2_q(10)) & u0_m0_wo0_mtree_mult1_32_replace_multhi_shift2_q);
    u0_m0_wo0_mtree_mult1_32_replace_multhi_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_32_replace_multhi_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_32_replace_multhi_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_32_replace_multhi_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_32_replace_multhi_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_32_replace_multhi_sub_3_q <= u0_m0_wo0_mtree_mult1_32_replace_multhi_sub_3_o(11 downto 0);


	--u0_m0_wo0_mtree_mult1_32_replace_shiftup(BITSHIFT,188)@14
    u0_m0_wo0_mtree_mult1_32_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_32_replace_multhi_sub_3_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_32_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_32_replace_shiftup_q_int(28 downto 0);

	--u0_m0_wo0_mtree_mult1_32_replace_add(ADD,189)@14
    u0_m0_wo0_mtree_mult1_32_replace_add_a <= u0_m0_wo0_mtree_mult1_32_replace_shiftup_q;
    u0_m0_wo0_mtree_mult1_32_replace_add_b <= STD_LOGIC_VECTOR((28 downto 22 => u0_m0_wo0_mtree_mult1_32_replace_multlo_sub_3_q(21)) & u0_m0_wo0_mtree_mult1_32_replace_multlo_sub_3_q);
    u0_m0_wo0_mtree_mult1_32_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_32_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_32_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_32_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_32_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_32_replace_add_q <= u0_m0_wo0_mtree_mult1_32_replace_add_o(28 downto 0);


	--u0_m0_wo0_mtree_add0_16(ADD,134)@15
    u0_m0_wo0_mtree_add0_16_a <= STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_mult1_32_replace_add_q(28)) & u0_m0_wo0_mtree_mult1_32_replace_add_q);
    u0_m0_wo0_mtree_add0_16_b <= STD_LOGIC_VECTOR((29 downto 28 => u0_m0_wo0_mtree_mult1_33_replace_add_q(27)) & u0_m0_wo0_mtree_mult1_33_replace_add_q);
    u0_m0_wo0_mtree_add0_16: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_16_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_16_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_16_a) + SIGNED(u0_m0_wo0_mtree_add0_16_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_16_q <= u0_m0_wo0_mtree_add0_16_o(29 downto 0);


	--u0_m0_wo0_mtree_add1_8(ADD,144)@16
    u0_m0_wo0_mtree_add1_8_a <= STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_add0_16_q(29)) & u0_m0_wo0_mtree_add0_16_q);
    u0_m0_wo0_mtree_add1_8_b <= STD_LOGIC_VECTOR((30 downto 28 => u0_m0_wo0_mtree_mult1_35_replace_add_q(27)) & u0_m0_wo0_mtree_mult1_35_replace_add_q);
    u0_m0_wo0_mtree_add1_8: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_8_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_8_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_8_a) + SIGNED(u0_m0_wo0_mtree_add1_8_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_8_q <= u0_m0_wo0_mtree_add1_8_o(30 downto 0);


	--u0_m0_wo0_mtree_add2_4(ADD,149)@17
    u0_m0_wo0_mtree_add2_4_a <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_add1_8_q(30)) & u0_m0_wo0_mtree_add1_8_q);
    u0_m0_wo0_mtree_add2_4_b <= STD_LOGIC_VECTOR((31 downto 29 => u0_m0_wo0_mtree_mult1_36_replace_add_q(28)) & u0_m0_wo0_mtree_mult1_36_replace_add_q);
    u0_m0_wo0_mtree_add2_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_4_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_4_a) + SIGNED(u0_m0_wo0_mtree_add2_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_4_q <= u0_m0_wo0_mtree_add2_4_o(31 downto 0);


	--u0_m0_wo0_wi0_delayr5(DELAY,12)@10
    u0_m0_wo0_wi0_delayr5 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr4_q, xout => u0_m0_wo0_wi0_delayr5_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr5_q_12(DELAY,541)@10
    d_u0_m0_wo0_wi0_delayr5_q_12 : dspba_delay
    GENERIC MAP ( width => 24, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr5_q, xout => d_u0_m0_wo0_wi0_delayr5_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_31_replace_split_low(BITSELECT,191)@12
    u0_m0_wo0_mtree_mult1_31_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr5_q_12_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_31_replace_split_low_b <= u0_m0_wo0_mtree_mult1_31_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_31_replace_multlo_shift0(BITSHIFT,364)@12
    u0_m0_wo0_mtree_mult1_31_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_31_replace_split_low_b & "000";
    u0_m0_wo0_mtree_mult1_31_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_31_replace_multlo_shift0_q_int(19 downto 0);

	--u0_m0_wo0_mtree_mult1_31_replace_multlo_sub_1(SUB,365)@12
    u0_m0_wo0_mtree_mult1_31_replace_multlo_sub_1_a <= STD_LOGIC_VECTOR("00000000000000000000" & GND_q);
    u0_m0_wo0_mtree_mult1_31_replace_multlo_sub_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_31_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_31_replace_multlo_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_31_replace_multlo_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_31_replace_multlo_sub_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_31_replace_multlo_sub_1_a) - UNSIGNED(u0_m0_wo0_mtree_mult1_31_replace_multlo_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_31_replace_multlo_sub_1_q <= u0_m0_wo0_mtree_mult1_31_replace_multlo_sub_1_o(20 downto 0);


	--u0_m0_wo0_mtree_mult1_31_replace_split_high(BITSELECT,190)@12
    u0_m0_wo0_mtree_mult1_31_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr5_q_12_q;
    u0_m0_wo0_mtree_mult1_31_replace_split_high_b <= u0_m0_wo0_mtree_mult1_31_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_31_replace_multhi_shift0(BITSHIFT,362)@12
    u0_m0_wo0_mtree_mult1_31_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_31_replace_split_high_b & "000";
    u0_m0_wo0_mtree_mult1_31_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_31_replace_multhi_shift0_q_int(9 downto 0);

	--u0_m0_wo0_mtree_mult1_31_replace_multhi_sub_1(SUB,363)@12
    u0_m0_wo0_mtree_mult1_31_replace_multhi_sub_1_a <= STD_LOGIC_VECTOR((10 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo0_mtree_mult1_31_replace_multhi_sub_1_b <= STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_31_replace_multhi_shift0_q(9)) & u0_m0_wo0_mtree_mult1_31_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_31_replace_multhi_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_31_replace_multhi_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_31_replace_multhi_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_31_replace_multhi_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_31_replace_multhi_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_31_replace_multhi_sub_1_q <= u0_m0_wo0_mtree_mult1_31_replace_multhi_sub_1_o(10 downto 0);


	--u0_m0_wo0_mtree_mult1_31_replace_shiftup(BITSHIFT,194)@13
    u0_m0_wo0_mtree_mult1_31_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_31_replace_multhi_sub_1_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_31_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_31_replace_shiftup_q_int(27 downto 0);

	--u0_m0_wo0_mtree_mult1_31_replace_add(ADD,195)@13
    u0_m0_wo0_mtree_mult1_31_replace_add_a <= u0_m0_wo0_mtree_mult1_31_replace_shiftup_q;
    u0_m0_wo0_mtree_mult1_31_replace_add_b <= STD_LOGIC_VECTOR((27 downto 21 => u0_m0_wo0_mtree_mult1_31_replace_multlo_sub_1_q(20)) & u0_m0_wo0_mtree_mult1_31_replace_multlo_sub_1_q);
    u0_m0_wo0_mtree_mult1_31_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_31_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_31_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_31_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_31_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_31_replace_add_q <= u0_m0_wo0_mtree_mult1_31_replace_add_o(27 downto 0);


	--u0_m0_wo0_mtree_mult1_29_replace_multlo_shift0(BITSHIFT,369)@11
    u0_m0_wo0_mtree_mult1_29_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_29_replace_split_low_b & "00";
    u0_m0_wo0_mtree_mult1_29_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_29_replace_multlo_shift0_q_int(18 downto 0);

	--u0_m0_wo0_wi0_delayr6(DELAY,13)@10
    u0_m0_wo0_wi0_delayr6 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr5_q, xout => u0_m0_wo0_wi0_delayr6_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_wi0_delayr7(DELAY,14)@10
    u0_m0_wo0_wi0_delayr7 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr6_q, xout => u0_m0_wo0_wi0_delayr7_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr7_q_11(DELAY,542)@10
    d_u0_m0_wo0_wi0_delayr7_q_11 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr7_q, xout => d_u0_m0_wo0_wi0_delayr7_q_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_29_replace_split_low(BITSELECT,197)@11
    u0_m0_wo0_mtree_mult1_29_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr7_q_11_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_29_replace_split_low_b <= u0_m0_wo0_mtree_mult1_29_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_29_replace_multlo_add_1(ADD,370)@11
    u0_m0_wo0_mtree_mult1_29_replace_multlo_add_1_a <= STD_LOGIC_VECTOR("000" & u0_m0_wo0_mtree_mult1_29_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_29_replace_multlo_add_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_29_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_29_replace_multlo_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_29_replace_multlo_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_29_replace_multlo_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_29_replace_multlo_add_1_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_29_replace_multlo_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_29_replace_multlo_add_1_q <= u0_m0_wo0_mtree_mult1_29_replace_multlo_add_1_o(19 downto 0);


	--u0_m0_wo0_mtree_mult1_29_replace_multlo_shift2(BITSHIFT,371)@12
    u0_m0_wo0_mtree_mult1_29_replace_multlo_shift2_q_int <= u0_m0_wo0_mtree_mult1_29_replace_multlo_add_1_q & "0";
    u0_m0_wo0_mtree_mult1_29_replace_multlo_shift2_q <= u0_m0_wo0_mtree_mult1_29_replace_multlo_shift2_q_int(20 downto 0);

	--u0_m0_wo0_mtree_mult1_29_replace_multlo_final_convert(ROUND,372)@12
    u0_m0_wo0_mtree_mult1_29_replace_multlo_final_convert_in <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_29_replace_multlo_shift2_q);
    u0_m0_wo0_mtree_mult1_29_replace_multlo_final_convert_q <= u0_m0_wo0_mtree_mult1_29_replace_multlo_final_convert_in(21 downto 0);

	--u0_m0_wo0_mtree_mult1_29_replace_multhi_shift0(BITSHIFT,366)@11
    u0_m0_wo0_mtree_mult1_29_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_29_replace_split_high_b & "00";
    u0_m0_wo0_mtree_mult1_29_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_29_replace_multhi_shift0_q_int(8 downto 0);

	--u0_m0_wo0_mtree_mult1_29_replace_split_high(BITSELECT,196)@11
    u0_m0_wo0_mtree_mult1_29_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr7_q_11_q;
    u0_m0_wo0_mtree_mult1_29_replace_split_high_b <= u0_m0_wo0_mtree_mult1_29_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_29_replace_multhi_add_1(ADD,367)@11
    u0_m0_wo0_mtree_mult1_29_replace_multhi_add_1_a <= STD_LOGIC_VECTOR((9 downto 7 => u0_m0_wo0_mtree_mult1_29_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_29_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_29_replace_multhi_add_1_b <= STD_LOGIC_VECTOR((9 downto 9 => u0_m0_wo0_mtree_mult1_29_replace_multhi_shift0_q(8)) & u0_m0_wo0_mtree_mult1_29_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_29_replace_multhi_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_29_replace_multhi_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_29_replace_multhi_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_29_replace_multhi_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_29_replace_multhi_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_29_replace_multhi_add_1_q <= u0_m0_wo0_mtree_mult1_29_replace_multhi_add_1_o(9 downto 0);


	--u0_m0_wo0_mtree_mult1_29_replace_multhi_shift2(BITSHIFT,368)@12
    u0_m0_wo0_mtree_mult1_29_replace_multhi_shift2_q_int <= u0_m0_wo0_mtree_mult1_29_replace_multhi_add_1_q & "0";
    u0_m0_wo0_mtree_mult1_29_replace_multhi_shift2_q <= u0_m0_wo0_mtree_mult1_29_replace_multhi_shift2_q_int(10 downto 0);

	--u0_m0_wo0_mtree_mult1_29_replace_shiftup(BITSHIFT,200)@12
    u0_m0_wo0_mtree_mult1_29_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_29_replace_multhi_shift2_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_29_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_29_replace_shiftup_q_int(27 downto 0);

	--u0_m0_wo0_mtree_mult1_29_replace_add(ADD,201)@12
    u0_m0_wo0_mtree_mult1_29_replace_add_a <= STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_mult1_29_replace_shiftup_q(27)) & u0_m0_wo0_mtree_mult1_29_replace_shiftup_q);
    u0_m0_wo0_mtree_mult1_29_replace_add_b <= STD_LOGIC_VECTOR((28 downto 22 => u0_m0_wo0_mtree_mult1_29_replace_multlo_final_convert_q(21)) & u0_m0_wo0_mtree_mult1_29_replace_multlo_final_convert_q);
    u0_m0_wo0_mtree_mult1_29_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_29_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_29_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_29_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_29_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_29_replace_add_q <= u0_m0_wo0_mtree_mult1_29_replace_add_o(28 downto 0);


	--u0_m0_wo0_wi0_delayr8(DELAY,15)@10
    u0_m0_wo0_wi0_delayr8 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr7_q, xout => u0_m0_wo0_wi0_delayr8_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr8_q_12(DELAY,543)@10
    d_u0_m0_wo0_wi0_delayr8_q_12 : dspba_delay
    GENERIC MAP ( width => 24, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr8_q, xout => d_u0_m0_wo0_wi0_delayr8_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_28_replace_split_low(BITSELECT,203)@12
    u0_m0_wo0_mtree_mult1_28_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr8_q_12_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_28_replace_split_low_b <= u0_m0_wo0_mtree_mult1_28_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_28_replace_multlo_shift0(BITSHIFT,374)@12
    u0_m0_wo0_mtree_mult1_28_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_28_replace_split_low_b & "0000";
    u0_m0_wo0_mtree_mult1_28_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_28_replace_multlo_shift0_q_int(20 downto 0);

	--u0_m0_wo0_mtree_mult1_28_replace_multlo_final_convert(ROUND,375)@12
    u0_m0_wo0_mtree_mult1_28_replace_multlo_final_convert_in <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_28_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_28_replace_multlo_final_convert_q <= u0_m0_wo0_mtree_mult1_28_replace_multlo_final_convert_in(21 downto 0);

	--u0_m0_wo0_mtree_mult1_28_replace_split_high(BITSELECT,202)@12
    u0_m0_wo0_mtree_mult1_28_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr8_q_12_q;
    u0_m0_wo0_mtree_mult1_28_replace_split_high_b <= u0_m0_wo0_mtree_mult1_28_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_28_replace_multhi_shift0(BITSHIFT,373)@12
    u0_m0_wo0_mtree_mult1_28_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_28_replace_split_high_b & "0000";
    u0_m0_wo0_mtree_mult1_28_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_28_replace_multhi_shift0_q_int(10 downto 0);

	--u0_m0_wo0_mtree_mult1_28_replace_shiftup(BITSHIFT,206)@12
    u0_m0_wo0_mtree_mult1_28_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_28_replace_multhi_shift0_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_28_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_28_replace_shiftup_q_int(27 downto 0);

	--u0_m0_wo0_mtree_mult1_28_replace_add(ADD,207)@12
    u0_m0_wo0_mtree_mult1_28_replace_add_a <= STD_LOGIC_VECTOR((29 downto 28 => u0_m0_wo0_mtree_mult1_28_replace_shiftup_q(27)) & u0_m0_wo0_mtree_mult1_28_replace_shiftup_q);
    u0_m0_wo0_mtree_mult1_28_replace_add_b <= STD_LOGIC_VECTOR((29 downto 22 => u0_m0_wo0_mtree_mult1_28_replace_multlo_final_convert_q(21)) & u0_m0_wo0_mtree_mult1_28_replace_multlo_final_convert_q);
    u0_m0_wo0_mtree_mult1_28_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_28_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_28_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_28_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_28_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_28_replace_add_q <= u0_m0_wo0_mtree_mult1_28_replace_add_o(29 downto 0);


	--u0_m0_wo0_mtree_add0_14(ADD,132)@13
    u0_m0_wo0_mtree_add0_14_a <= STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_mult1_28_replace_add_q(29)) & u0_m0_wo0_mtree_mult1_28_replace_add_q);
    u0_m0_wo0_mtree_add0_14_b <= STD_LOGIC_VECTOR((30 downto 29 => u0_m0_wo0_mtree_mult1_29_replace_add_q(28)) & u0_m0_wo0_mtree_mult1_29_replace_add_q);
    u0_m0_wo0_mtree_add0_14: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_14_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_14_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_14_a) + SIGNED(u0_m0_wo0_mtree_add0_14_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_14_q <= u0_m0_wo0_mtree_add0_14_o(30 downto 0);


	--u0_m0_wo0_mtree_add1_7(ADD,143)@14
    u0_m0_wo0_mtree_add1_7_a <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_add0_14_q(30)) & u0_m0_wo0_mtree_add0_14_q);
    u0_m0_wo0_mtree_add1_7_b <= STD_LOGIC_VECTOR((31 downto 28 => u0_m0_wo0_mtree_mult1_31_replace_add_q(27)) & u0_m0_wo0_mtree_mult1_31_replace_add_q);
    u0_m0_wo0_mtree_add1_7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_7_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_7_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_7_a) + SIGNED(u0_m0_wo0_mtree_add1_7_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_7_q <= u0_m0_wo0_mtree_add1_7_o(31 downto 0);


	--u0_m0_wo0_mtree_mult1_27_replace_multlo_shift0(BITSHIFT,379)@12
    u0_m0_wo0_mtree_mult1_27_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_27_replace_split_low_b & "0";
    u0_m0_wo0_mtree_mult1_27_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_27_replace_multlo_shift0_q_int(17 downto 0);

	--u0_m0_wo0_wi0_delayr9(DELAY,16)@10
    u0_m0_wo0_wi0_delayr9 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr8_q, xout => u0_m0_wo0_wi0_delayr9_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr9_q_12(DELAY,544)@10
    d_u0_m0_wo0_wi0_delayr9_q_12 : dspba_delay
    GENERIC MAP ( width => 24, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr9_q, xout => d_u0_m0_wo0_wi0_delayr9_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_27_replace_split_low(BITSELECT,209)@12
    u0_m0_wo0_mtree_mult1_27_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr9_q_12_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_27_replace_split_low_b <= u0_m0_wo0_mtree_mult1_27_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_27_replace_multlo_add_1(ADD,380)@12
    u0_m0_wo0_mtree_mult1_27_replace_multlo_add_1_a <= STD_LOGIC_VECTOR("00" & u0_m0_wo0_mtree_mult1_27_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_27_replace_multlo_add_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_27_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_27_replace_multlo_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_27_replace_multlo_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_27_replace_multlo_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_27_replace_multlo_add_1_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_27_replace_multlo_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_27_replace_multlo_add_1_q <= u0_m0_wo0_mtree_mult1_27_replace_multlo_add_1_o(18 downto 0);


	--u0_m0_wo0_mtree_mult1_27_replace_multlo_shift2(BITSHIFT,381)@13
    u0_m0_wo0_mtree_mult1_27_replace_multlo_shift2_q_int <= u0_m0_wo0_mtree_mult1_27_replace_multlo_add_1_q & "00";
    u0_m0_wo0_mtree_mult1_27_replace_multlo_shift2_q <= u0_m0_wo0_mtree_mult1_27_replace_multlo_shift2_q_int(20 downto 0);

	--u0_m0_wo0_mtree_mult1_27_replace_multlo_final_convert(ROUND,382)@13
    u0_m0_wo0_mtree_mult1_27_replace_multlo_final_convert_in <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_27_replace_multlo_shift2_q);
    u0_m0_wo0_mtree_mult1_27_replace_multlo_final_convert_q <= u0_m0_wo0_mtree_mult1_27_replace_multlo_final_convert_in(21 downto 0);

	--u0_m0_wo0_mtree_mult1_27_replace_multhi_shift0(BITSHIFT,376)@12
    u0_m0_wo0_mtree_mult1_27_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_27_replace_split_high_b & "0";
    u0_m0_wo0_mtree_mult1_27_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_27_replace_multhi_shift0_q_int(7 downto 0);

	--u0_m0_wo0_mtree_mult1_27_replace_split_high(BITSELECT,208)@12
    u0_m0_wo0_mtree_mult1_27_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr9_q_12_q;
    u0_m0_wo0_mtree_mult1_27_replace_split_high_b <= u0_m0_wo0_mtree_mult1_27_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_27_replace_multhi_add_1(ADD,377)@12
    u0_m0_wo0_mtree_mult1_27_replace_multhi_add_1_a <= STD_LOGIC_VECTOR((8 downto 7 => u0_m0_wo0_mtree_mult1_27_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_27_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_27_replace_multhi_add_1_b <= STD_LOGIC_VECTOR((8 downto 8 => u0_m0_wo0_mtree_mult1_27_replace_multhi_shift0_q(7)) & u0_m0_wo0_mtree_mult1_27_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_27_replace_multhi_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_27_replace_multhi_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_27_replace_multhi_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_27_replace_multhi_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_27_replace_multhi_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_27_replace_multhi_add_1_q <= u0_m0_wo0_mtree_mult1_27_replace_multhi_add_1_o(8 downto 0);


	--u0_m0_wo0_mtree_mult1_27_replace_multhi_shift2(BITSHIFT,378)@13
    u0_m0_wo0_mtree_mult1_27_replace_multhi_shift2_q_int <= u0_m0_wo0_mtree_mult1_27_replace_multhi_add_1_q & "00";
    u0_m0_wo0_mtree_mult1_27_replace_multhi_shift2_q <= u0_m0_wo0_mtree_mult1_27_replace_multhi_shift2_q_int(10 downto 0);

	--u0_m0_wo0_mtree_mult1_27_replace_shiftup(BITSHIFT,212)@13
    u0_m0_wo0_mtree_mult1_27_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_27_replace_multhi_shift2_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_27_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_27_replace_shiftup_q_int(27 downto 0);

	--u0_m0_wo0_mtree_mult1_27_replace_add(ADD,213)@13
    u0_m0_wo0_mtree_mult1_27_replace_add_a <= STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_mult1_27_replace_shiftup_q(27)) & u0_m0_wo0_mtree_mult1_27_replace_shiftup_q);
    u0_m0_wo0_mtree_mult1_27_replace_add_b <= STD_LOGIC_VECTOR((28 downto 22 => u0_m0_wo0_mtree_mult1_27_replace_multlo_final_convert_q(21)) & u0_m0_wo0_mtree_mult1_27_replace_multlo_final_convert_q);
    u0_m0_wo0_mtree_mult1_27_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_27_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_27_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_27_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_27_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_27_replace_add_q <= u0_m0_wo0_mtree_mult1_27_replace_add_o(28 downto 0);


	--u0_m0_wo0_wi0_delayr10(DELAY,17)@10
    u0_m0_wo0_wi0_delayr10 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr9_q, xout => u0_m0_wo0_wi0_delayr10_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_wi0_delayr11(DELAY,18)@10
    u0_m0_wo0_wi0_delayr11 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr10_q, xout => u0_m0_wo0_wi0_delayr11_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr11_q_11(DELAY,545)@10
    d_u0_m0_wo0_wi0_delayr11_q_11 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr11_q, xout => d_u0_m0_wo0_wi0_delayr11_q_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_25_replace_split_low(BITSELECT,215)@11
    u0_m0_wo0_mtree_mult1_25_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr11_q_11_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_25_replace_split_low_b <= u0_m0_wo0_mtree_mult1_25_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_25_replace_multlo_shift0(BITSHIFT,385)@11
    u0_m0_wo0_mtree_mult1_25_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_25_replace_split_low_b & "0000";
    u0_m0_wo0_mtree_mult1_25_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_25_replace_multlo_shift0_q_int(20 downto 0);

	--u0_m0_wo0_mtree_mult1_25_replace_multlo_sub_1(SUB,386)@11
    u0_m0_wo0_mtree_mult1_25_replace_multlo_sub_1_a <= STD_LOGIC_VECTOR("000000000000000000000" & GND_q);
    u0_m0_wo0_mtree_mult1_25_replace_multlo_sub_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_25_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_25_replace_multlo_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_25_replace_multlo_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_25_replace_multlo_sub_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_25_replace_multlo_sub_1_a) - UNSIGNED(u0_m0_wo0_mtree_mult1_25_replace_multlo_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_25_replace_multlo_sub_1_q <= u0_m0_wo0_mtree_mult1_25_replace_multlo_sub_1_o(21 downto 0);


	--u0_m0_wo0_mtree_mult1_25_replace_split_high(BITSELECT,214)@11
    u0_m0_wo0_mtree_mult1_25_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr11_q_11_q;
    u0_m0_wo0_mtree_mult1_25_replace_split_high_b <= u0_m0_wo0_mtree_mult1_25_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_25_replace_multhi_shift0(BITSHIFT,383)@11
    u0_m0_wo0_mtree_mult1_25_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_25_replace_split_high_b & "0000";
    u0_m0_wo0_mtree_mult1_25_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_25_replace_multhi_shift0_q_int(10 downto 0);

	--u0_m0_wo0_mtree_mult1_25_replace_multhi_sub_1(SUB,384)@11
    u0_m0_wo0_mtree_mult1_25_replace_multhi_sub_1_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo0_mtree_mult1_25_replace_multhi_sub_1_b <= STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_25_replace_multhi_shift0_q(10)) & u0_m0_wo0_mtree_mult1_25_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_25_replace_multhi_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_25_replace_multhi_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_25_replace_multhi_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_25_replace_multhi_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_25_replace_multhi_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_25_replace_multhi_sub_1_q <= u0_m0_wo0_mtree_mult1_25_replace_multhi_sub_1_o(11 downto 0);


	--u0_m0_wo0_mtree_mult1_25_replace_shiftup(BITSHIFT,218)@12
    u0_m0_wo0_mtree_mult1_25_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_25_replace_multhi_sub_1_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_25_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_25_replace_shiftup_q_int(28 downto 0);

	--u0_m0_wo0_mtree_mult1_25_replace_add(ADD,219)@12
    u0_m0_wo0_mtree_mult1_25_replace_add_a <= u0_m0_wo0_mtree_mult1_25_replace_shiftup_q;
    u0_m0_wo0_mtree_mult1_25_replace_add_b <= STD_LOGIC_VECTOR((28 downto 22 => u0_m0_wo0_mtree_mult1_25_replace_multlo_sub_1_q(21)) & u0_m0_wo0_mtree_mult1_25_replace_multlo_sub_1_q);
    u0_m0_wo0_mtree_mult1_25_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_25_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_25_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_25_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_25_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_25_replace_add_q <= u0_m0_wo0_mtree_mult1_25_replace_add_o(28 downto 0);


	--u0_m0_wo0_wi0_delayr12(DELAY,19)@10
    u0_m0_wo0_wi0_delayr12 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr11_q, xout => u0_m0_wo0_wi0_delayr12_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_24_replace_split_low(BITSELECT,221)@10
    u0_m0_wo0_mtree_mult1_24_replace_split_low_in <= u0_m0_wo0_wi0_delayr12_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_24_replace_split_low_b <= u0_m0_wo0_mtree_mult1_24_replace_split_low_in(16 downto 0);

	--d_u0_m0_wo0_mtree_mult1_24_replace_split_low_b_11(DELAY,562)@10
    d_u0_m0_wo0_mtree_mult1_24_replace_split_low_b_11 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_24_replace_split_low_b, xout => d_u0_m0_wo0_mtree_mult1_24_replace_split_low_b_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_24_replace_multlo_shift2(BITSHIFT,394)@11
    u0_m0_wo0_mtree_mult1_24_replace_multlo_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_24_replace_split_low_b_11_q & "0000";
    u0_m0_wo0_mtree_mult1_24_replace_multlo_shift2_q <= u0_m0_wo0_mtree_mult1_24_replace_multlo_shift2_q_int(20 downto 0);

	--u0_m0_wo0_mtree_mult1_24_replace_multlo_shift0(BITSHIFT,392)@10
    u0_m0_wo0_mtree_mult1_24_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_24_replace_split_low_b & "00";
    u0_m0_wo0_mtree_mult1_24_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_24_replace_multlo_shift0_q_int(18 downto 0);

	--u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_1(SUB,393)@10
    u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_1_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_24_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_1_b <= STD_LOGIC_VECTOR("000" & u0_m0_wo0_mtree_mult1_24_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_1_a) - UNSIGNED(u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_1_q <= u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_1_o(19 downto 0);


	--u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_3(SUB,395)@11
    u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_3_a <= STD_LOGIC_VECTOR((22 downto 20 => u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_1_q(19)) & u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_1_q);
    u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_3_b <= STD_LOGIC_VECTOR('0' & "0" & u0_m0_wo0_mtree_mult1_24_replace_multlo_shift2_q);
    u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_3_q <= u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_3_o(22 downto 0);


	--u0_m0_wo0_mtree_mult1_24_replace_multlo_shift4(BITSHIFT,396)@12
    u0_m0_wo0_mtree_mult1_24_replace_multlo_shift4_q_int <= u0_m0_wo0_mtree_mult1_24_replace_multlo_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_24_replace_multlo_shift4_q <= u0_m0_wo0_mtree_mult1_24_replace_multlo_shift4_q_int(23 downto 0);

	--u0_m0_wo0_mtree_mult1_24_replace_split_high(BITSELECT,220)@10
    u0_m0_wo0_mtree_mult1_24_replace_split_high_in <= u0_m0_wo0_wi0_delayr12_q;
    u0_m0_wo0_mtree_mult1_24_replace_split_high_b <= u0_m0_wo0_mtree_mult1_24_replace_split_high_in(23 downto 17);

	--d_u0_m0_wo0_mtree_mult1_24_replace_split_high_b_11(DELAY,561)@10
    d_u0_m0_wo0_mtree_mult1_24_replace_split_high_b_11 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_24_replace_split_high_b, xout => d_u0_m0_wo0_mtree_mult1_24_replace_split_high_b_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_24_replace_multhi_shift2(BITSHIFT,389)@11
    u0_m0_wo0_mtree_mult1_24_replace_multhi_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_24_replace_split_high_b_11_q & "0000";
    u0_m0_wo0_mtree_mult1_24_replace_multhi_shift2_q <= u0_m0_wo0_mtree_mult1_24_replace_multhi_shift2_q_int(10 downto 0);

	--u0_m0_wo0_mtree_mult1_24_replace_multhi_shift0(BITSHIFT,387)@10
    u0_m0_wo0_mtree_mult1_24_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_24_replace_split_high_b & "00";
    u0_m0_wo0_mtree_mult1_24_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_24_replace_multhi_shift0_q_int(8 downto 0);

	--u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_1(SUB,388)@10
    u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_1_a <= STD_LOGIC_VECTOR((9 downto 9 => u0_m0_wo0_mtree_mult1_24_replace_multhi_shift0_q(8)) & u0_m0_wo0_mtree_mult1_24_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_1_b <= STD_LOGIC_VECTOR((9 downto 7 => u0_m0_wo0_mtree_mult1_24_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_24_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_1_q <= u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_1_o(9 downto 0);


	--u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_3(SUB,390)@11
    u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_3_a <= STD_LOGIC_VECTOR((11 downto 10 => u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_1_q(9)) & u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_1_q);
    u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_3_b <= STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_24_replace_multhi_shift2_q(10)) & u0_m0_wo0_mtree_mult1_24_replace_multhi_shift2_q);
    u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_3_q <= u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_3_o(11 downto 0);


	--u0_m0_wo0_mtree_mult1_24_replace_multhi_shift4(BITSHIFT,391)@12
    u0_m0_wo0_mtree_mult1_24_replace_multhi_shift4_q_int <= u0_m0_wo0_mtree_mult1_24_replace_multhi_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_24_replace_multhi_shift4_q <= u0_m0_wo0_mtree_mult1_24_replace_multhi_shift4_q_int(12 downto 0);

	--u0_m0_wo0_mtree_mult1_24_replace_shiftup(BITSHIFT,224)@12
    u0_m0_wo0_mtree_mult1_24_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_24_replace_multhi_shift4_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_24_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_24_replace_shiftup_q_int(29 downto 0);

	--u0_m0_wo0_mtree_mult1_24_replace_add(ADD,225)@12
    u0_m0_wo0_mtree_mult1_24_replace_add_a <= u0_m0_wo0_mtree_mult1_24_replace_shiftup_q;
    u0_m0_wo0_mtree_mult1_24_replace_add_b <= STD_LOGIC_VECTOR((29 downto 24 => u0_m0_wo0_mtree_mult1_24_replace_multlo_shift4_q(23)) & u0_m0_wo0_mtree_mult1_24_replace_multlo_shift4_q);
    u0_m0_wo0_mtree_mult1_24_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_24_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_24_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_24_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_24_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_24_replace_add_q <= u0_m0_wo0_mtree_mult1_24_replace_add_o(29 downto 0);


	--u0_m0_wo0_mtree_add0_12(ADD,130)@13
    u0_m0_wo0_mtree_add0_12_a <= STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_mult1_24_replace_add_q(29)) & u0_m0_wo0_mtree_mult1_24_replace_add_q);
    u0_m0_wo0_mtree_add0_12_b <= STD_LOGIC_VECTOR((30 downto 29 => u0_m0_wo0_mtree_mult1_25_replace_add_q(28)) & u0_m0_wo0_mtree_mult1_25_replace_add_q);
    u0_m0_wo0_mtree_add0_12: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_12_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_12_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_12_a) + SIGNED(u0_m0_wo0_mtree_add0_12_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_12_q <= u0_m0_wo0_mtree_add0_12_o(30 downto 0);


	--u0_m0_wo0_mtree_add1_6(ADD,142)@14
    u0_m0_wo0_mtree_add1_6_a <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_add0_12_q(30)) & u0_m0_wo0_mtree_add0_12_q);
    u0_m0_wo0_mtree_add1_6_b <= STD_LOGIC_VECTOR((31 downto 29 => u0_m0_wo0_mtree_mult1_27_replace_add_q(28)) & u0_m0_wo0_mtree_mult1_27_replace_add_q);
    u0_m0_wo0_mtree_add1_6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_6_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_6_a) + SIGNED(u0_m0_wo0_mtree_add1_6_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_6_q <= u0_m0_wo0_mtree_add1_6_o(31 downto 0);


	--u0_m0_wo0_mtree_add2_3(ADD,148)@15
    u0_m0_wo0_mtree_add2_3_a <= STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_add1_6_q(31)) & u0_m0_wo0_mtree_add1_6_q);
    u0_m0_wo0_mtree_add2_3_b <= STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_add1_7_q(31)) & u0_m0_wo0_mtree_add1_7_q);
    u0_m0_wo0_mtree_add2_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_3_a) + SIGNED(u0_m0_wo0_mtree_add2_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_3_q <= u0_m0_wo0_mtree_add2_3_o(32 downto 0);


	--u0_m0_wo0_wi0_delayr13(DELAY,20)@10
    u0_m0_wo0_wi0_delayr13 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr12_q, xout => u0_m0_wo0_wi0_delayr13_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr13_q_11(DELAY,546)@10
    d_u0_m0_wo0_wi0_delayr13_q_11 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr13_q, xout => d_u0_m0_wo0_wi0_delayr13_q_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_23_replace_split_low(BITSELECT,227)@11
    u0_m0_wo0_mtree_mult1_23_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr13_q_11_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_23_replace_split_low_b <= u0_m0_wo0_mtree_mult1_23_replace_split_low_in(16 downto 0);

	--d_u0_m0_wo0_mtree_mult1_23_replace_split_low_b_12(DELAY,564)@11
    d_u0_m0_wo0_mtree_mult1_23_replace_split_low_b_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_23_replace_split_low_b, xout => d_u0_m0_wo0_mtree_mult1_23_replace_split_low_b_12_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_23_replace_multlo_shift2(BITSHIFT,404)@12
    u0_m0_wo0_mtree_mult1_23_replace_multlo_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_23_replace_split_low_b_12_q & "0000";
    u0_m0_wo0_mtree_mult1_23_replace_multlo_shift2_q <= u0_m0_wo0_mtree_mult1_23_replace_multlo_shift2_q_int(20 downto 0);

	--u0_m0_wo0_mtree_mult1_23_replace_multlo_shift0(BITSHIFT,402)@11
    u0_m0_wo0_mtree_mult1_23_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_23_replace_split_low_b & "00";
    u0_m0_wo0_mtree_mult1_23_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_23_replace_multlo_shift0_q_int(18 downto 0);

	--u0_m0_wo0_mtree_mult1_23_replace_multlo_add_1(ADD,403)@11
    u0_m0_wo0_mtree_mult1_23_replace_multlo_add_1_a <= STD_LOGIC_VECTOR("000" & u0_m0_wo0_mtree_mult1_23_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_23_replace_multlo_add_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_23_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_23_replace_multlo_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_23_replace_multlo_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_23_replace_multlo_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_23_replace_multlo_add_1_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_23_replace_multlo_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_23_replace_multlo_add_1_q <= u0_m0_wo0_mtree_mult1_23_replace_multlo_add_1_o(19 downto 0);


	--u0_m0_wo0_mtree_mult1_23_replace_multlo_sub_3(SUB,405)@12
    u0_m0_wo0_mtree_mult1_23_replace_multlo_sub_3_a <= STD_LOGIC_VECTOR("00" & u0_m0_wo0_mtree_mult1_23_replace_multlo_add_1_q);
    u0_m0_wo0_mtree_mult1_23_replace_multlo_sub_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_23_replace_multlo_shift2_q);
    u0_m0_wo0_mtree_mult1_23_replace_multlo_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_23_replace_multlo_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_23_replace_multlo_sub_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_23_replace_multlo_sub_3_a) - UNSIGNED(u0_m0_wo0_mtree_mult1_23_replace_multlo_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_23_replace_multlo_sub_3_q <= u0_m0_wo0_mtree_mult1_23_replace_multlo_sub_3_o(21 downto 0);


	--u0_m0_wo0_mtree_mult1_23_replace_multlo_shift4(BITSHIFT,406)@13
    u0_m0_wo0_mtree_mult1_23_replace_multlo_shift4_q_int <= u0_m0_wo0_mtree_mult1_23_replace_multlo_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_23_replace_multlo_shift4_q <= u0_m0_wo0_mtree_mult1_23_replace_multlo_shift4_q_int(22 downto 0);

	--u0_m0_wo0_mtree_mult1_23_replace_split_high(BITSELECT,226)@11
    u0_m0_wo0_mtree_mult1_23_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr13_q_11_q;
    u0_m0_wo0_mtree_mult1_23_replace_split_high_b <= u0_m0_wo0_mtree_mult1_23_replace_split_high_in(23 downto 17);

	--d_u0_m0_wo0_mtree_mult1_23_replace_split_high_b_12(DELAY,563)@11
    d_u0_m0_wo0_mtree_mult1_23_replace_split_high_b_12 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_23_replace_split_high_b, xout => d_u0_m0_wo0_mtree_mult1_23_replace_split_high_b_12_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_23_replace_multhi_shift2(BITSHIFT,399)@12
    u0_m0_wo0_mtree_mult1_23_replace_multhi_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_23_replace_split_high_b_12_q & "0000";
    u0_m0_wo0_mtree_mult1_23_replace_multhi_shift2_q <= u0_m0_wo0_mtree_mult1_23_replace_multhi_shift2_q_int(10 downto 0);

	--u0_m0_wo0_mtree_mult1_23_replace_multhi_shift0(BITSHIFT,397)@11
    u0_m0_wo0_mtree_mult1_23_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_23_replace_split_high_b & "00";
    u0_m0_wo0_mtree_mult1_23_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_23_replace_multhi_shift0_q_int(8 downto 0);

	--u0_m0_wo0_mtree_mult1_23_replace_multhi_add_1(ADD,398)@11
    u0_m0_wo0_mtree_mult1_23_replace_multhi_add_1_a <= STD_LOGIC_VECTOR((9 downto 7 => u0_m0_wo0_mtree_mult1_23_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_23_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_23_replace_multhi_add_1_b <= STD_LOGIC_VECTOR((9 downto 9 => u0_m0_wo0_mtree_mult1_23_replace_multhi_shift0_q(8)) & u0_m0_wo0_mtree_mult1_23_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_23_replace_multhi_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_23_replace_multhi_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_23_replace_multhi_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_23_replace_multhi_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_23_replace_multhi_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_23_replace_multhi_add_1_q <= u0_m0_wo0_mtree_mult1_23_replace_multhi_add_1_o(9 downto 0);


	--u0_m0_wo0_mtree_mult1_23_replace_multhi_sub_3(SUB,400)@12
    u0_m0_wo0_mtree_mult1_23_replace_multhi_sub_3_a <= STD_LOGIC_VECTOR((11 downto 10 => u0_m0_wo0_mtree_mult1_23_replace_multhi_add_1_q(9)) & u0_m0_wo0_mtree_mult1_23_replace_multhi_add_1_q);
    u0_m0_wo0_mtree_mult1_23_replace_multhi_sub_3_b <= STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_23_replace_multhi_shift2_q(10)) & u0_m0_wo0_mtree_mult1_23_replace_multhi_shift2_q);
    u0_m0_wo0_mtree_mult1_23_replace_multhi_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_23_replace_multhi_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_23_replace_multhi_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_23_replace_multhi_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_23_replace_multhi_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_23_replace_multhi_sub_3_q <= u0_m0_wo0_mtree_mult1_23_replace_multhi_sub_3_o(11 downto 0);


	--u0_m0_wo0_mtree_mult1_23_replace_multhi_shift4(BITSHIFT,401)@13
    u0_m0_wo0_mtree_mult1_23_replace_multhi_shift4_q_int <= u0_m0_wo0_mtree_mult1_23_replace_multhi_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_23_replace_multhi_shift4_q <= u0_m0_wo0_mtree_mult1_23_replace_multhi_shift4_q_int(12 downto 0);

	--u0_m0_wo0_mtree_mult1_23_replace_shiftup(BITSHIFT,230)@13
    u0_m0_wo0_mtree_mult1_23_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_23_replace_multhi_shift4_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_23_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_23_replace_shiftup_q_int(29 downto 0);

	--u0_m0_wo0_mtree_mult1_23_replace_add(ADD,231)@13
    u0_m0_wo0_mtree_mult1_23_replace_add_a <= u0_m0_wo0_mtree_mult1_23_replace_shiftup_q;
    u0_m0_wo0_mtree_mult1_23_replace_add_b <= STD_LOGIC_VECTOR((29 downto 23 => u0_m0_wo0_mtree_mult1_23_replace_multlo_shift4_q(22)) & u0_m0_wo0_mtree_mult1_23_replace_multlo_shift4_q);
    u0_m0_wo0_mtree_mult1_23_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_23_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_23_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_23_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_23_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_23_replace_add_q <= u0_m0_wo0_mtree_mult1_23_replace_add_o(29 downto 0);


	--u0_m0_wo0_wi0_delayr14(DELAY,21)@10
    u0_m0_wo0_wi0_delayr14 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr13_q, xout => u0_m0_wo0_wi0_delayr14_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_wi0_delayr15(DELAY,22)@10
    u0_m0_wo0_wi0_delayr15 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr14_q, xout => u0_m0_wo0_wi0_delayr15_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_21_replace_split_low(BITSELECT,233)@10
    u0_m0_wo0_mtree_mult1_21_replace_split_low_in <= u0_m0_wo0_wi0_delayr15_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_21_replace_split_low_b <= u0_m0_wo0_mtree_mult1_21_replace_split_low_in(16 downto 0);

	--d_u0_m0_wo0_mtree_mult1_21_replace_split_low_b_11(DELAY,566)@10
    d_u0_m0_wo0_mtree_mult1_21_replace_split_low_b_11 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_21_replace_split_low_b, xout => d_u0_m0_wo0_mtree_mult1_21_replace_split_low_b_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_21_replace_multlo_shift2(BITSHIFT,414)@11
    u0_m0_wo0_mtree_mult1_21_replace_multlo_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_21_replace_split_low_b_11_q & "0000";
    u0_m0_wo0_mtree_mult1_21_replace_multlo_shift2_q <= u0_m0_wo0_mtree_mult1_21_replace_multlo_shift2_q_int(20 downto 0);

	--u0_m0_wo0_mtree_mult1_21_replace_multlo_shift0(BITSHIFT,412)@10
    u0_m0_wo0_mtree_mult1_21_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_21_replace_split_low_b & "0";
    u0_m0_wo0_mtree_mult1_21_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_21_replace_multlo_shift0_q_int(17 downto 0);

	--u0_m0_wo0_mtree_mult1_21_replace_multlo_add_1(ADD,413)@10
    u0_m0_wo0_mtree_mult1_21_replace_multlo_add_1_a <= STD_LOGIC_VECTOR("00" & u0_m0_wo0_mtree_mult1_21_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_21_replace_multlo_add_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_21_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_21_replace_multlo_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_21_replace_multlo_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_21_replace_multlo_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_21_replace_multlo_add_1_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_21_replace_multlo_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_21_replace_multlo_add_1_q <= u0_m0_wo0_mtree_mult1_21_replace_multlo_add_1_o(18 downto 0);


	--u0_m0_wo0_mtree_mult1_21_replace_multlo_add_3(ADD,415)@11
    u0_m0_wo0_mtree_mult1_21_replace_multlo_add_3_a <= STD_LOGIC_VECTOR("000" & u0_m0_wo0_mtree_mult1_21_replace_multlo_add_1_q);
    u0_m0_wo0_mtree_mult1_21_replace_multlo_add_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_21_replace_multlo_shift2_q);
    u0_m0_wo0_mtree_mult1_21_replace_multlo_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_21_replace_multlo_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_21_replace_multlo_add_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_21_replace_multlo_add_3_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_21_replace_multlo_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_21_replace_multlo_add_3_q <= u0_m0_wo0_mtree_mult1_21_replace_multlo_add_3_o(21 downto 0);


	--u0_m0_wo0_mtree_mult1_21_replace_multlo_shift4(BITSHIFT,416)@12
    u0_m0_wo0_mtree_mult1_21_replace_multlo_shift4_q_int <= u0_m0_wo0_mtree_mult1_21_replace_multlo_add_3_q & "0";
    u0_m0_wo0_mtree_mult1_21_replace_multlo_shift4_q <= u0_m0_wo0_mtree_mult1_21_replace_multlo_shift4_q_int(22 downto 0);

	--u0_m0_wo0_mtree_mult1_21_replace_multlo_final_convert(ROUND,417)@12
    u0_m0_wo0_mtree_mult1_21_replace_multlo_final_convert_in <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_21_replace_multlo_shift4_q);
    u0_m0_wo0_mtree_mult1_21_replace_multlo_final_convert_q <= u0_m0_wo0_mtree_mult1_21_replace_multlo_final_convert_in(23 downto 0);

	--u0_m0_wo0_mtree_mult1_21_replace_split_high(BITSELECT,232)@10
    u0_m0_wo0_mtree_mult1_21_replace_split_high_in <= u0_m0_wo0_wi0_delayr15_q;
    u0_m0_wo0_mtree_mult1_21_replace_split_high_b <= u0_m0_wo0_mtree_mult1_21_replace_split_high_in(23 downto 17);

	--d_u0_m0_wo0_mtree_mult1_21_replace_split_high_b_11(DELAY,565)@10
    d_u0_m0_wo0_mtree_mult1_21_replace_split_high_b_11 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_21_replace_split_high_b, xout => d_u0_m0_wo0_mtree_mult1_21_replace_split_high_b_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_21_replace_multhi_shift2(BITSHIFT,409)@11
    u0_m0_wo0_mtree_mult1_21_replace_multhi_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_21_replace_split_high_b_11_q & "0000";
    u0_m0_wo0_mtree_mult1_21_replace_multhi_shift2_q <= u0_m0_wo0_mtree_mult1_21_replace_multhi_shift2_q_int(10 downto 0);

	--u0_m0_wo0_mtree_mult1_21_replace_multhi_shift0(BITSHIFT,407)@10
    u0_m0_wo0_mtree_mult1_21_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_21_replace_split_high_b & "0";
    u0_m0_wo0_mtree_mult1_21_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_21_replace_multhi_shift0_q_int(7 downto 0);

	--u0_m0_wo0_mtree_mult1_21_replace_multhi_add_1(ADD,408)@10
    u0_m0_wo0_mtree_mult1_21_replace_multhi_add_1_a <= STD_LOGIC_VECTOR((8 downto 7 => u0_m0_wo0_mtree_mult1_21_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_21_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_21_replace_multhi_add_1_b <= STD_LOGIC_VECTOR((8 downto 8 => u0_m0_wo0_mtree_mult1_21_replace_multhi_shift0_q(7)) & u0_m0_wo0_mtree_mult1_21_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_21_replace_multhi_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_21_replace_multhi_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_21_replace_multhi_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_21_replace_multhi_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_21_replace_multhi_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_21_replace_multhi_add_1_q <= u0_m0_wo0_mtree_mult1_21_replace_multhi_add_1_o(8 downto 0);


	--u0_m0_wo0_mtree_mult1_21_replace_multhi_add_3(ADD,410)@11
    u0_m0_wo0_mtree_mult1_21_replace_multhi_add_3_a <= STD_LOGIC_VECTOR((11 downto 9 => u0_m0_wo0_mtree_mult1_21_replace_multhi_add_1_q(8)) & u0_m0_wo0_mtree_mult1_21_replace_multhi_add_1_q);
    u0_m0_wo0_mtree_mult1_21_replace_multhi_add_3_b <= STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_21_replace_multhi_shift2_q(10)) & u0_m0_wo0_mtree_mult1_21_replace_multhi_shift2_q);
    u0_m0_wo0_mtree_mult1_21_replace_multhi_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_21_replace_multhi_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_21_replace_multhi_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_21_replace_multhi_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_21_replace_multhi_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_21_replace_multhi_add_3_q <= u0_m0_wo0_mtree_mult1_21_replace_multhi_add_3_o(11 downto 0);


	--u0_m0_wo0_mtree_mult1_21_replace_multhi_shift4(BITSHIFT,411)@12
    u0_m0_wo0_mtree_mult1_21_replace_multhi_shift4_q_int <= u0_m0_wo0_mtree_mult1_21_replace_multhi_add_3_q & "0";
    u0_m0_wo0_mtree_mult1_21_replace_multhi_shift4_q <= u0_m0_wo0_mtree_mult1_21_replace_multhi_shift4_q_int(12 downto 0);

	--u0_m0_wo0_mtree_mult1_21_replace_shiftup(BITSHIFT,236)@12
    u0_m0_wo0_mtree_mult1_21_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_21_replace_multhi_shift4_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_21_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_21_replace_shiftup_q_int(29 downto 0);

	--u0_m0_wo0_mtree_mult1_21_replace_add(ADD,237)@12
    u0_m0_wo0_mtree_mult1_21_replace_add_a <= STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_mult1_21_replace_shiftup_q(29)) & u0_m0_wo0_mtree_mult1_21_replace_shiftup_q);
    u0_m0_wo0_mtree_mult1_21_replace_add_b <= STD_LOGIC_VECTOR((30 downto 24 => u0_m0_wo0_mtree_mult1_21_replace_multlo_final_convert_q(23)) & u0_m0_wo0_mtree_mult1_21_replace_multlo_final_convert_q);
    u0_m0_wo0_mtree_mult1_21_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_21_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_21_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_21_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_21_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_21_replace_add_q <= u0_m0_wo0_mtree_mult1_21_replace_add_o(30 downto 0);


	--u0_m0_wo0_mtree_mult1_20_replace_multlo_shift0(BITSHIFT,421)@11
    u0_m0_wo0_mtree_mult1_20_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_20_replace_split_low_b & "00";
    u0_m0_wo0_mtree_mult1_20_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_20_replace_multlo_shift0_q_int(18 downto 0);

	--u0_m0_wo0_wi0_delayr16(DELAY,23)@10
    u0_m0_wo0_wi0_delayr16 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr15_q, xout => u0_m0_wo0_wi0_delayr16_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr16_q_11(DELAY,547)@10
    d_u0_m0_wo0_wi0_delayr16_q_11 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr16_q, xout => d_u0_m0_wo0_wi0_delayr16_q_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_20_replace_split_low(BITSELECT,239)@11
    u0_m0_wo0_mtree_mult1_20_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr16_q_11_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_20_replace_split_low_b <= u0_m0_wo0_mtree_mult1_20_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_20_replace_multlo_add_1(ADD,422)@11
    u0_m0_wo0_mtree_mult1_20_replace_multlo_add_1_a <= STD_LOGIC_VECTOR("000" & u0_m0_wo0_mtree_mult1_20_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_20_replace_multlo_add_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_20_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_20_replace_multlo_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_20_replace_multlo_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_20_replace_multlo_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_20_replace_multlo_add_1_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_20_replace_multlo_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_20_replace_multlo_add_1_q <= u0_m0_wo0_mtree_mult1_20_replace_multlo_add_1_o(19 downto 0);


	--u0_m0_wo0_mtree_mult1_20_replace_multlo_shift2(BITSHIFT,423)@12
    u0_m0_wo0_mtree_mult1_20_replace_multlo_shift2_q_int <= u0_m0_wo0_mtree_mult1_20_replace_multlo_add_1_q & "0000";
    u0_m0_wo0_mtree_mult1_20_replace_multlo_shift2_q <= u0_m0_wo0_mtree_mult1_20_replace_multlo_shift2_q_int(23 downto 0);

	--u0_m0_wo0_mtree_mult1_20_replace_multlo_final_convert(ROUND,424)@12
    u0_m0_wo0_mtree_mult1_20_replace_multlo_final_convert_in <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_20_replace_multlo_shift2_q);
    u0_m0_wo0_mtree_mult1_20_replace_multlo_final_convert_q <= u0_m0_wo0_mtree_mult1_20_replace_multlo_final_convert_in(24 downto 0);

	--u0_m0_wo0_mtree_mult1_20_replace_multhi_shift0(BITSHIFT,418)@11
    u0_m0_wo0_mtree_mult1_20_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_20_replace_split_high_b & "00";
    u0_m0_wo0_mtree_mult1_20_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_20_replace_multhi_shift0_q_int(8 downto 0);

	--u0_m0_wo0_mtree_mult1_20_replace_split_high(BITSELECT,238)@11
    u0_m0_wo0_mtree_mult1_20_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr16_q_11_q;
    u0_m0_wo0_mtree_mult1_20_replace_split_high_b <= u0_m0_wo0_mtree_mult1_20_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_20_replace_multhi_add_1(ADD,419)@11
    u0_m0_wo0_mtree_mult1_20_replace_multhi_add_1_a <= STD_LOGIC_VECTOR((9 downto 7 => u0_m0_wo0_mtree_mult1_20_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_20_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_20_replace_multhi_add_1_b <= STD_LOGIC_VECTOR((9 downto 9 => u0_m0_wo0_mtree_mult1_20_replace_multhi_shift0_q(8)) & u0_m0_wo0_mtree_mult1_20_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_20_replace_multhi_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_20_replace_multhi_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_20_replace_multhi_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_20_replace_multhi_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_20_replace_multhi_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_20_replace_multhi_add_1_q <= u0_m0_wo0_mtree_mult1_20_replace_multhi_add_1_o(9 downto 0);


	--u0_m0_wo0_mtree_mult1_20_replace_multhi_shift2(BITSHIFT,420)@12
    u0_m0_wo0_mtree_mult1_20_replace_multhi_shift2_q_int <= u0_m0_wo0_mtree_mult1_20_replace_multhi_add_1_q & "0000";
    u0_m0_wo0_mtree_mult1_20_replace_multhi_shift2_q <= u0_m0_wo0_mtree_mult1_20_replace_multhi_shift2_q_int(13 downto 0);

	--u0_m0_wo0_mtree_mult1_20_replace_shiftup(BITSHIFT,242)@12
    u0_m0_wo0_mtree_mult1_20_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_20_replace_multhi_shift2_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_20_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_20_replace_shiftup_q_int(30 downto 0);

	--u0_m0_wo0_mtree_mult1_20_replace_add(ADD,243)@12
    u0_m0_wo0_mtree_mult1_20_replace_add_a <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_mult1_20_replace_shiftup_q(30)) & u0_m0_wo0_mtree_mult1_20_replace_shiftup_q);
    u0_m0_wo0_mtree_mult1_20_replace_add_b <= STD_LOGIC_VECTOR((31 downto 25 => u0_m0_wo0_mtree_mult1_20_replace_multlo_final_convert_q(24)) & u0_m0_wo0_mtree_mult1_20_replace_multlo_final_convert_q);
    u0_m0_wo0_mtree_mult1_20_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_20_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_20_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_20_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_20_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_20_replace_add_q <= u0_m0_wo0_mtree_mult1_20_replace_add_o(31 downto 0);


	--u0_m0_wo0_mtree_add0_10(ADD,128)@13
    u0_m0_wo0_mtree_add0_10_a <= STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_mult1_20_replace_add_q(31)) & u0_m0_wo0_mtree_mult1_20_replace_add_q);
    u0_m0_wo0_mtree_add0_10_b <= STD_LOGIC_VECTOR((32 downto 31 => u0_m0_wo0_mtree_mult1_21_replace_add_q(30)) & u0_m0_wo0_mtree_mult1_21_replace_add_q);
    u0_m0_wo0_mtree_add0_10: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_10_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_10_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_10_a) + SIGNED(u0_m0_wo0_mtree_add0_10_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_10_q <= u0_m0_wo0_mtree_add0_10_o(32 downto 0);


	--u0_m0_wo0_mtree_add1_5(ADD,141)@14
    u0_m0_wo0_mtree_add1_5_a <= STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_add0_10_q(32)) & u0_m0_wo0_mtree_add0_10_q);
    u0_m0_wo0_mtree_add1_5_b <= STD_LOGIC_VECTOR((33 downto 30 => u0_m0_wo0_mtree_mult1_23_replace_add_q(29)) & u0_m0_wo0_mtree_mult1_23_replace_add_q);
    u0_m0_wo0_mtree_add1_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_5_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_5_a) + SIGNED(u0_m0_wo0_mtree_add1_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_5_q <= u0_m0_wo0_mtree_add1_5_o(33 downto 0);


	--u0_m0_wo0_wi0_delayr17(DELAY,24)@10
    u0_m0_wo0_wi0_delayr17 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr16_q, xout => u0_m0_wo0_wi0_delayr17_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_19_replace_split_low(BITSELECT,245)@10
    u0_m0_wo0_mtree_mult1_19_replace_split_low_in <= u0_m0_wo0_wi0_delayr17_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_19_replace_split_low_b <= u0_m0_wo0_mtree_mult1_19_replace_split_low_in(16 downto 0);

	--d_u0_m0_wo0_mtree_mult1_19_replace_split_low_b_11(DELAY,568)@10
    d_u0_m0_wo0_mtree_mult1_19_replace_split_low_b_11 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_19_replace_split_low_b, xout => d_u0_m0_wo0_mtree_mult1_19_replace_split_low_b_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_19_replace_multlo_shift2(BITSHIFT,432)@11
    u0_m0_wo0_mtree_mult1_19_replace_multlo_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_19_replace_split_low_b_11_q & "000000";
    u0_m0_wo0_mtree_mult1_19_replace_multlo_shift2_q <= u0_m0_wo0_mtree_mult1_19_replace_multlo_shift2_q_int(22 downto 0);

	--u0_m0_wo0_mtree_mult1_19_replace_multlo_shift0(BITSHIFT,430)@10
    u0_m0_wo0_mtree_mult1_19_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_19_replace_split_low_b & "000";
    u0_m0_wo0_mtree_mult1_19_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_19_replace_multlo_shift0_q_int(19 downto 0);

	--u0_m0_wo0_mtree_mult1_19_replace_multlo_sub_1(SUB,431)@10
    u0_m0_wo0_mtree_mult1_19_replace_multlo_sub_1_a <= STD_LOGIC_VECTOR("0000" & u0_m0_wo0_mtree_mult1_19_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_19_replace_multlo_sub_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_19_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_19_replace_multlo_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_19_replace_multlo_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_19_replace_multlo_sub_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_19_replace_multlo_sub_1_a) - UNSIGNED(u0_m0_wo0_mtree_mult1_19_replace_multlo_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_19_replace_multlo_sub_1_q <= u0_m0_wo0_mtree_mult1_19_replace_multlo_sub_1_o(20 downto 0);


	--u0_m0_wo0_mtree_mult1_19_replace_multlo_add_3(ADD,433)@11
    u0_m0_wo0_mtree_mult1_19_replace_multlo_add_3_a <= STD_LOGIC_VECTOR((24 downto 21 => u0_m0_wo0_mtree_mult1_19_replace_multlo_sub_1_q(20)) & u0_m0_wo0_mtree_mult1_19_replace_multlo_sub_1_q);
    u0_m0_wo0_mtree_mult1_19_replace_multlo_add_3_b <= STD_LOGIC_VECTOR('0' & "0" & u0_m0_wo0_mtree_mult1_19_replace_multlo_shift2_q);
    u0_m0_wo0_mtree_mult1_19_replace_multlo_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_19_replace_multlo_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_19_replace_multlo_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_19_replace_multlo_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_19_replace_multlo_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_19_replace_multlo_add_3_q <= u0_m0_wo0_mtree_mult1_19_replace_multlo_add_3_o(24 downto 0);


	--u0_m0_wo0_mtree_mult1_19_replace_multlo_shift4(BITSHIFT,434)@12
    u0_m0_wo0_mtree_mult1_19_replace_multlo_shift4_q_int <= u0_m0_wo0_mtree_mult1_19_replace_multlo_add_3_q & "0";
    u0_m0_wo0_mtree_mult1_19_replace_multlo_shift4_q <= u0_m0_wo0_mtree_mult1_19_replace_multlo_shift4_q_int(25 downto 0);

	--u0_m0_wo0_mtree_mult1_19_replace_split_high(BITSELECT,244)@10
    u0_m0_wo0_mtree_mult1_19_replace_split_high_in <= u0_m0_wo0_wi0_delayr17_q;
    u0_m0_wo0_mtree_mult1_19_replace_split_high_b <= u0_m0_wo0_mtree_mult1_19_replace_split_high_in(23 downto 17);

	--d_u0_m0_wo0_mtree_mult1_19_replace_split_high_b_11(DELAY,567)@10
    d_u0_m0_wo0_mtree_mult1_19_replace_split_high_b_11 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_19_replace_split_high_b, xout => d_u0_m0_wo0_mtree_mult1_19_replace_split_high_b_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_19_replace_multhi_shift2(BITSHIFT,427)@11
    u0_m0_wo0_mtree_mult1_19_replace_multhi_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_19_replace_split_high_b_11_q & "000000";
    u0_m0_wo0_mtree_mult1_19_replace_multhi_shift2_q <= u0_m0_wo0_mtree_mult1_19_replace_multhi_shift2_q_int(12 downto 0);

	--u0_m0_wo0_mtree_mult1_19_replace_multhi_shift0(BITSHIFT,425)@10
    u0_m0_wo0_mtree_mult1_19_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_19_replace_split_high_b & "000";
    u0_m0_wo0_mtree_mult1_19_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_19_replace_multhi_shift0_q_int(9 downto 0);

	--u0_m0_wo0_mtree_mult1_19_replace_multhi_sub_1(SUB,426)@10
    u0_m0_wo0_mtree_mult1_19_replace_multhi_sub_1_a <= STD_LOGIC_VECTOR((10 downto 7 => u0_m0_wo0_mtree_mult1_19_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_19_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_19_replace_multhi_sub_1_b <= STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_19_replace_multhi_shift0_q(9)) & u0_m0_wo0_mtree_mult1_19_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_19_replace_multhi_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_19_replace_multhi_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_19_replace_multhi_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_19_replace_multhi_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_19_replace_multhi_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_19_replace_multhi_sub_1_q <= u0_m0_wo0_mtree_mult1_19_replace_multhi_sub_1_o(10 downto 0);


	--u0_m0_wo0_mtree_mult1_19_replace_multhi_add_3(ADD,428)@11
    u0_m0_wo0_mtree_mult1_19_replace_multhi_add_3_a <= STD_LOGIC_VECTOR((13 downto 11 => u0_m0_wo0_mtree_mult1_19_replace_multhi_sub_1_q(10)) & u0_m0_wo0_mtree_mult1_19_replace_multhi_sub_1_q);
    u0_m0_wo0_mtree_mult1_19_replace_multhi_add_3_b <= STD_LOGIC_VECTOR((13 downto 13 => u0_m0_wo0_mtree_mult1_19_replace_multhi_shift2_q(12)) & u0_m0_wo0_mtree_mult1_19_replace_multhi_shift2_q);
    u0_m0_wo0_mtree_mult1_19_replace_multhi_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_19_replace_multhi_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_19_replace_multhi_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_19_replace_multhi_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_19_replace_multhi_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_19_replace_multhi_add_3_q <= u0_m0_wo0_mtree_mult1_19_replace_multhi_add_3_o(13 downto 0);


	--u0_m0_wo0_mtree_mult1_19_replace_multhi_shift4(BITSHIFT,429)@12
    u0_m0_wo0_mtree_mult1_19_replace_multhi_shift4_q_int <= u0_m0_wo0_mtree_mult1_19_replace_multhi_add_3_q & "0";
    u0_m0_wo0_mtree_mult1_19_replace_multhi_shift4_q <= u0_m0_wo0_mtree_mult1_19_replace_multhi_shift4_q_int(14 downto 0);

	--u0_m0_wo0_mtree_mult1_19_replace_shiftup(BITSHIFT,248)@12
    u0_m0_wo0_mtree_mult1_19_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_19_replace_multhi_shift4_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_19_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_19_replace_shiftup_q_int(31 downto 0);

	--u0_m0_wo0_mtree_mult1_19_replace_add(ADD,249)@12
    u0_m0_wo0_mtree_mult1_19_replace_add_a <= u0_m0_wo0_mtree_mult1_19_replace_shiftup_q;
    u0_m0_wo0_mtree_mult1_19_replace_add_b <= STD_LOGIC_VECTOR((31 downto 26 => u0_m0_wo0_mtree_mult1_19_replace_multlo_shift4_q(25)) & u0_m0_wo0_mtree_mult1_19_replace_multlo_shift4_q);
    u0_m0_wo0_mtree_mult1_19_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_19_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_19_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_19_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_19_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_19_replace_add_q <= u0_m0_wo0_mtree_mult1_19_replace_add_o(31 downto 0);


	--u0_m0_wo0_wi0_delayr18(DELAY,25)@10
    u0_m0_wo0_wi0_delayr18 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr17_q, xout => u0_m0_wo0_wi0_delayr18_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr18_q_11(DELAY,548)@10
    d_u0_m0_wo0_wi0_delayr18_q_11 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr18_q, xout => d_u0_m0_wo0_wi0_delayr18_q_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_18_replace_split_low(BITSELECT,251)@11
    u0_m0_wo0_mtree_mult1_18_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr18_q_11_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_18_replace_split_low_b <= u0_m0_wo0_mtree_mult1_18_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_18_replace_multlo_shift0(BITSHIFT,437)@11
    u0_m0_wo0_mtree_mult1_18_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_18_replace_split_low_b & "0000000";
    u0_m0_wo0_mtree_mult1_18_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_18_replace_multlo_shift0_q_int(23 downto 0);

	--u0_m0_wo0_mtree_mult1_18_replace_multlo_sub_1(SUB,438)@11
    u0_m0_wo0_mtree_mult1_18_replace_multlo_sub_1_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_18_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_18_replace_multlo_sub_1_b <= STD_LOGIC_VECTOR("00000000" & u0_m0_wo0_mtree_mult1_18_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_18_replace_multlo_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_18_replace_multlo_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_18_replace_multlo_sub_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_18_replace_multlo_sub_1_a) - UNSIGNED(u0_m0_wo0_mtree_mult1_18_replace_multlo_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_18_replace_multlo_sub_1_q <= u0_m0_wo0_mtree_mult1_18_replace_multlo_sub_1_o(24 downto 0);


	--u0_m0_wo0_mtree_mult1_18_replace_split_high(BITSELECT,250)@11
    u0_m0_wo0_mtree_mult1_18_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr18_q_11_q;
    u0_m0_wo0_mtree_mult1_18_replace_split_high_b <= u0_m0_wo0_mtree_mult1_18_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_18_replace_multhi_shift0(BITSHIFT,435)@11
    u0_m0_wo0_mtree_mult1_18_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_18_replace_split_high_b & "0000000";
    u0_m0_wo0_mtree_mult1_18_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_18_replace_multhi_shift0_q_int(13 downto 0);

	--u0_m0_wo0_mtree_mult1_18_replace_multhi_sub_1(SUB,436)@11
    u0_m0_wo0_mtree_mult1_18_replace_multhi_sub_1_a <= STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_mult1_18_replace_multhi_shift0_q(13)) & u0_m0_wo0_mtree_mult1_18_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_18_replace_multhi_sub_1_b <= STD_LOGIC_VECTOR((14 downto 7 => u0_m0_wo0_mtree_mult1_18_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_18_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_18_replace_multhi_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_18_replace_multhi_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_18_replace_multhi_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_18_replace_multhi_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_18_replace_multhi_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_18_replace_multhi_sub_1_q <= u0_m0_wo0_mtree_mult1_18_replace_multhi_sub_1_o(14 downto 0);


	--u0_m0_wo0_mtree_mult1_18_replace_shiftup(BITSHIFT,254)@12
    u0_m0_wo0_mtree_mult1_18_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_18_replace_multhi_sub_1_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_18_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_18_replace_shiftup_q_int(31 downto 0);

	--u0_m0_wo0_mtree_mult1_18_replace_add(ADD,255)@12
    u0_m0_wo0_mtree_mult1_18_replace_add_a <= u0_m0_wo0_mtree_mult1_18_replace_shiftup_q;
    u0_m0_wo0_mtree_mult1_18_replace_add_b <= STD_LOGIC_VECTOR((31 downto 25 => u0_m0_wo0_mtree_mult1_18_replace_multlo_sub_1_q(24)) & u0_m0_wo0_mtree_mult1_18_replace_multlo_sub_1_q);
    u0_m0_wo0_mtree_mult1_18_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_18_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_18_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_18_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_18_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_18_replace_add_q <= u0_m0_wo0_mtree_mult1_18_replace_add_o(31 downto 0);


	--u0_m0_wo0_mtree_add0_9(ADD,127)@13
    u0_m0_wo0_mtree_add0_9_a <= STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_mult1_18_replace_add_q(31)) & u0_m0_wo0_mtree_mult1_18_replace_add_q);
    u0_m0_wo0_mtree_add0_9_b <= STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_mult1_19_replace_add_q(31)) & u0_m0_wo0_mtree_mult1_19_replace_add_q);
    u0_m0_wo0_mtree_add0_9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_9_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_9_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_9_a) + SIGNED(u0_m0_wo0_mtree_add0_9_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_9_q <= u0_m0_wo0_mtree_add0_9_o(32 downto 0);


	--u0_m0_wo0_wi0_delayr19(DELAY,26)@10
    u0_m0_wo0_wi0_delayr19 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr18_q, xout => u0_m0_wo0_wi0_delayr19_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_17_replace_split_low(BITSELECT,257)@10
    u0_m0_wo0_mtree_mult1_17_replace_split_low_in <= u0_m0_wo0_wi0_delayr19_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_17_replace_split_low_b <= u0_m0_wo0_mtree_mult1_17_replace_split_low_in(16 downto 0);

	--d_u0_m0_wo0_mtree_mult1_17_replace_split_low_b_11(DELAY,570)@10
    d_u0_m0_wo0_mtree_mult1_17_replace_split_low_b_11 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_17_replace_split_low_b, xout => d_u0_m0_wo0_mtree_mult1_17_replace_split_low_b_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_17_replace_multlo_shift2(BITSHIFT,446)@11
    u0_m0_wo0_mtree_mult1_17_replace_multlo_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_17_replace_split_low_b_11_q & "000000";
    u0_m0_wo0_mtree_mult1_17_replace_multlo_shift2_q <= u0_m0_wo0_mtree_mult1_17_replace_multlo_shift2_q_int(22 downto 0);

	--u0_m0_wo0_mtree_mult1_17_replace_multlo_shift0(BITSHIFT,444)@10
    u0_m0_wo0_mtree_mult1_17_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_17_replace_split_low_b & "000";
    u0_m0_wo0_mtree_mult1_17_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_17_replace_multlo_shift0_q_int(19 downto 0);

	--u0_m0_wo0_mtree_mult1_17_replace_multlo_sub_1(SUB,445)@10
    u0_m0_wo0_mtree_mult1_17_replace_multlo_sub_1_a <= STD_LOGIC_VECTOR("0000" & u0_m0_wo0_mtree_mult1_17_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_17_replace_multlo_sub_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_17_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_17_replace_multlo_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_17_replace_multlo_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_17_replace_multlo_sub_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_17_replace_multlo_sub_1_a) - UNSIGNED(u0_m0_wo0_mtree_mult1_17_replace_multlo_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_17_replace_multlo_sub_1_q <= u0_m0_wo0_mtree_mult1_17_replace_multlo_sub_1_o(20 downto 0);


	--u0_m0_wo0_mtree_mult1_17_replace_multlo_add_3(ADD,447)@11
    u0_m0_wo0_mtree_mult1_17_replace_multlo_add_3_a <= STD_LOGIC_VECTOR((24 downto 21 => u0_m0_wo0_mtree_mult1_17_replace_multlo_sub_1_q(20)) & u0_m0_wo0_mtree_mult1_17_replace_multlo_sub_1_q);
    u0_m0_wo0_mtree_mult1_17_replace_multlo_add_3_b <= STD_LOGIC_VECTOR('0' & "0" & u0_m0_wo0_mtree_mult1_17_replace_multlo_shift2_q);
    u0_m0_wo0_mtree_mult1_17_replace_multlo_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_17_replace_multlo_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_17_replace_multlo_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_17_replace_multlo_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_17_replace_multlo_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_17_replace_multlo_add_3_q <= u0_m0_wo0_mtree_mult1_17_replace_multlo_add_3_o(24 downto 0);


	--u0_m0_wo0_mtree_mult1_17_replace_multlo_shift4(BITSHIFT,448)@12
    u0_m0_wo0_mtree_mult1_17_replace_multlo_shift4_q_int <= u0_m0_wo0_mtree_mult1_17_replace_multlo_add_3_q & "0";
    u0_m0_wo0_mtree_mult1_17_replace_multlo_shift4_q <= u0_m0_wo0_mtree_mult1_17_replace_multlo_shift4_q_int(25 downto 0);

	--u0_m0_wo0_mtree_mult1_17_replace_split_high(BITSELECT,256)@10
    u0_m0_wo0_mtree_mult1_17_replace_split_high_in <= u0_m0_wo0_wi0_delayr19_q;
    u0_m0_wo0_mtree_mult1_17_replace_split_high_b <= u0_m0_wo0_mtree_mult1_17_replace_split_high_in(23 downto 17);

	--d_u0_m0_wo0_mtree_mult1_17_replace_split_high_b_11(DELAY,569)@10
    d_u0_m0_wo0_mtree_mult1_17_replace_split_high_b_11 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_17_replace_split_high_b, xout => d_u0_m0_wo0_mtree_mult1_17_replace_split_high_b_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_17_replace_multhi_shift2(BITSHIFT,441)@11
    u0_m0_wo0_mtree_mult1_17_replace_multhi_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_17_replace_split_high_b_11_q & "000000";
    u0_m0_wo0_mtree_mult1_17_replace_multhi_shift2_q <= u0_m0_wo0_mtree_mult1_17_replace_multhi_shift2_q_int(12 downto 0);

	--u0_m0_wo0_mtree_mult1_17_replace_multhi_shift0(BITSHIFT,439)@10
    u0_m0_wo0_mtree_mult1_17_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_17_replace_split_high_b & "000";
    u0_m0_wo0_mtree_mult1_17_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_17_replace_multhi_shift0_q_int(9 downto 0);

	--u0_m0_wo0_mtree_mult1_17_replace_multhi_sub_1(SUB,440)@10
    u0_m0_wo0_mtree_mult1_17_replace_multhi_sub_1_a <= STD_LOGIC_VECTOR((10 downto 7 => u0_m0_wo0_mtree_mult1_17_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_17_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_17_replace_multhi_sub_1_b <= STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_17_replace_multhi_shift0_q(9)) & u0_m0_wo0_mtree_mult1_17_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_17_replace_multhi_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_17_replace_multhi_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_17_replace_multhi_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_17_replace_multhi_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_17_replace_multhi_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_17_replace_multhi_sub_1_q <= u0_m0_wo0_mtree_mult1_17_replace_multhi_sub_1_o(10 downto 0);


	--u0_m0_wo0_mtree_mult1_17_replace_multhi_add_3(ADD,442)@11
    u0_m0_wo0_mtree_mult1_17_replace_multhi_add_3_a <= STD_LOGIC_VECTOR((13 downto 11 => u0_m0_wo0_mtree_mult1_17_replace_multhi_sub_1_q(10)) & u0_m0_wo0_mtree_mult1_17_replace_multhi_sub_1_q);
    u0_m0_wo0_mtree_mult1_17_replace_multhi_add_3_b <= STD_LOGIC_VECTOR((13 downto 13 => u0_m0_wo0_mtree_mult1_17_replace_multhi_shift2_q(12)) & u0_m0_wo0_mtree_mult1_17_replace_multhi_shift2_q);
    u0_m0_wo0_mtree_mult1_17_replace_multhi_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_17_replace_multhi_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_17_replace_multhi_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_17_replace_multhi_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_17_replace_multhi_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_17_replace_multhi_add_3_q <= u0_m0_wo0_mtree_mult1_17_replace_multhi_add_3_o(13 downto 0);


	--u0_m0_wo0_mtree_mult1_17_replace_multhi_shift4(BITSHIFT,443)@12
    u0_m0_wo0_mtree_mult1_17_replace_multhi_shift4_q_int <= u0_m0_wo0_mtree_mult1_17_replace_multhi_add_3_q & "0";
    u0_m0_wo0_mtree_mult1_17_replace_multhi_shift4_q <= u0_m0_wo0_mtree_mult1_17_replace_multhi_shift4_q_int(14 downto 0);

	--u0_m0_wo0_mtree_mult1_17_replace_shiftup(BITSHIFT,260)@12
    u0_m0_wo0_mtree_mult1_17_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_17_replace_multhi_shift4_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_17_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_17_replace_shiftup_q_int(31 downto 0);

	--u0_m0_wo0_mtree_mult1_17_replace_add(ADD,261)@12
    u0_m0_wo0_mtree_mult1_17_replace_add_a <= u0_m0_wo0_mtree_mult1_17_replace_shiftup_q;
    u0_m0_wo0_mtree_mult1_17_replace_add_b <= STD_LOGIC_VECTOR((31 downto 26 => u0_m0_wo0_mtree_mult1_17_replace_multlo_shift4_q(25)) & u0_m0_wo0_mtree_mult1_17_replace_multlo_shift4_q);
    u0_m0_wo0_mtree_mult1_17_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_17_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_17_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_17_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_17_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_17_replace_add_q <= u0_m0_wo0_mtree_mult1_17_replace_add_o(31 downto 0);


	--u0_m0_wo0_mtree_mult1_16_replace_multlo_shift0(BITSHIFT,452)@11
    u0_m0_wo0_mtree_mult1_16_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_16_replace_split_low_b & "00";
    u0_m0_wo0_mtree_mult1_16_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_16_replace_multlo_shift0_q_int(18 downto 0);

	--u0_m0_wo0_wi0_delayr20(DELAY,27)@10
    u0_m0_wo0_wi0_delayr20 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr19_q, xout => u0_m0_wo0_wi0_delayr20_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr20_q_11(DELAY,549)@10
    d_u0_m0_wo0_wi0_delayr20_q_11 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr20_q, xout => d_u0_m0_wo0_wi0_delayr20_q_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_16_replace_split_low(BITSELECT,263)@11
    u0_m0_wo0_mtree_mult1_16_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr20_q_11_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_16_replace_split_low_b <= u0_m0_wo0_mtree_mult1_16_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_16_replace_multlo_add_1(ADD,453)@11
    u0_m0_wo0_mtree_mult1_16_replace_multlo_add_1_a <= STD_LOGIC_VECTOR("000" & u0_m0_wo0_mtree_mult1_16_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_16_replace_multlo_add_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_16_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_16_replace_multlo_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_16_replace_multlo_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_16_replace_multlo_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_16_replace_multlo_add_1_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_16_replace_multlo_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_16_replace_multlo_add_1_q <= u0_m0_wo0_mtree_mult1_16_replace_multlo_add_1_o(19 downto 0);


	--u0_m0_wo0_mtree_mult1_16_replace_multlo_shift2(BITSHIFT,454)@12
    u0_m0_wo0_mtree_mult1_16_replace_multlo_shift2_q_int <= u0_m0_wo0_mtree_mult1_16_replace_multlo_add_1_q & "0000";
    u0_m0_wo0_mtree_mult1_16_replace_multlo_shift2_q <= u0_m0_wo0_mtree_mult1_16_replace_multlo_shift2_q_int(23 downto 0);

	--u0_m0_wo0_mtree_mult1_16_replace_multlo_final_convert(ROUND,455)@12
    u0_m0_wo0_mtree_mult1_16_replace_multlo_final_convert_in <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_16_replace_multlo_shift2_q);
    u0_m0_wo0_mtree_mult1_16_replace_multlo_final_convert_q <= u0_m0_wo0_mtree_mult1_16_replace_multlo_final_convert_in(24 downto 0);

	--u0_m0_wo0_mtree_mult1_16_replace_multhi_shift0(BITSHIFT,449)@11
    u0_m0_wo0_mtree_mult1_16_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_16_replace_split_high_b & "00";
    u0_m0_wo0_mtree_mult1_16_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_16_replace_multhi_shift0_q_int(8 downto 0);

	--u0_m0_wo0_mtree_mult1_16_replace_split_high(BITSELECT,262)@11
    u0_m0_wo0_mtree_mult1_16_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr20_q_11_q;
    u0_m0_wo0_mtree_mult1_16_replace_split_high_b <= u0_m0_wo0_mtree_mult1_16_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_16_replace_multhi_add_1(ADD,450)@11
    u0_m0_wo0_mtree_mult1_16_replace_multhi_add_1_a <= STD_LOGIC_VECTOR((9 downto 7 => u0_m0_wo0_mtree_mult1_16_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_16_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_16_replace_multhi_add_1_b <= STD_LOGIC_VECTOR((9 downto 9 => u0_m0_wo0_mtree_mult1_16_replace_multhi_shift0_q(8)) & u0_m0_wo0_mtree_mult1_16_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_16_replace_multhi_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_16_replace_multhi_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_16_replace_multhi_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_16_replace_multhi_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_16_replace_multhi_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_16_replace_multhi_add_1_q <= u0_m0_wo0_mtree_mult1_16_replace_multhi_add_1_o(9 downto 0);


	--u0_m0_wo0_mtree_mult1_16_replace_multhi_shift2(BITSHIFT,451)@12
    u0_m0_wo0_mtree_mult1_16_replace_multhi_shift2_q_int <= u0_m0_wo0_mtree_mult1_16_replace_multhi_add_1_q & "0000";
    u0_m0_wo0_mtree_mult1_16_replace_multhi_shift2_q <= u0_m0_wo0_mtree_mult1_16_replace_multhi_shift2_q_int(13 downto 0);

	--u0_m0_wo0_mtree_mult1_16_replace_shiftup(BITSHIFT,266)@12
    u0_m0_wo0_mtree_mult1_16_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_16_replace_multhi_shift2_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_16_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_16_replace_shiftup_q_int(30 downto 0);

	--u0_m0_wo0_mtree_mult1_16_replace_add(ADD,267)@12
    u0_m0_wo0_mtree_mult1_16_replace_add_a <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_mult1_16_replace_shiftup_q(30)) & u0_m0_wo0_mtree_mult1_16_replace_shiftup_q);
    u0_m0_wo0_mtree_mult1_16_replace_add_b <= STD_LOGIC_VECTOR((31 downto 25 => u0_m0_wo0_mtree_mult1_16_replace_multlo_final_convert_q(24)) & u0_m0_wo0_mtree_mult1_16_replace_multlo_final_convert_q);
    u0_m0_wo0_mtree_mult1_16_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_16_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_16_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_16_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_16_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_16_replace_add_q <= u0_m0_wo0_mtree_mult1_16_replace_add_o(31 downto 0);


	--u0_m0_wo0_mtree_add0_8(ADD,126)@13
    u0_m0_wo0_mtree_add0_8_a <= STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_mult1_16_replace_add_q(31)) & u0_m0_wo0_mtree_mult1_16_replace_add_q);
    u0_m0_wo0_mtree_add0_8_b <= STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_mult1_17_replace_add_q(31)) & u0_m0_wo0_mtree_mult1_17_replace_add_q);
    u0_m0_wo0_mtree_add0_8: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_8_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_8_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_8_a) + SIGNED(u0_m0_wo0_mtree_add0_8_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_8_q <= u0_m0_wo0_mtree_add0_8_o(32 downto 0);


	--u0_m0_wo0_mtree_add1_4(ADD,140)@14
    u0_m0_wo0_mtree_add1_4_a <= STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_add0_8_q(32)) & u0_m0_wo0_mtree_add0_8_q);
    u0_m0_wo0_mtree_add1_4_b <= STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_add0_9_q(32)) & u0_m0_wo0_mtree_add0_9_q);
    u0_m0_wo0_mtree_add1_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_4_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_4_a) + SIGNED(u0_m0_wo0_mtree_add1_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_4_q <= u0_m0_wo0_mtree_add1_4_o(33 downto 0);


	--u0_m0_wo0_mtree_add2_2(ADD,147)@15
    u0_m0_wo0_mtree_add2_2_a <= STD_LOGIC_VECTOR((34 downto 34 => u0_m0_wo0_mtree_add1_4_q(33)) & u0_m0_wo0_mtree_add1_4_q);
    u0_m0_wo0_mtree_add2_2_b <= STD_LOGIC_VECTOR((34 downto 34 => u0_m0_wo0_mtree_add1_5_q(33)) & u0_m0_wo0_mtree_add1_5_q);
    u0_m0_wo0_mtree_add2_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_2_a) + SIGNED(u0_m0_wo0_mtree_add2_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_2_q <= u0_m0_wo0_mtree_add2_2_o(34 downto 0);


	--u0_m0_wo0_mtree_add3_1(ADD,151)@16
    u0_m0_wo0_mtree_add3_1_a <= STD_LOGIC_VECTOR((35 downto 35 => u0_m0_wo0_mtree_add2_2_q(34)) & u0_m0_wo0_mtree_add2_2_q);
    u0_m0_wo0_mtree_add3_1_b <= STD_LOGIC_VECTOR((35 downto 33 => u0_m0_wo0_mtree_add2_3_q(32)) & u0_m0_wo0_mtree_add2_3_q);
    u0_m0_wo0_mtree_add3_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_1_a) + SIGNED(u0_m0_wo0_mtree_add3_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_1_q <= u0_m0_wo0_mtree_add3_1_o(35 downto 0);


	--u0_m0_wo0_wi0_delayr21(DELAY,28)@10
    u0_m0_wo0_wi0_delayr21 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr20_q, xout => u0_m0_wo0_wi0_delayr21_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr21_q_11(DELAY,550)@10
    d_u0_m0_wo0_wi0_delayr21_q_11 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr21_q, xout => d_u0_m0_wo0_wi0_delayr21_q_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_15_replace_split_low(BITSELECT,269)@11
    u0_m0_wo0_mtree_mult1_15_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr21_q_11_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_15_replace_split_low_b <= u0_m0_wo0_mtree_mult1_15_replace_split_low_in(16 downto 0);

	--d_u0_m0_wo0_mtree_mult1_15_replace_split_low_b_12(DELAY,572)@11
    d_u0_m0_wo0_mtree_mult1_15_replace_split_low_b_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_15_replace_split_low_b, xout => d_u0_m0_wo0_mtree_mult1_15_replace_split_low_b_12_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_15_replace_multlo_shift2(BITSHIFT,463)@12
    u0_m0_wo0_mtree_mult1_15_replace_multlo_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_15_replace_split_low_b_12_q & "0000";
    u0_m0_wo0_mtree_mult1_15_replace_multlo_shift2_q <= u0_m0_wo0_mtree_mult1_15_replace_multlo_shift2_q_int(20 downto 0);

	--u0_m0_wo0_mtree_mult1_15_replace_multlo_shift0(BITSHIFT,461)@11
    u0_m0_wo0_mtree_mult1_15_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_15_replace_split_low_b & "0";
    u0_m0_wo0_mtree_mult1_15_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_15_replace_multlo_shift0_q_int(17 downto 0);

	--u0_m0_wo0_mtree_mult1_15_replace_multlo_add_1(ADD,462)@11
    u0_m0_wo0_mtree_mult1_15_replace_multlo_add_1_a <= STD_LOGIC_VECTOR("00" & u0_m0_wo0_mtree_mult1_15_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_15_replace_multlo_add_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_15_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_15_replace_multlo_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_15_replace_multlo_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_15_replace_multlo_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_15_replace_multlo_add_1_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_15_replace_multlo_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_15_replace_multlo_add_1_q <= u0_m0_wo0_mtree_mult1_15_replace_multlo_add_1_o(18 downto 0);


	--u0_m0_wo0_mtree_mult1_15_replace_multlo_add_3(ADD,464)@12
    u0_m0_wo0_mtree_mult1_15_replace_multlo_add_3_a <= STD_LOGIC_VECTOR("000" & u0_m0_wo0_mtree_mult1_15_replace_multlo_add_1_q);
    u0_m0_wo0_mtree_mult1_15_replace_multlo_add_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_15_replace_multlo_shift2_q);
    u0_m0_wo0_mtree_mult1_15_replace_multlo_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_15_replace_multlo_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_15_replace_multlo_add_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_15_replace_multlo_add_3_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_15_replace_multlo_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_15_replace_multlo_add_3_q <= u0_m0_wo0_mtree_mult1_15_replace_multlo_add_3_o(21 downto 0);


	--u0_m0_wo0_mtree_mult1_15_replace_multlo_shift4(BITSHIFT,465)@13
    u0_m0_wo0_mtree_mult1_15_replace_multlo_shift4_q_int <= u0_m0_wo0_mtree_mult1_15_replace_multlo_add_3_q & "0";
    u0_m0_wo0_mtree_mult1_15_replace_multlo_shift4_q <= u0_m0_wo0_mtree_mult1_15_replace_multlo_shift4_q_int(22 downto 0);

	--u0_m0_wo0_mtree_mult1_15_replace_multlo_final_convert(ROUND,466)@13
    u0_m0_wo0_mtree_mult1_15_replace_multlo_final_convert_in <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_15_replace_multlo_shift4_q);
    u0_m0_wo0_mtree_mult1_15_replace_multlo_final_convert_q <= u0_m0_wo0_mtree_mult1_15_replace_multlo_final_convert_in(23 downto 0);

	--u0_m0_wo0_mtree_mult1_15_replace_split_high(BITSELECT,268)@11
    u0_m0_wo0_mtree_mult1_15_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr21_q_11_q;
    u0_m0_wo0_mtree_mult1_15_replace_split_high_b <= u0_m0_wo0_mtree_mult1_15_replace_split_high_in(23 downto 17);

	--d_u0_m0_wo0_mtree_mult1_15_replace_split_high_b_12(DELAY,571)@11
    d_u0_m0_wo0_mtree_mult1_15_replace_split_high_b_12 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_15_replace_split_high_b, xout => d_u0_m0_wo0_mtree_mult1_15_replace_split_high_b_12_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_15_replace_multhi_shift2(BITSHIFT,458)@12
    u0_m0_wo0_mtree_mult1_15_replace_multhi_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_15_replace_split_high_b_12_q & "0000";
    u0_m0_wo0_mtree_mult1_15_replace_multhi_shift2_q <= u0_m0_wo0_mtree_mult1_15_replace_multhi_shift2_q_int(10 downto 0);

	--u0_m0_wo0_mtree_mult1_15_replace_multhi_shift0(BITSHIFT,456)@11
    u0_m0_wo0_mtree_mult1_15_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_15_replace_split_high_b & "0";
    u0_m0_wo0_mtree_mult1_15_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_15_replace_multhi_shift0_q_int(7 downto 0);

	--u0_m0_wo0_mtree_mult1_15_replace_multhi_add_1(ADD,457)@11
    u0_m0_wo0_mtree_mult1_15_replace_multhi_add_1_a <= STD_LOGIC_VECTOR((8 downto 7 => u0_m0_wo0_mtree_mult1_15_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_15_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_15_replace_multhi_add_1_b <= STD_LOGIC_VECTOR((8 downto 8 => u0_m0_wo0_mtree_mult1_15_replace_multhi_shift0_q(7)) & u0_m0_wo0_mtree_mult1_15_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_15_replace_multhi_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_15_replace_multhi_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_15_replace_multhi_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_15_replace_multhi_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_15_replace_multhi_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_15_replace_multhi_add_1_q <= u0_m0_wo0_mtree_mult1_15_replace_multhi_add_1_o(8 downto 0);


	--u0_m0_wo0_mtree_mult1_15_replace_multhi_add_3(ADD,459)@12
    u0_m0_wo0_mtree_mult1_15_replace_multhi_add_3_a <= STD_LOGIC_VECTOR((11 downto 9 => u0_m0_wo0_mtree_mult1_15_replace_multhi_add_1_q(8)) & u0_m0_wo0_mtree_mult1_15_replace_multhi_add_1_q);
    u0_m0_wo0_mtree_mult1_15_replace_multhi_add_3_b <= STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_15_replace_multhi_shift2_q(10)) & u0_m0_wo0_mtree_mult1_15_replace_multhi_shift2_q);
    u0_m0_wo0_mtree_mult1_15_replace_multhi_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_15_replace_multhi_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_15_replace_multhi_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_15_replace_multhi_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_15_replace_multhi_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_15_replace_multhi_add_3_q <= u0_m0_wo0_mtree_mult1_15_replace_multhi_add_3_o(11 downto 0);


	--u0_m0_wo0_mtree_mult1_15_replace_multhi_shift4(BITSHIFT,460)@13
    u0_m0_wo0_mtree_mult1_15_replace_multhi_shift4_q_int <= u0_m0_wo0_mtree_mult1_15_replace_multhi_add_3_q & "0";
    u0_m0_wo0_mtree_mult1_15_replace_multhi_shift4_q <= u0_m0_wo0_mtree_mult1_15_replace_multhi_shift4_q_int(12 downto 0);

	--u0_m0_wo0_mtree_mult1_15_replace_shiftup(BITSHIFT,272)@13
    u0_m0_wo0_mtree_mult1_15_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_15_replace_multhi_shift4_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_15_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_15_replace_shiftup_q_int(29 downto 0);

	--u0_m0_wo0_mtree_mult1_15_replace_add(ADD,273)@13
    u0_m0_wo0_mtree_mult1_15_replace_add_a <= STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_mult1_15_replace_shiftup_q(29)) & u0_m0_wo0_mtree_mult1_15_replace_shiftup_q);
    u0_m0_wo0_mtree_mult1_15_replace_add_b <= STD_LOGIC_VECTOR((30 downto 24 => u0_m0_wo0_mtree_mult1_15_replace_multlo_final_convert_q(23)) & u0_m0_wo0_mtree_mult1_15_replace_multlo_final_convert_q);
    u0_m0_wo0_mtree_mult1_15_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_15_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_15_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_15_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_15_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_15_replace_add_q <= u0_m0_wo0_mtree_mult1_15_replace_add_o(30 downto 0);


	--u0_m0_wo0_wi0_delayr22(DELAY,29)@10
    u0_m0_wo0_wi0_delayr22 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr21_q, xout => u0_m0_wo0_wi0_delayr22_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_wi0_delayr23(DELAY,30)@10
    u0_m0_wo0_wi0_delayr23 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr22_q, xout => u0_m0_wo0_wi0_delayr23_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_13_replace_split_low(BITSELECT,275)@10
    u0_m0_wo0_mtree_mult1_13_replace_split_low_in <= u0_m0_wo0_wi0_delayr23_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_13_replace_split_low_b <= u0_m0_wo0_mtree_mult1_13_replace_split_low_in(16 downto 0);

	--d_u0_m0_wo0_mtree_mult1_13_replace_split_low_b_11(DELAY,574)@10
    d_u0_m0_wo0_mtree_mult1_13_replace_split_low_b_11 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_13_replace_split_low_b, xout => d_u0_m0_wo0_mtree_mult1_13_replace_split_low_b_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_13_replace_multlo_shift2(BITSHIFT,474)@11
    u0_m0_wo0_mtree_mult1_13_replace_multlo_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_13_replace_split_low_b_11_q & "0000";
    u0_m0_wo0_mtree_mult1_13_replace_multlo_shift2_q <= u0_m0_wo0_mtree_mult1_13_replace_multlo_shift2_q_int(20 downto 0);

	--u0_m0_wo0_mtree_mult1_13_replace_multlo_shift0(BITSHIFT,472)@10
    u0_m0_wo0_mtree_mult1_13_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_13_replace_split_low_b & "00";
    u0_m0_wo0_mtree_mult1_13_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_13_replace_multlo_shift0_q_int(18 downto 0);

	--u0_m0_wo0_mtree_mult1_13_replace_multlo_add_1(ADD,473)@10
    u0_m0_wo0_mtree_mult1_13_replace_multlo_add_1_a <= STD_LOGIC_VECTOR("000" & u0_m0_wo0_mtree_mult1_13_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_13_replace_multlo_add_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_13_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_13_replace_multlo_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_13_replace_multlo_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_13_replace_multlo_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_13_replace_multlo_add_1_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_13_replace_multlo_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_13_replace_multlo_add_1_q <= u0_m0_wo0_mtree_mult1_13_replace_multlo_add_1_o(19 downto 0);


	--u0_m0_wo0_mtree_mult1_13_replace_multlo_sub_3(SUB,475)@11
    u0_m0_wo0_mtree_mult1_13_replace_multlo_sub_3_a <= STD_LOGIC_VECTOR("00" & u0_m0_wo0_mtree_mult1_13_replace_multlo_add_1_q);
    u0_m0_wo0_mtree_mult1_13_replace_multlo_sub_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_13_replace_multlo_shift2_q);
    u0_m0_wo0_mtree_mult1_13_replace_multlo_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_13_replace_multlo_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_13_replace_multlo_sub_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_13_replace_multlo_sub_3_a) - UNSIGNED(u0_m0_wo0_mtree_mult1_13_replace_multlo_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_13_replace_multlo_sub_3_q <= u0_m0_wo0_mtree_mult1_13_replace_multlo_sub_3_o(21 downto 0);


	--u0_m0_wo0_mtree_mult1_13_replace_multlo_shift4(BITSHIFT,476)@12
    u0_m0_wo0_mtree_mult1_13_replace_multlo_shift4_q_int <= u0_m0_wo0_mtree_mult1_13_replace_multlo_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_13_replace_multlo_shift4_q <= u0_m0_wo0_mtree_mult1_13_replace_multlo_shift4_q_int(22 downto 0);

	--u0_m0_wo0_mtree_mult1_13_replace_split_high(BITSELECT,274)@10
    u0_m0_wo0_mtree_mult1_13_replace_split_high_in <= u0_m0_wo0_wi0_delayr23_q;
    u0_m0_wo0_mtree_mult1_13_replace_split_high_b <= u0_m0_wo0_mtree_mult1_13_replace_split_high_in(23 downto 17);

	--d_u0_m0_wo0_mtree_mult1_13_replace_split_high_b_11(DELAY,573)@10
    d_u0_m0_wo0_mtree_mult1_13_replace_split_high_b_11 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_13_replace_split_high_b, xout => d_u0_m0_wo0_mtree_mult1_13_replace_split_high_b_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_13_replace_multhi_shift2(BITSHIFT,469)@11
    u0_m0_wo0_mtree_mult1_13_replace_multhi_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_13_replace_split_high_b_11_q & "0000";
    u0_m0_wo0_mtree_mult1_13_replace_multhi_shift2_q <= u0_m0_wo0_mtree_mult1_13_replace_multhi_shift2_q_int(10 downto 0);

	--u0_m0_wo0_mtree_mult1_13_replace_multhi_shift0(BITSHIFT,467)@10
    u0_m0_wo0_mtree_mult1_13_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_13_replace_split_high_b & "00";
    u0_m0_wo0_mtree_mult1_13_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_13_replace_multhi_shift0_q_int(8 downto 0);

	--u0_m0_wo0_mtree_mult1_13_replace_multhi_add_1(ADD,468)@10
    u0_m0_wo0_mtree_mult1_13_replace_multhi_add_1_a <= STD_LOGIC_VECTOR((9 downto 7 => u0_m0_wo0_mtree_mult1_13_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_13_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_13_replace_multhi_add_1_b <= STD_LOGIC_VECTOR((9 downto 9 => u0_m0_wo0_mtree_mult1_13_replace_multhi_shift0_q(8)) & u0_m0_wo0_mtree_mult1_13_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_13_replace_multhi_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_13_replace_multhi_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_13_replace_multhi_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_13_replace_multhi_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_13_replace_multhi_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_13_replace_multhi_add_1_q <= u0_m0_wo0_mtree_mult1_13_replace_multhi_add_1_o(9 downto 0);


	--u0_m0_wo0_mtree_mult1_13_replace_multhi_sub_3(SUB,470)@11
    u0_m0_wo0_mtree_mult1_13_replace_multhi_sub_3_a <= STD_LOGIC_VECTOR((11 downto 10 => u0_m0_wo0_mtree_mult1_13_replace_multhi_add_1_q(9)) & u0_m0_wo0_mtree_mult1_13_replace_multhi_add_1_q);
    u0_m0_wo0_mtree_mult1_13_replace_multhi_sub_3_b <= STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_13_replace_multhi_shift2_q(10)) & u0_m0_wo0_mtree_mult1_13_replace_multhi_shift2_q);
    u0_m0_wo0_mtree_mult1_13_replace_multhi_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_13_replace_multhi_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_13_replace_multhi_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_13_replace_multhi_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_13_replace_multhi_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_13_replace_multhi_sub_3_q <= u0_m0_wo0_mtree_mult1_13_replace_multhi_sub_3_o(11 downto 0);


	--u0_m0_wo0_mtree_mult1_13_replace_multhi_shift4(BITSHIFT,471)@12
    u0_m0_wo0_mtree_mult1_13_replace_multhi_shift4_q_int <= u0_m0_wo0_mtree_mult1_13_replace_multhi_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_13_replace_multhi_shift4_q <= u0_m0_wo0_mtree_mult1_13_replace_multhi_shift4_q_int(12 downto 0);

	--u0_m0_wo0_mtree_mult1_13_replace_shiftup(BITSHIFT,278)@12
    u0_m0_wo0_mtree_mult1_13_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_13_replace_multhi_shift4_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_13_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_13_replace_shiftup_q_int(29 downto 0);

	--u0_m0_wo0_mtree_mult1_13_replace_add(ADD,279)@12
    u0_m0_wo0_mtree_mult1_13_replace_add_a <= u0_m0_wo0_mtree_mult1_13_replace_shiftup_q;
    u0_m0_wo0_mtree_mult1_13_replace_add_b <= STD_LOGIC_VECTOR((29 downto 23 => u0_m0_wo0_mtree_mult1_13_replace_multlo_shift4_q(22)) & u0_m0_wo0_mtree_mult1_13_replace_multlo_shift4_q);
    u0_m0_wo0_mtree_mult1_13_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_13_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_13_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_13_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_13_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_13_replace_add_q <= u0_m0_wo0_mtree_mult1_13_replace_add_o(29 downto 0);


	--u0_m0_wo0_wi0_delayr24(DELAY,31)@10
    u0_m0_wo0_wi0_delayr24 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr23_q, xout => u0_m0_wo0_wi0_delayr24_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_12_replace_split_low(BITSELECT,281)@10
    u0_m0_wo0_mtree_mult1_12_replace_split_low_in <= u0_m0_wo0_wi0_delayr24_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_12_replace_split_low_b <= u0_m0_wo0_mtree_mult1_12_replace_split_low_in(16 downto 0);

	--d_u0_m0_wo0_mtree_mult1_12_replace_split_low_b_11(DELAY,576)@10
    d_u0_m0_wo0_mtree_mult1_12_replace_split_low_b_11 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_12_replace_split_low_b, xout => d_u0_m0_wo0_mtree_mult1_12_replace_split_low_b_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_12_replace_multlo_shift2(BITSHIFT,484)@11
    u0_m0_wo0_mtree_mult1_12_replace_multlo_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_12_replace_split_low_b_11_q & "0000";
    u0_m0_wo0_mtree_mult1_12_replace_multlo_shift2_q <= u0_m0_wo0_mtree_mult1_12_replace_multlo_shift2_q_int(20 downto 0);

	--u0_m0_wo0_mtree_mult1_12_replace_multlo_shift0(BITSHIFT,482)@10
    u0_m0_wo0_mtree_mult1_12_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_12_replace_split_low_b & "00";
    u0_m0_wo0_mtree_mult1_12_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_12_replace_multlo_shift0_q_int(18 downto 0);

	--u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_1(SUB,483)@10
    u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_1_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_12_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_1_b <= STD_LOGIC_VECTOR("000" & u0_m0_wo0_mtree_mult1_12_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_1_a) - UNSIGNED(u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_1_q <= u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_1_o(19 downto 0);


	--u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_3(SUB,485)@11
    u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_3_a <= STD_LOGIC_VECTOR((22 downto 20 => u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_1_q(19)) & u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_1_q);
    u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_3_b <= STD_LOGIC_VECTOR('0' & "0" & u0_m0_wo0_mtree_mult1_12_replace_multlo_shift2_q);
    u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_3_q <= u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_3_o(22 downto 0);


	--u0_m0_wo0_mtree_mult1_12_replace_multlo_shift4(BITSHIFT,486)@12
    u0_m0_wo0_mtree_mult1_12_replace_multlo_shift4_q_int <= u0_m0_wo0_mtree_mult1_12_replace_multlo_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_12_replace_multlo_shift4_q <= u0_m0_wo0_mtree_mult1_12_replace_multlo_shift4_q_int(23 downto 0);

	--u0_m0_wo0_mtree_mult1_12_replace_split_high(BITSELECT,280)@10
    u0_m0_wo0_mtree_mult1_12_replace_split_high_in <= u0_m0_wo0_wi0_delayr24_q;
    u0_m0_wo0_mtree_mult1_12_replace_split_high_b <= u0_m0_wo0_mtree_mult1_12_replace_split_high_in(23 downto 17);

	--d_u0_m0_wo0_mtree_mult1_12_replace_split_high_b_11(DELAY,575)@10
    d_u0_m0_wo0_mtree_mult1_12_replace_split_high_b_11 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_12_replace_split_high_b, xout => d_u0_m0_wo0_mtree_mult1_12_replace_split_high_b_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_12_replace_multhi_shift2(BITSHIFT,479)@11
    u0_m0_wo0_mtree_mult1_12_replace_multhi_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_12_replace_split_high_b_11_q & "0000";
    u0_m0_wo0_mtree_mult1_12_replace_multhi_shift2_q <= u0_m0_wo0_mtree_mult1_12_replace_multhi_shift2_q_int(10 downto 0);

	--u0_m0_wo0_mtree_mult1_12_replace_multhi_shift0(BITSHIFT,477)@10
    u0_m0_wo0_mtree_mult1_12_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_12_replace_split_high_b & "00";
    u0_m0_wo0_mtree_mult1_12_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_12_replace_multhi_shift0_q_int(8 downto 0);

	--u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_1(SUB,478)@10
    u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_1_a <= STD_LOGIC_VECTOR((9 downto 9 => u0_m0_wo0_mtree_mult1_12_replace_multhi_shift0_q(8)) & u0_m0_wo0_mtree_mult1_12_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_1_b <= STD_LOGIC_VECTOR((9 downto 7 => u0_m0_wo0_mtree_mult1_12_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_12_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_1_q <= u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_1_o(9 downto 0);


	--u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_3(SUB,480)@11
    u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_3_a <= STD_LOGIC_VECTOR((11 downto 10 => u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_1_q(9)) & u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_1_q);
    u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_3_b <= STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_12_replace_multhi_shift2_q(10)) & u0_m0_wo0_mtree_mult1_12_replace_multhi_shift2_q);
    u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_3_q <= u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_3_o(11 downto 0);


	--u0_m0_wo0_mtree_mult1_12_replace_multhi_shift4(BITSHIFT,481)@12
    u0_m0_wo0_mtree_mult1_12_replace_multhi_shift4_q_int <= u0_m0_wo0_mtree_mult1_12_replace_multhi_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_12_replace_multhi_shift4_q <= u0_m0_wo0_mtree_mult1_12_replace_multhi_shift4_q_int(12 downto 0);

	--u0_m0_wo0_mtree_mult1_12_replace_shiftup(BITSHIFT,284)@12
    u0_m0_wo0_mtree_mult1_12_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_12_replace_multhi_shift4_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_12_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_12_replace_shiftup_q_int(29 downto 0);

	--u0_m0_wo0_mtree_mult1_12_replace_add(ADD,285)@12
    u0_m0_wo0_mtree_mult1_12_replace_add_a <= u0_m0_wo0_mtree_mult1_12_replace_shiftup_q;
    u0_m0_wo0_mtree_mult1_12_replace_add_b <= STD_LOGIC_VECTOR((29 downto 24 => u0_m0_wo0_mtree_mult1_12_replace_multlo_shift4_q(23)) & u0_m0_wo0_mtree_mult1_12_replace_multlo_shift4_q);
    u0_m0_wo0_mtree_mult1_12_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_12_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_12_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_12_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_12_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_12_replace_add_q <= u0_m0_wo0_mtree_mult1_12_replace_add_o(29 downto 0);


	--u0_m0_wo0_mtree_add0_6(ADD,124)@13
    u0_m0_wo0_mtree_add0_6_a <= STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_mult1_12_replace_add_q(29)) & u0_m0_wo0_mtree_mult1_12_replace_add_q);
    u0_m0_wo0_mtree_add0_6_b <= STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_mult1_13_replace_add_q(29)) & u0_m0_wo0_mtree_mult1_13_replace_add_q);
    u0_m0_wo0_mtree_add0_6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_6_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_6_a) + SIGNED(u0_m0_wo0_mtree_add0_6_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_6_q <= u0_m0_wo0_mtree_add0_6_o(30 downto 0);


	--u0_m0_wo0_mtree_add1_3(ADD,139)@14
    u0_m0_wo0_mtree_add1_3_a <= STD_LOGIC_VECTOR((32 downto 31 => u0_m0_wo0_mtree_add0_6_q(30)) & u0_m0_wo0_mtree_add0_6_q);
    u0_m0_wo0_mtree_add1_3_b <= STD_LOGIC_VECTOR((32 downto 31 => u0_m0_wo0_mtree_mult1_15_replace_add_q(30)) & u0_m0_wo0_mtree_mult1_15_replace_add_q);
    u0_m0_wo0_mtree_add1_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_3_a) + SIGNED(u0_m0_wo0_mtree_add1_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_3_q <= u0_m0_wo0_mtree_add1_3_o(32 downto 0);


	--u0_m0_wo0_wi0_delayr25(DELAY,32)@10
    u0_m0_wo0_wi0_delayr25 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr24_q, xout => u0_m0_wo0_wi0_delayr25_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr25_q_12(DELAY,551)@10
    d_u0_m0_wo0_wi0_delayr25_q_12 : dspba_delay
    GENERIC MAP ( width => 24, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr25_q, xout => d_u0_m0_wo0_wi0_delayr25_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_11_replace_split_low(BITSELECT,287)@12
    u0_m0_wo0_mtree_mult1_11_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr25_q_12_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_11_replace_split_low_b <= u0_m0_wo0_mtree_mult1_11_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_11_replace_multlo_shift0(BITSHIFT,489)@12
    u0_m0_wo0_mtree_mult1_11_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_11_replace_split_low_b & "0000";
    u0_m0_wo0_mtree_mult1_11_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_11_replace_multlo_shift0_q_int(20 downto 0);

	--u0_m0_wo0_mtree_mult1_11_replace_multlo_sub_1(SUB,490)@12
    u0_m0_wo0_mtree_mult1_11_replace_multlo_sub_1_a <= STD_LOGIC_VECTOR("000000000000000000000" & GND_q);
    u0_m0_wo0_mtree_mult1_11_replace_multlo_sub_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_11_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_11_replace_multlo_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_11_replace_multlo_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_11_replace_multlo_sub_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_11_replace_multlo_sub_1_a) - UNSIGNED(u0_m0_wo0_mtree_mult1_11_replace_multlo_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_11_replace_multlo_sub_1_q <= u0_m0_wo0_mtree_mult1_11_replace_multlo_sub_1_o(21 downto 0);


	--u0_m0_wo0_mtree_mult1_11_replace_split_high(BITSELECT,286)@12
    u0_m0_wo0_mtree_mult1_11_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr25_q_12_q;
    u0_m0_wo0_mtree_mult1_11_replace_split_high_b <= u0_m0_wo0_mtree_mult1_11_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_11_replace_multhi_shift0(BITSHIFT,487)@12
    u0_m0_wo0_mtree_mult1_11_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_11_replace_split_high_b & "0000";
    u0_m0_wo0_mtree_mult1_11_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_11_replace_multhi_shift0_q_int(10 downto 0);

	--u0_m0_wo0_mtree_mult1_11_replace_multhi_sub_1(SUB,488)@12
    u0_m0_wo0_mtree_mult1_11_replace_multhi_sub_1_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo0_mtree_mult1_11_replace_multhi_sub_1_b <= STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_11_replace_multhi_shift0_q(10)) & u0_m0_wo0_mtree_mult1_11_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_11_replace_multhi_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_11_replace_multhi_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_11_replace_multhi_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_11_replace_multhi_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_11_replace_multhi_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_11_replace_multhi_sub_1_q <= u0_m0_wo0_mtree_mult1_11_replace_multhi_sub_1_o(11 downto 0);


	--u0_m0_wo0_mtree_mult1_11_replace_shiftup(BITSHIFT,290)@13
    u0_m0_wo0_mtree_mult1_11_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_11_replace_multhi_sub_1_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_11_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_11_replace_shiftup_q_int(28 downto 0);

	--u0_m0_wo0_mtree_mult1_11_replace_add(ADD,291)@13
    u0_m0_wo0_mtree_mult1_11_replace_add_a <= u0_m0_wo0_mtree_mult1_11_replace_shiftup_q;
    u0_m0_wo0_mtree_mult1_11_replace_add_b <= STD_LOGIC_VECTOR((28 downto 22 => u0_m0_wo0_mtree_mult1_11_replace_multlo_sub_1_q(21)) & u0_m0_wo0_mtree_mult1_11_replace_multlo_sub_1_q);
    u0_m0_wo0_mtree_mult1_11_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_11_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_11_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_11_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_11_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_11_replace_add_q <= u0_m0_wo0_mtree_mult1_11_replace_add_o(28 downto 0);


	--u0_m0_wo0_mtree_mult1_9_replace_multlo_shift0(BITSHIFT,494)@11
    u0_m0_wo0_mtree_mult1_9_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_9_replace_split_low_b & "0";
    u0_m0_wo0_mtree_mult1_9_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_9_replace_multlo_shift0_q_int(17 downto 0);

	--u0_m0_wo0_wi0_delayr26(DELAY,33)@10
    u0_m0_wo0_wi0_delayr26 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr25_q, xout => u0_m0_wo0_wi0_delayr26_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_wi0_delayr27(DELAY,34)@10
    u0_m0_wo0_wi0_delayr27 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr26_q, xout => u0_m0_wo0_wi0_delayr27_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr27_q_11(DELAY,552)@10
    d_u0_m0_wo0_wi0_delayr27_q_11 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr27_q, xout => d_u0_m0_wo0_wi0_delayr27_q_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_9_replace_split_low(BITSELECT,293)@11
    u0_m0_wo0_mtree_mult1_9_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr27_q_11_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_9_replace_split_low_b <= u0_m0_wo0_mtree_mult1_9_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_9_replace_multlo_add_1(ADD,495)@11
    u0_m0_wo0_mtree_mult1_9_replace_multlo_add_1_a <= STD_LOGIC_VECTOR("00" & u0_m0_wo0_mtree_mult1_9_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_9_replace_multlo_add_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_9_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_9_replace_multlo_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_9_replace_multlo_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_9_replace_multlo_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_9_replace_multlo_add_1_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_9_replace_multlo_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_9_replace_multlo_add_1_q <= u0_m0_wo0_mtree_mult1_9_replace_multlo_add_1_o(18 downto 0);


	--u0_m0_wo0_mtree_mult1_9_replace_multlo_shift2(BITSHIFT,496)@12
    u0_m0_wo0_mtree_mult1_9_replace_multlo_shift2_q_int <= u0_m0_wo0_mtree_mult1_9_replace_multlo_add_1_q & "00";
    u0_m0_wo0_mtree_mult1_9_replace_multlo_shift2_q <= u0_m0_wo0_mtree_mult1_9_replace_multlo_shift2_q_int(20 downto 0);

	--u0_m0_wo0_mtree_mult1_9_replace_multlo_final_convert(ROUND,497)@12
    u0_m0_wo0_mtree_mult1_9_replace_multlo_final_convert_in <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_9_replace_multlo_shift2_q);
    u0_m0_wo0_mtree_mult1_9_replace_multlo_final_convert_q <= u0_m0_wo0_mtree_mult1_9_replace_multlo_final_convert_in(21 downto 0);

	--u0_m0_wo0_mtree_mult1_9_replace_multhi_shift0(BITSHIFT,491)@11
    u0_m0_wo0_mtree_mult1_9_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_9_replace_split_high_b & "0";
    u0_m0_wo0_mtree_mult1_9_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_9_replace_multhi_shift0_q_int(7 downto 0);

	--u0_m0_wo0_mtree_mult1_9_replace_split_high(BITSELECT,292)@11
    u0_m0_wo0_mtree_mult1_9_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr27_q_11_q;
    u0_m0_wo0_mtree_mult1_9_replace_split_high_b <= u0_m0_wo0_mtree_mult1_9_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_9_replace_multhi_add_1(ADD,492)@11
    u0_m0_wo0_mtree_mult1_9_replace_multhi_add_1_a <= STD_LOGIC_VECTOR((8 downto 7 => u0_m0_wo0_mtree_mult1_9_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_9_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_9_replace_multhi_add_1_b <= STD_LOGIC_VECTOR((8 downto 8 => u0_m0_wo0_mtree_mult1_9_replace_multhi_shift0_q(7)) & u0_m0_wo0_mtree_mult1_9_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_9_replace_multhi_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_9_replace_multhi_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_9_replace_multhi_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_9_replace_multhi_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_9_replace_multhi_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_9_replace_multhi_add_1_q <= u0_m0_wo0_mtree_mult1_9_replace_multhi_add_1_o(8 downto 0);


	--u0_m0_wo0_mtree_mult1_9_replace_multhi_shift2(BITSHIFT,493)@12
    u0_m0_wo0_mtree_mult1_9_replace_multhi_shift2_q_int <= u0_m0_wo0_mtree_mult1_9_replace_multhi_add_1_q & "00";
    u0_m0_wo0_mtree_mult1_9_replace_multhi_shift2_q <= u0_m0_wo0_mtree_mult1_9_replace_multhi_shift2_q_int(10 downto 0);

	--u0_m0_wo0_mtree_mult1_9_replace_shiftup(BITSHIFT,296)@12
    u0_m0_wo0_mtree_mult1_9_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_9_replace_multhi_shift2_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_9_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_9_replace_shiftup_q_int(27 downto 0);

	--u0_m0_wo0_mtree_mult1_9_replace_add(ADD,297)@12
    u0_m0_wo0_mtree_mult1_9_replace_add_a <= STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_mult1_9_replace_shiftup_q(27)) & u0_m0_wo0_mtree_mult1_9_replace_shiftup_q);
    u0_m0_wo0_mtree_mult1_9_replace_add_b <= STD_LOGIC_VECTOR((28 downto 22 => u0_m0_wo0_mtree_mult1_9_replace_multlo_final_convert_q(21)) & u0_m0_wo0_mtree_mult1_9_replace_multlo_final_convert_q);
    u0_m0_wo0_mtree_mult1_9_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_9_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_9_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_9_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_9_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_9_replace_add_q <= u0_m0_wo0_mtree_mult1_9_replace_add_o(28 downto 0);


	--u0_m0_wo0_wi0_delayr28(DELAY,35)@10
    u0_m0_wo0_wi0_delayr28 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr27_q, xout => u0_m0_wo0_wi0_delayr28_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr28_q_12(DELAY,553)@10
    d_u0_m0_wo0_wi0_delayr28_q_12 : dspba_delay
    GENERIC MAP ( width => 24, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr28_q, xout => d_u0_m0_wo0_wi0_delayr28_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_8_replace_split_low(BITSELECT,299)@12
    u0_m0_wo0_mtree_mult1_8_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr28_q_12_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_8_replace_split_low_b <= u0_m0_wo0_mtree_mult1_8_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_8_replace_multlo_shift0(BITSHIFT,499)@12
    u0_m0_wo0_mtree_mult1_8_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_8_replace_split_low_b & "0000";
    u0_m0_wo0_mtree_mult1_8_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_8_replace_multlo_shift0_q_int(20 downto 0);

	--u0_m0_wo0_mtree_mult1_8_replace_multlo_final_convert(ROUND,500)@12
    u0_m0_wo0_mtree_mult1_8_replace_multlo_final_convert_in <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_8_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_8_replace_multlo_final_convert_q <= u0_m0_wo0_mtree_mult1_8_replace_multlo_final_convert_in(21 downto 0);

	--u0_m0_wo0_mtree_mult1_8_replace_split_high(BITSELECT,298)@12
    u0_m0_wo0_mtree_mult1_8_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr28_q_12_q;
    u0_m0_wo0_mtree_mult1_8_replace_split_high_b <= u0_m0_wo0_mtree_mult1_8_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_8_replace_multhi_shift0(BITSHIFT,498)@12
    u0_m0_wo0_mtree_mult1_8_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_8_replace_split_high_b & "0000";
    u0_m0_wo0_mtree_mult1_8_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_8_replace_multhi_shift0_q_int(10 downto 0);

	--u0_m0_wo0_mtree_mult1_8_replace_shiftup(BITSHIFT,302)@12
    u0_m0_wo0_mtree_mult1_8_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_8_replace_multhi_shift0_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_8_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_8_replace_shiftup_q_int(27 downto 0);

	--u0_m0_wo0_mtree_mult1_8_replace_add(ADD,303)@12
    u0_m0_wo0_mtree_mult1_8_replace_add_a <= STD_LOGIC_VECTOR((29 downto 28 => u0_m0_wo0_mtree_mult1_8_replace_shiftup_q(27)) & u0_m0_wo0_mtree_mult1_8_replace_shiftup_q);
    u0_m0_wo0_mtree_mult1_8_replace_add_b <= STD_LOGIC_VECTOR((29 downto 22 => u0_m0_wo0_mtree_mult1_8_replace_multlo_final_convert_q(21)) & u0_m0_wo0_mtree_mult1_8_replace_multlo_final_convert_q);
    u0_m0_wo0_mtree_mult1_8_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_8_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_8_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_8_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_8_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_8_replace_add_q <= u0_m0_wo0_mtree_mult1_8_replace_add_o(29 downto 0);


	--u0_m0_wo0_mtree_add0_4(ADD,122)@13
    u0_m0_wo0_mtree_add0_4_a <= STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_mult1_8_replace_add_q(29)) & u0_m0_wo0_mtree_mult1_8_replace_add_q);
    u0_m0_wo0_mtree_add0_4_b <= STD_LOGIC_VECTOR((30 downto 29 => u0_m0_wo0_mtree_mult1_9_replace_add_q(28)) & u0_m0_wo0_mtree_mult1_9_replace_add_q);
    u0_m0_wo0_mtree_add0_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_4_a) + SIGNED(u0_m0_wo0_mtree_add0_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_4_q <= u0_m0_wo0_mtree_add0_4_o(30 downto 0);


	--u0_m0_wo0_mtree_add1_2(ADD,138)@14
    u0_m0_wo0_mtree_add1_2_a <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_add0_4_q(30)) & u0_m0_wo0_mtree_add0_4_q);
    u0_m0_wo0_mtree_add1_2_b <= STD_LOGIC_VECTOR((31 downto 29 => u0_m0_wo0_mtree_mult1_11_replace_add_q(28)) & u0_m0_wo0_mtree_mult1_11_replace_add_q);
    u0_m0_wo0_mtree_add1_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_2_a) + SIGNED(u0_m0_wo0_mtree_add1_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_2_q <= u0_m0_wo0_mtree_add1_2_o(31 downto 0);


	--u0_m0_wo0_mtree_add2_1(ADD,146)@15
    u0_m0_wo0_mtree_add2_1_a <= STD_LOGIC_VECTOR((33 downto 32 => u0_m0_wo0_mtree_add1_2_q(31)) & u0_m0_wo0_mtree_add1_2_q);
    u0_m0_wo0_mtree_add2_1_b <= STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_add1_3_q(32)) & u0_m0_wo0_mtree_add1_3_q);
    u0_m0_wo0_mtree_add2_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_1_a) + SIGNED(u0_m0_wo0_mtree_add2_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_1_q <= u0_m0_wo0_mtree_add2_1_o(33 downto 0);


	--u0_m0_wo0_mtree_mult1_7_replace_multlo_shift0(BITSHIFT,504)@12
    u0_m0_wo0_mtree_mult1_7_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_7_replace_split_low_b & "00";
    u0_m0_wo0_mtree_mult1_7_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_7_replace_multlo_shift0_q_int(18 downto 0);

	--u0_m0_wo0_wi0_delayr29(DELAY,36)@10
    u0_m0_wo0_wi0_delayr29 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr28_q, xout => u0_m0_wo0_wi0_delayr29_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr29_q_12(DELAY,554)@10
    d_u0_m0_wo0_wi0_delayr29_q_12 : dspba_delay
    GENERIC MAP ( width => 24, depth => 2 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr29_q, xout => d_u0_m0_wo0_wi0_delayr29_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_7_replace_split_low(BITSELECT,305)@12
    u0_m0_wo0_mtree_mult1_7_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr29_q_12_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_7_replace_split_low_b <= u0_m0_wo0_mtree_mult1_7_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_7_replace_multlo_add_1(ADD,505)@12
    u0_m0_wo0_mtree_mult1_7_replace_multlo_add_1_a <= STD_LOGIC_VECTOR("000" & u0_m0_wo0_mtree_mult1_7_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_7_replace_multlo_add_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_7_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_7_replace_multlo_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_7_replace_multlo_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_7_replace_multlo_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_7_replace_multlo_add_1_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_7_replace_multlo_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_7_replace_multlo_add_1_q <= u0_m0_wo0_mtree_mult1_7_replace_multlo_add_1_o(19 downto 0);


	--u0_m0_wo0_mtree_mult1_7_replace_multlo_shift2(BITSHIFT,506)@13
    u0_m0_wo0_mtree_mult1_7_replace_multlo_shift2_q_int <= u0_m0_wo0_mtree_mult1_7_replace_multlo_add_1_q & "0";
    u0_m0_wo0_mtree_mult1_7_replace_multlo_shift2_q <= u0_m0_wo0_mtree_mult1_7_replace_multlo_shift2_q_int(20 downto 0);

	--u0_m0_wo0_mtree_mult1_7_replace_multlo_final_convert(ROUND,507)@13
    u0_m0_wo0_mtree_mult1_7_replace_multlo_final_convert_in <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_7_replace_multlo_shift2_q);
    u0_m0_wo0_mtree_mult1_7_replace_multlo_final_convert_q <= u0_m0_wo0_mtree_mult1_7_replace_multlo_final_convert_in(21 downto 0);

	--u0_m0_wo0_mtree_mult1_7_replace_multhi_shift0(BITSHIFT,501)@12
    u0_m0_wo0_mtree_mult1_7_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_7_replace_split_high_b & "00";
    u0_m0_wo0_mtree_mult1_7_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_7_replace_multhi_shift0_q_int(8 downto 0);

	--u0_m0_wo0_mtree_mult1_7_replace_split_high(BITSELECT,304)@12
    u0_m0_wo0_mtree_mult1_7_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr29_q_12_q;
    u0_m0_wo0_mtree_mult1_7_replace_split_high_b <= u0_m0_wo0_mtree_mult1_7_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_7_replace_multhi_add_1(ADD,502)@12
    u0_m0_wo0_mtree_mult1_7_replace_multhi_add_1_a <= STD_LOGIC_VECTOR((9 downto 7 => u0_m0_wo0_mtree_mult1_7_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_7_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_7_replace_multhi_add_1_b <= STD_LOGIC_VECTOR((9 downto 9 => u0_m0_wo0_mtree_mult1_7_replace_multhi_shift0_q(8)) & u0_m0_wo0_mtree_mult1_7_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_7_replace_multhi_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_7_replace_multhi_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_7_replace_multhi_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_7_replace_multhi_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_7_replace_multhi_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_7_replace_multhi_add_1_q <= u0_m0_wo0_mtree_mult1_7_replace_multhi_add_1_o(9 downto 0);


	--u0_m0_wo0_mtree_mult1_7_replace_multhi_shift2(BITSHIFT,503)@13
    u0_m0_wo0_mtree_mult1_7_replace_multhi_shift2_q_int <= u0_m0_wo0_mtree_mult1_7_replace_multhi_add_1_q & "0";
    u0_m0_wo0_mtree_mult1_7_replace_multhi_shift2_q <= u0_m0_wo0_mtree_mult1_7_replace_multhi_shift2_q_int(10 downto 0);

	--u0_m0_wo0_mtree_mult1_7_replace_shiftup(BITSHIFT,308)@13
    u0_m0_wo0_mtree_mult1_7_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_7_replace_multhi_shift2_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_7_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_7_replace_shiftup_q_int(27 downto 0);

	--u0_m0_wo0_mtree_mult1_7_replace_add(ADD,309)@13
    u0_m0_wo0_mtree_mult1_7_replace_add_a <= STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_mult1_7_replace_shiftup_q(27)) & u0_m0_wo0_mtree_mult1_7_replace_shiftup_q);
    u0_m0_wo0_mtree_mult1_7_replace_add_b <= STD_LOGIC_VECTOR((28 downto 22 => u0_m0_wo0_mtree_mult1_7_replace_multlo_final_convert_q(21)) & u0_m0_wo0_mtree_mult1_7_replace_multlo_final_convert_q);
    u0_m0_wo0_mtree_mult1_7_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_7_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_7_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_7_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_7_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_7_replace_add_q <= u0_m0_wo0_mtree_mult1_7_replace_add_o(28 downto 0);


	--u0_m0_wo0_wi0_delayr30(DELAY,37)@10
    u0_m0_wo0_wi0_delayr30 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr29_q, xout => u0_m0_wo0_wi0_delayr30_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_wi0_delayr31(DELAY,38)@10
    u0_m0_wo0_wi0_delayr31 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr30_q, xout => u0_m0_wo0_wi0_delayr31_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr31_q_11(DELAY,555)@10
    d_u0_m0_wo0_wi0_delayr31_q_11 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr31_q, xout => d_u0_m0_wo0_wi0_delayr31_q_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_5_replace_split_low(BITSELECT,311)@11
    u0_m0_wo0_mtree_mult1_5_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr31_q_11_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_5_replace_split_low_b <= u0_m0_wo0_mtree_mult1_5_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_5_replace_multlo_shift0(BITSHIFT,510)@11
    u0_m0_wo0_mtree_mult1_5_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_5_replace_split_low_b & "000";
    u0_m0_wo0_mtree_mult1_5_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_5_replace_multlo_shift0_q_int(19 downto 0);

	--u0_m0_wo0_mtree_mult1_5_replace_multlo_sub_1(SUB,511)@11
    u0_m0_wo0_mtree_mult1_5_replace_multlo_sub_1_a <= STD_LOGIC_VECTOR("00000000000000000000" & GND_q);
    u0_m0_wo0_mtree_mult1_5_replace_multlo_sub_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_5_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_5_replace_multlo_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_5_replace_multlo_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_5_replace_multlo_sub_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_5_replace_multlo_sub_1_a) - UNSIGNED(u0_m0_wo0_mtree_mult1_5_replace_multlo_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_5_replace_multlo_sub_1_q <= u0_m0_wo0_mtree_mult1_5_replace_multlo_sub_1_o(20 downto 0);


	--u0_m0_wo0_mtree_mult1_5_replace_split_high(BITSELECT,310)@11
    u0_m0_wo0_mtree_mult1_5_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr31_q_11_q;
    u0_m0_wo0_mtree_mult1_5_replace_split_high_b <= u0_m0_wo0_mtree_mult1_5_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_5_replace_multhi_shift0(BITSHIFT,508)@11
    u0_m0_wo0_mtree_mult1_5_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_5_replace_split_high_b & "000";
    u0_m0_wo0_mtree_mult1_5_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_5_replace_multhi_shift0_q_int(9 downto 0);

	--u0_m0_wo0_mtree_mult1_5_replace_multhi_sub_1(SUB,509)@11
    u0_m0_wo0_mtree_mult1_5_replace_multhi_sub_1_a <= STD_LOGIC_VECTOR((10 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo0_mtree_mult1_5_replace_multhi_sub_1_b <= STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_5_replace_multhi_shift0_q(9)) & u0_m0_wo0_mtree_mult1_5_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_5_replace_multhi_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_5_replace_multhi_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_5_replace_multhi_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_5_replace_multhi_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_5_replace_multhi_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_5_replace_multhi_sub_1_q <= u0_m0_wo0_mtree_mult1_5_replace_multhi_sub_1_o(10 downto 0);


	--u0_m0_wo0_mtree_mult1_5_replace_shiftup(BITSHIFT,314)@12
    u0_m0_wo0_mtree_mult1_5_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_5_replace_multhi_sub_1_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_5_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_5_replace_shiftup_q_int(27 downto 0);

	--u0_m0_wo0_mtree_mult1_5_replace_add(ADD,315)@12
    u0_m0_wo0_mtree_mult1_5_replace_add_a <= u0_m0_wo0_mtree_mult1_5_replace_shiftup_q;
    u0_m0_wo0_mtree_mult1_5_replace_add_b <= STD_LOGIC_VECTOR((27 downto 21 => u0_m0_wo0_mtree_mult1_5_replace_multlo_sub_1_q(20)) & u0_m0_wo0_mtree_mult1_5_replace_multlo_sub_1_q);
    u0_m0_wo0_mtree_mult1_5_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_5_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_5_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_5_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_5_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_5_replace_add_q <= u0_m0_wo0_mtree_mult1_5_replace_add_o(27 downto 0);


	--u0_m0_wo0_wi0_delayr32(DELAY,39)@10
    u0_m0_wo0_wi0_delayr32 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr31_q, xout => u0_m0_wo0_wi0_delayr32_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_4_replace_split_low(BITSELECT,317)@10
    u0_m0_wo0_mtree_mult1_4_replace_split_low_in <= u0_m0_wo0_wi0_delayr32_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_4_replace_split_low_b <= u0_m0_wo0_mtree_mult1_4_replace_split_low_in(16 downto 0);

	--d_u0_m0_wo0_mtree_mult1_4_replace_split_low_b_11(DELAY,578)@10
    d_u0_m0_wo0_mtree_mult1_4_replace_split_low_b_11 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_4_replace_split_low_b, xout => d_u0_m0_wo0_mtree_mult1_4_replace_split_low_b_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_4_replace_multlo_shift2(BITSHIFT,518)@11
    u0_m0_wo0_mtree_mult1_4_replace_multlo_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_4_replace_split_low_b_11_q & "0000";
    u0_m0_wo0_mtree_mult1_4_replace_multlo_shift2_q <= u0_m0_wo0_mtree_mult1_4_replace_multlo_shift2_q_int(20 downto 0);

	--u0_m0_wo0_mtree_mult1_4_replace_multlo_shift0(BITSHIFT,516)@10
    u0_m0_wo0_mtree_mult1_4_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_4_replace_split_low_b & "00";
    u0_m0_wo0_mtree_mult1_4_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_4_replace_multlo_shift0_q_int(18 downto 0);

	--u0_m0_wo0_mtree_mult1_4_replace_multlo_add_1(ADD,517)@10
    u0_m0_wo0_mtree_mult1_4_replace_multlo_add_1_a <= STD_LOGIC_VECTOR("000" & u0_m0_wo0_mtree_mult1_4_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_4_replace_multlo_add_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_4_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_4_replace_multlo_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_replace_multlo_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_replace_multlo_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_4_replace_multlo_add_1_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_4_replace_multlo_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_replace_multlo_add_1_q <= u0_m0_wo0_mtree_mult1_4_replace_multlo_add_1_o(19 downto 0);


	--u0_m0_wo0_mtree_mult1_4_replace_multlo_sub_3(SUB,519)@11
    u0_m0_wo0_mtree_mult1_4_replace_multlo_sub_3_a <= STD_LOGIC_VECTOR("00" & u0_m0_wo0_mtree_mult1_4_replace_multlo_add_1_q);
    u0_m0_wo0_mtree_mult1_4_replace_multlo_sub_3_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_4_replace_multlo_shift2_q);
    u0_m0_wo0_mtree_mult1_4_replace_multlo_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_replace_multlo_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_replace_multlo_sub_3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_4_replace_multlo_sub_3_a) - UNSIGNED(u0_m0_wo0_mtree_mult1_4_replace_multlo_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_replace_multlo_sub_3_q <= u0_m0_wo0_mtree_mult1_4_replace_multlo_sub_3_o(21 downto 0);


	--u0_m0_wo0_mtree_mult1_4_replace_split_high(BITSELECT,316)@10
    u0_m0_wo0_mtree_mult1_4_replace_split_high_in <= u0_m0_wo0_wi0_delayr32_q;
    u0_m0_wo0_mtree_mult1_4_replace_split_high_b <= u0_m0_wo0_mtree_mult1_4_replace_split_high_in(23 downto 17);

	--d_u0_m0_wo0_mtree_mult1_4_replace_split_high_b_11(DELAY,577)@10
    d_u0_m0_wo0_mtree_mult1_4_replace_split_high_b_11 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_4_replace_split_high_b, xout => d_u0_m0_wo0_mtree_mult1_4_replace_split_high_b_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_4_replace_multhi_shift2(BITSHIFT,514)@11
    u0_m0_wo0_mtree_mult1_4_replace_multhi_shift2_q_int <= d_u0_m0_wo0_mtree_mult1_4_replace_split_high_b_11_q & "0000";
    u0_m0_wo0_mtree_mult1_4_replace_multhi_shift2_q <= u0_m0_wo0_mtree_mult1_4_replace_multhi_shift2_q_int(10 downto 0);

	--u0_m0_wo0_mtree_mult1_4_replace_multhi_shift0(BITSHIFT,512)@10
    u0_m0_wo0_mtree_mult1_4_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_4_replace_split_high_b & "00";
    u0_m0_wo0_mtree_mult1_4_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_4_replace_multhi_shift0_q_int(8 downto 0);

	--u0_m0_wo0_mtree_mult1_4_replace_multhi_add_1(ADD,513)@10
    u0_m0_wo0_mtree_mult1_4_replace_multhi_add_1_a <= STD_LOGIC_VECTOR((9 downto 7 => u0_m0_wo0_mtree_mult1_4_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_4_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_4_replace_multhi_add_1_b <= STD_LOGIC_VECTOR((9 downto 9 => u0_m0_wo0_mtree_mult1_4_replace_multhi_shift0_q(8)) & u0_m0_wo0_mtree_mult1_4_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_4_replace_multhi_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_replace_multhi_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_replace_multhi_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_replace_multhi_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_4_replace_multhi_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_replace_multhi_add_1_q <= u0_m0_wo0_mtree_mult1_4_replace_multhi_add_1_o(9 downto 0);


	--u0_m0_wo0_mtree_mult1_4_replace_multhi_sub_3(SUB,515)@11
    u0_m0_wo0_mtree_mult1_4_replace_multhi_sub_3_a <= STD_LOGIC_VECTOR((11 downto 10 => u0_m0_wo0_mtree_mult1_4_replace_multhi_add_1_q(9)) & u0_m0_wo0_mtree_mult1_4_replace_multhi_add_1_q);
    u0_m0_wo0_mtree_mult1_4_replace_multhi_sub_3_b <= STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_4_replace_multhi_shift2_q(10)) & u0_m0_wo0_mtree_mult1_4_replace_multhi_shift2_q);
    u0_m0_wo0_mtree_mult1_4_replace_multhi_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_replace_multhi_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_replace_multhi_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_replace_multhi_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_4_replace_multhi_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_replace_multhi_sub_3_q <= u0_m0_wo0_mtree_mult1_4_replace_multhi_sub_3_o(11 downto 0);


	--u0_m0_wo0_mtree_mult1_4_replace_shiftup(BITSHIFT,320)@12
    u0_m0_wo0_mtree_mult1_4_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_4_replace_multhi_sub_3_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_4_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_4_replace_shiftup_q_int(28 downto 0);

	--u0_m0_wo0_mtree_mult1_4_replace_add(ADD,321)@12
    u0_m0_wo0_mtree_mult1_4_replace_add_a <= u0_m0_wo0_mtree_mult1_4_replace_shiftup_q;
    u0_m0_wo0_mtree_mult1_4_replace_add_b <= STD_LOGIC_VECTOR((28 downto 22 => u0_m0_wo0_mtree_mult1_4_replace_multlo_sub_3_q(21)) & u0_m0_wo0_mtree_mult1_4_replace_multlo_sub_3_q);
    u0_m0_wo0_mtree_mult1_4_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_4_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_replace_add_q <= u0_m0_wo0_mtree_mult1_4_replace_add_o(28 downto 0);


	--u0_m0_wo0_mtree_add0_2(ADD,120)@13
    u0_m0_wo0_mtree_add0_2_a <= STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_mult1_4_replace_add_q(28)) & u0_m0_wo0_mtree_mult1_4_replace_add_q);
    u0_m0_wo0_mtree_add0_2_b <= STD_LOGIC_VECTOR((29 downto 28 => u0_m0_wo0_mtree_mult1_5_replace_add_q(27)) & u0_m0_wo0_mtree_mult1_5_replace_add_q);
    u0_m0_wo0_mtree_add0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_2_a) + SIGNED(u0_m0_wo0_mtree_add0_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_2_q <= u0_m0_wo0_mtree_add0_2_o(29 downto 0);


	--u0_m0_wo0_mtree_add1_1(ADD,137)@14
    u0_m0_wo0_mtree_add1_1_a <= STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_add0_2_q(29)) & u0_m0_wo0_mtree_add0_2_q);
    u0_m0_wo0_mtree_add1_1_b <= STD_LOGIC_VECTOR((30 downto 29 => u0_m0_wo0_mtree_mult1_7_replace_add_q(28)) & u0_m0_wo0_mtree_mult1_7_replace_add_q);
    u0_m0_wo0_mtree_add1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_1_a) + SIGNED(u0_m0_wo0_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_1_q <= u0_m0_wo0_mtree_add1_1_o(30 downto 0);


	--u0_m0_wo0_mtree_mult1_3_replace_multlo_shift0(BITSHIFT,522)@12
    u0_m0_wo0_mtree_mult1_3_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_3_replace_split_low_b & "000";
    u0_m0_wo0_mtree_mult1_3_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_3_replace_multlo_shift0_q_int(19 downto 0);

	--d_u0_m0_wo0_memread_q_11(DELAY,534)@10
    d_u0_m0_wo0_memread_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_memread_q_11_q, clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr32_q_11(DELAY,556)@10
    d_u0_m0_wo0_wi0_delayr32_q_11 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr32_q, xout => d_u0_m0_wo0_wi0_delayr32_q_11_q, clk => clk, aclr => areset );

	--u0_m0_wo0_wi0_delayr33(DELAY,40)@11
    u0_m0_wo0_wi0_delayr33 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_delayr32_q_11_q, xout => u0_m0_wo0_wi0_delayr33_q, ena => d_u0_m0_wo0_memread_q_11_q(0), clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr33_q_12(DELAY,557)@11
    d_u0_m0_wo0_wi0_delayr33_q_12 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr33_q, xout => d_u0_m0_wo0_wi0_delayr33_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_3_replace_split_low(BITSELECT,323)@12
    u0_m0_wo0_mtree_mult1_3_replace_split_low_in <= d_u0_m0_wo0_wi0_delayr33_q_12_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_3_replace_split_low_b <= u0_m0_wo0_mtree_mult1_3_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_3_replace_multlo_sub_1(SUB,523)@12
    u0_m0_wo0_mtree_mult1_3_replace_multlo_sub_1_a <= STD_LOGIC_VECTOR("0000" & u0_m0_wo0_mtree_mult1_3_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_3_replace_multlo_sub_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_3_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_3_replace_multlo_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_replace_multlo_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_replace_multlo_sub_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_3_replace_multlo_sub_1_a) - UNSIGNED(u0_m0_wo0_mtree_mult1_3_replace_multlo_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_replace_multlo_sub_1_q <= u0_m0_wo0_mtree_mult1_3_replace_multlo_sub_1_o(20 downto 0);


	--u0_m0_wo0_mtree_mult1_3_replace_multhi_shift0(BITSHIFT,520)@12
    u0_m0_wo0_mtree_mult1_3_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_3_replace_split_high_b & "000";
    u0_m0_wo0_mtree_mult1_3_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_3_replace_multhi_shift0_q_int(9 downto 0);

	--u0_m0_wo0_mtree_mult1_3_replace_split_high(BITSELECT,322)@12
    u0_m0_wo0_mtree_mult1_3_replace_split_high_in <= d_u0_m0_wo0_wi0_delayr33_q_12_q;
    u0_m0_wo0_mtree_mult1_3_replace_split_high_b <= u0_m0_wo0_mtree_mult1_3_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_3_replace_multhi_sub_1(SUB,521)@12
    u0_m0_wo0_mtree_mult1_3_replace_multhi_sub_1_a <= STD_LOGIC_VECTOR((10 downto 7 => u0_m0_wo0_mtree_mult1_3_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_3_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_3_replace_multhi_sub_1_b <= STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_3_replace_multhi_shift0_q(9)) & u0_m0_wo0_mtree_mult1_3_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_3_replace_multhi_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_replace_multhi_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_replace_multhi_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_replace_multhi_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_3_replace_multhi_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_replace_multhi_sub_1_q <= u0_m0_wo0_mtree_mult1_3_replace_multhi_sub_1_o(10 downto 0);


	--u0_m0_wo0_mtree_mult1_3_replace_shiftup(BITSHIFT,326)@13
    u0_m0_wo0_mtree_mult1_3_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_3_replace_multhi_sub_1_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_3_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_3_replace_shiftup_q_int(27 downto 0);

	--u0_m0_wo0_mtree_mult1_3_replace_add(ADD,327)@13
    u0_m0_wo0_mtree_mult1_3_replace_add_a <= u0_m0_wo0_mtree_mult1_3_replace_shiftup_q;
    u0_m0_wo0_mtree_mult1_3_replace_add_b <= STD_LOGIC_VECTOR((27 downto 21 => u0_m0_wo0_mtree_mult1_3_replace_multlo_sub_1_q(20)) & u0_m0_wo0_mtree_mult1_3_replace_multlo_sub_1_q);
    u0_m0_wo0_mtree_mult1_3_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_3_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_replace_add_q <= u0_m0_wo0_mtree_mult1_3_replace_add_o(27 downto 0);


	--u0_m0_wo0_mtree_mult1_1_replace_multlo_shift0(BITSHIFT,527)@11
    u0_m0_wo0_mtree_mult1_1_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_1_replace_split_low_b & "0";
    u0_m0_wo0_mtree_mult1_1_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_1_replace_multlo_shift0_q_int(17 downto 0);

	--u0_m0_wo0_wi0_delayr34(DELAY,41)@11
    u0_m0_wo0_wi0_delayr34 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr33_q, xout => u0_m0_wo0_wi0_delayr34_q, ena => d_u0_m0_wo0_memread_q_11_q(0), clk => clk, aclr => areset );

	--u0_m0_wo0_wi0_delayr35(DELAY,42)@11
    u0_m0_wo0_wi0_delayr35 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr34_q, xout => u0_m0_wo0_wi0_delayr35_q, ena => d_u0_m0_wo0_memread_q_11_q(0), clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_1_replace_split_low(BITSELECT,329)@11
    u0_m0_wo0_mtree_mult1_1_replace_split_low_in <= u0_m0_wo0_wi0_delayr35_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_1_replace_split_low_b <= u0_m0_wo0_mtree_mult1_1_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_1_replace_multlo_add_1(ADD,528)@11
    u0_m0_wo0_mtree_mult1_1_replace_multlo_add_1_a <= STD_LOGIC_VECTOR("00" & u0_m0_wo0_mtree_mult1_1_replace_split_low_b);
    u0_m0_wo0_mtree_mult1_1_replace_multlo_add_1_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_1_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_1_replace_multlo_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_replace_multlo_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_replace_multlo_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_1_replace_multlo_add_1_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_1_replace_multlo_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_replace_multlo_add_1_q <= u0_m0_wo0_mtree_mult1_1_replace_multlo_add_1_o(18 downto 0);


	--u0_m0_wo0_mtree_mult1_1_replace_multlo_shift2(BITSHIFT,529)@12
    u0_m0_wo0_mtree_mult1_1_replace_multlo_shift2_q_int <= u0_m0_wo0_mtree_mult1_1_replace_multlo_add_1_q & "0";
    u0_m0_wo0_mtree_mult1_1_replace_multlo_shift2_q <= u0_m0_wo0_mtree_mult1_1_replace_multlo_shift2_q_int(19 downto 0);

	--u0_m0_wo0_mtree_mult1_1_replace_multlo_final_convert(ROUND,530)@12
    u0_m0_wo0_mtree_mult1_1_replace_multlo_final_convert_in <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_1_replace_multlo_shift2_q);
    u0_m0_wo0_mtree_mult1_1_replace_multlo_final_convert_q <= u0_m0_wo0_mtree_mult1_1_replace_multlo_final_convert_in(20 downto 0);

	--u0_m0_wo0_mtree_mult1_1_replace_multhi_shift0(BITSHIFT,524)@11
    u0_m0_wo0_mtree_mult1_1_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_1_replace_split_high_b & "0";
    u0_m0_wo0_mtree_mult1_1_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_1_replace_multhi_shift0_q_int(7 downto 0);

	--u0_m0_wo0_mtree_mult1_1_replace_split_high(BITSELECT,328)@11
    u0_m0_wo0_mtree_mult1_1_replace_split_high_in <= u0_m0_wo0_wi0_delayr35_q;
    u0_m0_wo0_mtree_mult1_1_replace_split_high_b <= u0_m0_wo0_mtree_mult1_1_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_1_replace_multhi_add_1(ADD,525)@11
    u0_m0_wo0_mtree_mult1_1_replace_multhi_add_1_a <= STD_LOGIC_VECTOR((8 downto 7 => u0_m0_wo0_mtree_mult1_1_replace_split_high_b(6)) & u0_m0_wo0_mtree_mult1_1_replace_split_high_b);
    u0_m0_wo0_mtree_mult1_1_replace_multhi_add_1_b <= STD_LOGIC_VECTOR((8 downto 8 => u0_m0_wo0_mtree_mult1_1_replace_multhi_shift0_q(7)) & u0_m0_wo0_mtree_mult1_1_replace_multhi_shift0_q);
    u0_m0_wo0_mtree_mult1_1_replace_multhi_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_replace_multhi_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_replace_multhi_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_replace_multhi_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_1_replace_multhi_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_replace_multhi_add_1_q <= u0_m0_wo0_mtree_mult1_1_replace_multhi_add_1_o(8 downto 0);


	--u0_m0_wo0_mtree_mult1_1_replace_multhi_shift2(BITSHIFT,526)@12
    u0_m0_wo0_mtree_mult1_1_replace_multhi_shift2_q_int <= u0_m0_wo0_mtree_mult1_1_replace_multhi_add_1_q & "0";
    u0_m0_wo0_mtree_mult1_1_replace_multhi_shift2_q <= u0_m0_wo0_mtree_mult1_1_replace_multhi_shift2_q_int(9 downto 0);

	--u0_m0_wo0_mtree_mult1_1_replace_shiftup(BITSHIFT,332)@12
    u0_m0_wo0_mtree_mult1_1_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_1_replace_multhi_shift2_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_1_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_1_replace_shiftup_q_int(26 downto 0);

	--u0_m0_wo0_mtree_mult1_1_replace_add(ADD,333)@12
    u0_m0_wo0_mtree_mult1_1_replace_add_a <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_mult1_1_replace_shiftup_q(26)) & u0_m0_wo0_mtree_mult1_1_replace_shiftup_q);
    u0_m0_wo0_mtree_mult1_1_replace_add_b <= STD_LOGIC_VECTOR((27 downto 21 => u0_m0_wo0_mtree_mult1_1_replace_multlo_final_convert_q(20)) & u0_m0_wo0_mtree_mult1_1_replace_multlo_final_convert_q);
    u0_m0_wo0_mtree_mult1_1_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_1_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_replace_add_q <= u0_m0_wo0_mtree_mult1_1_replace_add_o(27 downto 0);


	--d_u0_m0_wo0_memread_q_12(DELAY,535)@11
    d_u0_m0_wo0_memread_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => d_u0_m0_wo0_memread_q_11_q, xout => d_u0_m0_wo0_memread_q_12_q, clk => clk, aclr => areset );

	--d_u0_m0_wo0_wi0_delayr35_q_12(DELAY,558)@11
    d_u0_m0_wo0_wi0_delayr35_q_12 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr35_q, xout => d_u0_m0_wo0_wi0_delayr35_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo0_wi0_delayr36(DELAY,43)@12
    u0_m0_wo0_wi0_delayr36 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_delayr35_q_12_q, xout => u0_m0_wo0_wi0_delayr36_q, ena => d_u0_m0_wo0_memread_q_12_q(0), clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_mult1_0_replace_split_low(BITSELECT,335)@12
    u0_m0_wo0_mtree_mult1_0_replace_split_low_in <= u0_m0_wo0_wi0_delayr36_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_0_replace_split_low_b <= u0_m0_wo0_mtree_mult1_0_replace_split_low_in(16 downto 0);

	--u0_m0_wo0_mtree_mult1_0_replace_multlo_shift0(BITSHIFT,532)@12
    u0_m0_wo0_mtree_mult1_0_replace_multlo_shift0_q_int <= u0_m0_wo0_mtree_mult1_0_replace_split_low_b & "000";
    u0_m0_wo0_mtree_mult1_0_replace_multlo_shift0_q <= u0_m0_wo0_mtree_mult1_0_replace_multlo_shift0_q_int(19 downto 0);

	--u0_m0_wo0_mtree_mult1_0_replace_multlo_final_convert(ROUND,533)@12
    u0_m0_wo0_mtree_mult1_0_replace_multlo_final_convert_in <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_0_replace_multlo_shift0_q);
    u0_m0_wo0_mtree_mult1_0_replace_multlo_final_convert_q <= u0_m0_wo0_mtree_mult1_0_replace_multlo_final_convert_in(20 downto 0);

	--u0_m0_wo0_mtree_mult1_0_replace_split_high(BITSELECT,334)@12
    u0_m0_wo0_mtree_mult1_0_replace_split_high_in <= u0_m0_wo0_wi0_delayr36_q;
    u0_m0_wo0_mtree_mult1_0_replace_split_high_b <= u0_m0_wo0_mtree_mult1_0_replace_split_high_in(23 downto 17);

	--u0_m0_wo0_mtree_mult1_0_replace_multhi_shift0(BITSHIFT,531)@12
    u0_m0_wo0_mtree_mult1_0_replace_multhi_shift0_q_int <= u0_m0_wo0_mtree_mult1_0_replace_split_high_b & "000";
    u0_m0_wo0_mtree_mult1_0_replace_multhi_shift0_q <= u0_m0_wo0_mtree_mult1_0_replace_multhi_shift0_q_int(9 downto 0);

	--u0_m0_wo0_mtree_mult1_0_replace_shiftup(BITSHIFT,338)@12
    u0_m0_wo0_mtree_mult1_0_replace_shiftup_q_int <= u0_m0_wo0_mtree_mult1_0_replace_multhi_shift0_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_0_replace_shiftup_q <= u0_m0_wo0_mtree_mult1_0_replace_shiftup_q_int(26 downto 0);

	--u0_m0_wo0_mtree_mult1_0_replace_add(ADD,339)@12
    u0_m0_wo0_mtree_mult1_0_replace_add_a <= STD_LOGIC_VECTOR((28 downto 27 => u0_m0_wo0_mtree_mult1_0_replace_shiftup_q(26)) & u0_m0_wo0_mtree_mult1_0_replace_shiftup_q);
    u0_m0_wo0_mtree_mult1_0_replace_add_b <= STD_LOGIC_VECTOR((28 downto 21 => u0_m0_wo0_mtree_mult1_0_replace_multlo_final_convert_q(20)) & u0_m0_wo0_mtree_mult1_0_replace_multlo_final_convert_q);
    u0_m0_wo0_mtree_mult1_0_replace_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_replace_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_replace_add_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_0_replace_add_a) + SIGNED(u0_m0_wo0_mtree_mult1_0_replace_add_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_replace_add_q <= u0_m0_wo0_mtree_mult1_0_replace_add_o(28 downto 0);


	--u0_m0_wo0_mtree_add0_0(ADD,118)@13
    u0_m0_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_mult1_0_replace_add_q(28)) & u0_m0_wo0_mtree_mult1_0_replace_add_q);
    u0_m0_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR((29 downto 28 => u0_m0_wo0_mtree_mult1_1_replace_add_q(27)) & u0_m0_wo0_mtree_mult1_1_replace_add_q);
    u0_m0_wo0_mtree_add0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_a) + SIGNED(u0_m0_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_q <= u0_m0_wo0_mtree_add0_0_o(29 downto 0);


	--u0_m0_wo0_mtree_add1_0(ADD,136)@14
    u0_m0_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_add0_0_q(29)) & u0_m0_wo0_mtree_add0_0_q);
    u0_m0_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR((30 downto 28 => u0_m0_wo0_mtree_mult1_3_replace_add_q(27)) & u0_m0_wo0_mtree_mult1_3_replace_add_q);
    u0_m0_wo0_mtree_add1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_a) + SIGNED(u0_m0_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_q <= u0_m0_wo0_mtree_add1_0_o(30 downto 0);


	--u0_m0_wo0_mtree_add2_0(ADD,145)@15
    u0_m0_wo0_mtree_add2_0_a <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_add1_0_q(30)) & u0_m0_wo0_mtree_add1_0_q);
    u0_m0_wo0_mtree_add2_0_b <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_add1_1_q(30)) & u0_m0_wo0_mtree_add1_1_q);
    u0_m0_wo0_mtree_add2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_0_a) + SIGNED(u0_m0_wo0_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_0_q <= u0_m0_wo0_mtree_add2_0_o(31 downto 0);


	--u0_m0_wo0_mtree_add3_0(ADD,150)@16
    u0_m0_wo0_mtree_add3_0_a <= STD_LOGIC_VECTOR((34 downto 32 => u0_m0_wo0_mtree_add2_0_q(31)) & u0_m0_wo0_mtree_add2_0_q);
    u0_m0_wo0_mtree_add3_0_b <= STD_LOGIC_VECTOR((34 downto 34 => u0_m0_wo0_mtree_add2_1_q(33)) & u0_m0_wo0_mtree_add2_1_q);
    u0_m0_wo0_mtree_add3_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_0_a) + SIGNED(u0_m0_wo0_mtree_add3_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_0_q <= u0_m0_wo0_mtree_add3_0_o(34 downto 0);


	--u0_m0_wo0_mtree_add4_0(ADD,152)@17
    u0_m0_wo0_mtree_add4_0_a <= STD_LOGIC_VECTOR((36 downto 35 => u0_m0_wo0_mtree_add3_0_q(34)) & u0_m0_wo0_mtree_add3_0_q);
    u0_m0_wo0_mtree_add4_0_b <= STD_LOGIC_VECTOR((36 downto 36 => u0_m0_wo0_mtree_add3_1_q(35)) & u0_m0_wo0_mtree_add3_1_q);
    u0_m0_wo0_mtree_add4_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add4_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add4_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add4_0_a) + SIGNED(u0_m0_wo0_mtree_add4_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add4_0_q <= u0_m0_wo0_mtree_add4_0_o(36 downto 0);


	--u0_m0_wo0_mtree_add5_0(ADD,153)@18
    u0_m0_wo0_mtree_add5_0_a <= STD_LOGIC_VECTOR((37 downto 37 => u0_m0_wo0_mtree_add4_0_q(36)) & u0_m0_wo0_mtree_add4_0_q);
    u0_m0_wo0_mtree_add5_0_b <= STD_LOGIC_VECTOR((37 downto 32 => u0_m0_wo0_mtree_add2_4_q(31)) & u0_m0_wo0_mtree_add2_4_q);
    u0_m0_wo0_mtree_add5_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add5_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add5_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add5_0_a) + SIGNED(u0_m0_wo0_mtree_add5_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add5_0_q <= u0_m0_wo0_mtree_add5_0_o(37 downto 0);


	--GND(CONSTANT,0)@0
    GND_q <= "0";

	--d_u0_m0_wo0_memread_q_18(DELAY,536)@12
    d_u0_m0_wo0_memread_q_18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6 )
    PORT MAP ( xin => d_u0_m0_wo0_memread_q_12_q, xout => d_u0_m0_wo0_memread_q_18_q, clk => clk, aclr => areset );

	--u0_m0_wo0_oseq_gated_reg(REG,154)@18
    u0_m0_wo0_oseq_gated_reg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= d_u0_m0_wo0_memread_q_18_q;
        END IF;
    END PROCESS;


	--xOut(PORTOUT,157)@19
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_mtree_add5_0_q;


end normal;

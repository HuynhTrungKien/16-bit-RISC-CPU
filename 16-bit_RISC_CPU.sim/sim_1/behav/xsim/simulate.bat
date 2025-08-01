@echo off
REM ****************************************************************************
REM Vivado (TM) v2025.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : AMD Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Thu Jul 31 17:25:43 +0700 2025
REM SW Build 6140274 on Thu May 22 00:12:29 MDT 2025
REM
REM Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
REM Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim CPU_tb_behav -key {Behavioral:sim_1:Functional:CPU_tb} -tclbatch CPU_tb.tcl -log simulate.log"
call xsim  CPU_tb_behav -key {Behavioral:sim_1:Functional:CPU_tb} -tclbatch CPU_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

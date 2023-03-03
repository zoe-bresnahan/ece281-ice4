--+----------------------------------------------------------------------------
--| 
--| COPYRIGHT 2018 United States Air Force Academy All rights reserved.
--| 
--| United States Air Force Academy     __  _______ ___    _________ 
--| Dept of Electrical &               / / / / ___//   |  / ____/   |
--| Computer Engineering              / / / /\__ \/ /| | / /_  / /| |
--| 2354 Fairchild Drive Ste 2F6     / /_/ /___/ / ___ |/ __/ / ___ |
--| USAF Academy, CO 80840           \____//____/_/  |_/_/   /_/  |_|
--| 
--| ---------------------------------------------------------------------------
--|
--| FILENAME      : stoplight.vhd
--| AUTHOR(S)     : Capt Phillip Warner, Capt Dan Johnson
--| CREATED       : 02/22/2018, Last Modified 06/24/2020 by Capt Dan Johnson
--| DESCRIPTION   : This module file implements solution for the HW stoplight example using 
--|				  : direct hardware mapping (registers and CL) for BINARY encoding.
--|               : Reset is asynchronous with a default state of yellow.
--|
--|					Inputs:  i_C 	 --> input to indicate a car is present
--|                          i_reset --> fsm reset
--|                          i_clk   --> slowed down clk
--|							 
--|					Outputs: o_R     --> red light output
--|							 o_Y	 --> yellow light output
--|							 o_G	 --> green light output
--|
--+----------------------------------------------------------------------------
--|
--| REQUIRED FILES :
--|
--|    Libraries : ieee
--|    Packages  : std_logic_1164, numeric_std
--|    Files     : None
--|
--+----------------------------------------------------------------------------
--|
--| NAMING CONVENSIONS :
--|
--|    xb_<port name>           = off-chip bidirectional port ( _pads file )
--|    xi_<port name>           = off-chip input port         ( _pads file )
--|    xo_<port name>           = off-chip output port        ( _pads file )
--|    b_<port name>            = on-chip bidirectional port
--|    i_<port name>            = on-chip input port
--|    o_<port name>            = on-chip output port
--|    c_<signal name>          = combinatorial signal
--|    f_<signal name>          = synchronous signal
--|    ff_<signal name>         = pipeline stage (ff_, fff_, etc.)
--|    <signal name>_n          = active low signal
--|    w_<signal name>          = top level wiring signal
--|    g_<generic name>         = generic
--|    k_<constant name>        = constant
--|    v_<variable name>        = variable
--|    sm_<state machine type>  = state machine type definition
--|    s_<signal name>          = state name
--|
--+----------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

  
entity stoplight_fsm is
    Port ( i_C     : in  STD_LOGIC;
           i_reset : in  STD_LOGIC;
           i_clk   : in  STD_LOGIC;
           o_R     : out  STD_LOGIC;
           o_Y     : out  STD_LOGIC;
           o_G     : out  STD_LOGIC);
end stoplight_fsm;

architecture stoplight_fsm_arch of stoplight_fsm is 
	
	-- create register signals with default state yellow (10)
  
begin
	-- CONCURRENT STATEMENTS ----------------------------
	-- Next state logic
	
	
	-- Output logic
	
	-------------------------------------------------------	
	
	-- PROCESSES ----------------------------------------	
	-- state memory w/ asynchronous reset ---------------
	register_proc : process (  )
	begin
			--Reset state is yellow


	end process register_proc;
	-------------------------------------------------------
	
end stoplight_fsm_arch;

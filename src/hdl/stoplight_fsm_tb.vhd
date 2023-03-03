--+----------------------------------------------------------------------------
--| 
--| COPYRIGHT 2017 United States Air Force Academy All rights reserved.
--| 
--| United States Air Force Academy     __  _______ ___    _________ 
--| Dept of Electrical &               / / / / ___//   |  / ____/   |
--| Computer Engineering              / / / /\__ \/ /| | / /_  / /| |
--| 2354 Fairchild Drive Ste 2F6     / /_/ /___/ / ___ |/ __/ / ___ |
--| USAF Academy, CO 80840           \____//____/_/  |_/_/   /_/  |_|
--| 
--| ---------------------------------------------------------------------------
--|
--| FILENAME      : stoplight_tb.vhd (TEST BENCH)
--| AUTHOR(S)     : Maj Jeff Falkinburg, Capt Phillip Warner, Capt Dan johnson,
--|					**Your Name**
--| CREATED       : Spring 2017 Last modified 06/24/2020
--| DESCRIPTION   : This file provides a solution testbench for the stoplight entity
--|
--+----------------------------------------------------------------------------
--|
--| REQUIRED FILES :
--|
--|    Libraries : ieee
--|    Packages  : std_logic_1164, numeric_std, unisim
--|    Files     : stoplight.vhd
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
 
entity stoplight_fsm_tb is
end stoplight_fsm_tb;
 
architecture behavior of stoplight_fsm_tb is 
 
    -- Component Declaration for the Unit Under Test (UUT)
    component stoplight_fsm
    port(
         i_C 	 : in  std_logic;
         i_reset : in  std_logic;
         i_clk 	 : in  std_logic;
         o_R 	 : out  std_logic;
         o_Y 	 : out  std_logic;
         o_G 	 : out  std_logic
        );
    end component;
    

	--Inputs
	signal i_C : std_logic := '0';
	signal i_reset : std_logic := '0';
	signal i_clk : std_logic := '0';
	
		--Outputs
	signal o_R : std_logic;
	signal o_Y : std_logic;
	signal o_G : std_logic;
	
	-- Clock period definitions
	constant k_clk_period : time := 10 ns;
 
begin
  	-- PORT MAPS ---------------------------------------------------
	-- Instantiate the Unit Under Test (UUT)
   uut: stoplight_fsm port map (
          i_C => i_C,
          i_reset => i_reset,
          i_clk => i_clk,
          o_R => o_R,
          o_Y => o_Y,
          o_G => o_G
        );
	----------------------------------------------------------------
  
	-- PROCESSES --------------------------------------------------- 
	-- Clock process
	clk_proc : process
	begin
		i_clk <= '0';
		wait for k_clk_period/2;
		i_clk <= '1';
		wait for k_clk_period/2;
	end process;
	
	-- Simulation process
	-- Use 220 ns for simulation
	sim_proc: process
	begin
		-- sequential timing		
		i_reset <= '1';
		wait for k_clk_period*1;
		
		i_reset <= '0';
		wait for k_clk_period*1;
		
		-- alternative way of implementing Finite State Machine Inputs
		-- starts after "wait for" statements
		-- statements after this one start in paralell to this one
		i_C <= '0', '1' after 40 ns, '0' after 80ns, '1' after 120 ns, '0' after 160 ns, '1' after 170 ns;
	
		-- one way to make using the reset easier would be to use a separate process to control it
		wait for k_clk_period*19;
		i_reset <= '1';
	
		wait;
	end process;
	----------------------------------------------------------------
end;

library ieee;
use ieee.std_logic_1164.all;

entity ha_test is
end;

architecture arch of ha_test is
	component HA is
		port(A, B: std_logic;
			S, Cout: out std_logic);
	end component;

	signal A, B, S, Cout: std_logic;

begin
	DUT: HA port map (A, B, S, Cout);
	inputs: process
	
	begin
	A <= '0';
	B <= '0';
	wait for 10 ns;
	B <= '1';
	wait for 10 ns;
	A <= '1';
	B <= '0';
	wait for 10 ns;
	B <= '1';
	wait for 10 ns;
	wait;
	end process;
	
end;

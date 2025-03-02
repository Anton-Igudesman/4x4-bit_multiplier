library ieee;
use ieee.std_logic_1164.all;

entity AND_gate_test is
end;

architecture arch of AND_gate_test is
	component AND_gate is
		port(A, B: std_logic;
			F: out std_logic);
	end component;
	
	signal A, B, F: std_logic;

begin
	DUT: AND_gate port map(A, B, F);
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

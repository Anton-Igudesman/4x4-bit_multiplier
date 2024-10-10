library ieee;
use ieee.std_logic_1164.all;

entity fa_test is
end;

architecture arch of fa_test is
	component FA is
		port(A, B, Cin: std_logic;
			S, Cout: out std_logic);
	end component;

	signal A, B, Cin, S, Cout: std_logic;
begin
	DUT: FA port map (A, B, Cin, S, Cout);
	inputs: process
	begin
	A <= '0';
	B <= '0';
	Cin <= '0';
	wait for 10 ns;
	Cin <= '1';
	wait for 10 ns;
	B <= '1';
	Cin <= '0';
	wait for 10 ns;
	Cin <= '1';
	wait for 10 ns;
	A <= '1';
	B <= '0';
	Cin <= '0';
	wait for 10 ns;
	Cin <= '1';
	wait for 10 ns;
	B <= '1';
	Cin <= '0';
	wait for 10 ns;
	Cin <= '1';
	wait for 10 ns;
	wait;
	end process;
end;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier_circuit_testbench is
end;

architecture arch of multiplier_circuit_testbench is
	component multiplier_circuit is
		port(A, B: in std_logic_vector(3 downto 0);
			F: out std_logic_vector(7 downto 0));
	end component;

	signal A: std_logic_vector(3 downto 0);
	signal B: std_logic_vector(3 downto 0);
	signal F: std_logic_vector(7 downto 0);

begin
	DUT: multiplier_circuit port map (A, B, F);
	inputs: process

	begin
		for i in 0 to 15 loop
			A <= std_logic_vector( to_unsigned(i, A'length) );
			
			
			for j in 0 to 15 loop
				B <= std_logic_vector( to_unsigned(j, B'length) );
				wait for 10 ns;
			end loop;
			wait for 10 ns;
		end loop;
		wait;
	end process;
end;
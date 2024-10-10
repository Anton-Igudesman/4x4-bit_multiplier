library ieee;
use ieee.std_logic_1164.all;

entity AND_gate is
	port(A, B: std_logic;
		F: out std_logic);
end;

architecture arch of AND_gate is
begin
	F <= A and B;
end;
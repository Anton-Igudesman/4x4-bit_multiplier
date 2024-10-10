library ieee;
use ieee.std_logic_1164.all;

entity HA is
	port(A, B: std_logic;
		Cout, S: out std_logic);
end;

architecture arch of HA is
begin
	S <= A xor B;
	Cout <= A and B;
end;
library ieee;
use ieee.std_logic_1164.all;

entity multiplier_circuit is
	port(A, B: in std_logic_vector(3 downto 0);
		F: out std_logic_vector(7 downto 0));
		
end;

architecture arch of multiplier_circuit is

component FA is
	port(A, B, Cin: std_logic;
		S, Cout: out std_logic);
end component;

component HA is
	port(A, B: std_logic;
		Cout, S: out std_logic);
end component;

component AND_gate is
	port(A, B: std_logic;
		F: out std_logic);
end component;

-- Signal declarations
signal ROW1, ROW2, ROW3, ROW4: std_logic_vector (3 downto 0) := (others => '0');
signal CARRY: std_logic_vector (10 downto 0) := (others => '0');
signal PART_SUM: std_logic_vector(5 downto 0) := (others => '0');
signal PRODUCT: std_logic_vector(7 downto 0) := (others => '0');

begin

-- Creating AND gate combinations 
	ROW1(0) <= A(0) and B(0);
	ROW1(1) <= A(1) and B(0);
	ROW1(2) <= A(2) and B(0);
	ROW1(3) <= A(3) and B(0);

	ROW2(0) <= A(0) and B(1);
	ROW2(1) <= A(1) and B(1);
	ROW2(2) <= A(2) and B(1);
	ROW2(3) <= A(3) and B(1);

	ROW3(0) <= A(0) and B(2);
	ROW3(1) <= A(1) and B(2);
	ROW3(2) <= A(2) and B(2);
	ROW3(3) <= A(3) and B(2);

	ROW4(0) <= A(0) and B(3);
	ROW4(1) <= A(1) and B(3);
	ROW4(2) <= A(2) and B(3);
	ROW4(3) <= A(3) and B(3);

-- Mapping 8 Full Adders and 4 Half Adders with partial sums and carries included

--Tag | Component | Map	     |      Inputs(3)	      |            Outputs(2)
----------------------------------------------------------------------------------
	FA0: FA port map ( ROW1(2), ROW2(1), CARRY(0), PART_SUM(0), CARRY(1) );
	FA1: FA port map ( ROW1(3), CARRY(1), CARRY(2), PART_SUM(1), CARRY(3) );
	FA2: FA port map ( ROW2(2), ROW3(1), PART_SUM(1), PART_SUM(2), CARRY(4) );
	FA3: FA port map ( CARRY(3), CARRY(4), CARRY(5), PART_SUM(3), CARRY(6) );
	FA4: FA port map ( ROW2(3), ROW3(2), PART_SUM(3), PART_SUM(4), CARRY(7) );
	FA5: FA port map ( CARRY(6), CARRY(7), CARRY(8), PART_SUM(5), CARRY(9) );
	FA6: FA port map ( ROW3(3), ROW4(2), PART_SUM(5), PRODUCT(5), CARRY(10) );
	FA7: FA port map ( ROW4(3), CARRY(9), CARRY(10), PRODUCT(6), PRODUCT(7) );
	HA0: HA port map ( ROW1(1), ROW2(0), CARRY(0), PRODUCT(1) );
	HA1: HA port map ( ROW3(0), PART_SUM(0), CARRY(2), PRODUCT(2) );
	HA2: HA port map ( PART_SUM(2), ROW4(0), CARRY(5), PRODUCT(3) );
	HA3: HA port map ( PART_SUM(4), ROW4(1), CARRY(8), PRODUCT(4) );
	
	--First Product
	PRODUCT(0) <= ROW1(0);

	-- Assigning all products to F output
	F <= PRODUCT;
	

end;
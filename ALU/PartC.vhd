Library ieee;
use ieee.std_logic_1164.all;

entity partCEntity is 
GENERIC(N:INTEGER:=16);
port(
A : IN std_logic_vector (n-1 DOWNTO 0);
B : IN std_logic_vector (n-1 DOWNTO 0);
S0 : IN std_logic;
S1 : IN std_logic;
CIN : IN std_logic;
F : OUT std_logic_vector (n-1 DOWNTO 0);
COUT : OUT std_logic);
end entity;

Architecture PART_C of partCEntity is
begin

F <= '0' & A(n-1 DOWNTO 1) WHEN S0 = '0' AND S1 = '0'
ELSE A(0) & A(n-1 DOWNTO 1) WHEN S0 = '1' AND S1 = '0'
ELSE CIN & A(n-1 DOWNTO 1) WHEN S0 = '0' AND S1 = '1'
ELSE A(n-1) & A(n-1 DOWNTO 1);

COUT <= A(0); 

end Architecture;
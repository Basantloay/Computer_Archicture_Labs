Library ieee;
use ieee.std_logic_1164.all;

entity partBEntity is 
GENERIC(N:INTEGER:=16);
port(
A : IN std_logic_vector (n-1 DOWNTO 0);
B : IN std_logic_vector (n-1 DOWNTO 0);
S0 : IN std_logic;
S1 : IN std_logic;
F : OUT std_logic_vector (n-1 DOWNTO 0));

end entity;

Architecture PART_b of partBEntity is
begin

F <= A AND B WHEN S0 = '0' AND S1 = '0'
ELSE A OR B WHEN S0 = '1' AND S1 = '0'
ELSE A NOR B WHEN S0 = '0' AND S1 = '1'
ELSE NOT A;

end Architecture;

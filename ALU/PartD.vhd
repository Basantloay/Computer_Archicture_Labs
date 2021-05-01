Library ieee;
use ieee.std_logic_1164.all;

entity partDEntity is 
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

Architecture PART_D of partDEntity is
begin

F <= A(n-2 DOWNTO 0) & '0' WHEN S0 = '0' AND S1 = '0'
ELSE A(n-2 DOWNTO 0) & A(n-1) WHEN S0 = '1' AND S1 = '0'
ELSE A(n-2 DOWNTO 0) & CIN  WHEN S0 = '0' AND S1 = '1'
ELSE (OTHERS=> '0' );

cout <= '0'  WHEN S0 = '1' AND S1 = '1'
ELSE A(n-1); 

end Architecture;
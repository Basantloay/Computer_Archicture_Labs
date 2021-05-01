Library ieee;
use ieee.std_logic_1164.all;

entity ALUEntity is 
GENERIC(N:INTEGER:=16);
port(
A : IN std_logic_vector (n-1 DOWNTO 0);
B : IN std_logic_vector (n-1 DOWNTO 0);
SS : IN std_logic_vector (3 DOWNTO 0);
CIN : IN std_logic;
F : OUT std_logic_vector (N-1 DOWNTO 0);
COUT : OUT std_logic);
end entity;

Architecture ALU of ALUEntity is

COMPONENT PartA IS 
GENERIC(N:INTEGER:=16);
PORT(A,B:IN std_logic_vector(N-1 DOWNTO 0);
CIN:IN STD_LOGIC;
COUT:OUT STD_LOGIC;
F:OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
S0 : IN std_logic;
S1 : IN std_logic
);
END COMPONENT;

COMPONENT partBEntity is 
GENERIC(N:INTEGER:=16);
port(
A : IN std_logic_vector (n-1 DOWNTO 0);
B : IN std_logic_vector (n-1 DOWNTO 0);
S0 : IN std_logic;
S1 : IN std_logic;
F : OUT std_logic_vector (n-1 DOWNTO 0));
end COMPONENT;

COMPONENT partCEntity is 
GENERIC(N:INTEGER:=16);
port(
A : IN std_logic_vector (n-1 DOWNTO 0);
B : IN std_logic_vector (n-1 DOWNTO 0);
S0 : IN std_logic;
S1 : IN std_logic;
CIN : IN std_logic;
F : OUT std_logic_vector (n-1 DOWNTO 0);
COUT : OUT std_logic);
end COMPONENT;

COMPONENT partDEntity is 
GENERIC(N:INTEGER:=16);
port(
A : IN std_logic_vector (n-1 DOWNTO 0);
B : IN std_logic_vector (n-1 DOWNTO 0);
S0 : IN std_logic;
S1 : IN std_logic;
CIN : IN std_logic;
F : OUT std_logic_vector (n-1 DOWNTO 0);
COUT : OUT std_logic);
end COMPONENT;


SIGNAL FA,FB,FC,FD : std_logic_vector (n-1 DOWNTO 0);
SIGNAL COUTA,COUTD,COUTC : std_logic;

begin
X0:  PartA generic map(8) PORT MAP (A,B,CIN,COUTA,FA,SS(0),SS(1));
X1 : partBEntity generic map(8) PORT MAP (A,B,SS(0),SS(1),FB);
X2 : partCEntity generic map(8) PORT MAP (A,B,SS(0),SS(1),CIN,FC,COUTC);
X3 : partDEntity generic map(8) PORT MAP (A,B,SS(0),SS(1),CIN,FD,COUTD);

F <= FB WHEN SS(2) = '1' AND SS(3) = '0'
ELSE FC WHEN SS(2) = '0' AND SS(3) = '1'
ELSE FD WHEN SS(2) = '1' AND SS(3) = '1'
ELSE FA;

COUT <= COUTC WHEN SS(2) = '0' AND SS(3) = '1'
ELSE COUTD WHEN SS(2) = '1' AND SS(3) = '1'
ELSE COUTA WHEN SS(2) = '0' AND SS(3) = '0';
--ELSE "00000000";
	
end ALU;
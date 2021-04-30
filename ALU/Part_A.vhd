LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY PartA IS 
GENERIC(N:INTEGER:=16);
PORT(A,B:IN std_logic_vector(N-1 DOWNTO 0);
CIN:IN STD_LOGIC;
COUT:OUT STD_LOGIC;
F:OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
S0 : IN std_logic;
S1 : IN std_logic
);
END PartA;



ARCHITECTURE PartAarch OF PartA IS
COMPONENT my_nadder IS
GENERIC (n : integer := 16);
PORT (a, b : IN std_logic_vector(n-1 DOWNTO 0) ;
cin : IN std_logic;
s : OUT std_logic_vector(n-1 DOWNTO 0);
cout : OUT std_logic);
END COMPONENT;

SIGNAL Btemp : std_logic_vector(n-1 DOWNTO 0);
SIGNAL FTEMP : std_logic_vector(n-1 DOWNTO 0);
SIGNAL COUTTEMP: STD_LOGIC;
BEGIN
Btemp<= (OTHERS=> '0' )WHEN S0 = '0' AND S1 = '0'
ELSE B  WHEN S0 = '1' AND S1 = '0'
ELSE NOT B  WHEN S0 = '0' AND S1 = '1'
ELSE (OTHERS=> '1' );

X: my_Nadder GENERIC MAP(8) PORT MAP(A,BTEMP,CIN,FTEMP,COUTTEMP);
F<=(OTHERS=> '0' ) WHEN S0 = '1' AND S1 = '1' AND CIN='1'
ELSE FTEMP;
COUT<='0' WHEN S0 = '1' AND S1 = '1' AND CIN='1'
ELSE COUTTEMP;END PartAarch;
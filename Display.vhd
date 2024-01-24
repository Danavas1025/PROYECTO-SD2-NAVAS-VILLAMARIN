library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Display is
port(
	BCD: in std_logic_vector (3 downto 0);
	siete_seg: out std_logic_vector (6 downto 0));
end Display;

architecture behavioral of Display is
begin
process (BCD)
begin 
	if BCD="0000" then--0
		siete_seg<="1000000";
		
	elsif BCD="0001" then--1
		siete_seg<="1111001";
		
	elsif BCD="0010" then--2
		siete_seg<="0100100";
		
	elsif BCD="0011" then--3
		siete_seg<="0110000";
		
	elsif BCD="0100" then--4
		siete_seg<="0011001";
		
	elsif BCD="0101" then--5
		siete_seg<="0010010";
		
	elsif BCD="0110" then--6
		siete_seg<="0000010";
		
	elsif BCD="0111" then--7
		siete_seg<="1111000";
		
	elsif BCD="1000" then--8
		siete_seg<="0000000";
		
	elsif BCD="1001" then--9
		siete_seg<="0011000";
		
	else 
		siete_seg<="1111110";
	end if;
end process;
end behavioral;
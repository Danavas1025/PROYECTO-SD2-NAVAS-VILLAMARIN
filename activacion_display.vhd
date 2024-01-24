library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity activacion_display is
port(en: in std_logic;
A, B: out std_logic_vector (6 downto 0));
end activacion_display ;

architecture behavioral of activacion_display  is
begin
process (en)
begin 
	if en='1' then
		A<="0001000";
		B<="0001100";
	else
		A<="1111111";
		B<="1111111";
	end if;
end process;
end behavioral;
		
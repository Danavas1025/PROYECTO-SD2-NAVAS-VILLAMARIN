library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comprobacionClave is
    Port ( entrada1 : in  STD_LOGIC_VECTOR(3 downto 0);
           entrada2 : in  STD_LOGIC_VECTOR(3 downto 0);
           entrada3 : in  STD_LOGIC_VECTOR(3 downto 0);
           entrada4 : in  STD_LOGIC_VECTOR(3 downto 0);
           Salida1 : out  STD_LOGIC;
           Salida2 : out  STD_LOGIC;
           Salida3 : out  STD_LOGIC;
           Salida4 : out  STD_LOGIC);
end comprobacionClave;

architecture Behavioral of comprobacionClave is
begin
    process(entrada1, entrada2 , entrada3 , entrada4 )
    begin
        if entrada1 = "0011" then Salida1 <= '1' ;
		   else Salida1<='0'; end if;--3
        if entrada2 = "0101" then Salida2 <= '1' ;
		  else Salida2<='0'; end if;--5
        if entrada3 = "0111" then Salida3 <= '1' ;
		  else Salida3<='0'; end if;--7
        if entrada4 = "1001" then Salida4 <= '1' ;
		  else Salida4<='0'; end if;--9
    end process;
end Behavioral;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity teclado is
port(clk: in std_logic;
	Ent: in std_logic_vector(3 downto 0);
	Sal: out std_logic_vector(3 downto 0);
	Tecla: out std_logic;
	Teclado: out std_logic_vector(3 downto 0):="1111");
	
end teclado;

architecture desarrollo of teclado is
signal temp: std_logic_vector(3 downto 0) := "0001";
signal tempTecla: std_logic_vector(3 downto 0):="1111";
signal band: std_logic:='0';
signal n : integer := 0;

begin
	process(clk)
	begin
		if (clk'event and clk='1') then
			if temp="0001" then
				temp<="0010";
				Sal<="0010";
			elsif temp="0010" then 
				temp<="0100";
				Sal<="0100";
			elsif temp="0100" then 
				temp<="1000";
				Sal<="1000";
			elsif temp="1000" then 
				temp<="0001";
				Sal<="0001";
			end if;
		end if;
	
	
	end process;
	
	process(Ent)
	begin
			--PRIMERA FILA
			if temp="0010" then
				if Ent="0000" then
					tempTecla<="1111";--Nada
				elsif Ent="0001" then
					tempTecla<="0001";-- 1
				elsif Ent="0010" then 
					tempTecla<="0010";-- 2
				elsif Ent="0100" then 
					tempTecla<="0011";-- 3
				elsif Ent="1000" then 
					tempTecla<="1010";-- A
				end if;
			--SEGUNDA FILA
			elsif temp="0100" then
				if Ent="0000" then
					tempTecla<="1111";--Nada
				elsif Ent="0001" then
					tempTecla<="0100";-- 4
				elsif Ent="0010" then 
					tempTecla<="0101";-- 5
				elsif Ent="0100" then 
					tempTecla<="0110";-- 6
				elsif Ent="1000" then 
					tempTecla<="1011";-- B
				end if;
			--TERCERA FILA
			elsif temp="1000" then
				if Ent="0000" then
					tempTecla<="1111";--Nada
				elsif Ent="0001" then
					tempTecla<="0111";-- 7
				elsif Ent="0010" then 
					tempTecla<="1000";-- 8
				elsif Ent="0100" then 
					tempTecla<="1001";-- 9
				elsif Ent="1000" then 
					tempTecla<="1100";-- C
				end if;
			--CUARTA FILA
			elsif temp="0001" then
				if Ent="0000" then
					tempTecla<="1111";--Nada
				elsif Ent="0001" then
					tempTecla<="1101";-- *
				elsif Ent="0010" then 
					tempTecla<="0000";-- 0
				elsif Ent="0100" then 
					tempTecla<="1110";-- #
				elsif Ent="1000" then 
					tempTecla<="1111";-- D
				end if;
			end if;
			
			
			if Ent/="0000" then
				if band='0' then
					band<='1';
				end if;
				Tecla<='1';
			else
				Tecla<='0';
			end if;
			
			if band ='1' then
				n<=n+1;
				if n>4 then
					n<=0;
					band<='0';
				end if;
			end if;
			
			
	end process;
	Teclado<= tempTecla;
end desarrollo;
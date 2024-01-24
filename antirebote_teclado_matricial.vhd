library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity antirebote_teclado_matricial is
    port (
        clk, resetn: in std_logic;
        teclado_in: in std_logic_vector(3 downto 0);
        salida: out std_logic;
        teclado_out: out std_logic_vector(3 downto 0);
        presionar: out std_logic
    );
end antirebote_teclado_matricial;

architecture desarrollo of antirebote_teclado_matricial is
    signal contador: natural := 0;
    signal activo: boolean := false;

begin
    process(clk)
    begin
        if resetn = '0' then
            contador <= 0;
            activo <= false;
            salida <= '0';
            presionar <= '0';
            teclado_out <= "1111";
        elsif falling_edge(clk) then
            if teclado_in /= "1111" then
                contador <= 0;  -- Reiniciar el contador si la entrada está activa
                activo <= true; -- Activar la bandera "activo"
            end if;

            if activo = true then
                if contador = 3 then
                    contador <= contador + 1; -- Incrementar el contador
                    teclado_out <= teclado_in;
                    salida <= '1';
                    presionar <= '0';
                elsif contador < 3 then
                    contador <= contador + 1; -- Incrementar el contador
                    teclado_out <= teclado_in;
                    salida <= '0';
                    presionar <= '0';
                elsif contador < 25000000 then
                    contador <= contador + 1; -- Incrementar el contador
                    teclado_out <= teclado_in;
                    salida <= '0';
                    presionar <= '1';
                else
                    activo <= false;          -- Desactivar la bandera "activo" después de 4 pulsos
                    teclado_out <= "1111";
                    salida <= '0';
                    presionar <= '0';
                end if;
            else
                contador <= 0;  -- Reiniciar el contador si la entrada está inactiva
                teclado_out <= "1111";
                salida <= '0';
                presionar <= '0';
            end if;
        end if;
    end process;
end desarrollo;

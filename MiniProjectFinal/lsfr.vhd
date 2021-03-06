library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.math_real.all;

entity lsfr is
  port (q_x   :out integer;
		clock    :in  std_logic);
end entity;

architecture rtl of lsfr is
    signal count : std_logic_vector (9 downto 0) := "0000110100"; --Initial value --

begin
    process (clock) 
	begin
      if rising_edge(clock) then
                count <= count(8) & (not(count(7) xor count(3)) & not(count(5) xor count(1)) & count(5)
						  & not(count(3) xor count(8)) & count(3) & count(2) & (count(4) xor count(6))
						  & count(0) & count(9));
       end if;
    end process;
	
    q_x <= to_integer(unsigned(count(8 downto 0)));
end architecture;

















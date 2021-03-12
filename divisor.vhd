library ieee;
use ieee.std_logic_1164.all;

Entity divisor is 
	generic(
		pulses : integer := 25000000		--Default is to change CLK from 50 MHz to 1 Hz
		);
	port(
		CLK 		: in std_logic;
		CLK_OUT 	: out std_logic
		);

end divisor;


Architecture behavior of divisor is
	signal CLK_TEMP : std_logic;
Begin
	process(CLK)
		variable counter : integer;	--Counts the pulses
	Begin
		if(rising_edge(CLK)) then
			counter := counter + 1;
			if(counter = pulses) then
				CLK_TEMP <= not CLK_TEMP;	--Change clk
				counter := 0;					--Reinitialize counter
			end if;
		end if;
	end process;
	
	CLK_OUT <= CLK_TEMP;						--Assign clk_out
	
end behavior;
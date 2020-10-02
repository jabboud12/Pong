architecture rtl of debouncer is
SIGNAL s_but, s_ff1, s_ff2, s_ff3, s_out, s_cond : std_logic;
BEGIN
	s_but <= button;
	button_o <= s_out;
	s_cond <= not(reset or enable) and (s_out or (s_ff2 and not(s_ff3)));

	dff : PROCESS (clock)
	BEGIN
		IF (rising_edge(clock)) THEN
					s_ff1 <= s_but;
					s_ff2 <= s_ff1;
					s_ff3 <= s_ff2;
					s_out <= s_cond;
		END IF;
	END PROCESS dff;

END ARCHITECTURE rtl; 
   

ARCHITECTURE rtl OF bat IS
	SIGNAL s_current_state, s_next_state : STD_LOGIC_VECTOR (8 downto 0);
BEGIN
	
	bat_o <= s_current_state;

	dff : PROCESS (clock)
	BEGIN
		IF (rising_edge(clock)) THEN 
			IF (reset = '1') THEN s_current_state <= "000111000";
				ELSE s_current_state <= s_next_state;
			END IF;
		END IF;
	END PROCESS dff;

	transition : PROCESS (button_up, button_down, enable, s_current_state)
	BEGIN
		IF (enable = '1' AND button_up = '1' AND button_down = '0') THEN
			IF (s_current_state(8) = '0') THEN
				s_next_state <= s_current_state(7 downto 0) & '0';
			ELSE
				s_next_state <= s_current_state;
			END IF;
		ELSE 
			IF (enable = '1' AND button_up = '0' AND button_down = '1') THEN
				IF (s_current_state(0) = '0') THEN
					s_next_state <= '0' & s_current_state(8 downto 1);
				ELSE
					s_next_state <= s_current_state;
				END IF;
			ELSE
				s_next_state <= s_current_state;
			END IF;	
		END IF;
	END PROCESS transition;
END ARCHITECTURE rtl;

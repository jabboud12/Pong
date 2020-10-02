ARCHITECTURE rtl OF direction IS
	SIGNAL s_current_state, s_next_state : STD_LOGIC;

BEGIN
	dir <= s_current_state;

	dff : PROCESS ( clock )
	BEGIN
		IF (rising_edge(clock)) THEN
			IF (reset = '1') THEN s_current_state <= '1';
				ELSE s_current_state <= s_next_state;
			END IF;
		END IF;
	END PROCESS dff;
				
	transition : PROCESS ( change, enable, s_current_state )
	BEGIN
		IF (change = '1' AND enable = '1') THEN
			IF (s_current_state = '0') THEN
				s_next_state <= '1';
			ELSE
				s_next_state <= '0';
			END IF;
		ELSE
			s_next_state <= s_current_state;
		END IF;
	END PROCESS transition;
END ARCHITECTURE rtl;
--<=      

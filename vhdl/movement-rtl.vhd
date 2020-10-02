ARCHITECTURE rtl OF movement IS
	SIGNAL s_current_state, s_next_state : STD_LOGIC_VECTOR (WIDTH - 1 downto 0);
BEGIN
	
	pos <= s_current_state;

	dff : PROCESS (clock)
	BEGIN
		IF (rising_edge(clock)) THEN 
			IF (reset = '1') THEN s_current_state <= INIT;
				ELSIF (enable = '1') THEN 
				s_current_state <= s_next_state;
			END IF;
		END IF;
	END PROCESS dff;

	transition : PROCESS (dir, enable, s_current_state)
	BEGIN
		IF (enable = '1' AND dir = '1') THEN
			IF (s_current_state(WIDTH - 1) = '0') THEN
				s_next_state <= s_current_state((WIDTH - 2) downto 0) & '0';
			ELSE
				s_next_state <= s_current_state;
			END IF;
		ELSE 
			IF (enable = '1' AND dir = '0') THEN
				IF (s_current_state(0) = '0') THEN
					s_next_state <= '0' & s_current_state((WIDTH - 1) downto 1);
				ELSE
					s_next_state <= s_current_state;
				END IF;
			ELSE
				s_next_state <= s_current_state;
			END IF;	
		END IF;
	END PROCESS transition;
END ARCHITECTURE rtl;

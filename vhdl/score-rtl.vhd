ARCHITECTURE rtl OF score IS

	SIGNAL s_user_score, s_user_score_next, s_sys_score, s_sys_score_next : natural;
	SIGNAL s_user, s_sys : std_logic_vector(3 downto 0);
	SIGNAL s_over : std_logic;
BEGIN
					
		WITH s_user SELECT user <=
			"11111100" when "0000",
					"01100000" when "0001",
					"11011010" when "0010",
					"11110010" when "0011",
					"01100110" when "0100",
					"10110110" when "0101",
					"10111110" when "0110",
					"11100000" when "0111",
					"11111110" when "1000",
					"11110110" when "1001",
					"11111111" when OTHERS;
					
		WITH s_sys SELECT sys <=
			"11111100" when "0000",
					"01100000" when "0001",
					"11011010" when "0010",
					"11110010" when "0011",
					"01100110" when "0100",
					"10110110" when "0101",
					"10111110" when "0110",
					"11100000" when "0111",
					"11111110" when "1000",
					"11110110" when "1001",
					"11111111" when OTHERS;
			
			s_over <= '1' 
						WHEN (s_user_score = 9 OR s_sys_score = 9) AND reset = '0' ELSE
						'0';
			s_user_score_next <= s_user_score + 1;
			s_sys_score_next <= s_sys_score + 1;
			over <= s_over;
			s_user <= std_logic_vector(to_unsigned(s_user_score, 4));
			s_sys <= std_logic_vector(to_unsigned(s_sys_score, 4));
		
	dff : PROCESS (clock, x_pos, enable, reset, s_over)
	BEGIN
		IF (rising_edge(clock)) THEN 
			IF (reset = '1') THEN
				s_user_score <= 0;
				s_sys_score <= 0;
			ELSIF (enable = '1') THEN 			
				IF (s_over = '0') THEN
					IF (x_pos(0) = '1') THEN
						s_user_score <= s_user_score_next;	
					ELSIF (x_pos(11) = '1') THEN
						s_sys_score <= s_sys_score_next;
					END IF;			
				END IF;
			END IF;
		END IF;	
	END PROCESS dff;
END ARCHITECTURE rtl;

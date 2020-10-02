architecture rtl of collision is
SIGNAL next_y : std_logic_vector(8 downto 0);
SIGNAL s_change, s_cond : std_logic;

BEGIN
	
	change <= s_change;

	s_cond <= (next_y(0) and bat_pos(0)) or
						(next_y(1) and bat_pos(1)) or
						(next_y(2) and bat_pos(2)) or
						(next_y(3) and bat_pos(3)) or
						(next_y(4) and bat_pos(4)) or
						(next_y(5) and bat_pos(5)) or
						(next_y(6) and bat_pos(6)) or
						(next_y(7) and bat_pos(7)) or
						(next_y(8) and bat_pos(8));


	
	
	transition : PROCESS (x_dir, y_dir, x_pos, y_pos, bat_pos, s_cond)
	BEGIN
		IF (x_pos(9) = '1' and x_dir = '1') THEN
			If (s_cond = '1') THEN
				s_change <= '1';
			ELSE s_change <= '0';
			END IF;
		ELSIF (x_pos(11) = '1' and x_dir = '0') THEN
			IF (s_cond = '1') THEN
				s_change <= '1';
			ELSE s_change <= '0';	
			END IF;
		ELSE s_change <= '0';
		END IF;
	END PROCESS transition;
	
	nextY : PROCESS (y_pos, y_dir)
	BEGIN
		IF (y_dir = '1') THEN 
			IF (y_pos(8) = '0') THEN
				next_y <= y_pos(7 downto 0) & '0';
			ELSE
				next_y <= y_pos;
			END IF;
		ELSE
			IF (y_pos(0) ='0') THEN
				next_y <='0' & y_pos(8 downto 1);
			ELSE 
				next_y <= y_pos;
			END IF;		
		END IF;
	END PROCESS nextY;
END ARCHITECTURE rtl;


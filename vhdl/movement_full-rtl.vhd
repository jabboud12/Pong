ARCHITECTURE rtl OF movement_full IS

	COMPONENT DIRECTION IS
		PORT (change, reset, enable, clock : IN std_logic;
			dir : OUT std_logic);
	END COMPONENT;

	COMPONENT MOVEMENT IS
	GENERIC (WIDTH : natural := 9;
					INIT : std_logic_vector);
		PORT (dir, enable, reset, clock : IN std_logic;
			pos : OUT std_logic_vector(WIDTH - 1 downto 0));
	END COMPONENT;
	
	SIGNAL s_dir_out, s_pos_1, s_pos_width_2, s_or, s_and, s_and_neg : std_logic;
	SIGNAL s_pos : std_logic_vector(WIDTH - 1 downto 0);
BEGIN
	pos <= s_pos;
	dir_o <=s_dir_out;

	s_or <= ext_change OR (s_and_neg OR s_and);
	s_and <= s_dir_out AND s_pos_width_2;
	s_and_neg <= (NOT s_dir_out) AND s_pos_1;
	s_pos_1 <= s_pos(1);
	s_pos_width_2 <= s_pos(WIDTH - 2);

	direct : DIRECTION 
	PORT MAP(enable => enable,
			reset => reset,
			clock => clock,
			change => s_or,
			dir => s_dir_out);
	
	move : MOVEMENT
	GENERIC MAP(WIDTH => WIDTH,
						INIT => INIT)
	PORT MAP(dir => s_dir_out,
			enable => enable,
			reset => reset,
			clock => clock,
			pos => s_pos);
END ARCHITECTURE rtl;

ARCHITECTURE rtl OF pong IS
	
	COMPONENT PONG
		PORT (n_button_up   : in std_logic;
        n_button_down : in std_logic;
        n_reset       : in std_logic;
        clock         : in std_logic;
        playfield     : out std_logic_vector(107 downto 0);
        user          : out std_logic_vector(7 downto 0);
        sys           : out std_logic_vector(7 downto 0));	
	END COMPONENT;

	COMPONENT MOVEMENT_FULL
	GENERIC ( WIDTH : natural := 9;
				INIT : std_logic_vector);
		PORT( ext_change, enable, reset, clock: IN std_logic;
	 		pos : OUT std_logic_vector( WIDTH- 1 downto 0);
			dir_o : OUT std_logic);
	END COMPONENT;

	COMPONENT clock_divider
		PORT ( clock, reset : IN std_logic;
			enable : OUT std_logic);
	END COMPONENT;
	
	COMPONENT SCORE 
		PORT(x_pos : IN std_logic_vector(11 downto 0);
			enable, reset, clock : IN std_logic;
			user, sys : OUT std_logic_vector(7 downto 0);
			over : OUT std_logic);
	END COMPONENT;
	
	COMPONENT BAT
		PORT (button_up, button_down, enable, reset, clock   : in std_logic;
				bat_o       : out std_logic_vector(8 downto 0));
	END COMPONENT;
	
	COMPONENT DEBOUNCER
		PORT (button, enable, reset, clock   : in std_logic;
				button_o : out std_logic);
	END COMPONENT;
	
	COMPONENT COLLISION
		port(x_dir   : in std_logic;
     y_dir   : in std_logic;
     x_pos   : in std_logic_vector(11 downto 0);
     y_pos   : in std_logic_vector(8 downto 0);
     bat_pos : in std_logic_vector(8 downto 0);
     change  : out std_logic);
	END COMPONENT;
	
	SIGNAL x_pos, bat_pos_x 	: std_logic_vector(11 downto 0);
	SIGNAL y_pos, bat_pos_y 	: std_logic_vector(8 downto 0);
	SIGNAL s_user, s_sys			: std_logic_vector(7 downto 0);
	SIGNAL s_12MHz_clock			: std_logic;
	SIGNAL s_reset					: std_logic;
	SIGNAL s_kick_ass, s_en		: std_logic;
	SIGNAL s_dir_x					: std_logic;
	SIGNAL dir_x, dir_y			: std_logic;
	SIGNAL s_over, s_change 	: std_logic;
	SIGNAL s_button_down, s_button_up, z_button_down, z_button_up: std_logic;
BEGIN
	s_12MHz_clock <= clock;
	s_reset <= NOT(n_reset);
	s_en <= s_kick_ass AND NOT(s_over);
	user <= s_user;
	sys <= s_sys;
	bat_pos_x <= "010000000000";
	s_button_down <= NOT(n_button_down);
	s_button_up <= NOT(n_button_up);
	
	s_dir_x <= dir_x
					WHEN s_change = '0' ELSE
					'1'
					WHEN dir_x = '1' ELSE
					'0';
	
	display : FOR y IN 8 DOWNTO 0 GENERATE
		oneline : FOR x IN 11 DOWNTO 0 GENERATE
			playfield(y*12+x) <= (y_pos(y) AND x_pos(x)) OR (bat_pos_y(y) AND bat_pos_x(x)) ;
		END GENERATE oneline;
	END GENERATE display;
	
	bump : COLLISION
	PORT MAP(x_pos => x_pos,
				y_pos => y_pos,
				x_dir => s_dir_x,
				y_dir => dir_y,
				bat_pos => bat_pos_y,
				change => s_change);
	
	button_down : DEBOUNCER
	PORT MAP(button => s_button_down,
				enable => s_en,
				reset => s_reset,
				clock => s_12MHz_clock,
				button_o => z_button_down);
				
	button_up : DEBOUNCER
	PORT MAP(button => s_button_up,
				enable => s_en,
				reset => s_reset,
				clock => s_12MHz_clock,
				button_o => z_button_up);
	
	bat_disp : BAT
	PORT MAP(button_up => z_button_up,
				button_down => z_button_down,
				reset => s_reset,
				clock => s_12MHz_clock,
				enable => s_en,
				bat_o => bat_pos_y);

	scores : SCORE 
	PORT MAP(x_pos => x_pos,
			enable => s_en,
			reset => s_reset,
			clock => s_12MHz_clock,
			user => s_user,
			sys => s_sys,
			over => s_over);
			
	
	moveX : MOVEMENT_FULL
	GENERIC MAP(WIDTH => 12,
						INIT => "000000100000")
	PORT MAP(enable => s_en,
			ext_change => s_change,
			reset => s_reset,
			clock => s_12MHz_clock,
			pos => X_pos,
			dir_o => dir_x);
	
	moveY : MOVEMENT_FULL
	GENERIC MAP(WIDTH => 9,
						INIT => "000010000")
	PORT MAP(enable => s_en,
			ext_change => '0',
			reset => s_reset,
			clock => s_12MHz_clock,
			pos => Y_pos,
			dir_o => dir_y);
	
	clock_div : clock_divider 
	PORT MAP( clock => s_12MHz_clock,
			reset => s_reset,
			enable => s_kick_ass);

END ARCHITECTURE rtl; 

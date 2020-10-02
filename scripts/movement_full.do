vsim -t ps -gINIT="000010000" movement_full
add wave *
force reset 1 0 , 0 30
force clock 1 0 , 0 5 -repeat 10
force enable 0 0 , 1 15 , 0 25 -repeat 40
force ext_change 0 0, 1 523, 0 563 -repeat 1200
run 5000


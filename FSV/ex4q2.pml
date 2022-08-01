mtype = { coin20, coin50, soda, beer };

chan coin_channel = [1] of { mtype };
chan drink_channel = [1] of { mtype };

proctype customer(){
         do
           :: coin_channel!coin20; drink_channel?soda;
           :: coin_channel!coin50; drink_channel?beer;
        od
}

proctype vender(){
         do
           :: coin_channel?coin20; drink_channel!soda;
           :: coin_channel?coin50; drink_channel!beer;
         od
}

init { atomic { run vender(); run customer(); }}

mtype = { soda, beer };

chan coin_channel = [1] of { byte };
chan drink_channel = [1] of { mtype };

byte soda_bottles = 10, beer_bottles = 5;
int  coin_box = 0;

proctype customer(){
do
  :: coin_channel!20; drink_channel?soda;
  :: coin_channel!50; drink_channel?beer;
od
}

proctype vender(){
do
         :: ((soda_bottles > 0) && coin_channel?[20]) ->
                               coin_channel?20;
                               drink_channel!soda;
                               soda_bottles = soda_bottles-1;
                               coin_box = coin_box + 20;
         :: ((beer_bottles > 0) && coin_channel?[50]) ->
                                coin_channel?50;
                                drink_channel!beer;
                                beer_bottles = beer_bottles-1;
                                coin_box = coin_box + 50;
od }

init { atomic { run vender(); run customer(); }}

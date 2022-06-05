/*
Name: Parth Hareshbhai Saliya
Marticulation Number: 1340219
*/

mtype = {MESSAGE, ACK};
chan s2r = [2] of {mtype, bit, int};
chan r2s = [2] of {mtype, bit, int};

active proctype Sender() {
    bit sent_i, receive_i; 
    int sent_j, receive_j;
    do
        :: s2r ! MESSAGE(sent_i, sent_j) ->
            r2s ? ACK(receive_i, receive_j);
            printf("Tag_Received_in_Sender:%d", sent_j);
            if 
                :: receive_i == sent_i -> 
                    if
                        :: sent_i == 0 -> sent_i = 1;
                        :: else -> sent_i = 0;
                    fi
                    sent_j++;
                :: else 
            fi
    od
} 

active proctype Receiver() {
    bit sent_i, receive_i;
    int sent_j, receive_j;
    do
        ::  s2r ? MESSAGE(receive_i, receive_j) ->
            if
                :: sent_i != receive_i ->
                    printf("Tag_Received_in_Receiver: %d\n", receive_j);
                    sent_i = receive_i;
                :: else    
            fi
            r2s ! ACK(sent_i, sent_j);
    od
}

init {
    run Sender();
    run Receiver();
}
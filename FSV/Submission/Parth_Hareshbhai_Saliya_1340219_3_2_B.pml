/*
Name: Parth Hareshbhai Saliya
Marticulation Number: 1340219
*/

mtype = {MESSAGE, ACK};
chan s2r = [2] of {mtype, bit, int};
chan r2s = [2] of {mtype, bit, int};

inline unreliable_send(channel, type, tag, seqno) {
    bool loss = false;
    bool duplicate = false;
    if
        :: channel!type(tag, seqno);
        if
            :: channel!type(tag, seqno); duplicate = true;
            :: skip; 
        fi 
        :: loss = true;
    fi;
}

active proctype Sender() {
    bit sent_i, receive_i; 
    int sent_j, receive_j;
    do
        :: unreliable_send(s2r, MESSAGE, sent_i, sent_j) ->
            r2s ? ACK(receive_i, 0);
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
    int j;
    do
        ::  s2r ? MESSAGE(receive_i, j) ->
            if
                :: sent_i != receive_i ->
                    printf("Tag_Received_in_Receiver: %d\n", j);
                    sent_i = receive_i;
                :: else    
            fi
            :: unreliable_send(r2s, ACK, sent_i, 0);
    od
}

init {
    run Sender();
    run Receiver();
}
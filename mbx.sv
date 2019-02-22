class tx;

    int a;
    mailbox mbx;

    function new(mailbox mbx);
        this.mbx=mbx;
    endfunction

    task send();
        mbx.put(a);
    endtask

endclass

class rx;

    int a;
    mailbox mbx;

    function new(mailbox mbx);
        this.mbx=mbx;
    endfunction

    task recieve();
        mbx.get(a);
    endtask

endclass

class env;

    tx txh;
    rx rxh;
    mailbox mbx;

    function new();
        mbx = new();
        txh = new(mbx);
        rxh = new(mbx);
    endfunction

    task main();
        fork
            txh.send();
            rxh.recieve();
        join
        $display("data sent by tx=%d",txh.a);
        $display("data recieved by rx=%d",rxh.a);
        $finish;
    endtask

endclass

module top();
    env en;

    initial
        begin
            en=new();
            en.txh.a=20;
            en.main();
        end
endmodule

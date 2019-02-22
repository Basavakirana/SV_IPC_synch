module test();

    initial
        begin
            #10;
            fork
                begin
                    #20;
                end
                begin
                    #40;
                end
                begin
                    #30;
                end
       //     join
       //     join_any
            join_none
            $display("exit is at time=%t",$time);
       end
endmodule


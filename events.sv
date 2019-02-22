module test();

    event ev;

    initial
        begin
            $display("about to drive ctrl after 10 time units");
            #10;
            $display("ctrl is driven at time =%t",$time);
            ->ev;
        end

        initial
            begin
                $display("about to drive data");
           //     #20;
                #10;
         //       @(ev);
                wait(ev.triggered);
                $display("data is driven at time =%t",$time);
            end
endmodule

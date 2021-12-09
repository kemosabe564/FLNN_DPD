function [res] = txenable_RFSoC()

import matlab.net.*
import matlab.net.http.*
r = RequestMessage;
requrl = "http://192.168.3.1:9092/tx_enable";
res = send(r,URI(requrl));

end

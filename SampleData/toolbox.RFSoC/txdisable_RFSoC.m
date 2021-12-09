function [res] = txdisable_RFSoC()

import matlab.net.*
import matlab.net.http.*
r = RequestMessage;
requrl = "http://192.168.3.1:9092/tx_disable";
res = send(r,URI(requrl));

end

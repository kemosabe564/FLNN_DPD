function [res] = setPhaseOffset_RFSoC(phase)

import matlab.net.*
import matlab.net.http.*
r = RequestMessage;
url = "http://192.168.3.1:9092/phase_offset/";
requrl = strcat(url,int2str(phase));
res = send(r,URI(requrl));

end

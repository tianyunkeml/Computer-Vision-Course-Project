testMax = max(S_step2);
testMin = min(S_step2);
testM = (S_step2-testMin)/(testMax-testMin);
testOut = testM(sp_pixel);
testOut = 1-testOut;
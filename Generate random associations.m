
for L = 1:1 %determines the number of samples you want to generate. For 2 samples L=1:2, for 3 samples L=1:3, etc
    
    rng('shuffle'); %makes sure that the randi numbers are trully random every time
    [rew,STA,AP] = Main(2,5,[randi([1 2]),randi([1 2]),randi([1 2]),randi([1 2]),randi([1 2])],1,"location.csv") %calls function from marc's code. Mapping is based on location.csv. If location.csv doesn't exist then it's random
    for K= 1:5 % this value changes based on the number of APs. For 7 APs K =1:7, for 8 APs K = 1:8, etc 
        if K==1
            inp = STA(K).associated_AP
            INPT = array2table(inp)
            INTT = INPT
        end
        inp = STA(K).associated_AP
        INPT = array2table(inp)
        INTT = [INTT ; INPT]

    end
    INTT([1],:) = [];
    INTTI = table2array(INTT)
    INTT = array2table(INTTI')
    Assoc = table2array(INTT)

    dlmwrite ('Associationsnew.csv', Assoc, 'delimiter',',', '-append');%saves associations in a CSV
    dlmwrite ('Rewardsnew.csv', rew, 'delimiter',',', '-append'); %Saves rewards in a CSv
end
clear
clc
%this code DOES NOT keep track of participant number, add it if it is
%needed
%c1s, c2s, and c3s keep track of how many participants are in each condition. It is also there to keep things 
%’pretty’ in the data and avoid blank spots. Add or remove these for more or less conditions 
c1s =1; %condition 1 
c2s = 1; %condition 2
c3s = 1; %condition 3
participants  = 5; %change for number of participants 
trials = 30; %change for number of trials
for doc=1:participants
    for j=1:trials
        x = strcat('Participant', int2str(doc), '.xls');
        t = readtable(x);
        a = table2array(t(j,2));
        switch a %if you want more or less conditions, add or remove cases, coping the code under 
        %case 1, and changing the numbers to accommodate the new cases 
            case 1 %condition 1
            %have this go to the number of trials in the experiment
            condition1.piNum(c1s, 1) = t{j, 4};
            if char(t{j, 5}) == 'Y' || char(t{j, 5}) == 'y'
            condition1.response(c1s, 1) = 1;
            elseif char(t{j,5}) == 'N'|| char(t{j, 5}) == 'n'
            condition1.response(c1s, 1) = 0;
            end
            c1s = 1 + c1s; %upticks number of people in the condition 
            case 2 %condition 2
            condition2.piNum(c2s, 1) = t{j, 4};
            if char(t{j, 5}) == 'Y' || char(t{j, 5}) == 'y'
            condition2.response(c2s,1) = 1;
            elseif char(t{j,5}) == 'N'|| char(t{j, 5}) == 'n'
            condition2.response(c2s,1) = 0;
            end
            c2s = 1 + c2s; %upticks number of people in the condition 
            case 3 %condition 3          
            condition3.piNum(c3s,1) = t{j, 4};
            if char(t{j, 5}) == 'Y' || char(t{j, 5}) == 'y'
            condition3.response(c3s,1) = 1;
            elseif char(t{j,5}) == 'N'|| char(t{j, 5}) == 'n'
            condition3.response(c3s,1) = 0;
            end
            c3s = 1 + c3s; %upticks number of people in the condition 
        end
    end
end

condition1Avg = conditionAvg(condition1);
condition2Avg = conditionAvg(condition2);
condition3Avg = conditionAvg(condition3);
piNum = [.9; 1; 1.1];

hold on
xlabel('Pi Number');
ylabel('Response Average');
plot(piNum, condition1Avg);
plot(piNum, condition2Avg);
plot(piNum, condition3Avg);
legend('Condition 1', 'Condition 2', 'Condition 3');
hold off

function avg = conditionAvg(struct) %function that computes the avg of each pi num

ctable = struct2table(struct);
pi1 = 0;
uptick1 = 0;
pi2 = 0;
uptick2 = 0;
pi3 = 0;
uptick3 = 0;
for i=1:50
    if table2array(ctable(i,1)) == .9
        pi1 = pi1 + table2array(ctable(i,2));
        uptick1 = uptick1 + 1;
    elseif table2array(ctable(i,1)) == 1
        pi2 = pi2 + table2array(ctable(i,2));
        uptick2 = uptick2 + 1;
    elseif table2array(ctable(i,1)) == 1.1
        pi3 = pi3 + table2array(ctable(i,2));
        uptick3 = uptick3 + 1;
    end
end

pi1 = pi1 / uptick1;
pi2 = pi2 / uptick2;
pi3 = pi3 / uptick3;
avg = [pi1; pi2; pi3];

return
end


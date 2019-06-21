clear
clc
c1s = 1;
for i=1:6 %have this go to the number of participants in the experiment
    x = strcat('Participant', num2str(i), '.xls');
    t = readtable(x)
    for j=1:10
       y= table2cell(t(j, 4));
        if y > 1
            condition1.piNum(1,j) = 1;
        elseif y < 1
            condition1.piNum(1,j) = 2;
        elseif t(4,j) == 1
                    condition.piNum(1,j) = 3;
        end
    end
end


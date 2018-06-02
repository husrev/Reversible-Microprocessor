clearvars -all
clc
fileID = fopen('testbench/rd32m.real');
circuitdata = textscan(fileID,'%1c%2u8 ');
fclose(fileID);
lines = 4;
num_inputs = 1000;
numberoftries = 100;
truthvector = decimalToBinaryVector(0:2^lines-1);
% If lines >> 10, it is impractical to try all the
%  truth table. Insted, use the following line
% truthvector = rand([num_inputs lines])>0.5;
for i=1:size(truthvector,1)
    x = truthvector(i,:);
    for j = 1:length(circuitdata{1})            
        if(circuitdata{1}(j) == 't')
            control = 1;
            s = j+1;
            while(circuitdata{1}(s) == 'a' || circuitdata{1}(s) == 'x')
                if(x(circuitdata{2}(s)) == 0 && (s ~= j+circuitdata{2}(j)) )
                    control = 0;
                end                 
                s = s+1;
                if s == length(circuitdata{1})+1
                    break
                end
            end
            if(control == 1)
                x(circuitdata{2}(j+circuitdata{2}(j))) = ~x(circuitdata{2}(j+circuitdata{2}(j)));
            end
        end
    end
    outputvector(i,:) = x;
end
%% Now we calculated the desired configuration.
% Let's find the defected output
clearvars  -except outputvector truthvector lines circuitdata numberoftries c1 c2 c3 c4 c5
clc
e=zeros(1,numberoftries);
for it = 1:numberoftries
    it
    erroutputvector = zeros(size(outputvector));
    errors = zeros(1,size(truthvector,1));
    while 1
        defect = randperm(length(circuitdata{1})) > (length(circuitdata{1})-1);
        [M,I] = max(defect);
        if circuitdata{1}(I) ~= 't'
            break
        end
    end
    for i=1:size(truthvector,1)
        x = truthvector(i,:);
        for j = 1:length(circuitdata{1})            
            if(circuitdata{1}(j) == 't')
                control = 1;
                s = j+1;
                while(circuitdata{1}(s) == 'a' || circuitdata{1}(s) == 'x')
                    if(x(circuitdata{2}(s)) == 0 && (s ~= j+circuitdata{2}(j)) )
                        control = 0;
                    end                 
                    s = s+1;
                    if s == length(circuitdata{1})+1
                        break
                    end
                end
                if(control == 1)
                    x(circuitdata{2}(j+circuitdata{2}(j))) = ~x(circuitdata{2}(j+circuitdata{2}(j)));
                end      
                x(circuitdata{2}(j+circuitdata{2}(j))) = xor(x(circuitdata{2}(j+circuitdata{2}(j))),defect(j));
            end
            if(circuitdata{1}(j) == 'a' || circuitdata{1}(j) == 'x')
                x(circuitdata{2}(j)) = xor(x(circuitdata{2}(j)),defect(j));
            end       
        end
        erroutputvector(i,:) = x;
    end

    for n=1:size(outputvector,1)
        errors(n) = sum(xor(outputvector(n,:),erroutputvector(n,:)));
    end
%     for m=1+(it-1)*size(truthvector,1):it*size(truthvector,1)
%         e(m) = transpose(errors);
%     end
    e(1+(it-1)*size(truthvector,1):it*size(truthvector,1)) = transpose(errors);
end
hist(e)
% Single average error percentage
sum(e<1.01)/(numberoftries*size(truthvector,1))
% Single or double average error percentage
sum(e<2.01)/(numberoftries*size(truthvector,1))
% Up to three average error percentage
sum(e<3.01)/(numberoftries*size(truthvector,1))

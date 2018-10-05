% author: Simone Bystadhagen
% purpose: Converting a binary number to decimal 
% comment: very useful for learning binary. The argument is
%          a list containing either 0's og 1's


function number = binary2num(binary)
n=length(binary);
    if sort(unique(binary))~=[0,1]
        error('Not a binary number')
    end
decoder=zeros(1,n);  
exp=0;
    for i = 1:n
        decoder(i)=2^exp;
        exp=exp+1;
    end
decoder=fliplr(decoder);
number=sum(decoder.*binary);
end

% author: Simone Bystadhagen
% purpose: Encrypt a word using Caesar encryption. 
% comment: correct spelling is apparently not one of my skills

function result = ceasar(word,step)
word=lower(word);
ord=ones(1,length(word));
for i = 1:length(word)
    if isletter(word(i))==1
        encrypt = mod(8+char((word(i)) + step-1), 26); 
        word(i) = char(encrypt+97);
        ord(i)=word(i);
    else
        ord(i)=word(i);
    end
    
    end
result=word;
end

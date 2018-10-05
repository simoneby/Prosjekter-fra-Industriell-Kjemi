function winner = check4winnerO(board)
for i = 1:3
    if board (i,:) == ['|','O','|','O','|','O','|'] 
        winner = true;
        return
    else
        winner = false;
    end  
end    
for i = 2:2:6
    if board (:,i) == ['O';'O';'O'] 
        winner = true;
        return
    else
        winner = false;
    end
if board(1,2)=='O' && board(2,4)=='O' && board(3,6)=='O'
    winner=true;
    return
else
    winner=false;
end   
if board(1,6)=='O' && board(2,4)=='O' && board(3,2)=='O'
    winner=true;
    return
else
    winner=false;
end  
end    
end

function winner = check4winnerX(board)
for i = 1:3
    if board (i,:) == ['|','X','|','X','|','X','|'] 
        winner = true;
        return
    else
        winner = false;
    end  
end    
for i = 2:2:6
    if board (:,i) == ['X';'X';'X'] 
        winner = true;
        return
    else
        winner = false;
    end
if board(1,2)=='X' && board(2,4)=='X' && board(3,6)=='X'
    winner=true;
    return
else
    winner=false;
end   
if board(1,6)=='X' && board(2,4)=='X' && board(3,2)=='X'
    winner=true;
    return
else
    winner=false;
end  
end    
end

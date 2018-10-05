% author: Simone Bystadhagen
% purpose: TicTacToe game! 
% comment: First game i ever made, nostalgic looking back

function move = TicTacToe()
board=['|',' ','|',' ','|',' ','|';'|',' ','|',' ','|',' ','|';'|',' ','|',' ','|',' ','|'];
player1 = input('Spiller nr.1 ','s');
player2 = input('Spiller nr.2 ','s');
fprintf('%s og %s spiller!\n\n', player1, player2) 
for i = 1:9
    if (i/2) == round(i/2)
        fprintf('Spiller %s sin tur!\n', player2)
    else
        fprintf('Spiller %s sin tur!\n', player1)
    end
    if i == 1
    disp(board)
    end
    x = input('Rad: ');
    y = input('Kolonne: ');
    if x > 3 || x < 1 || y > 3 || y < 1
        error('ikke en del av brettet')
    end
    y=y*2;
    if (i/2) == round(i/2) 
        if board(x,y)~=' '
            error('plassen er okkupert')
        end
        board(x,y)='X'
    else
        if board(x,y)~=' '
            error('plassen er okkupert')
        end
        board(x,y)='O'
    end
        if check4winnerO(board)==1
            fprintf('GRATULERER %s vant!\n', player1)
            return;
        end
        if check4winnerX(board)==1
            fprintf('GRATULERER %s vant!\n', player2)
            return;
        end
end
if check4winnerX(board)== 0 && check4winnerO(board)==0
    disp('Det ble uavgjort, pr?v igjen!')
end    
 end    



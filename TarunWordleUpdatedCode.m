while true
%-------------------------------------------------------Colton
clc
clear
close
grey_a=1;
grey_b=2;
grey_c=3;
grey_d=4;
grey_e=5;
grey_f=6;
grey_g=7;
grey_h=8;
grey_i=9;
grey_j=10;
grey_k=11;
grey_l=12;
grey_m=13;
grey_n=14;
grey_o=15;
grey_p=16;
grey_q=17;
grey_r=18;
grey_s=19;
grey_t=20;
grey_u=21;
grey_v=22;
grey_w=23;
grey_x=24;
grey_y=25;
grey_z=26;
yellow_a=27;
yellow_b=28;
yellow_c=29;
yellow_d=30;
yellow_e=31;
yellow_f=32;
yellow_g=33;
yellow_h=34;
yellow_i=35;
yellow_j=36;
yellow_k=37;
yellow_l=38;
yellow_m=39;
yellow_n=40;
yellow_o=41;
yellow_p=42;
yellow_q=43;
yellow_r=44;
yellow_s=45;
yellow_t=46;
yellow_u=47;
yellow_v=48;
yellow_w=49;
yellow_x=50;
yellow_y=51;
yellow_z=52;
green_a=53;
green_b=54;
green_c=55;
green_d=56;
green_e=57;
green_f=58;
green_g=59;
green_h=60;
green_i=61;
green_j=62;
green_k=63;
green_l=64;
green_m=65;
green_n=66;
green_o=67;
green_p=68;
green_q=69;
green_r=70;
green_s=71;
green_t=72;
green_u=73;
green_v=74;
green_w=75;
green_x=76;
green_y=77;
green_z=78;
blank_border=79;
blanknoborder=80;
enter=81;
backspace=82;
white_a=83;
white_b=84;
white_c=85;
white_d=86;
white_e=87;
white_f=88;
white_g=89;
white_h=90;
white_i=91;
white_j=92;
white_k=93;
white_l=94;
white_m=95;
white_n=96;
white_o=97;
white_p=98;
white_q=99;
white_r=100;
white_s=101;
white_t=102;
white_u=103;
white_v=104;
white_w=105;
white_x=106;
white_y=107;
white_z=108;
firstscene=simpleGameEngine('Wordlesprites2.png',16,16,4,[255,255,255]);
blankboard=[80,80,80,80,80,80,80,80,80,80,80,80,80              
    80,green_w,80,80,79,79,79,79,79,80,80,80,80
    80,grey_o,80,80,79,79,79,79,79,80,80,80,80
    80,green_r,80,80,79,79,79,79,79,80,80,80,80
    80,yellow_d,80,80,79,79,79,79,79,80,80,80,80
    80,grey_l,80,80,79,79,79,79,79,80,80,80,80
    80,green_e,80,80,79,79,79,79,79,80,80,80,80
    80,80,80,80,80,80,80,80,80,80,80,80,80
    80,80,white_q,white_w,white_e,white_r,white_t,white_y,white_u,white_i,white_o,white_p,80
    80,80,white_a,white_s,white_d,white_f,white_g,white_h,white_j,white_k,white_l,80,80
    80,80,enter,white_z,white_x,white_c,white_v,white_b,white_n,white_m,backspace,80,80];

Wordle_answers=readtable("DictionaryWordleanswer.xlsx");
Wordle_guess=readtable("WordleGuesslist.xlsx");

%while true %Main code inside while statement for auto play
Guesslistwords=Wordle_guess{:,1};
Guesslist=char(Guesslistwords);
Guessliststring=string(Guesslist);
numrows=height(Wordle_answers);
randomindex=randperm(numrows,1);
randomword=Wordle_answers{randomindex,1};
secretword=char(randomword);
%fprintf('The secret word is: %s\n', secretword);
maxattempts = 6;%maximum amounts of attempts
wordLength = strlength(secretword);
charAnswer=secretword(1:end);
attempts = 0; % counter for attempts
drawScene(firstscene,blankboard)
set(gcf,'WindowStyle','docked')%doc window of blankboard
while attempts < maxattempts 
    %-------------------------------------------------------------------------------Andre
    guess1 = input('Enter your 5-letter guess of the secret word: ', 's'); %guess1 is the input word
    guess=string(guess1);%convert word to string
    % If user enters a word that has an upper case letter anywhere in the
    % word it will change the word to all lower case letters so it can see
    % if the word is in the dictonary
    if any(isstrprop(guess, 'upper'))
        guess = lower(guess);
        guess1 = lower(guess1);
    end    
   ispresent=ismember(guess,Guessliststring);%true/false for if guess is in the guesslist string
   if ispresent
       fprintf('Nice guess!\n') %if word is in string, good guess
   elseif strlength(guess1) ~= wordLength %if guess is more or less than 5 characters long invalid guess and try again
        fprintf('Invalid guess length. Please enter a %d-letter word.\n', wordLength); 
        continue;
   else
       fprintf('Not in word list, try again\n') % if not, tries again
 continue;
   end
    %------------------------------------------------------------------------------------------------------Tarun
    % Tracks the number of attemps the user has made 
    attempts = attempts + 1;
    % Creates an array of "- - - - -" which are place holders for the
    % feedback
    feedback = repmat('-', 1, wordLength); 
    
    % Loops through the whole word so we can determine the feedback for
    % each word
    for i = 1:wordLength 
        % Checks if each letter is in the correct position
        if guess1(i) == secretword(i)
            feedback(i) = guess1(i); % If letter is in the correct position 
                                     % it will change the "-" in the position 
                                     % it was guessed in feedback to the letter
        elseif contains(secretword, guess1(i))
            feedback(i) = '*'; % If the letter is in the secretWord but in the 
                               % wrong position it will change the change the "-" 
                               % in the position it was guessed in feedback
                               % to a "*"

        % If the letter is not in the secret word it will not change that 
        % specific position in feedback and will keep it as a "-"                       
        end
    end
    % Prints the feedback with all the changes
    fprintf('Feedback: %s\n', feedback);
    %-------------------------------------------------------------------------------------------------------Jackson
    keyboard =struct('q', [9, 3], 'w', [9, 4], 'e', [9, 5], 'r', [9, 6], 't', [9, 7], 'y', [9, 8], 'u', [9, 9], 'i', [9, 10], 'o', [9, 11], 'p', [9, 12],'a', [10, 3], 's', [10, 4], 'd', [10, 5], 'f', [10, 6], 'g', [10, 7], 'h', [10, 8], 'j', [10, 9], 'k', [10, 10], 'l', [10, 11],'z', [11, 4], 'x', [11, 5], 'c', [11, 6], 'v', [11, 7], 'b', [11, 8], 'n', [11, 9], 'm', [11, 10]);
     %using structure function to assign each letter to a position on the
     %keyboard
for letter = 'a':'z' 
    keyposition=keyboard.(letter); %get the letter array from  keyboard
    greensprite = eval(['green_' letter]);%greensprite = the #value of green_'whatever letter is being evaluated' ie 53 for green_a
    yellowsprite = eval(['yellow_' letter]);%same things for yellow and grey
    greysprite = eval(['grey_' letter]);
    targetrow = 1 + attempts; % Start at row 2 and go up based on attempts
    
    if guess1(1:1) == charAnswer(1:1) && guess1(1:1) == letter %if first letter of word = first letter of secret word and the first letter is in the letterbank 'a':'z'
        blankboard(targetrow, 5) = greensprite; %the targetrow and first letter of the word (5 because thats the x value of tile 1)
 
          blankboard(keyposition(1),keyposition(2))=greensprite; %blank board turns to green sprite based on the location of the letter in the "keyboard"
       
    elseif ismember(guess1(1:1), charAnswer(1:5)) && guess1(1:1) == letter %if word has the letter in it but wrong place make blankboard for that tile yellow
        blankboard(targetrow, 5) = yellowsprite;  
      
            blankboard(keyposition(1),keyposition(2))=yellowsprite; %board turns green from location on keyboard
        
    elseif guess1(1:1) == letter && ~ismember(guess1(1:1), charAnswer(1:5)) %if the letter is not a member of the secret word tile is grey
        blankboard(targetrow, 5) = greysprite;
            blankboard(keyposition(1),keyposition(2))=greysprite;
    end
    
    if guess1(2:2) == charAnswer(2:2) && guess1(2:2) == letter %same deal for every letter in guessed word
        blankboard(targetrow, 6) = greensprite;
        
           blankboard(keyposition(1),keyposition(2))=greensprite;
        
    elseif ismember(guess1(2:2), charAnswer(1:5)) && guess1(2:2) == letter
        blankboard(targetrow, 6) = yellowsprite;
       
         blankboard(keyposition(1),keyposition(2))=yellowsprite;
       
    elseif guess1(2:2) == letter && ~ismember(guess1(2:2), charAnswer(1:5))
        blankboard(targetrow, 6) = greysprite;
         blankboard(keyposition(1),keyposition(2))=greysprite;
    end
    
    if guess1(3:3) == charAnswer(3:3) && guess1(3:3) == letter
        blankboard(targetrow, 7) = greensprite;
       
        blankboard(keyposition(1),keyposition(2))=greensprite;
      
    elseif ismember(guess1(3:3), charAnswer(1:5)) && guess1(3:3) == letter
        blankboard(targetrow, 7) = yellowsprite;
        
         blankboard(keyposition(1),keyposition(2))=yellowsprite;
     
    elseif guess1(3:3) == letter && ~ismember(guess1(3:3), charAnswer(1:5))
        blankboard(targetrow, 7) = greysprite;
         blankboard(keyposition(1),keyposition(2))=greysprite;
    end
   
    if guess1(4:4) == charAnswer(4:4) && guess1(4:4) == letter
        blankboard(targetrow, 8) = greensprite;
       
        blankboard(keyposition(1),keyposition(2))=greensprite;
        
    elseif ismember(guess1(4:4), charAnswer(1:5)) && guess1(4:4) == letter
        blankboard(targetrow, 8) = yellowsprite;
        
         blankboard(keyposition(1),keyposition(2))=yellowsprite;
        
    elseif guess1(4:4) == letter && ~ismember(guess1(4:4), charAnswer(1:5))
        blankboard(targetrow, 8) = greysprite;
         blankboard(keyposition(1),keyposition(2))=greysprite;
    end
    
    if guess1(5:5) == charAnswer(5:5) && guess1(5:5) == letter
        blankboard(targetrow, 9)= greensprite;
        
        blankboard(keyposition(1),keyposition(2))=greensprite;

    elseif ismember(guess1(5:5), charAnswer(1:5)) && guess1(5:5) == letter
        blankboard(targetrow, 9) = yellowsprite;
        
         blankboard(keyposition(1),keyposition(2))=yellowsprite;
        
    elseif guess1(5:5) == letter && ~ismember(guess1(5:5), charAnswer(1:5))
        blankboard(targetrow, 9) = greysprite;
         blankboard(keyposition(1),keyposition(2))=greysprite;
    end  
end
    close % close to reopen new scene after every guess
    drawScene(firstscene,blankboard) % draws scene after every new guess
    set(gcf,'WindowStyle','docked')%dock window to matlab scree (quality of life)
    %--------------------------------------------------------------------------------Tarun
    % Compares what the user guessed to the secret word
    if strcmp(guess1, secretword)
        % If guessed word is same as secret word it will congraduate the
        % user and leaves the program
        fprintf('Congratulations! You guessed the word in %d attempts.\n', attempts);
        break;
    else
        % If it the guessed word isn't the same then it will tell the user
        % how many attempts they have left
        fprintf('Attempts remaining: %d\n', maxattempts - attempts);
    end

% Updates the graphics
drawScene(firstscene,blankboard)

% If the user ran out of attempts and still didn't guess the secret word
% then it will tell the user the game is over and will leave the program
if attempts == maxattempts && ~strcmp(guess1, secretword)
    fprintf('Game Over! The correct word was: %s\n', secretword);
end
end
%-------------------------------------------------------Vinayak
if ~askToPlayAgain(firstscene)
    fprintf('Thanks for playing! Goodbye.\n');
    pause(3);
    break;
else
    fprintf('Let''s play again!\nGive me second to think of a word\n');
    pause(3); 
    clc
    clear
end
end

function playAgain = askToPlayAgain(scene)

fprintf('Press the space bar to play again or click escape button to quit.\n');

while true
    key = getKeyboardInput(scene);

    if strcmp(key, 'space')
        playAgain = true;
        break;
    
    elseif strcmp(key, 'escape')
        playAgain = false;
        break;
    else 
        fprintf('Invalid Input, Press the space bar to play again or click escape button to quit.\n ')
    end
end
end
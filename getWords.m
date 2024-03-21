function terms = getWords(txtDocument, removeCommonWords)
% This function receives as input txt documents, and and boolean condition for deleting 
% common English words. It will return a list of words as a column string array.
%
%       txtDocuments = A vector of strings or a character array of document names
%  removeCommonWords = A boolean that controls whether or not to remove common words
% 
% @author Jarren Ralf

NUM_CHAR = 3204;     % The number of charcters in the common_words.txt document
MAX_NUM_CHAR = 5000; % The max number of charcters to read into the matrix (Arbitrary)
fileID = fopen(txtDocument, 'r', 'n', 'UTF-8'); % Read in .txt file as a character array
termsMTX = fread(fileID, [1 MAX_NUM_CHAR], '*char');
termsMTX = string(termsMTX);     % Convert character array to string array
termsMTX = splitlines(termsMTX); % Split strings at newline characters
TF = (termsMTX == "");           % Find blank strings of text ...
termsMTX(TF) = [];               % ... and remove them
% Replace unwanted charaters with spaces i.e. punctuation and numbers
p = ["." "?" "!" "," ";" ":" "%" "(" ")" "[" "]" "=" "+" "-" "?" "/" "'" 0:9];
termsMTX = replace(termsMTX, p, " ");
% Strip leading and trailing blank space characters from each element
termsMTX = strip(termsMTX); 
terms = strings(0); % Strip the strings to individual words and store in column vector
for i = 1:length(termsMTX)
   terms = [terms ; split(termsMTX(i))];
end
% Remove the common words from the terms vector if true (chosen by the user)
if removeCommonWords == true 
fileID_CW = fopen('common_words.txt', 'r', 'n', 'UTF-8'); % Read in .txt file 
commonWords = fread(fileID_CW, [1 NUM_CHAR], '*char');    % as a character array
commonWords = string(commonWords);     % Convert character array to string array
commonWords = splitlines(commonWords); % Split strings at newline characters
% Delete the commom words from our terms vector **Notice that duplicates are kept
terms = terms(~ismember(terms, commonWords));
end
fclose('all');
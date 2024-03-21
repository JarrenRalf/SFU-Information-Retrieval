function dictionary = createDictionary(txtDocuments, removeCommonWords)
% This function accepts as input the txt documents, and boolean condition for deleting 
% common English words. The output is the dictionary as a vector of strings representing all
% words used across each of the documents.
%
%       txtDocuments = A vector of strings or a character array of document names
%  removeCommonWords = A boolean that controls whether or not to remove common words
%
% @author Jarren Ralf

d = length(txtDocuments); % The number of documents
for i = 1:d
    % Return a column vector of words that where contained in the chosen document
    terms = getWords(txtDocuments(i), removeCommonWords);
    if i == 1                               % For the first document in the list
        currentDictionary = unique(terms);  % Alphabetizes and deletes repetitive words
        if d == 1                           % If there is only 1 document ...
            dictionary = currentDictionary; % ... then return this sorted list ...
            break;                          % ... by breaking the for loop
        end
    else
        concatenatedList = [currentDictionary; terms]; 
        currentDictionary = unique(concatenatedList);
    end
end
dictionary = currentDictionary;
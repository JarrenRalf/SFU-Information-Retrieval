function message = getDocuments(query, txtDocuments, removeCommonWords, numRelDocs)
% This function accepts as input the cosine simularities and the number of relevant
% documents the user wants returned. The output is the d number of relevant documents.
% 
%              query = A vector of strings that represents the question asked
%       txtDocuments = A vector of strings or a character array of document names
%  removeCommonWords = A boolean that controls whether or not to remove common words
%         numRelDocs = The number of relevant documents the user wants returned
%
% @author Michelle Wu and Jarren Ralf

if nargin < 4       % If the user doesn't input the number of relevant articles ...
    numRelDocs = 0; % ... then return all of them, "mostRelevantDocument" will handle this
end
query = split(string(query));                       % Make the query a vector of strings
dictionary = createDictionary(txtDocuments, removeCommonWords);     % Create the dictionary
td = createTermDocMtx(dictionary, txtDocuments, removeCommonWords); % Build the td matrix
q = getQueryVector(query, dictionary);              % Compute the numerical query vector
cosSim = simmilarityValue(td, q);                   % Calculate the cosine similarity
message = mostRelevantDocument(cosSim, numRelDocs); % Output the relevant documents
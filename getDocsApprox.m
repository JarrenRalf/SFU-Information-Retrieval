function message = getDocsApprox(query, txtDocuments, removeCommonWords, k, numRelDocs)
% This function accepts as input the cosine simularities and the number of relevant
% documents the user wants returned. The output is the d number of relevant documents.
% 
%              query = A vector of strings that represents the question asked
%       txtDocuments = A vector of strings or a character array of document names
%  removeCommonWords = A boolean that controls whether or not to remove common words
%                  k = An integer that represents the rank-k approximation to the td matrix
%         numRelDocs = The number of relevant documents the user wants returned
%
% @author Michelle Wu and Jarren Ralf

if nargin < 5          % If the user doesn't input the number of relevant articles ...
    if nargin < 4
        k = ceil(length(txtDocuments)/2);
    end
    numRelDocs = 0; % ... then return all of them, "mostRelevantDocument" will handle this
end

query = split(string(query)); % Make the query a vector of strings
dictionary = createDictionary(txtDocuments, removeCommonWords);     % Create the dictionary
td = createTermDocMtx(dictionary, txtDocuments, removeCommonWords); % Build the td matrix
q = getQueryVector(query, dictionary); % Set up the query vector
cosSim = simmilarityValueSVD(td, q, k); % Calculate the cosine similarity
message = mostRelevantDocument(cosSim, numRelDocs);
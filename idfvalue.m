function idfValues = idfvalue(termDocumentMatrix)
% This function accepts as input the Term Document Matrix. The output is a vector of the 
% idfValues corresponding to each term.
% 
% termDocumentMatrix = numerical term-document (td) matrix where
% 
% @author Michelle Wu amd Jarren Ralf

[d, t] = size(termDocumentMatrix); % The number of documents, d, and the number of terms, t
totalFrequency = sum(termDocumentMatrix); % Calculate the total frequency for each term 
idfValues = log2(d./(totalFrequency));    % Calculate the idf values 
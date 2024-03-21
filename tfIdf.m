function tfScoreMatrix = tfIdf(termDocumentMatrix)
% This function accepts as input the term-document Matrix. The output is a matrix of the 
% idfValues in their corresponding position in the td matrix.
% 
%     termDocumentMatrix = numerical term-document matrix
%
% @author Michelle Wu and Jarren Ralf

idfValues = idfvalue(termDocumentMatrix);
tfScoreMatrix = termDocumentMatrix.*idfValues;
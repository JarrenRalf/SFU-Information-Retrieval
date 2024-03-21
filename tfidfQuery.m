function tfidfQuery = tfidfQuery(termDocumentMatrix, query)
% This function accepts as input the term-document matrix and a query vector. The output is 
% the Query vector with the idf values applied to it.
%
%     termDocumentMatrix = Numerical term-document matrix
%                  query = Numerical query vector
%
% @author Michelle Wu and Jarren Ralf

idfValues = idfvalue(termDocumentMatrix);  % Apply the idf values to the td matrix
tfidfQuery = query.*idfValues'/max(query); % Apply the idf values to the query vector
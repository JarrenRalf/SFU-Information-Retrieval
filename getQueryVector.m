function q = getQueryVector(query, dictionary)
% This function receives as input a query vector and dictionary vector of strings. The 
% output is a numerical query vector which places a 1 the ith position corresponding to the
% ith word in the dictionary.
%
%              query = A vector of strings that represents the question asked
%         dictionary = A vector of strings (all words used across each of the documents)
%
% @author Jarren Ralf

% i is the index in the dictionary which each string of the query vector belongs
[C,i] = intersect(dictionary, query);
j = ones(length(i), 1);               % Column: 1
v = ones(length(i), 1);               % Entry:  1
q = sparse(i, j, v);                  % Build sparse query vector
q(end + 1:length(dictionary), 1) = 0; % Append zeros so it is the correct length
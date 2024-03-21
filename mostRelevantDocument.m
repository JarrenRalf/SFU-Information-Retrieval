function str = mostRelevantDocument(cosSim, d)
% This function accepts as input the cosine simularities and the number of relevant
% documents the user wants returned. The output is the d number of relevant documents.
% 
%    cosSim = A vector of doubles representing the cosine similarities of the documents
%         d = The number of relevant documents the user wants returned
%
% @author Michelle Wu and Jarren Ralf

[~, Index] = sort(cosSim, 'descend');
if any(isnan(cosSim))                 % If none of the query words are in the dictionary
    str = newline + "No results found. Please ask another question." + newline;
    disp(str);
    return 
end
if d == 0          % If the user doesn't input the number of relevant articles ...
    d = length(Index); % ... then return all of them.
end
str = "The most relevent " + num2str(d) + " documents are:" + newline;
for i = 1:d
    str = str + strcat("document ", num2str(Index(i))) + newline;
end
disp(str);
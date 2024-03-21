function td = createTermDocMtx(dictionary, txtDocuments, removeCommonWords)
% This function accepts as input the dictionary, txt documents, and boolean condition for 
% deleting common English words. The output is a numerical term-document (td) matrix where
% td_{ij} is the frequency of the jth term occuring in the ith document.
%
%         dictionary = A vector of strings (all words used across each of the documents)
%       txtDocuments = A vector of strings or a character array of document names
%  removeCommonWords = A boolean that controls whether or not to remove common words
%
% @author Jarren Ralf

d  = length(txtDocuments); % The number of documents
t  = length(dictionary);   % The number of terms
td = sparse(d, t);         % Preallocate the sparse td matrix
for i = 1:d                % Loop through all of the documents
    terms = getWords(txtDocuments(i), removeCommonWords); 
    % Place a set of ones in row i to represent the occurences of term j
    td(i, :) = getQueryVector(terms, dictionary)';
       uniqueTerms = unique(terms);       % Retrieve the unique terms
    numUniqueTerms = length(uniqueTerms); % The number of unique terms
    freq = ones(1, numUniqueTerms);       % Preallocate the frequency vector
    % Compute the frequency
    for k = 1:numUniqueTerms
        freq(k) = sum(ismember(terms, uniqueTerms(k, :)));
    end
    counter = 1;                                % Initialize a counter
    numRepetitiveWords = sum(freq(:) > 1);      % Total number of repetitive words
    freq_max  = max(freq);                      % The maximum frequency
    freq_list = strings(numRepetitiveWords, 1); % The list of repetitive words
    freq_vals =    ones(numRepetitiveWords, 1); % The list of frequencies 
    % Store only the repetitive terms and their corresponding frequencies
    for j = 1:numUniqueTerms
        if freq(j) > 1
            freq_list(counter) = uniqueTerms(j);
            freq_vals(counter) = freq(j);
            counter = counter + 1;
        end
    end
    % Update the frequencies of the occurences of words in row i of the td matrix
    for f = 1:freq_max - 1 % These are the cases where a term occurs > 1 times
        [r, c] = find(freq_vals > f); % f is the frequency of a word occuring
        td(i, :) = td(i, :) + getQueryVector(freq_list(r), dictionary)'; % Update row
    end
end
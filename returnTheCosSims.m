% Prepare the text documents for input
txtDocuments = strings(9, 1);
for i = 1:9
    txtDocuments(i) = strcat("TestCase/", num2str(i), ".txt");
end
query = split(string(query)); % Make the query a vector of strings
removeCommonWords = false; % Keep the common words
dictionary = createDictionary(txtDocuments, removeCommonWords);     % Create the dictionary
td = createTermDocMtx(dictionary, txtDocuments, removeCommonWords); % Build the td matrix
idfValues = idfvalue(td);  % Calculate the idf values
tfScoreMatrix = tfIdf(td); % Apply the tdIdf score
q = getQueryVector(query, dictionary); % Set up the query vector
tfidfQuery = tfidfQuery(td, q);   % Apply the tdIdf score to q vector
cosSim = simmilarityValue(td, q); % Calculate the cosine similarity
%cosSim = simmilarityValueSVD(td, dictionary, 5); % Calculate the cosine similarity
message = mostRelevantDocument(cosSim);
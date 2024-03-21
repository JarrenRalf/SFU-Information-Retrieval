clear; close all; clc;


% Try asking: the causes of mental illness?


% Choose the number of relevant documents you want return (default is all)
%numRelevantDocuments = 8;

% Choose the rank k approximation from k = 1:0
%k = 8;

% Choose your query
%query = ["the" "cause" "of" "mental" "illness"]; the causes of mental illness

% Or Type your own query
prompt = 'Please ask your question:\n';
query = input(prompt, 's');

% Prepare the text documents for input
txtDocuments = strings(9, 1);
for i = 1:9
    txtDocuments(i) = strcat("TestCase/", num2str(i), ".txt");
end

removeCommonWords = false;

tic
message1 = getDocuments(query, txtDocuments, removeCommonWords);
toc
%message = getDocuments(query, txtDocuments, removeCommonWords, numRelevantDocuments);

disp('This is the approximation using the SVD.')
disp('The default rank is ceil(d/2) (half the number of documents.)')
tic
message2 = getDocsApprox(query, txtDocuments, removeCommonWords);
toc
%message2 = getDocsApprox(query, txtDocuments, removeCommonWords, k);
%message2 = getDocuments(query, txtDocuments, removeCommonWords, numRelevantDocuments);
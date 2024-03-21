function cosSim = simmilarityValueSVD(termDocumentMatrix, query, k)
% This function accepts as input the term-document matrix and a query vector. The output is 
% a vecotr of the cosine similarity values.
%
%     termDocumentMatrix = Numerical term-document matrix
%                  query = Numerical query vector
%
% @author Michell Wu

[d, t] = size(termDocumentMatrix); % The number of documents, d, and the number of terms, t
tfScoreMatrix = full(tfIdf(termDocumentMatrix)); 
[U, S, V] = svd(tfScoreMatrix);
tfScoreMatrixSVD = zeros(size(tfScoreMatrix));
for i = 1:k
    tfScoreMatrixSVD_i = S(i,i)*U(:,i)*V(:,i)'; % Apply the rank k approximation
    tfScoreMatrixSVD = tfScoreMatrixSVD + tfScoreMatrixSVD_i;
end
tfQuery = tfidfQuery(termDocumentMatrix, query); %the final query vector
documentLength = vecnorm(tfScoreMatrix'); 
queryLength = norm(tfQuery);
cosSim = zeros(d, 1);
for i = 1:d
    total = 0;
    for  j = 1:t
        total = total +tfQuery(j)*tfScoreMatrixSVD(i, j);
    end
    cosSim(i) = total/(queryLength*documentLength(i));
end
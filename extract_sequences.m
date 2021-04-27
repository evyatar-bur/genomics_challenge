function [upstream_seq,downstream_seq] = extract_sequences(Chromosome_seq,start_position,end_position,X,Y,strand)
% This funtion extract X nt upstream to the mutation and Y nt downstream to
% the mutation 
% input: 1. Chromosome_seq - the relevant chromosome nt seqeunce as a string. 2. start_position
% - mutation start position. 3. end_position - mutation end position. 4. X
% the number of nt before the mutation. 5. Y - the number of nt after the
% mutation. 5. The strand of the relevant gene ('+' or '-').
% output - upstream and downstream sequences.

if strcmp(strand,'+')
    upstream_seq=Chromosome_seq(start_position-X:start_position-1);
    downstream_seq=Chromosome_seq(end_position+1:end_position-Y);
elseif strcmp(strand,'-')
    downstream_seq=seqrcomplement(Chromosome_seq(start_position-X:start_position-1));
    upstream_seq=seqrcomplement(Chromosome_seq(end_position+1:end_position-Y));
end

end


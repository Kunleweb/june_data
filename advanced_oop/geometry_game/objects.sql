--Window function
rank() -- assigns ranking to rows from 1 and when there is a tie it jumps to the naturally occuring next no
dense_rank() -- doesnt jump e.g 1,2,2,3
row_number() -- each row gets a uniques no

-- use partition by to assign this bs within groups

rank() over(partition by col_name) as ranked_col
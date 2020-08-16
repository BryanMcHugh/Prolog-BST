emptyBT(nil).

bTree(N, nil, nil).
bTree(N, [X|T1], [Y|T2]) :- 
	X =< N, 
	Y => N.

insert(I, nil, bTree(I, nil, nil)).
insert(I, bTree(N, T1, T2), bTree(N, T1_L, T2)) :- 
	I =< N,
	insert(I, T1, T1_L).
insert(I, bTree(N, T1, T2), bTree(N, T1, T2_R)) :- 
	insert(I, T2, T2_R).

preorder(nil, []).
preorder(bTree(N, T1, T2), L) :- 
	preorder(T1, Left), 
	preorder(T2, Right), 
	append(Left, Right, [N|L]).

inorder(nil, []).
inorder(bTree(N, T1, T2), L) :- 
	inorder(T1, Left), 
	inorder(T2, Right), 
	append(Left, [N|Right], L).

postorder(nil, []).
postorder(bTree(N, T1, T2), L) :- 
	postorder(T1, Left), 
	postorder(T2, Right), 
	append(Left, Right, List), 
	append(List, [N], L).

search(bTree(I, T1, T2), I).
search(bTree(N, T1, T2), I) :- 
	I =< N, 
	search(T1, I).
search(bTree(N, T1, T2), I) :- 
	search(T2, I).

height(nil, 0).
height(bTree(N, T1, T2), H) :- 
	height(T1, HT1), 
	height(T2, HT2), 
	HT1 =< HT2 -> H is HT2 + 1; H is HT1 + 1.
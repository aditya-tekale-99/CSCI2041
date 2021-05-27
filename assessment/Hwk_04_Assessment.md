# Hwk_04 Assessment

Run on November 13, 13:50:27 PM.

*Test results are for the code in this repository as it appeared on November 04 at 17:15 CT.*

+ Pass: Change into directory "Hwk_04".

+ Pass: Check that file "proofs.md" exists.

``Problem 1``

+  _2_ / _2_ : Pass: P1: state the base case

    

+  _2_ / _2_ : Pass: P1: state the inductive case

    

+  _2_ / _2_ : Pass: P1: state the inductive hypothesis

    

+  _2_ / _2_ : Pass: P1: state the principle of induction

    

+  _3_ / _3_ : Pass: P1: first 3 steps in the base case proof are correct

    Last step should be `prod [] * prod l2`

+  _2_ / _2_ : Pass: P1: Correct use of IH in proof of inductive case

    

+  _1_ / _1_ : Pass: P1: correct justification in this step using the inductive hypothesis

    

+  _6_ / _6_ : Pass: P1: first 3 steps other than IH part are correct

    

+ Pass: P1: Mislabeled parts?

    

``Problem 2``

+  _2_ / _2_ : Pass: P2: state the base case

    

+  _2_ / _2_ : Pass: P2: state the inductive case

    

+  _2_ / _2_ : Pass: P2: state the inductive hypothesis

    

+  _2_ / _2_ : Pass: P2: state the principle of induction

    

+  _3_ / _3_ : Pass: P2: first 3 steps in the base case proof are correct

    

+  _0_ / _2_ : Pass: P2: Correct use of IH in proof of inductive case

    Look at your IH in step 3. When you apply it in a proof it should look exactly as it does there

+  _1_ / _1_ : Pass: P2: correct justification in this step using the inductive hypothesis

    

+  _3_ / _6_ : Pass: P2: first 3 steps other than IH part are correct

    Some of your justifications are not necessarily valid. Look at the definitions of the functions and apply them directly to your proof

+ Pass: P2: Mislabeled parts?

    

``Problem 3``

+  _2_ / _2_ : Pass: P3: state the base case

    

+  _2_ / _2_ : Pass: P3: state the inductive case

    

+  _2_ / _2_ : Pass: P3: state the inductive hypothesis

    

+  _2_ / _2_ : Pass: P3: state the principle of induction

    

+  _1_ / _3_ : Pass: P3: first 3 steps in the base case proof are correct

    `map inc []` does not equal `map []` (which is invalid) and `map []` does not equal `1 + map []`

+  _2_ / _2_ : Pass: P3: Correct use of IH in proof of inductive case

    

+  _0_ / _1_ : Pass: P3: correct justification in this step using the inductive hypothesis

    You really applied your IH in the very last step, not the second to last

+  _3_ / _6_ : Pass: P3: first 3 steps other than IH part are correct

    Once again, look at the definitions of functions and apply them directly. For example, what happens when map is passed a value? `map inc(y::ys)` should become `inc y :: map inc ys`  directly from the definition of map

+ Pass: P3: Mislabeled parts?

    

``Problem 4``

+  _2_ / _2_ : Pass: P4: state the base case

    

+  _2_ / _2_ : Pass: P4: state the inductive case

    

+  _2_ / _2_ : Pass: P4: state the inductive hypothesis

    

+  _2_ / _2_ : Pass: P4: state the principle of induction

    

+  _3_ / _3_ : Pass: P4: first 3 steps in the base case proof are correct

    Showing that the LHS = RHS is important in discovering proofs, but when we are presenting them we want them to flow easily from LHS to RHS, instead of proving them both separately

+  _0_ / _2_ : Pass: P4: Correct use of IH in proof of inductive case

    IH not used in proof

+  _0_ / _1_ : Pass: P4: correct justification in this step using the inductive hypothesis

    

+  _2_ / _6_ : Pass: P4: first 3 steps other than IH part are correct

    The IH was never used in the proof, which should be the main point in inductive proofs. Also, many justifications are incorrect. Look at the definitions of functions and apply them directly. 

+ Pass: P4: Mislabeled parts?

    

``Problem 5``

+  _2_ / _2_ : Pass: P5: state the base case

    

+  _2_ / _2_ : Pass: P5: state the inductive case

    

+  _2_ / _2_ : Pass: P5: state the inductive hypothesis

    

+  _2_ / _2_ : Pass: P5: state the principle of induction

    

+  _3_ / _3_ : Pass: P5: first 3 steps in the base case proof are correct

    

+  _2_ / _2_ : Pass: P5: Correct use of IH in proof of inductive case

    

+  _1_ / _1_ : Pass: P5: correct justification in this step using the inductive hypothesis

    

+  _0_ / _6_ : Pass: P5: first 3 steps other than IH part are correct

    None of these steps are correct and do not have correct justifcations. `size (v,t1,t2)` does not equal `size t1`. You did use your IH correctly, however. 

+ Pass: P5: Mislabeled parts?

    

#### Total score: _76_ / _100_


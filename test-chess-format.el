(require 'ert)
(require 'chess-format)

(ert-deftest chess-format--swap-colours/swap-colours ()
  (let ((swapped (chess-format--swap-colours "r1bkq3/2p1n3/pp1bpB2/4N3/2NP4/6P1/PP3P1P/R1K1Q2R")))
    (should (equal swapped "r2q1k1r/p1p3pp/1p6/4pn2/3n4/2bPB1PP/3N1P2/3QKB1R"))))


(ert-deftest chess-format--invert-case-string/inverts ()
  (should (equal (chess-format--invert-case-string "PLease toggLE MY LETTER case")
                 "plEASE TOGGle my letter CASE")))

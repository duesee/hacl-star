module Lib.LoopCombinators


(**
* fold_left-like loop combinator:
* [ repeat_left lo hi a f acc == f (hi - 1) .. ... (f (lo + 1) (f lo acc)) ]
*
* e.g. [ repeat_left 0 3 (fun _ -> list int) Cons [] == [2;1;0] ]
*
* It satisfies
* [ repeat_left lo hi (fun _ -> a) f acc == fold_left (flip f) acc [lo..hi-1] ]
*
* A simpler variant with a non-dependent accumuator used to be called [repeat_range]
*)
inline_for_extraction
val repeat_left:
    lo:nat
  -> hi:nat{lo <= hi}
  -> a:(i:nat{lo <= i /\ i <= hi} -> Type)
  -> f:(i:nat{lo <= i /\ i < hi} -> a i -> a (i + 1))
  -> acc:a lo
  -> Tot (a hi) (decreases (hi - lo))

inline_for_extraction
val repeat_left_all_ml:
    lo:nat
  -> hi:nat{lo <= hi}
  -> a:(i:nat{lo <= i /\ i <= hi} -> Type)
  -> f:(i:nat{lo <= i /\ i < hi} -> a i -> FStar.All.ML (a (i + 1)))
  -> acc:a lo
  -> FStar.All.ML (a hi)

(**
* fold_right-like loop combinator:
* [ repeat_right lo hi a f acc == f (hi - 1) .. ... (f (lo + 1) (f lo acc)) ]
*
* e.g. [ repeat_right 0 3 (fun _ -> list int) Cons [] == [2;1;0] ]
*
* It satisfies
* [ repeat_right lo hi (fun _ -> a) f acc == fold_right f acc [hi-1..lo] ]
*)
val repeat_right:
    lo:nat
  -> hi:nat{lo <= hi}
  -> a:(i:nat{lo <= i /\ i <= hi} -> Type)
  -> f:(i:nat{lo <= i /\ i < hi} -> a i -> a (i + 1))
  -> acc:a lo
  -> Tot (a hi) (decreases (hi - lo))

(** Splitting a repetition *)
val repeat_right_plus:
    lo:nat
  -> mi:nat{lo <= mi}
  -> hi:nat{mi <= hi}
  -> a:(i:nat{lo <= i /\ i <= hi} -> Type)
  -> f:(i:nat{lo <= i /\ i < hi} -> a i -> a (i + 1))
  -> acc:a lo
  -> Lemma (ensures
      repeat_right lo hi a f acc ==
      repeat_right mi hi a f (repeat_right lo mi a f acc))
    (decreases hi)

(**
* [repeat_left] and [repeat_right] are equivalent.
*
* This follows from the third duality theorem
* [ fold_right f acc xs = fold_left (flip f) acc (reverse xs) ]
*)
val repeat_left_right:
    lo:nat
  -> hi:nat{lo <= hi}
  -> a:(i:nat{lo <= i /\ i <= hi} -> Type)
  -> f:(i:nat{lo <= i /\ i < hi} -> a i -> a (i + 1))
  -> acc:a lo
  -> Lemma (ensures repeat_right lo hi a f acc == repeat_left lo hi a f acc)
    (decreases (hi - lo))

(**
* Repetition starting from 0
*
* Defined as [repeat_right] for convenience, but [repeat_left] may be more
* efficient when extracted to OCaml.
*)

val repeat_gen:
    n:nat
  -> a:(i:nat{i <= n} -> Type)
  -> f:(i:nat{i < n} -> a i -> a (i + 1))
  -> acc0:a 0
  -> a n

(** Unfolding one iteration *)
val unfold_repeat_gen:
    n:nat
  -> a:(i:nat{i <= n} -> Type)
  -> f:(i:nat{i < n} -> a i -> a (i + 1))
  -> acc0:a 0
  -> i:nat{i < n}
  -> Lemma (repeat_gen (i + 1) a f acc0 == f i (repeat_gen i a f acc0))

(**
* Repetition with a fixed accumulator type
*)

val repeati:
    #a:Type
  -> n:nat
  -> f:(i:nat{i < n} -> a -> a)
  -> acc0:a
  -> a

(** Unfolding one iteration *)
val unfold_repeati:
    #a:Type
  -> n:nat
  -> f:(i:nat{i < n} -> a -> a)
  -> acc0:a
  -> i:nat{i < n}
  -> Lemma (repeati #a (i + 1) f acc0 == f i (repeati #a i f acc0))

val repeat:
    #a:Type
  -> n:nat
  -> f:(a -> a)
  -> acc0:a
  -> a

val repeat_range:
  #a:Type
  -> min:nat
  -> max:nat{min <= max}
  -> (s:nat{s >= min /\ s < max} -> a -> Tot a)
  -> a
  -> Tot a (decreases (max - min))

val repeat_range_all_ml:
  #a:Type
  -> min:nat
  -> max:nat{min <= max}
  -> (s:nat{s >= min /\ s < max} -> a -> FStar.All.ML a)
  -> a
  -> FStar.All.ML a

unfold
type repeatable (#a:Type) (#n:nat) (pred:(i:nat{i <= n} -> a -> Tot Type)) =
  i:nat{i < n} -> x:a{pred i x} -> y:a{pred (i+1) y}

val repeat_range_inductive:
    #a:Type
  -> min:nat
  -> max:nat{min <= max}
  -> pred:(i:nat{i <= max} -> a -> Type)
  -> f:repeatable #a #max pred
  -> x0:a{pred min x0}
  -> Tot (res:a{pred max res}) (decreases (max - min))

val repeati_inductive:
   #a:Type
 -> n:nat
 -> pred:(i:nat{i <= n} -> a -> Type)
 -> f:repeatable #a #n pred
 -> x0:a{pred 0 x0}
 -> res:a{pred n res}

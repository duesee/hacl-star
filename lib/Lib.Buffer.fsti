module Lib.Buffer

open FStar.HyperStack
open FStar.HyperStack.ST

open Lib.IntTypes
open Lib.RawIntTypes

module B = LowStar.Buffer
module IB = LowStar.ImmutableBuffer
module LMB = LowStar.Monotonic.Buffer

module U32 = FStar.UInt32
module ST = FStar.HyperStack.ST
module HS = FStar.HyperStack

module Seq = Lib.Sequence
module ByteSeq = Lib.ByteSequence
module Loop = Lib.LoopCombinators

#set-options "--z3rlimit 15"

inline_for_extraction noextract
let v = size_v

(** Definition of a mutable Buffer *)
let buffer (a:Type0) = B.buffer a

(** Definition of an immutable Buffer *)
let ibuffer (a:Type0) = IB.ibuffer a

(** Length of buffers *)
val length: #a:Type0 -> b:buffer a -> GTot (r:size_nat{r == B.length b})
val ilength: #a:Type0 -> b:ibuffer a -> GTot (r:size_nat{r == IB.length b})

(** Definition of fixed length mutable and immutable Buffers *)
let lbuffer (a:Type0) (len:size_nat) = b:buffer a {length b == len}
let ilbuffer (a:Type0) (len:size_nat) = b:IB.ibuffer a {IB.length b == len}

(** Alias for mutable buffer of bytes *)
let lbytes len = lbuffer uint8 len

(** Liveness of buffers *)
let live (#a:Type0) (#rrel #rel:LMB.srel a) (h:HS.mem) (b:LMB.mbuffer a rrel rel) = B.live #a #rrel #rel h b

(** Generalized modification clause for Buffer locations *)
let modifies
  (s: B.loc)
  (h1 h2: HS.mem)
: GTot Type0 = B.modifies s h1 h2

(** Disjointness clause for Buffers *)
unfold
let disjoint
  (#a1 #a2:Type0)
  (#rrel1 #rel1:LMB.srel a1)
  (#rrel2 #rel2:LMB.srel a2)
  (b1:LMB.mbuffer a1 rrel1 rel1)
  (b2:LMB.mbuffer a2 rrel2 rel2)
: GTot Type0 =
  B.loc_disjoint (B.loc_buffer b1) (B.loc_buffer b2)

(** Modification clause for one Buffer *)
unfold
let modifies1
  (#a:Type0)
  (#len:size_nat)
  (b: lbuffer a len)
  (h1 h2: HS.mem)
: GTot Type0 = B.modifies (B.loc_buffer b) h1 h2

(** Modification clause for two Buffers *)
unfold
let modifies2
  (#a0:Type0)
  (#a1:Type0)
  (#len0:size_nat)
  (#len1:size_nat)
  (b0: lbuffer a0 len0)
  (b1: lbuffer a1 len1)
  (h1 h2: HS.mem)
: GTot Type0 = B.modifies (B.loc_union (B.loc_buffer b0) (B.loc_buffer b1)) h1 h2

(** Modification clause for three Buffers *)
unfold
let modifies3
  (#a0:Type0)
  (#a1:Type0)
  (#a2:Type0)
  (#len0:size_nat)
  (#len1:size_nat)
  (#len2:size_nat)
  (b0: lbuffer a0 len0)
  (b1: lbuffer a1 len1)
  (b2: lbuffer a1 len1)
  (h1 h2: HS.mem)
: GTot Type0 = B.modifies (B.loc_union (B.loc_buffer b0) (B.loc_union (B.loc_buffer b1) (B.loc_buffer b2))) h1 h2

(** Ghost reveal a Buffer as its Pure Sequence *)
let as_seq (#a:Type0) (#rrel #rel:LMB.srel a) (h:HS.mem) (b:LMB.mbuffer a rrel rel)
  : GTot (Seq.seq a)
= B.as_seq #a #rrel #rel h b

(** Ghost view of a subset of a mutable Buffer *)
let gsub
    (#a:Type0)
    (#len:size_nat)
    (b:lbuffer a len)
    (start:size_t)
    (n:size_t{v start + v n <= len})
 =
  B.gsub b (size_to_UInt32 start) (size_to_UInt32 n)

val as_seq_gsub:
    #a:Type0
  -> #len:size_nat
  -> h:HS.mem
  -> b:lbuffer a len
  -> start:size_t
  -> n:size_t{v start + v n <= len}
  -> Lemma
    (B.as_seq h (gsub #a #len b start n) ==
     Seq.sub #a #len (B.as_seq h b) (v start) (v n))
    [SMTPat (Seq.sub #a #len (B.as_seq h b) (v start) (v n))]

(** Subset of a mutable Buffer *)
inline_for_extraction
val sub:
    #a:Type0
  -> #len:size_nat
  -> #olen:size_nat
  -> b:lbuffer a len
  -> start:size_t
  -> n:size_t{v start + v n <= len /\ v n == olen} ->
  Stack (lbuffer a olen)
    (requires fun h0 -> B.live h0 b)
    (ensures  fun h0 r h1 -> h0 == h1 /\ r == gsub b start n)

let igsub
    (#a:Type0)
    (#len:size_nat)
    (b:ilbuffer a len)
    (start:size_t)
    (n:size_t{v start + v n <= len})
 =
  IB.igsub b (size_to_UInt32 start) (size_to_UInt32 n)

val as_seq_igsub:
    #a:Type0
  -> #len:size_nat
  -> h:HS.mem
  -> b:ilbuffer a len
  -> start:size_t
  -> n:size_t{v start + v n <= len}
  -> Lemma
    (B.as_seq h (igsub #a #len b start n) ==
     Seq.sub #a #len (B.as_seq h b) (v start) (v n))
    [SMTPat (Seq.sub #a #len (B.as_seq h b) (v start) (v n))]

(** Subset of an immutable Buffer *)
inline_for_extraction
val isub:
    #a:Type0
  -> #len:size_nat
  -> #olen:size_nat
  -> b:ilbuffer a len
  -> start:size_t
  -> n:size_t{v start + v n <= len /\ v n == olen} ->
  Stack (ilbuffer a olen)
    (requires fun h0 -> IB.live h0 b)
    (ensures  fun h0 r h1 -> h0 == h1 /\ r == igsub b start n)

(** Access a specific value in an mutable Buffer *)
inline_for_extraction
val index:
    #a:Type0
  -> #len:size_nat
  -> b:lbuffer a len
  -> i:size_t{v i < len} ->
  Stack a
    (requires fun h0 -> B.live h0 b)
    (ensures  fun h0 r h1 -> h0 == h1 /\
      r == Seq.index #a #len (B.as_seq h1 b) (v i))

(** Access a specific value in an immutable Buffer *)
inline_for_extraction
val iindex:
    #a:Type0
  -> #len:size_nat
  -> b:ilbuffer a len
  -> i:size_t{v i < len} ->
  Stack a
    (requires fun h0 -> B.live h0 b)
    (ensures  fun h0 r h1 -> h0 == h1 /\
      r == Seq.index #a #len (IB.as_seq h1 b) (v i))

(** Update a specific value in a mutable Buffer *)
inline_for_extraction
val upd:
    #a:Type0
  -> #len:size_nat{len > 0}
  -> b:lbuffer a len
  -> i:size_t{v i < len}
  -> x:a ->
  Stack unit
    (requires fun h0 -> B.live h0 b)
    (ensures  fun h0 _ h1 ->
      B.modifies (B.loc_buffer b) h0 h1 /\ B.live h1 b /\
      B.as_seq h1 b == Seq.upd #a #len (B.as_seq h0 b) (v i) x)

(** Operator definition to update a mutable Buffer *)
inline_for_extraction
let op_Array_Assignment #a #len = upd #a #len

(** Operator definition to access a mutable Buffer *)
inline_for_extraction
let op_Array_Access #a #len = index #a #len

(** Operator definition to access a Buffer as a Sequence *)
inline_for_extraction
let op_String_Access #a #r0 #r1 m b = B.as_seq #a #r0 #r1 m b

(** Access to the pure sequence-based value associated to an index of a mutable Buffer  *)
(* We don't have access to Lib.Sequence.fst
   to get the fact `Lib.Sequence.index == FStar.Seq.index` *)
inline_for_extraction
val bget:
    #a:Type0
  -> #len:size_nat
  -> h:mem
  -> b:lbuffer a len
  -> i:size_nat{i < len}
  -> GTot (r:a{r == B.get h b i /\ r == Seq.index #a #len (B.as_seq h b) i})

(** Access to the pure sequence-based value associated to an index of an immutable Buffer  *)
(* We don't have access to Lib.Sequence.fst
   to get the fact `Lib.Sequence.index == FStar.Seq.index` *)
inline_for_extraction
val ibget:
    #a:Type0
  -> #len:size_nat
  -> h:mem
  -> b:ilbuffer a len
  -> i:size_nat{i < len}
  -> GTot (r:a{r == B.get h b i /\ r == Seq.index #a #len (IB.as_seq h b) i})

(** Allocate a fixed-length mutable Buffer and initialize it to value [init] *)
inline_for_extraction
val create:
    #a:Type0
  -> #len:size_nat
  -> clen:size_t{v clen == len}
  -> init:a ->
  StackInline (lbuffer a len)
    (requires fun h0 -> len > 0)
    (ensures  fun h0 b h1 ->
      B.alloc_post_mem_common b h0 h1 (Seq.create len init) /\
      B.frameOf b = HS.get_tip h0)

(** Allocate a fixed-length mutable Buffer based on an existing List *)
inline_for_extraction noextract
val createL:
    #a:Type0
  -> init:list a{List.Tot.length init <= max_size_t} ->
  StackInline (lbuffer a (normalize_term (List.Tot.length init)))
    (requires fun h0 -> B.alloca_of_list_pre #a init)
    (ensures fun h0 b h1 ->
      B.alloc_post_mem_common b h0 h1 (Seq.of_list init) /\
      B.frameOf b = HS.get_tip h0)

(** Recall the value of a top-level Buffer *)
inline_for_extraction noextract
val recall:
  #a:Type
  -> #len:size_nat
  -> b:lbuffer a len ->
  Stack unit
    (requires fun _ -> B.recallable b)
    (ensures  fun m0 _ m1 -> m0 == m1 /\ B.live m1 b)

(** Allocate a top-level fixed-length mutable Buffer and initialize it to value [init] *)
inline_for_extraction noextract
val createL_global:
    #a:Type0
  -> init:list a{normalize (List.Tot.length init <= max_size_t)} ->
  ST (b:lbuffer a (normalize_term (List.Tot.length init)){
      B.frameOf b == HyperStack.root /\ B.recallable b})
    (requires fun h0 -> B.gcmalloc_of_list_pre #a HyperStack.root init)
    (ensures  fun h0 b h1 -> B.alloc_post_mem_common b h0 h1 (Seq.of_list init))

private
let cpred (#a:Type0) (s:Seq.seq a) : B.spred a = fun s1 -> FStar.Seq.equal s s1

(** Allocate a top-level fixed-length immutable Buffer and initialize it to value [init] *)
inline_for_extraction noextract
val icreateL_global:
    #a:Type0
  -> init:list a{normalize (List.Tot.length init <= max_size_t)} ->
  ST (b:ilbuffer a (normalize_term (List.Tot.length init)){
      B.frameOf b == HyperStack.root /\ B.recallable b /\
      B.witnessed b (cpred (Seq.of_list init))})
    (requires fun h0 -> B.gcmalloc_of_list_pre #a HyperStack.root init)
    (ensures  fun h0 b h1 -> B.alloc_post_mem_common b h0 h1 (Seq.of_list init))

inline_for_extraction noextract
val recall_contents:
    #a:Type0
  -> #len:size_nat{len <= max_size_t}
  -> b:ilbuffer a len
  -> s:Seq.lseq a len
  -> ST unit
    (requires fun h0 -> (B.recallable b \/ live h0 b) /\ B.witnessed b (cpred s))
    (ensures  fun h0 _ h1 -> h0 == h1 /\ live h0 b /\ as_seq h0 b == s)

(** Copy a mutable Buffer in another mutable Buffer *)
inline_for_extraction
val copy:
    #a:Type
  -> #len:size_nat
  -> o:lbuffer a len
  -> clen:size_t{v clen == len}
  -> i:lbuffer a len ->
  Stack unit
    (requires fun h0 -> B.live h0 o /\ B.live h0 i /\ B.disjoint i o)
    (ensures  fun h0 _ h1 ->
      B.live h1 o /\ B.live h1 i /\ B.modifies (B.loc_buffer o) h0 h1 /\
      B.as_seq h1 o == B.as_seq h0 i)

(** Copy an immutable Buffer in a mutable Buffer *)
inline_for_extraction
val icopy:
    #a:Type
  -> #len:size_nat
  -> o:lbuffer a len
  -> clen:size_t{v clen == len}
  -> i:ilbuffer a len ->
  Stack unit
    (requires fun h0 -> B.live h0 o /\ B.live h0 i /\ B.disjoint i o)
    (ensures  fun h0 _ h1 ->
      B.live h1 o /\ B.live h1 i /\ B.modifies (B.loc_buffer o) h0 h1 /\
      B.as_seq h1 o == B.as_seq h0 i)

(** Copy a mutable Buffer in a part of another mutable Buffer *)
inline_for_extraction
val update_sub:
    #a:Type
  -> #len:size_nat
  -> dst:lbuffer a len
  -> start:size_t
  -> n:size_t{v start + v n <= len}
  -> src:lbuffer a (size_v n) ->
  Stack unit
    (requires fun h -> B.live h dst /\ B.live h src /\ B.disjoint dst src)
    (ensures  fun h0 _ h1 -> B.live h1 dst /\ B.modifies (B.loc_buffer dst) h0 h1 /\
      B.as_seq h1 dst == Seq.update_sub #a #len (B.as_seq h0 dst) (v start) (v n) (B.as_seq h0 src))

(** Copy an immutable Buffer in a part of a mutable Buffer *)
inline_for_extraction
val update_isub:
    #a:Type
  -> #len:size_nat
  -> dst:lbuffer a len
  -> start:size_t
  -> n:size_t{v start + v n <= len}
  -> src:ilbuffer a (size_v n) ->
  Stack unit
    (requires fun h -> B.live h dst /\ B.live h src /\ B.disjoint dst src)
    (ensures  fun h0 _ h1 -> B.live h1 dst /\ B.modifies (B.loc_buffer dst) h0 h1 /\
      B.as_seq h1 dst == Seq.update_sub #a #len (B.as_seq h0 dst) (v start) (v n) (B.as_seq h0 src))

(** Update a part of a mutable Buffer in-place with the application of a function F on another Buffer *)
inline_for_extraction
val update_sub_f:
    #a:Type
  -> #len:size_nat
  -> buf:lbuffer a len
  -> start:size_t
  -> n:size_t{v start + v n <= len}
  -> spec:(mem -> GTot (Seq.lseq a (v n)))
  -> f:(b:lbuffer a (v n) -> Stack unit
        (requires fun h -> B.live h b)
        (ensures  fun h0 _ h1 ->
	  B.modifies (B.loc_buffer b) h0 h1 /\
	  B.as_seq h1 b == spec h0)) ->
  Stack unit
    (requires fun h -> B.live h buf)
    (ensures  fun h0 _ h1 -> B.modifies (B.loc_buffer buf) h0 h1 /\
      B.as_seq h1 buf == Seq.update_sub #a #len (B.as_seq h0 buf) (v start) (v n) (spec h0))

(** Loop combinator with just memory safety specification *)
inline_for_extraction noextract
val loop_nospec:
    #h0:mem
  -> #a:Type0
  -> #len:size_nat
  -> n:size_t
  -> buf:lbuffer a len
  -> impl:
      (i:size_t{v i < v n} -> Stack unit
        (requires fun h -> B.modifies (B.loc_buffer buf) h0 h)
        (ensures  fun _ _ h1 -> B.modifies (B.loc_buffer buf) h0 h1)) ->
  Stack unit
    (requires fun h -> h0 == h /\ B.live h0 buf)
    (ensures  fun _ _ h1 -> B.modifies (B.loc_buffer buf) h0 h1)

(**
* A generalized loop combinator paremetrized by its state (e.g. an accumulator)
*
* Arguments:
* - [h0] the heap when entering the loop. I couldn't factor it out because the specification of the body dedpends on it
* - [a_spec] the type for the specification state (may depend on the loop index)
* - [a_impl] the Low* type of the state (e.g a tuple of buffers)
* - [acc] Low* state
* - [refl] a ghost function that reflects the Low* state in an iteration as [a_spec]
* - [footprint] locations modified by the loop (may depend on the loop index)
* - [spec] a specification of how the body of the loop modifies the state
* - [impl] the body of the loop as a Stack function
*)

inline_for_extraction noextract
let loop_inv
    (h0:mem)
    (n:size_t)
    (a_spec:(i:size_nat{i <= v n} -> Type))
    (a_impl:Type)
    (acc:a_impl)
    (refl:(mem -> i:size_nat{i <= v n} -> GTot (a_spec i)))
    (footprint:(i:size_nat{i <= v n} -> GTot B.loc))
    (spec:(mem -> GTot (i:size_nat{i < v n} -> a_spec i -> a_spec (i + 1))))
    (i:size_nat{i <= v n})
    (h:mem) : Type0
  =
  B.modifies (footprint i) h0 h /\
  refl h i == Loop.repeat_gen i a_spec (spec h0) (refl h0 0)

inline_for_extraction noextract
val loop:
    h0:mem
  -> n:size_t
  -> a_spec:(i:size_nat{i <= v n} -> Type)
  -> a_impl:Type
  -> acc:a_impl
  -> refl:(mem -> i:size_nat{i <= v n} -> GTot (a_spec i))
  -> footprint:(i:size_nat{i <= v n} -> GTot B.loc)
  -> spec:(mem -> GTot (i:size_nat{i < v n} -> a_spec i -> a_spec (i + 1)))
  -> impl:(i:size_t{v i < v n} -> Stack unit
     (requires loop_inv h0 n a_spec a_impl acc refl footprint spec (v i))
     (ensures  fun _ _ -> loop_inv h0 n a_spec a_impl acc refl footprint spec (v i + 1))) ->
  Stack unit
    (requires fun h -> h0 == h)
    (ensures  fun _ _ -> loop_inv h0 n a_spec a_impl acc refl footprint spec (v n))

(** Invariant for Loop1: modifies only one Buffer *)
inline_for_extraction noextract
let loop1_inv
    (h0:mem)
    (n:size_t)
    (b: Type)
    (blen: size_nat)
    (write:lbuffer b blen)
    (spec:(mem -> GTot (i:size_nat{i < v n} -> Seq.lseq b blen -> Seq.lseq b blen)))
    (i:size_nat{i <= v n})
    (h:mem) : Type0
 =
  B.modifies (B.loc_buffer write) h0 h /\
  B.as_seq h write == Loop.repeati i (spec h0) (B.as_seq h0 write)

(** Loop which modifies a single buffer [write] *)
inline_for_extraction noextract
val loop1:
    #b:Type
  -> #blen:size_nat
  -> h0:mem
  -> n:size_t
  -> write:lbuffer b blen
  -> spec:(mem -> GTot (i:size_nat{i < v n} -> Seq.lseq b blen -> Seq.lseq b blen))
  -> impl:(i:size_t{v i < v n} -> Stack unit
     (requires loop1_inv h0 n b blen write spec (v i))
     (ensures  fun _ _ -> loop1_inv h0 n b blen write spec (v i + 1))) ->
  Stack unit
    (requires fun h -> h0 == h)
    (ensures  fun _ _ -> loop1_inv h0 n b blen write spec (v n))

(** Invariant for Loop2: modifies two Buffers *)
inline_for_extraction noextract
let loop2_inv
    (#b0:Type)
    (#blen0:size_nat)
    (#b1:Type)
    (#blen1:size_nat)
    (h0:mem)
    (n:size_t)
    (write0:lbuffer b0 blen0)
    (write1:lbuffer b1 blen1)
    (spec:(mem -> GTot (i:size_nat{i < v n}
               -> tuple2 (Seq.lseq b0 blen0) (Seq.lseq b1 blen1)
               -> tuple2 (Seq.lseq b0 blen0) (Seq.lseq b1 blen1))))
    (i:size_nat{i <= v n})
    (h:mem) : Type0
 =
  B.modifies (B.loc_union (B.loc_buffer write0) (B.loc_buffer write1)) h0 h /\
  (let s0, s1 = Loop.repeati i (spec h0) (B.as_seq h0 write0, B.as_seq h0 write1) in
  B.as_seq h write0 == s0 /\ B.as_seq h write1 == s1)

(** Loop which modifies two buffers [write0] and [write1] *)
inline_for_extraction noextract
val loop2:
     #b0:Type
  -> #blen0:size_nat
  -> #b1:Type
  -> #blen1:size_nat
  -> h0:mem
  -> n:size_t
  -> write0:lbuffer b0 blen0
  -> write1:lbuffer b1 blen1
  -> spec:(mem -> GTot (i:size_nat{i < v n}
               -> tuple2 (Seq.lseq b0 blen0) (Seq.lseq b1 blen1)
               -> tuple2 (Seq.lseq b0 blen0) (Seq.lseq b1 blen1)))
  -> impl:(i:size_t{v i < v n} -> Stack unit
      (requires loop2_inv #b0 #blen0 #b1 #blen1 h0 n write0 write1 spec (v i))
      (ensures  fun _ _  -> loop2_inv #b0 #blen0 #b1 #blen1 h0 n write0 write1 spec (v i + 1))) ->
  Stack unit
    (requires fun h -> h0 == h)
    (ensures  fun _ _  -> loop2_inv #b0 #blen0 #b1 #blen1 h0 n write0 write1 spec (v n))

(** Compares two byte buffers of equal length returning a bool *)
inline_for_extraction
val lbytes_eq:
    #len:size_t
  -> a:lbuffer uint8 (v len)
  -> b:lbuffer uint8 (v len) ->
  Stack bool
    (requires fun h -> B.live h a /\ B.live h b)
    (ensures  fun h0 r h1 ->
      B.modifies B.loc_none h0 h1 /\
      r == Seq.lbytes_eq #(v len) (B.as_seq h0 a) (B.as_seq h0 b))

(** Allocates a mutable Buffer, perform computations [impl] and securely delete the allocated buffer *)
inline_for_extraction
val alloc:
    #a:Type0
  -> #b:Type0
  -> #w:Type0
  -> #len:size_nat
  -> #wlen:size_nat
  -> h0:mem
  -> clen:size_t{v clen == len}
  -> init:a
  -> write:lbuffer w wlen
  -> spec:(h:mem -> GTot(r:b -> Seq.lseq w wlen -> Type))
  -> impl:(buf:lbuffer a len -> Stack b
      (requires (fun h -> B.modifies (B.loc_buffer buf) h0 h /\ B.live h0 write))
      (ensures (fun h r h' -> B.modifies (B.loc_union (B.loc_buffer buf) (B.loc_buffer write)) h h' /\
			                  spec h0 r (B.as_seq h' write)))) ->
  Stack b
    (requires (fun h -> h == h0 /\ B.live h write))
    (ensures (fun h0 r h1 -> B.modifies (B.loc_buffer write) h0 h1 /\
		                    spec h0 r (B.as_seq h1 write)))

(** Print and compare two buffers securely *)
(* BB. TODO: used in tests; move to Lib.Print *)
val print_compare_display:
    len:size_t
  -> lbuffer uint8 (size_v len)
  -> lbuffer uint8 (size_v len) ->
  Stack unit
    (requires fun h -> True)
    (ensures fun h0 _ h1 -> h0 == h1)

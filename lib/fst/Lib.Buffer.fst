module Lib.Buffer

open FStar.HyperStack
open FStar.HyperStack.ST
module ST = FStar.HyperStack.ST
open Lib.IntTypes
open Lib.RawIntTypes
open Lib.Sequence

module LSeq = Lib.Sequence

module Buf = FStar.Buffer
module U32 = FStar.UInt32

type lbuffer (a:Type0) (len:size_nat) = b:Buf.buffer a {Buf.length b == len}
let sub #a #len #olen b start n = Buf.sub b (size_to_UInt32 start) (size_to_UInt32 n)

let disjoint #a1 #a2 #len1 #len2 b1 b2 : GTot Type0 = Buf.disjoint #a1 #a2 b1 b2
let live #a #len h b : GTot Type0 = Buf.live h b

let preserves_live h0 h1 = True
let as_seq #a #len b m = admit()
let as_lseq #a #len b m = admit()
let modifies1 #a #len b h0 h1 = admit()
let modifies2 = admit()
let modifies3 = admit()
let modifies = admit()
let live_list = admit()
let disjoint_list = admit()
let disjoint_lists = admit()
let disjoints = admit()

let index #a #len b i = Buf.index b (size_to_UInt32 i)
let upd #a #len b i v = Buf.upd b (size_to_UInt32 i) v

let create #a #len clen init = Buf.create init (size_to_UInt32 clen)
let createL #a init = Buf.createL init

let alloc #a #b #len clen init read writes spec impl =
  push_frame();
  let buf = create clen init in
  let r = impl buf in
  pop_frame();
  r

let alloc1 #h0 #a #b #w #len #wlen clen init write spec impl =
  push_frame();
  let buf = create clen init in
  let r = impl buf in
  pop_frame();
  r

let alloc1_with #h0 #a #b #w #len #wlen clen init_spec init write spec impl =
  push_frame();
  let buf = init () in
  let r = impl buf in
  pop_frame();
  r

let alloc_modifies2 #h0 #a #b #w0 #w1 #len #wlen0 #wlen1 clen init write0 write1 spec impl =
  push_frame();
  let buf = create clen init in
  let r = impl buf in
  pop_frame();
  r


let map #a #len clen f b =
  let h0 = ST.get() in
  let inv (h1:mem) (j:nat) = True in
  let f' (j:size_t{0 <= v j /\ v j <= len}) : Stack unit
      (requires (fun h -> inv h (v j)))
      (ensures (fun h1 _ h2 -> inv h2 (v j + 1))) =
      let b_i = b.(j) in
      b.(j) <- f b_i in
  Lib.Loops.for (size 0) clen inv f'


let map2 #a1 #a2 #len clen f b1 b2 =
  let h0 = ST.get() in
  let inv (h1:mem) (j:nat) = True in
  let f' (j:size_t{0 <= v j /\ v j <= len}) : Stack unit
      (requires (fun h -> inv h (v j)))
      (ensures (fun h1 _ h2 -> inv h2 (v j + 1))) =
      let i1 = b1.(j) in
      let i2 = b2.(j) in
      b1.(j) <- f i1 i2 in
  Lib.Loops.for (size 0) clen inv f'

let copy #a #len o clen i =
  let h0 = ST.get() in
  let inv (h1:mem) (j:nat) =
    preserves_live h0 h1 /\
    modifies1 o h0 h1 /\
    LSeq.slice (as_lseq #a #len o h1) 0 j ==
    LSeq.slice (as_lseq #a #len i h0) 0 j in
  let f' (j:size_t{0 <= v j /\ v j <= len}) : Stack unit
      (requires (fun h -> inv h (v j)))
      (ensures (fun h1 _ h2 -> inv h2 (v j + 1))) =
      let src_i = i.(j) in
      o.(j) <- src_i in
  Lib.Loops.for (size 0) clen inv f'


(* EXPERIMENTAL *)

let salloc #h0 #a #b #len clen init read writes spec impl =
  push_frame();
  let buf = create clen init in
  let r = impl buf in
  let inv (h1:mem) (j:nat) = True in
  let f' (j:size_t{0 <= v j /\ v j <= len}) : Stack unit
      (requires (fun h -> inv h (v j)))
      (ensures (fun h1 _ h2 -> inv h2 (v j + 1))) =
      upd #a #len buf j init in
  Lib.Loops.for (size 0) clen inv f';
  pop_frame();
  r

let salloc11 #h0 #a #b #c #len #wlen clen init read write spec impl =
  push_frame();
  let buf = create clen init in
  let r = impl buf in
  let inv (h1:mem) (j:nat) = True in
  let f' (j:size_t{0 <= v j /\ v j <= len}) : Stack unit
      (requires (fun h -> inv h (v j)))
      (ensures (fun h1 _ h2 -> inv h2 (v j + 1))) =
      upd #a #len buf j init in
  Lib.Loops.for (size 0) clen inv f';
  pop_frame();
  r

let salloc21 #h0 #b #a0 #a1 #w #len0 #len1 #wlen clen0 clen1 init0 init1 reads write spec impl =
  push_frame();
  let buf0 = create clen0 init0 in
  let buf1 = create clen1 init1 in
  let r = impl buf0 buf1 in
  let inv (h1:mem) (j:nat) = True in
  let f'0 (j:size_t{0 <= v j /\ v j <= len0}) : Stack unit
      (requires (fun h -> inv h (v j)))
      (ensures (fun h1 _ h2 -> inv h2 (v j + 1))) =
      upd #a0 #len0 buf0 j init0 in
  let f'1 (j:size_t{0 <= v j /\ v j <= len1}) : Stack unit
      (requires (fun h -> inv h (v j)))
      (ensures (fun h1 _ h2 -> inv h2 (v j + 1))) =
      upd #a1 #len1 buf1 j init1 in
  Lib.Loops.for (size 0) clen0 inv f'0;
  Lib.Loops.for (size 0) clen1 inv f'1;
  pop_frame();
  r


let iter_range #a #len start fin spec impl input =
  let h0 = ST.get() in
  let inv (h1:mem) (j:nat) = True in
  let f' (j:size_t{v start <= v j /\ v j <= v fin}) : Stack unit
      (requires (fun h -> inv h (v j)))
      (ensures (fun h1 _ h2 -> inv h2 (v j + 1))) =
      impl j input in
  Lib.Loops.for start fin inv f'

let iteri #a #len n spec impl input = iter_range #a #len (size 0) n spec impl input

let iter #a #len #clen n spec impl input =
  let h0 = ST.get() in
  let inv (h1:mem) (j:nat) = True in
  let f' (j:size_t{0 <= v j /\ v j <= len}) : Stack unit
      (requires (fun h -> inv h (v j)))
      (ensures (fun h1 _ h2 -> inv h2 (v j + 1))) =
      impl input in
  Lib.Loops.for (size 0) n inv f'

inline_for_extraction let loop #h0 #a #len n buf spec impl =
  let inv (h1:mem) (j:nat) = True in
  let f' (j:size_t{0 <= v j /\ v j <= len}) : Stack unit
      (requires (fun h -> inv h (v j)))
      (ensures (fun h1 _ h2 -> inv h2 (v j + 1))) =
      impl j in
  Lib.Loops.for (size 0) n inv f'

inline_for_extraction let loop_set #a #len buf start n init =
  let inv (h1:mem) (j:nat) = True in
  let f' (j:size_t{0 <= v j /\ v j <= len}) : Stack unit
      (requires (fun h -> inv h (v j)))
      (ensures (fun h1 _ h2 -> inv h2 (v j + 1))) =
      upd buf j init in
  Lib.Loops.for start n inv f'

inline_for_extraction let loop2 #h0 #a0 #a1 #len0 #len1 n buf0 buf1 spec impl =
  let inv (h1:mem) (j:nat) = True in
  let f' (j:size_t{0 <= v j /\ v j <= len0}) : Stack unit
      (requires (fun h -> inv h (v j)))
      (ensures (fun h1 _ h2 -> inv h2 (v j + 1))) =
      impl j in
  Lib.Loops.for (size 0) n inv f'


inline_for_extraction let map_blocks #h0 #a #bs #nb blocksize nblocks buf f_spec f =
  let inv (h1:mem) (j:nat) = True in
  let f' (j:size_t{0 <= v j /\ v j <= nb}) : Stack unit
      (requires (fun h -> inv h (v j)))
      (ensures (fun h1 _ h2 -> inv h2 (v j + 1))) =
      let bufi = sub #a #(nb*bs) #bs buf (j *. blocksize) blocksize in
      f j in
  Lib.Loops.for (size 0) nblocks inv f'


inline_for_extraction let reduce_blocks #h0 #a #r #bs #nb #rlen blocksize nblocks rbuf f_spec f buf =
  let inv (h1:mem) (j:nat) = True in
  let f' (j:size_t{0 <= v j /\ v j <= nb}) : Stack unit
      (requires (fun h -> inv h (v j)))
      (ensures (fun h1 _ h2 -> inv h2 (v j + 1))) =
      let bufi = sub buf (j *. blocksize) blocksize in
      f j bufi in
  Lib.Loops.for (size 0) nblocks inv f'

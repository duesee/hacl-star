module Spec.K256.Test

#reset-options "--z3rlimit 50 --fuel 0 --ifuel 0"

open FStar.Mul
open Lib.IntTypes
open Lib.RawIntTypes
open Lib.Sequence
open Lib.ByteSequence

open Spec.K256

//
// Test 1
//

let test1_pk_x = List.Tot.map u8_from_UInt8 [
  0xb8uy; 0x38uy; 0xffuy; 0x44uy; 0xe5uy; 0xbcuy; 0x17uy; 0x7buy;
  0xf2uy; 0x11uy; 0x89uy; 0xd0uy; 0x76uy; 0x60uy; 0x82uy; 0xfcuy;
  0x9duy; 0x84uy; 0x32uy; 0x26uy; 0x88uy; 0x7fuy; 0xc9uy; 0x76uy;
  0x03uy; 0x71uy; 0x10uy; 0x0buy; 0x7euy; 0xe2uy; 0x0auy; 0x6fuy
]

let test1_pk_y = List.Tot.map u8_from_UInt8 [
  0xf0uy; 0xc9uy; 0xd7uy; 0x5buy; 0xfbuy; 0xa7uy; 0xb3uy; 0x1auy;
  0x6buy; 0xcauy; 0x19uy; 0x74uy; 0x49uy; 0x6euy; 0xebuy; 0x56uy;
  0xdeuy; 0x35uy; 0x70uy; 0x71uy; 0x95uy; 0x5duy; 0x83uy; 0xc4uy;
  0xb1uy; 0xbauy; 0xdauy; 0xa0uy; 0xb2uy; 0x18uy; 0x32uy; 0xe9uy
]

let test1_msg = List.Tot.map u8_from_UInt8 [
  0x31uy; 0x32uy; 0x33uy; 0x34uy; 0x30uy; 0x30uy
]

let test1_sgnt_r = List.Tot.map u8_from_UInt8 [
  0x81uy; 0x3euy; 0xf7uy; 0x9cuy; 0xceuy; 0xfauy; 0x9auy; 0x56uy;
  0xf7uy; 0xbauy; 0x80uy; 0x5fuy; 0x0euy; 0x47uy; 0x85uy; 0x84uy;
  0xfeuy; 0x5fuy; 0x0duy; 0xd5uy; 0xf5uy; 0x67uy; 0xbcuy; 0x09uy;
  0xb5uy; 0x12uy; 0x3cuy; 0xcbuy; 0xc9uy; 0x83uy; 0x23uy; 0x65uy
]

let test1_sgnt_s = List.Tot.map u8_from_UInt8 [
  0x6fuy; 0xf1uy; 0x8auy; 0x52uy; 0xdcuy; 0xc0uy; 0x33uy; 0x6fuy;
  0x7auy; 0xf6uy; 0x24uy; 0x00uy; 0xa6uy; 0xdduy; 0x9buy; 0x81uy;
  0x07uy; 0x32uy; 0xbauy; 0xf1uy; 0xffuy; 0x75uy; 0x80uy; 0x00uy;
  0xd6uy; 0xf6uy; 0x13uy; 0xa5uy; 0x56uy; 0xebuy; 0x31uy; 0xbauy
]


let test () =
  assert_norm (List.Tot.length test1_pk_x = 32);
  assert_norm (List.Tot.length test1_pk_y = 32);
  assert_norm (List.Tot.length test1_msg = 6);
  assert_norm (List.Tot.length test1_sgnt_r = 32);
  assert_norm (List.Tot.length test1_sgnt_s = 32);

  let pk_x : lbytes 32 = of_list test1_pk_x in
  let pk_y : lbytes 32 = of_list test1_pk_y in
  let msg : lbytes 6 = of_list test1_msg in

  let sgnt_r : lbytes 32 = of_list test1_sgnt_r in
  let sgnt_s : lbytes 32 = of_list test1_sgnt_s in

  let pk_x = nat_from_bytes_be pk_x in
  let pk_y = nat_from_bytes_be pk_y in
  let verify : bool =
    if not (pk_x < prime && pk_y < prime) then false
    else
      ecdsa_verify_sha256 6 msg (pk_x, pk_y)
      (nat_from_bytes_be sgnt_r) (nat_from_bytes_be sgnt_s) in

  if verify
  then begin IO.print_string "Test K256 ecdsa verification: Success!\n"; true end
  else begin IO.print_string "Test K256 ecdsa verification: Failure :(\n"; false end

module Spec.SHA2.Test

#reset-options "--z3rlimit 100 --initial_fuel 0 --max_fuel 0 --initial_ifuel 0"

open FStar.Mul
open Spec.Lib.IntTypes
open Spec.Lib.RawIntTypes
open Spec.Lib.IntSeq
open Spec.Lib.Stateful

module Hash = Spec.SHA2


//
// Test 1
//

let test1_plaintext = List.Tot.map u8_from_UInt8 [
  0x61uy; 0x62uy; 0x63uy
]

let test1_expected224 = List.Tot.map u8_from_UInt8 [
  0x23uy; 0x09uy; 0x7duy; 0x22uy; 0x34uy; 0x05uy; 0xd8uy; 0x22uy;
  0x86uy; 0x42uy; 0xa4uy; 0x77uy; 0xbduy; 0xa2uy; 0x55uy; 0xb3uy;
  0x2auy; 0xaduy; 0xbcuy; 0xe4uy; 0xbduy; 0xa0uy; 0xb3uy; 0xf7uy;
  0xe3uy; 0x6cuy; 0x9duy; 0xa7uy
]

let test1_expected256 = List.Tot.map u8_from_UInt8 [
  0xbauy; 0x78uy; 0x16uy; 0xbfuy; 0x8fuy; 0x01uy; 0xcfuy; 0xeauy;
  0x41uy; 0x41uy; 0x40uy; 0xdeuy; 0x5duy; 0xaeuy; 0x22uy; 0x23uy;
  0xb0uy; 0x03uy; 0x61uy; 0xa3uy; 0x96uy; 0x17uy; 0x7auy; 0x9cuy;
  0xb4uy; 0x10uy; 0xffuy; 0x61uy; 0xf2uy; 0x00uy; 0x15uy; 0xaduy
]

let test1_expected384 = List.Tot.map u8_from_UInt8 [
  0xcbuy; 0x00uy; 0x75uy; 0x3fuy; 0x45uy; 0xa3uy; 0x5euy; 0x8buy;
  0xb5uy; 0xa0uy; 0x3duy; 0x69uy; 0x9auy; 0xc6uy; 0x50uy; 0x07uy;
  0x27uy; 0x2cuy; 0x32uy; 0xabuy; 0x0euy; 0xdeuy; 0xd1uy; 0x63uy;
  0x1auy; 0x8buy; 0x60uy; 0x5auy; 0x43uy; 0xffuy; 0x5buy; 0xeduy;
  0x80uy; 0x86uy; 0x07uy; 0x2buy; 0xa1uy; 0xe7uy; 0xccuy; 0x23uy;
  0x58uy; 0xbauy; 0xecuy; 0xa1uy; 0x34uy; 0xc8uy; 0x25uy; 0xa7uy
]

let test1_expected512 = List.Tot.map u8_from_UInt8 [
  0xdduy; 0xafuy; 0x35uy; 0xa1uy; 0x93uy; 0x61uy; 0x7auy; 0xbauy;
  0xccuy; 0x41uy; 0x73uy; 0x49uy; 0xaeuy; 0x20uy; 0x41uy; 0x31uy;
  0x12uy; 0xe6uy; 0xfauy; 0x4euy; 0x89uy; 0xa9uy; 0x7euy; 0xa2uy;
  0x0auy; 0x9euy; 0xeeuy; 0xe6uy; 0x4buy; 0x55uy; 0xd3uy; 0x9auy;
  0x21uy; 0x92uy; 0x99uy; 0x2auy; 0x27uy; 0x4fuy; 0xc1uy; 0xa8uy;
  0x36uy; 0xbauy; 0x3cuy; 0x23uy; 0xa3uy; 0xfeuy; 0xebuy; 0xbduy;
  0x45uy; 0x4duy; 0x44uy; 0x23uy; 0x64uy; 0x3cuy; 0xe8uy; 0x0euy;
  0x2auy; 0x9auy; 0xc9uy; 0x4fuy; 0xa5uy; 0x4cuy; 0xa4uy; 0x9fuy
]

//
// Test 2
//

let test2_plaintext = List.Tot.map u8_from_UInt8 []

let test2_expected224 = List.Tot.map u8_from_UInt8 [
  0xd1uy; 0x4auy; 0x02uy; 0x8cuy; 0x2auy; 0x3auy; 0x2buy; 0xc9uy;
  0x47uy; 0x61uy; 0x02uy; 0xbbuy; 0x28uy; 0x82uy; 0x34uy; 0xc4uy;
  0x15uy; 0xa2uy; 0xb0uy; 0x1fuy; 0x82uy; 0x8euy; 0xa6uy; 0x2auy;
  0xc5uy; 0xb3uy; 0xe4uy; 0x2fuy
]

let test2_expected256 = List.Tot.map u8_from_UInt8 [
  0xe3uy; 0xb0uy; 0xc4uy; 0x42uy; 0x98uy; 0xfcuy; 0x1cuy; 0x14uy;
  0x9auy; 0xfbuy; 0xf4uy; 0xc8uy; 0x99uy; 0x6fuy; 0xb9uy; 0x24uy;
  0x27uy; 0xaeuy; 0x41uy; 0xe4uy; 0x64uy; 0x9buy; 0x93uy; 0x4cuy;
  0xa4uy; 0x95uy; 0x99uy; 0x1buy; 0x78uy; 0x52uy; 0xb8uy; 0x55uy
]

let test2_expected384 = List.Tot.map u8_from_UInt8 [
  0x38uy; 0xb0uy; 0x60uy; 0xa7uy; 0x51uy; 0xacuy; 0x96uy; 0x38uy;
  0x4cuy; 0xd9uy; 0x32uy; 0x7euy; 0xb1uy; 0xb1uy; 0xe3uy; 0x6auy;
  0x21uy; 0xfduy; 0xb7uy; 0x11uy; 0x14uy; 0xbeuy; 0x07uy; 0x43uy;
  0x4cuy; 0x0cuy; 0xc7uy; 0xbfuy; 0x63uy; 0xf6uy; 0xe1uy; 0xdauy;
  0x27uy; 0x4euy; 0xdeuy; 0xbfuy; 0xe7uy; 0x6fuy; 0x65uy; 0xfbuy;
  0xd5uy; 0x1auy; 0xd2uy; 0xf1uy; 0x48uy; 0x98uy; 0xb9uy; 0x5buy
]

let test2_expected512 = List.Tot.map u8_from_UInt8 [
  0xcfuy; 0x83uy; 0xe1uy; 0x35uy; 0x7euy; 0xefuy; 0xb8uy; 0xbduy;
  0xf1uy; 0x54uy; 0x28uy; 0x50uy; 0xd6uy; 0x6duy; 0x80uy; 0x07uy;
  0xd6uy; 0x20uy; 0xe4uy; 0x05uy; 0x0buy; 0x57uy; 0x15uy; 0xdcuy;
  0x83uy; 0xf4uy; 0xa9uy; 0x21uy; 0xd3uy; 0x6cuy; 0xe9uy; 0xceuy;
  0x47uy; 0xd0uy; 0xd1uy; 0x3cuy; 0x5duy; 0x85uy; 0xf2uy; 0xb0uy;
  0xffuy; 0x83uy; 0x18uy; 0xd2uy; 0x87uy; 0x7euy; 0xecuy; 0x2fuy;
  0x63uy; 0xb9uy; 0x31uy; 0xbduy; 0x47uy; 0x41uy; 0x7auy; 0x81uy;
  0xa5uy; 0x38uy; 0x32uy; 0x7auy; 0xf9uy; 0x27uy; 0xdauy; 0x3euy
]

//
// Test 3
//

let test3_plaintext = List.Tot.map u8_from_UInt8 [
  0x61uy; 0x62uy; 0x63uy; 0x64uy; 0x62uy; 0x63uy; 0x64uy; 0x65uy;
  0x63uy; 0x64uy; 0x65uy; 0x66uy; 0x64uy; 0x65uy; 0x66uy; 0x67uy;
  0x65uy; 0x66uy; 0x67uy; 0x68uy; 0x66uy; 0x67uy; 0x68uy; 0x69uy;
  0x67uy; 0x68uy; 0x69uy; 0x6auy; 0x68uy; 0x69uy; 0x6auy; 0x6buy;
  0x69uy; 0x6auy; 0x6buy; 0x6cuy; 0x6auy; 0x6buy; 0x6cuy; 0x6duy;
  0x6buy; 0x6cuy; 0x6duy; 0x6euy; 0x6cuy; 0x6duy; 0x6euy; 0x6fuy;
  0x6duy; 0x6euy; 0x6fuy; 0x70uy; 0x6euy; 0x6fuy; 0x70uy; 0x71uy
]

let test3_expected224 = List.Tot.map u8_from_UInt8 [
  0x75uy; 0x38uy; 0x8buy; 0x16uy; 0x51uy; 0x27uy; 0x76uy; 0xccuy;
  0x5duy; 0xbauy; 0x5duy; 0xa1uy; 0xfduy; 0x89uy; 0x01uy; 0x50uy;
  0xb0uy; 0xc6uy; 0x45uy; 0x5cuy; 0xb4uy; 0xf5uy; 0x8buy; 0x19uy;
  0x52uy; 0x52uy; 0x25uy; 0x25uy
]

let test3_expected256 = List.Tot.map u8_from_UInt8 [
  0x24uy; 0x8duy; 0x6auy; 0x61uy; 0xd2uy; 0x06uy; 0x38uy; 0xb8uy;
  0xe5uy; 0xc0uy; 0x26uy; 0x93uy; 0x0cuy; 0x3euy; 0x60uy; 0x39uy;
  0xa3uy; 0x3cuy; 0xe4uy; 0x59uy; 0x64uy; 0xffuy; 0x21uy; 0x67uy;
  0xf6uy; 0xecuy; 0xeduy; 0xd4uy; 0x19uy; 0xdbuy; 0x06uy; 0xc1uy
]

let test3_expected384 = List.Tot.map u8_from_UInt8 [
  0x33uy; 0x91uy; 0xfduy; 0xdduy; 0xfcuy; 0x8duy; 0xc7uy; 0x39uy;
  0x37uy; 0x07uy; 0xa6uy; 0x5buy; 0x1buy; 0x47uy; 0x09uy; 0x39uy;
  0x7cuy; 0xf8uy; 0xb1uy; 0xd1uy; 0x62uy; 0xafuy; 0x05uy; 0xabuy;
  0xfeuy; 0x8fuy; 0x45uy; 0x0duy; 0xe5uy; 0xf3uy; 0x6buy; 0xc6uy;
  0xb0uy; 0x45uy; 0x5auy; 0x85uy; 0x20uy; 0xbcuy; 0x4euy; 0x6fuy;
  0x5fuy; 0xe9uy; 0x5buy; 0x1fuy; 0xe3uy; 0xc8uy; 0x45uy; 0x2buy
]

let test3_expected512 = List.Tot.map u8_from_UInt8 [
  0x20uy; 0x4auy; 0x8fuy; 0xc6uy; 0xdduy; 0xa8uy; 0x2fuy; 0x0auy;
  0x0cuy; 0xeduy; 0x7buy; 0xebuy; 0x8euy; 0x08uy; 0xa4uy; 0x16uy;
  0x57uy; 0xc1uy; 0x6euy; 0xf4uy; 0x68uy; 0xb2uy; 0x28uy; 0xa8uy;
  0x27uy; 0x9buy; 0xe3uy; 0x31uy; 0xa7uy; 0x03uy; 0xc3uy; 0x35uy;
  0x96uy; 0xfduy; 0x15uy; 0xc1uy; 0x3buy; 0x1buy; 0x07uy; 0xf9uy;
  0xaauy; 0x1duy; 0x3buy; 0xeauy; 0x57uy; 0x78uy; 0x9cuy; 0xa0uy;
  0x31uy; 0xaduy; 0x85uy; 0xc7uy; 0xa7uy; 0x1duy; 0xd7uy; 0x03uy;
  0x54uy; 0xecuy; 0x63uy; 0x12uy; 0x38uy; 0xcauy; 0x34uy; 0x45uy
]

//
// Test 4
//

let test4_plaintext = List.Tot.map u8_from_UInt8 [
  0x61uy; 0x62uy; 0x63uy; 0x64uy; 0x65uy; 0x66uy; 0x67uy; 0x68uy;
  0x62uy; 0x63uy; 0x64uy; 0x65uy; 0x66uy; 0x67uy; 0x68uy; 0x69uy;
  0x63uy; 0x64uy; 0x65uy; 0x66uy; 0x67uy; 0x68uy; 0x69uy; 0x6auy;
  0x64uy; 0x65uy; 0x66uy; 0x67uy; 0x68uy; 0x69uy; 0x6auy; 0x6buy;
  0x65uy; 0x66uy; 0x67uy; 0x68uy; 0x69uy; 0x6auy; 0x6buy; 0x6cuy;
  0x66uy; 0x67uy; 0x68uy; 0x69uy; 0x6auy; 0x6buy; 0x6cuy; 0x6duy;
  0x67uy; 0x68uy; 0x69uy; 0x6auy; 0x6buy; 0x6cuy; 0x6duy; 0x6euy;
  0x68uy; 0x69uy; 0x6auy; 0x6buy; 0x6cuy; 0x6duy; 0x6euy; 0x6fuy;
  0x69uy; 0x6auy; 0x6buy; 0x6cuy; 0x6duy; 0x6euy; 0x6fuy; 0x70uy;
  0x6auy; 0x6buy; 0x6cuy; 0x6duy; 0x6euy; 0x6fuy; 0x70uy; 0x71uy;
  0x6buy; 0x6cuy; 0x6duy; 0x6euy; 0x6fuy; 0x70uy; 0x71uy; 0x72uy;
  0x6cuy; 0x6duy; 0x6euy; 0x6fuy; 0x70uy; 0x71uy; 0x72uy; 0x73uy;
  0x6duy; 0x6euy; 0x6fuy; 0x70uy; 0x71uy; 0x72uy; 0x73uy; 0x74uy;
  0x6euy; 0x6fuy; 0x70uy; 0x71uy; 0x72uy; 0x73uy; 0x74uy; 0x75uy
]

let test4_expected224 = List.Tot.map u8_from_UInt8 [
  0xc9uy; 0x7cuy; 0xa9uy; 0xa5uy; 0x59uy; 0x85uy; 0x0cuy; 0xe9uy;
  0x7auy; 0x04uy; 0xa9uy; 0x6duy; 0xefuy; 0x6duy; 0x99uy; 0xa9uy;
  0xe0uy; 0xe0uy; 0xe2uy; 0xabuy; 0x14uy; 0xe6uy; 0xb8uy; 0xdfuy;
  0x26uy; 0x5fuy; 0xc0uy; 0xb3uy
]

let test4_expected256 = List.Tot.map u8_from_UInt8 [
  0xcfuy; 0x5buy; 0x16uy; 0xa7uy; 0x78uy; 0xafuy; 0x83uy; 0x80uy;
  0x03uy; 0x6cuy; 0xe5uy; 0x9euy; 0x7buy; 0x04uy; 0x92uy; 0x37uy;
  0x0buy; 0x24uy; 0x9buy; 0x11uy; 0xe8uy; 0xf0uy; 0x7auy; 0x51uy;
  0xafuy; 0xacuy; 0x45uy; 0x03uy; 0x7auy; 0xfeuy; 0xe9uy; 0xd1uy
]

let test4_expected384 = List.Tot.map u8_from_UInt8 [
  0x09uy; 0x33uy; 0x0cuy; 0x33uy; 0xf7uy; 0x11uy; 0x47uy; 0xe8uy;
  0x3duy; 0x19uy; 0x2fuy; 0xc7uy; 0x82uy; 0xcduy; 0x1buy; 0x47uy;
  0x53uy; 0x11uy; 0x1buy; 0x17uy; 0x3buy; 0x3buy; 0x05uy; 0xd2uy;
  0x2fuy; 0xa0uy; 0x80uy; 0x86uy; 0xe3uy; 0xb0uy; 0xf7uy; 0x12uy;
  0xfcuy; 0xc7uy; 0xc7uy; 0x1auy; 0x55uy; 0x7euy; 0x2duy; 0xb9uy;
  0x66uy; 0xc3uy; 0xe9uy; 0xfauy; 0x91uy; 0x74uy; 0x60uy; 0x39uy
]

let test4_expected512 = List.Tot.map u8_from_UInt8 [
  0x8euy; 0x95uy; 0x9buy; 0x75uy; 0xdauy; 0xe3uy; 0x13uy; 0xdauy;
  0x8cuy; 0xf4uy; 0xf7uy; 0x28uy; 0x14uy; 0xfcuy; 0x14uy; 0x3fuy;
  0x8fuy; 0x77uy; 0x79uy; 0xc6uy; 0xebuy; 0x9fuy; 0x7fuy; 0xa1uy;
  0x72uy; 0x99uy; 0xaeuy; 0xaduy; 0xb6uy; 0x88uy; 0x90uy; 0x18uy;
  0x50uy; 0x1duy; 0x28uy; 0x9euy; 0x49uy; 0x00uy; 0xf7uy; 0xe4uy;
  0x33uy; 0x1buy; 0x99uy; 0xdeuy; 0xc4uy; 0xb5uy; 0x43uy; 0x3auy;
  0xc7uy; 0xd3uy; 0x29uy; 0xeeuy; 0xb6uy; 0xdduy; 0x26uy; 0x54uy;
  0x5euy; 0x96uy; 0xe5uy; 0x5buy; 0x87uy; 0x4buy; 0xe9uy; 0x09uy
]

//
// Test 5
//

let test5_expected224 = List.Tot.map u8_from_UInt8 [

]

// let test5_expected256 = List.Tot.map u8_from_UInt8 [
//   0xcduy; 0xc7uy; 0x6euy; 0x5cuy; 0x99uy; 0x14uy; 0xfbuy; 0x92uy;
//   0x81uy; 0xa1uy; 0xc7uy; 0xe2uy; 0x84uy; 0xd7uy; 0x3euy; 0x67uy;
//   0xf1uy; 0x80uy; 0x9auy; 0x48uy; 0xa4uy; 0x97uy; 0x20uy; 0x0euy;
//   0x04uy; 0x6duy; 0x39uy; 0xccuy; 0xc7uy; 0x11uy; 0x2cuy; 0xd0uy
// ]
//
// let test5_expected384 = List.Tot.map u8_from_UInt8 [
//   0x9duy; 0x0euy; 0x18uy; 0x09uy; 0x71uy; 0x64uy; 0x74uy; 0xcbuy;
//   0x08uy; 0x6euy; 0x83uy; 0x4euy; 0x31uy; 0x0auy; 0x4auy; 0x1cuy;
//   0xeduy; 0x14uy; 0x9euy; 0x9cuy; 0x00uy; 0xf2uy; 0x48uy; 0x52uy;
//   0x79uy; 0x72uy; 0xceuy; 0xc5uy; 0x70uy; 0x4cuy; 0x2auy; 0x5buy;
//   0x07uy; 0xb8uy; 0xb3uy; 0xdcuy; 0x38uy; 0xecuy; 0xc4uy; 0xebuy;
//   0xaeuy; 0x97uy; 0xdduy; 0xd8uy; 0x7fuy; 0x3duy; 0x89uy; 0x85uy
// ]
//
// let test5_expected512 = List.Tot.map u8_from_UInt8 [
//   0xe7uy; 0x18uy; 0x48uy; 0x3duy; 0x0cuy; 0xe7uy; 0x69uy; 0x64uy;
//   0x4euy; 0x2euy; 0x42uy; 0xc7uy; 0xbcuy; 0x15uy; 0xb4uy; 0x63uy;
//   0x8euy; 0x1fuy; 0x98uy; 0xb1uy; 0x3buy; 0x20uy; 0x44uy; 0x28uy;
//   0x56uy; 0x32uy; 0xa8uy; 0x03uy; 0xafuy; 0xa9uy; 0x73uy; 0xebuy;
//   0xdeuy; 0x0fuy; 0xf2uy; 0x44uy; 0x87uy; 0x7euy; 0xa6uy; 0x0auy;
//   0x4cuy; 0xb0uy; 0x43uy; 0x2cuy; 0xe5uy; 0x77uy; 0xc3uy; 0x1buy;
//   0xebuy; 0x00uy; 0x9cuy; 0x5cuy; 0x2cuy; 0x49uy; 0xaauy; 0x2euy;
//   0x4euy; 0xaduy; 0xb2uy; 0x17uy; 0xaduy; 0x8cuy; 0xc0uy; 0x9buy
// ]



//
// Main
//

let test () =

  IO.print_string "\nTEST 1\n";
  let test1_plaintext_len : size_t = 3 in
  let test1_plaintext : lbytes test1_plaintext_len = createL test1_plaintext in
  let test1_expected224 : lbytes 28 = createL test1_expected224 in
  let test1_expected256 : lbytes 32 = createL test1_expected256 in
  let test1_expected384 : lbytes 48 = createL test1_expected384 in
  let test1_expected512 : lbytes 64 = createL test1_expected512 in
  let test1_result224 : lbytes 28 = Hash.hash Hash.parameters_sha2_224 test1_plaintext_len test1_plaintext in
  let test1_result256 : lbytes 32 = Hash.hash Hash.parameters_sha2_256 test1_plaintext_len test1_plaintext in
  let test1_result384 : lbytes 48 = Hash.hash Hash.parameters_sha2_384 test1_plaintext_len test1_plaintext in
  let test1_result512 : lbytes 64 = Hash.hash Hash.parameters_sha2_512 test1_plaintext_len test1_plaintext in
  let test1_result224' : lbytes 28 = Hash.hash' Hash.parameters_sha2_224 test1_plaintext_len test1_plaintext in
  let test1_result256' : lbytes 32 = Hash.hash' Hash.parameters_sha2_256 test1_plaintext_len test1_plaintext in
  let test1_result384' : lbytes 48 = Hash.hash' Hash.parameters_sha2_384 test1_plaintext_len test1_plaintext in
  let test1_result512' : lbytes 64 = Hash.hash' Hash.parameters_sha2_512 test1_plaintext_len test1_plaintext in
  let result1_224 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test1_expected224 test1_result224 in
  let result1_256 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test1_expected256 test1_result256 in
  let result1_384 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test1_expected384 test1_result384 in
  let result1_512 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test1_expected512 test1_result512 in
  let result1_224' = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test1_expected224 test1_result224' in
  let result1_256' = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test1_expected256 test1_result256' in
  let result1_384' = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test1_expected384 test1_result384' in
  let result1_512' = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test1_expected512 test1_result512' in
  let result1 = result1_224 && result1_256 && result1_384 && result1_512 in
  let result1' = result1_224' && result1_256' && result1_384' && result1_512' in

  IO.print_string "\nExpected SHA2 224: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test1_expected224);
  IO.print_string "\nComputed SHA2 224: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test1_result224);
  IO.print_string "\nExpected SHA2 256: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test1_expected256);
  IO.print_string "\nComputed SHA2 256: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test1_result256);
  IO.print_string "\nExpected SHA2 384: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test1_expected384);
  IO.print_string "\nComputed SHA2 384: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test1_result384);
  IO.print_string "\nExpected SHA2 512: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test1_expected512);
  IO.print_string "\nComputed SHA2 512: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test1_result512);

  if result1 then IO.print_string "\nSHA2 Test1 ontime: Success!\n"
  else IO.print_string "\nSHA2 Test1 ontime: Failure :(\n";

  IO.print_string "\nExpected SHA2 Incremental 224: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test1_expected224);
  IO.print_string "\nComputed SHA2 Incremental 224: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test1_result224');
  IO.print_string "\nExpected SHA2 Incremental 256: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test1_expected256);
  IO.print_string "\nComputed SHA2 Incremental 256: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test1_result256');
  IO.print_string "\nExpected SHA2 Incremental 384: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test1_expected384);
  IO.print_string "\nComputed SHA2 Incremental 384: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test1_result384');
  IO.print_string "\nExpected SHA2 Incremental 512: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test1_expected512);
  IO.print_string "\nComputed SHA2 Incremental 512: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test1_result512');

  if result1' then IO.print_string "\nSHA2 Test1 incremental: Success!\n"
  else IO.print_string "\nSHA2 Test1 incremental: Failure :(\n";

  IO.print_string "\nTEST 2\n";
  let test2_plaintext_len : size_t = 0 in
  let test2_plaintext : lbytes test2_plaintext_len = createL test2_plaintext in
  let test2_expected224 : lbytes 28 = createL test2_expected224 in
  let test2_expected256 : lbytes 32 = createL test2_expected256 in
  let test2_expected384 : lbytes 48 = createL test2_expected384 in
  let test2_expected512 : lbytes 64 = createL test2_expected512 in
  let test2_result224 : lbytes 28 = Hash.hash Hash.parameters_sha2_224 test2_plaintext_len test2_plaintext in
  let test2_result256 : lbytes 32 = Hash.hash Hash.parameters_sha2_256 test2_plaintext_len test2_plaintext in
  let test2_result384 : lbytes 48 = Hash.hash Hash.parameters_sha2_384 test2_plaintext_len test2_plaintext in
  let test2_result512 : lbytes 64 = Hash.hash Hash.parameters_sha2_512 test2_plaintext_len test2_plaintext in
  let test2_result224' : lbytes 28 = Hash.hash' Hash.parameters_sha2_224 test2_plaintext_len test2_plaintext in
  let test2_result256' : lbytes 32 = Hash.hash' Hash.parameters_sha2_256 test2_plaintext_len test2_plaintext in
  let test2_result384' : lbytes 48 = Hash.hash' Hash.parameters_sha2_384 test2_plaintext_len test2_plaintext in
  let test2_result512' : lbytes 64 = Hash.hash' Hash.parameters_sha2_512 test2_plaintext_len test2_plaintext in
  let result2_224 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test2_expected224 test2_result224 in
  let result2_256 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test2_expected256 test2_result256 in
  let result2_384 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test2_expected384 test2_result384 in
  let result2_512 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test2_expected512 test2_result512 in
  let result2_224' = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test2_expected224 test2_result224' in
  let result2_256' = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test2_expected256 test2_result256' in
  let result2_384' = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test2_expected384 test2_result384' in
  let result2_512' = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test2_expected512 test2_result512' in
  let result2 = result2_224 && result2_256 && result2_384 && result2_512 in
  let result2' = result2_224' && result2_256' && result2_384' && result2_512' in

  IO.print_string "\nExpected SHA2 224: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test2_expected224);
  IO.print_string "\nComputed SHA2 224: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test2_result224);
  IO.print_string "\nExpected SHA2 256: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test2_expected256);
  IO.print_string "\nComputed SHA2 256: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test2_result256);
  IO.print_string "\nExpected SHA2 384: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test2_expected384);
  IO.print_string "\nComputed SHA2 384: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test2_result384);
  IO.print_string "\nExpected SHA2 512: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test2_expected512);
  IO.print_string "\nComputed SHA2 512: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test2_result512);

  if result2 then IO.print_string "\nSHA2 Test2 ontime: Success!\n"
  else IO.print_string "\nSHA2 Test2 ontime: Failure :(\n";

  IO.print_string "\nExpected SHA2 Incremental 224: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test2_expected224);
  IO.print_string "\nComputed SHA2 Incremental 224: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test2_result224');
  IO.print_string "\nExpected SHA2 Incremental 256: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test2_expected256);
  IO.print_string "\nComputed SHA2 Incremental 256: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test2_result256');
  IO.print_string "\nExpected SHA2 Incremental 384: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test2_expected384);
  IO.print_string "\nComputed SHA2 Incremental 384: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test2_result384');
  IO.print_string "\nExpected SHA2 Incremental 512: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test2_expected512);
  IO.print_string "\nComputed SHA2 Incremental 512: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test2_result512');

  if result2' then IO.print_string "\nSHA2 Test2 incremental: Success!\n"
  else IO.print_string "\nSHA2 Test2 incremental: Failure :(\n";

  IO.print_string "\nTEST 3\n";
  let test3_plaintext_len : size_t = 56 in
  let test3_plaintext : lbytes test3_plaintext_len = createL test3_plaintext in
  let test3_expected224 : lbytes 28 = createL test3_expected224 in
  let test3_expected256 : lbytes 32 = createL test3_expected256 in
  let test3_expected384 : lbytes 48 = createL test3_expected384 in
  let test3_expected512 : lbytes 64 = createL test3_expected512 in
  let test3_result224 : lbytes 28 = Hash.hash Hash.parameters_sha2_224 test3_plaintext_len test3_plaintext in
  let test3_result256 : lbytes 32 = Hash.hash Hash.parameters_sha2_256 test3_plaintext_len test3_plaintext in
  let test3_result384 : lbytes 48 = Hash.hash Hash.parameters_sha2_384 test3_plaintext_len test3_plaintext in
  let test3_result512 : lbytes 64 = Hash.hash Hash.parameters_sha2_512 test3_plaintext_len test3_plaintext in
  let test3_result224' : lbytes 28 = Hash.hash' Hash.parameters_sha2_224 test3_plaintext_len test3_plaintext in
  let test3_result256' : lbytes 32 = Hash.hash' Hash.parameters_sha2_256 test3_plaintext_len test3_plaintext in
  let test3_result384' : lbytes 48 = Hash.hash' Hash.parameters_sha2_384 test3_plaintext_len test3_plaintext in
  let test3_result512' : lbytes 64 = Hash.hash' Hash.parameters_sha2_512 test3_plaintext_len test3_plaintext in
  let result3_224 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test3_expected224 test3_result224 in
  let result3_256 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test3_expected256 test3_result256 in
  let result3_384 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test3_expected384 test3_result384 in
  let result3_512 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test3_expected512 test3_result512 in
  let result3_224' = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test3_expected224 test3_result224' in
  let result3_256' = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test3_expected256 test3_result256' in
  let result3_384' = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test3_expected384 test3_result384' in
  let result3_512' = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test3_expected512 test3_result512' in
  let result3 = result3_224 && result3_256 && result3_384 && result3_512 in
  let result3' = result3_224' && result3_256' && result3_384' && result3_512' in

  IO.print_string "\nExpected SHA2 224: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test3_expected224);
  IO.print_string "\nComputed SHA2 224: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test3_result224);
  IO.print_string "\nExpected SHA2 256: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test3_expected256);
  IO.print_string "\nComputed SHA2 256: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test3_result256);
  IO.print_string "\nExpected SHA2 384: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test3_expected384);
  IO.print_string "\nComputed SHA2 384: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test3_result384);
  IO.print_string "\nExpected SHA2 512: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test3_expected512);
  IO.print_string "\nComputed SHA2 512: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test3_result512);

  if result3 then IO.print_string "\nSHA2 Test3 ontime: Success!\n"
  else IO.print_string "\nSHA2 Test3 ontime: Failure :(\n";

  IO.print_string "\nExpected SHA2 Incremental 224: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test3_expected224);
  IO.print_string "\nComputed SHA2 Incremental 224: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test3_result224');
  IO.print_string "\nExpected SHA2 Incremental 256: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test3_expected256);
  IO.print_string "\nComputed SHA2 Incremental 256: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test3_result256');
  IO.print_string "\nExpected SHA2 Incremental 384: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test3_expected384);
  IO.print_string "\nComputed SHA2 Incremental 384: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test3_result384');
  IO.print_string "\nExpected SHA2 Incremental 512: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test3_expected512);
  IO.print_string "\nComputed SHA2 Incremental 512: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test3_result512');

  if result3' then IO.print_string "\nSHA2 Test3 incremental: Success!\n"
  else IO.print_string "\nSHA2 Test3 incremental: Failure :(\n";

  IO.print_string "\nTEST 4\n";
  let test4_plaintext_len : size_t = 112 in
  let test4_plaintext : lbytes test4_plaintext_len = createL test4_plaintext in
  let test4_expected224 : lbytes 28 = createL test4_expected224 in
  let test4_expected256 : lbytes 32 = createL test4_expected256 in
  let test4_expected384 : lbytes 48 = createL test4_expected384 in
  let test4_expected512 : lbytes 64 = createL test4_expected512 in
  let test4_result224 : lbytes 28 = Hash.hash Hash.parameters_sha2_224 test4_plaintext_len test4_plaintext in
  let test4_result256 : lbytes 32 = Hash.hash Hash.parameters_sha2_256 test4_plaintext_len test4_plaintext in
  let test4_result384 : lbytes 48 = Hash.hash Hash.parameters_sha2_384 test4_plaintext_len test4_plaintext in
  let test4_result512 : lbytes 64 = Hash.hash Hash.parameters_sha2_512 test4_plaintext_len test4_plaintext in
  let test4_result224' : lbytes 28 = Hash.hash' Hash.parameters_sha2_224 test4_plaintext_len test4_plaintext in
  let test4_result256' : lbytes 32 = Hash.hash' Hash.parameters_sha2_256 test4_plaintext_len test4_plaintext in
  let test4_result384' : lbytes 48 = Hash.hash' Hash.parameters_sha2_384 test4_plaintext_len test4_plaintext in
  let test4_result512' : lbytes 64 = Hash.hash' Hash.parameters_sha2_512 test4_plaintext_len test4_plaintext in
  let result4_224 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test4_expected224 test4_result224 in
  let result4_256 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test4_expected256 test4_result256 in
  let result4_384 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test4_expected384 test4_result384 in
  let result4_512 = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test4_expected512 test4_result512 in
  let result4_224' = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test4_expected224 test4_result224' in
  let result4_256' = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test4_expected256 test4_result256' in
  let result4_384' = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test4_expected384 test4_result384' in
  let result4_512' = for_all2 (fun a b -> uint_to_nat #U8 a = uint_to_nat #U8 b) test4_expected512 test4_result512' in
  let result4 = result4_224 && result4_256 && result4_384 && result4_512 in
  let result4' = result4_224' && result4_256' && result4_384' && result4_512' in

  IO.print_string "\nExpected SHA2 224: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test4_expected224);
  IO.print_string "\nComputed SHA2 224: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test4_result224);
  IO.print_string "\nExpected SHA2 256: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test4_expected256);
  IO.print_string "\nComputed SHA2 256: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test4_result256);
  IO.print_string "\nExpected SHA2 384: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test4_expected384);
  IO.print_string "\nComputed SHA2 384: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test4_result384);
  IO.print_string "\nExpected SHA2 512: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test4_expected512);
  IO.print_string "\nComputed SHA2 512: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test4_result512);

  if result4 then IO.print_string "\nSHA2 Test4 ontime: Success!\n"
  else IO.print_string "\nSHA2 Test4 ontime: Failure :(\n";

  IO.print_string "\nExpected SHA2 Incremental 224: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test4_expected224);
  IO.print_string "\nComputed SHA2 Incremental 224: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test4_result224');
  IO.print_string "\nExpected SHA2 Incremental 256: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test4_expected256);
  IO.print_string "\nComputed SHA2 Incremental 256: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test4_result256');
  IO.print_string "\nExpected SHA2 Incremental 384: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test4_expected384);
  IO.print_string "\nComputed SHA2 Incremental 384: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test4_result384');
  IO.print_string "\nExpected SHA2 Incremental 512: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test4_expected512);
  IO.print_string "\nComputed SHA2 Incremental 512: ";
  List.iter (fun a -> IO.print_string (UInt8.to_string (u8_to_UInt8 a))) (as_list test4_result512');

  if result4' then IO.print_string "\nSHA2 Test4 incremental: Success!\n"
  else IO.print_string "\nSHA2 Test4 incremental: Failure :(\n";

  // Composite result
  if result1 && result1' && result2 && result2' && result3 && result3' && result4 && result4'
  then IO.print_string "\nComposite result: Success!\n"
  else IO.print_string "\nComposite result: Failure :(\n"

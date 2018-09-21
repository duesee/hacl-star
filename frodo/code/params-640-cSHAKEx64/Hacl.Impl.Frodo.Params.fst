module Hacl.Impl.Frodo.Params

open Lib.IntTypes
open Lib.PQ.Buffer

include Frodo.Params

let cshake_frodo = Hacl.SHA3.cshake128_frodo

let frodo_gen_matrix = Hacl.Impl.Frodo.Gen.frodo_gen_matrix_cshake_4x

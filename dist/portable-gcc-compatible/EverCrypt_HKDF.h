/* MIT License
 *
 * Copyright (c) 2016-2020 INRIA, CMU and Microsoft Corporation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */


#ifndef __EverCrypt_HKDF_H
#define __EverCrypt_HKDF_H

#if defined(__cplusplus)
extern "C" {
#endif

#include <string.h>
#include "krml/internal/types.h"
#include "krml/lowstar_endianness.h"
#include "krml/internal/target.h"


#include "Hacl_Spec.h"
#include "EverCrypt_HMAC.h"

/* SNIPPET_START: EverCrypt_HKDF_expand_sha1 */

void
EverCrypt_HKDF_expand_sha1(
  uint8_t *okm,
  uint8_t *prk,
  uint32_t prklen,
  uint8_t *info,
  uint32_t infolen,
  uint32_t len
);

/* SNIPPET_END: EverCrypt_HKDF_expand_sha1 */

/* SNIPPET_START: EverCrypt_HKDF_extract_sha1 */

void
EverCrypt_HKDF_extract_sha1(
  uint8_t *prk,
  uint8_t *salt,
  uint32_t saltlen,
  uint8_t *ikm,
  uint32_t ikmlen
);

/* SNIPPET_END: EverCrypt_HKDF_extract_sha1 */

/* SNIPPET_START: EverCrypt_HKDF_expand_sha2_256 */

void
EverCrypt_HKDF_expand_sha2_256(
  uint8_t *okm,
  uint8_t *prk,
  uint32_t prklen,
  uint8_t *info,
  uint32_t infolen,
  uint32_t len
);

/* SNIPPET_END: EverCrypt_HKDF_expand_sha2_256 */

/* SNIPPET_START: EverCrypt_HKDF_extract_sha2_256 */

void
EverCrypt_HKDF_extract_sha2_256(
  uint8_t *prk,
  uint8_t *salt,
  uint32_t saltlen,
  uint8_t *ikm,
  uint32_t ikmlen
);

/* SNIPPET_END: EverCrypt_HKDF_extract_sha2_256 */

/* SNIPPET_START: EverCrypt_HKDF_expand_sha2_384 */

void
EverCrypt_HKDF_expand_sha2_384(
  uint8_t *okm,
  uint8_t *prk,
  uint32_t prklen,
  uint8_t *info,
  uint32_t infolen,
  uint32_t len
);

/* SNIPPET_END: EverCrypt_HKDF_expand_sha2_384 */

/* SNIPPET_START: EverCrypt_HKDF_extract_sha2_384 */

void
EverCrypt_HKDF_extract_sha2_384(
  uint8_t *prk,
  uint8_t *salt,
  uint32_t saltlen,
  uint8_t *ikm,
  uint32_t ikmlen
);

/* SNIPPET_END: EverCrypt_HKDF_extract_sha2_384 */

/* SNIPPET_START: EverCrypt_HKDF_expand_sha2_512 */

void
EverCrypt_HKDF_expand_sha2_512(
  uint8_t *okm,
  uint8_t *prk,
  uint32_t prklen,
  uint8_t *info,
  uint32_t infolen,
  uint32_t len
);

/* SNIPPET_END: EverCrypt_HKDF_expand_sha2_512 */

/* SNIPPET_START: EverCrypt_HKDF_extract_sha2_512 */

void
EverCrypt_HKDF_extract_sha2_512(
  uint8_t *prk,
  uint8_t *salt,
  uint32_t saltlen,
  uint8_t *ikm,
  uint32_t ikmlen
);

/* SNIPPET_END: EverCrypt_HKDF_extract_sha2_512 */

/* SNIPPET_START: EverCrypt_HKDF_expand_blake2s */

void
EverCrypt_HKDF_expand_blake2s(
  uint8_t *okm,
  uint8_t *prk,
  uint32_t prklen,
  uint8_t *info,
  uint32_t infolen,
  uint32_t len
);

/* SNIPPET_END: EverCrypt_HKDF_expand_blake2s */

/* SNIPPET_START: EverCrypt_HKDF_extract_blake2s */

void
EverCrypt_HKDF_extract_blake2s(
  uint8_t *prk,
  uint8_t *salt,
  uint32_t saltlen,
  uint8_t *ikm,
  uint32_t ikmlen
);

/* SNIPPET_END: EverCrypt_HKDF_extract_blake2s */

/* SNIPPET_START: EverCrypt_HKDF_expand_blake2b */

void
EverCrypt_HKDF_expand_blake2b(
  uint8_t *okm,
  uint8_t *prk,
  uint32_t prklen,
  uint8_t *info,
  uint32_t infolen,
  uint32_t len
);

/* SNIPPET_END: EverCrypt_HKDF_expand_blake2b */

/* SNIPPET_START: EverCrypt_HKDF_extract_blake2b */

void
EverCrypt_HKDF_extract_blake2b(
  uint8_t *prk,
  uint8_t *salt,
  uint32_t saltlen,
  uint8_t *ikm,
  uint32_t ikmlen
);

/* SNIPPET_END: EverCrypt_HKDF_extract_blake2b */

/* SNIPPET_START: EverCrypt_HKDF_expand */

void
EverCrypt_HKDF_expand(
  Spec_Hash_Definitions_hash_alg a,
  uint8_t *okm,
  uint8_t *prk,
  uint32_t prklen,
  uint8_t *info,
  uint32_t infolen,
  uint32_t len
);

/* SNIPPET_END: EverCrypt_HKDF_expand */

/* SNIPPET_START: EverCrypt_HKDF_extract */

void
EverCrypt_HKDF_extract(
  Spec_Hash_Definitions_hash_alg a,
  uint8_t *prk,
  uint8_t *salt,
  uint32_t saltlen,
  uint8_t *ikm,
  uint32_t ikmlen
);

/* SNIPPET_END: EverCrypt_HKDF_extract */

#if defined(__cplusplus)
}
#endif

#define __EverCrypt_HKDF_H_DEFINED
#endif

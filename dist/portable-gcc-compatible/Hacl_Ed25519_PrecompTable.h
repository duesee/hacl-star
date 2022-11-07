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


#ifndef __Hacl_Ed25519_PrecompTable_H
#define __Hacl_Ed25519_PrecompTable_H

#if defined(__cplusplus)
extern "C" {
#endif

#include <string.h>
#include "krml/internal/types.h"
#include "krml/lowstar_endianness.h"
#include "krml/internal/target.h"




/* SNIPPET_START: Hacl_Ed25519_PrecompTable_precomp_basepoint_table_w4 */

static const
uint64_t
Hacl_Ed25519_PrecompTable_precomp_basepoint_table_w4[320U] =
  {
    (uint64_t)0U, (uint64_t)0U, (uint64_t)0U, (uint64_t)0U, (uint64_t)0U, (uint64_t)1U,
    (uint64_t)0U, (uint64_t)0U, (uint64_t)0U, (uint64_t)0U, (uint64_t)1U, (uint64_t)0U,
    (uint64_t)0U, (uint64_t)0U, (uint64_t)0U, (uint64_t)0U, (uint64_t)0U, (uint64_t)0U,
    (uint64_t)0U, (uint64_t)0U, (uint64_t)1738742601995546U, (uint64_t)1146398526822698U,
    (uint64_t)2070867633025821U, (uint64_t)562264141797630U, (uint64_t)587772402128613U,
    (uint64_t)1801439850948184U, (uint64_t)1351079888211148U, (uint64_t)450359962737049U,
    (uint64_t)900719925474099U, (uint64_t)1801439850948198U, (uint64_t)1U, (uint64_t)0U,
    (uint64_t)0U, (uint64_t)0U, (uint64_t)0U, (uint64_t)1841354044333475U,
    (uint64_t)16398895984059U, (uint64_t)755974180946558U, (uint64_t)900171276175154U,
    (uint64_t)1821297809914039U, (uint64_t)1661154287933054U, (uint64_t)284530020860578U,
    (uint64_t)1390261174866914U, (uint64_t)1524110943907984U, (uint64_t)1045603498418422U,
    (uint64_t)928651508580478U, (uint64_t)1383326941296346U, (uint64_t)961937908925785U,
    (uint64_t)80455759693706U, (uint64_t)904734540352947U, (uint64_t)1507481815385608U,
    (uint64_t)2223447444246085U, (uint64_t)1083941587175919U, (uint64_t)2059929906842505U,
    (uint64_t)1581435440146976U, (uint64_t)782730187692425U, (uint64_t)9928394897574U,
    (uint64_t)1539449519985236U, (uint64_t)1923587931078510U, (uint64_t)552919286076056U,
    (uint64_t)376925408065760U, (uint64_t)447320488831784U, (uint64_t)1362918338468019U,
    (uint64_t)1470031896696846U, (uint64_t)2189796996539902U, (uint64_t)1337552949959847U,
    (uint64_t)1762287177775726U, (uint64_t)237994495816815U, (uint64_t)1277840395970544U,
    (uint64_t)543972849007241U, (uint64_t)1224692671618814U, (uint64_t)162359533289271U,
    (uint64_t)282240927125249U, (uint64_t)586909166382289U, (uint64_t)17726488197838U,
    (uint64_t)377014554985659U, (uint64_t)1433835303052512U, (uint64_t)702061469493692U,
    (uint64_t)1142253108318154U, (uint64_t)318297794307551U, (uint64_t)954362646308543U,
    (uint64_t)517363881452320U, (uint64_t)1868013482130416U, (uint64_t)262562472373260U,
    (uint64_t)902232853249919U, (uint64_t)2107343057055746U, (uint64_t)462368348619024U,
    (uint64_t)1893758677092974U, (uint64_t)2177729767846389U, (uint64_t)2168532543559143U,
    (uint64_t)443867094639821U, (uint64_t)730169342581022U, (uint64_t)1564589016879755U,
    (uint64_t)51218195700649U, (uint64_t)76684578423745U, (uint64_t)560266272480743U,
    (uint64_t)922517457707697U, (uint64_t)2066645939860874U, (uint64_t)1318277348414638U,
    (uint64_t)1576726809084003U, (uint64_t)1817337608563665U, (uint64_t)1874240939237666U,
    (uint64_t)754733726333910U, (uint64_t)97085310406474U, (uint64_t)751148364309235U,
    (uint64_t)1622159695715187U, (uint64_t)1444098819684916U, (uint64_t)130920805558089U,
    (uint64_t)1260449179085308U, (uint64_t)1860021740768461U, (uint64_t)110052860348509U,
    (uint64_t)193830891643810U, (uint64_t)164148413933881U, (uint64_t)180017794795332U,
    (uint64_t)1523506525254651U, (uint64_t)465981629225956U, (uint64_t)559733514964572U,
    (uint64_t)1279624874416974U, (uint64_t)2026642326892306U, (uint64_t)1425156829982409U,
    (uint64_t)2160936383793147U, (uint64_t)1061870624975247U, (uint64_t)2023497043036941U,
    (uint64_t)117942212883190U, (uint64_t)490339622800774U, (uint64_t)1729931303146295U,
    (uint64_t)422305932971074U, (uint64_t)529103152793096U, (uint64_t)1211973233775992U,
    (uint64_t)721364955929681U, (uint64_t)1497674430438813U, (uint64_t)342545521275073U,
    (uint64_t)2102107575279372U, (uint64_t)2108462244669966U, (uint64_t)1382582406064082U,
    (uint64_t)2206396818383323U, (uint64_t)2109093268641147U, (uint64_t)10809845110983U,
    (uint64_t)1605176920880099U, (uint64_t)744640650753946U, (uint64_t)1712758897518129U,
    (uint64_t)373410811281809U, (uint64_t)648838265800209U, (uint64_t)813058095530999U,
    (uint64_t)513987632620169U, (uint64_t)465516160703329U, (uint64_t)2136322186126330U,
    (uint64_t)1979645899422932U, (uint64_t)1197131006470786U, (uint64_t)1467836664863979U,
    (uint64_t)1340751381374628U, (uint64_t)1810066212667962U, (uint64_t)1009933588225499U,
    (uint64_t)1106129188080873U, (uint64_t)1388980405213901U, (uint64_t)533719246598044U,
    (uint64_t)1169435803073277U, (uint64_t)198920999285821U, (uint64_t)487492330629854U,
    (uint64_t)1807093008537778U, (uint64_t)1540899012923865U, (uint64_t)2075080271659867U,
    (uint64_t)1527990806921523U, (uint64_t)1323728742908002U, (uint64_t)1568595959608205U,
    (uint64_t)1388032187497212U, (uint64_t)2026968840050568U, (uint64_t)1396591153295755U,
    (uint64_t)820416950170901U, (uint64_t)520060313205582U, (uint64_t)2016404325094901U,
    (uint64_t)1584709677868520U, (uint64_t)272161374469956U, (uint64_t)1567188603996816U,
    (uint64_t)1986160530078221U, (uint64_t)553930264324589U, (uint64_t)1058426729027503U,
    (uint64_t)8762762886675U, (uint64_t)2216098143382988U, (uint64_t)1835145266889223U,
    (uint64_t)1712936431558441U, (uint64_t)1017009937844974U, (uint64_t)585361667812740U,
    (uint64_t)2114711541628181U, (uint64_t)2238729632971439U, (uint64_t)121257546253072U,
    (uint64_t)847154149018345U, (uint64_t)211972965476684U, (uint64_t)287499084460129U,
    (uint64_t)2098247259180197U, (uint64_t)839070411583329U, (uint64_t)339551619574372U,
    (uint64_t)1432951287640743U, (uint64_t)526481249498942U, (uint64_t)931991661905195U,
    (uint64_t)1884279965674487U, (uint64_t)200486405604411U, (uint64_t)364173020594788U,
    (uint64_t)518034455936955U, (uint64_t)1085564703965501U, (uint64_t)16030410467927U,
    (uint64_t)604865933167613U, (uint64_t)1695298441093964U, (uint64_t)498856548116159U,
    (uint64_t)2193030062787034U, (uint64_t)1706339802964179U, (uint64_t)1721199073493888U,
    (uint64_t)820740951039755U, (uint64_t)1216053436896834U, (uint64_t)23954895815139U,
    (uint64_t)1662515208920491U, (uint64_t)1705443427511899U, (uint64_t)1957928899570365U,
    (uint64_t)1189636258255725U, (uint64_t)1795695471103809U, (uint64_t)1691191297654118U,
    (uint64_t)282402585374360U, (uint64_t)460405330264832U, (uint64_t)63765529445733U,
    (uint64_t)469763447404473U, (uint64_t)733607089694996U, (uint64_t)685410420186959U,
    (uint64_t)1096682630419738U, (uint64_t)1162548510542362U, (uint64_t)1020949526456676U,
    (uint64_t)1211660396870573U, (uint64_t)613126398222696U, (uint64_t)1117829165843251U,
    (uint64_t)742432540886650U, (uint64_t)1483755088010658U, (uint64_t)942392007134474U,
    (uint64_t)1447834130944107U, (uint64_t)489368274863410U, (uint64_t)23192985544898U,
    (uint64_t)648442406146160U, (uint64_t)785438843373876U, (uint64_t)249464684645238U,
    (uint64_t)170494608205618U, (uint64_t)335112827260550U, (uint64_t)1462050123162735U,
    (uint64_t)1084803668439016U, (uint64_t)853459233600325U, (uint64_t)215777728187495U,
    (uint64_t)1965759433526974U, (uint64_t)1349482894446537U, (uint64_t)694163317612871U,
    (uint64_t)860536766165036U, (uint64_t)1178788094084321U, (uint64_t)1652739626626996U,
    (uint64_t)2115723946388185U, (uint64_t)1577204379094664U, (uint64_t)1083882859023240U,
    (uint64_t)1768759143381635U, (uint64_t)1737180992507258U, (uint64_t)246054513922239U,
    (uint64_t)577253134087234U, (uint64_t)356340280578042U, (uint64_t)1638917769925142U,
    (uint64_t)223550348130103U, (uint64_t)470592666638765U, (uint64_t)22663573966996U,
    (uint64_t)596552461152400U, (uint64_t)364143537069499U, (uint64_t)3942119457699U,
    (uint64_t)107951982889287U, (uint64_t)1843471406713209U, (uint64_t)1625773041610986U,
    (uint64_t)1466141092501702U, (uint64_t)1043024095021271U, (uint64_t)310429964047508U,
    (uint64_t)98559121500372U, (uint64_t)152746933782868U, (uint64_t)259407205078261U,
    (uint64_t)828123093322585U, (uint64_t)1576847274280091U, (uint64_t)1170871375757302U,
    (uint64_t)1588856194642775U, (uint64_t)984767822341977U, (uint64_t)1141497997993760U,
    (uint64_t)809325345150796U, (uint64_t)1879837728202511U, (uint64_t)201340910657893U,
    (uint64_t)1079157558888483U, (uint64_t)1052373448588065U, (uint64_t)1732036202501778U,
    (uint64_t)2105292670328445U, (uint64_t)679751387312402U, (uint64_t)1679682144926229U,
    (uint64_t)1695823455818780U, (uint64_t)498852317075849U, (uint64_t)1786555067788433U,
    (uint64_t)1670727545779425U, (uint64_t)117945875433544U, (uint64_t)407939139781844U,
    (uint64_t)854632120023778U, (uint64_t)1413383148360437U, (uint64_t)286030901733673U,
    (uint64_t)1207361858071196U, (uint64_t)461340408181417U, (uint64_t)1096919590360164U,
    (uint64_t)1837594897475685U, (uint64_t)533755561544165U, (uint64_t)1638688042247712U,
    (uint64_t)1431653684793005U, (uint64_t)1036458538873559U, (uint64_t)390822120341779U,
    (uint64_t)1920929837111618U, (uint64_t)543426740024168U, (uint64_t)645751357799929U,
    (uint64_t)2245025632994463U, (uint64_t)1550778638076452U, (uint64_t)223738153459949U,
    (uint64_t)1337209385492033U, (uint64_t)1276967236456531U, (uint64_t)1463815821063071U,
    (uint64_t)2070620870191473U, (uint64_t)1199170709413753U, (uint64_t)273230877394166U,
    (uint64_t)1873264887608046U, (uint64_t)890877152910775U
  };

/* SNIPPET_END: Hacl_Ed25519_PrecompTable_precomp_basepoint_table_w4 */

/* SNIPPET_START: Hacl_Ed25519_PrecompTable_precomp_basepoint_table_w5 */

static const
uint64_t
Hacl_Ed25519_PrecompTable_precomp_basepoint_table_w5[640U] =
  {
    (uint64_t)0U, (uint64_t)0U, (uint64_t)0U, (uint64_t)0U, (uint64_t)0U, (uint64_t)1U,
    (uint64_t)0U, (uint64_t)0U, (uint64_t)0U, (uint64_t)0U, (uint64_t)1U, (uint64_t)0U,
    (uint64_t)0U, (uint64_t)0U, (uint64_t)0U, (uint64_t)0U, (uint64_t)0U, (uint64_t)0U,
    (uint64_t)0U, (uint64_t)0U, (uint64_t)1738742601995546U, (uint64_t)1146398526822698U,
    (uint64_t)2070867633025821U, (uint64_t)562264141797630U, (uint64_t)587772402128613U,
    (uint64_t)1801439850948184U, (uint64_t)1351079888211148U, (uint64_t)450359962737049U,
    (uint64_t)900719925474099U, (uint64_t)1801439850948198U, (uint64_t)1U, (uint64_t)0U,
    (uint64_t)0U, (uint64_t)0U, (uint64_t)0U, (uint64_t)1841354044333475U,
    (uint64_t)16398895984059U, (uint64_t)755974180946558U, (uint64_t)900171276175154U,
    (uint64_t)1821297809914039U, (uint64_t)1661154287933054U, (uint64_t)284530020860578U,
    (uint64_t)1390261174866914U, (uint64_t)1524110943907984U, (uint64_t)1045603498418422U,
    (uint64_t)928651508580478U, (uint64_t)1383326941296346U, (uint64_t)961937908925785U,
    (uint64_t)80455759693706U, (uint64_t)904734540352947U, (uint64_t)1507481815385608U,
    (uint64_t)2223447444246085U, (uint64_t)1083941587175919U, (uint64_t)2059929906842505U,
    (uint64_t)1581435440146976U, (uint64_t)782730187692425U, (uint64_t)9928394897574U,
    (uint64_t)1539449519985236U, (uint64_t)1923587931078510U, (uint64_t)552919286076056U,
    (uint64_t)376925408065760U, (uint64_t)447320488831784U, (uint64_t)1362918338468019U,
    (uint64_t)1470031896696846U, (uint64_t)2189796996539902U, (uint64_t)1337552949959847U,
    (uint64_t)1762287177775726U, (uint64_t)237994495816815U, (uint64_t)1277840395970544U,
    (uint64_t)543972849007241U, (uint64_t)1224692671618814U, (uint64_t)162359533289271U,
    (uint64_t)282240927125249U, (uint64_t)586909166382289U, (uint64_t)17726488197838U,
    (uint64_t)377014554985659U, (uint64_t)1433835303052512U, (uint64_t)702061469493692U,
    (uint64_t)1142253108318154U, (uint64_t)318297794307551U, (uint64_t)954362646308543U,
    (uint64_t)517363881452320U, (uint64_t)1868013482130416U, (uint64_t)262562472373260U,
    (uint64_t)902232853249919U, (uint64_t)2107343057055746U, (uint64_t)462368348619024U,
    (uint64_t)1893758677092974U, (uint64_t)2177729767846389U, (uint64_t)2168532543559143U,
    (uint64_t)443867094639821U, (uint64_t)730169342581022U, (uint64_t)1564589016879755U,
    (uint64_t)51218195700649U, (uint64_t)76684578423745U, (uint64_t)560266272480743U,
    (uint64_t)922517457707697U, (uint64_t)2066645939860874U, (uint64_t)1318277348414638U,
    (uint64_t)1576726809084003U, (uint64_t)1817337608563665U, (uint64_t)1874240939237666U,
    (uint64_t)754733726333910U, (uint64_t)97085310406474U, (uint64_t)751148364309235U,
    (uint64_t)1622159695715187U, (uint64_t)1444098819684916U, (uint64_t)130920805558089U,
    (uint64_t)1260449179085308U, (uint64_t)1860021740768461U, (uint64_t)110052860348509U,
    (uint64_t)193830891643810U, (uint64_t)164148413933881U, (uint64_t)180017794795332U,
    (uint64_t)1523506525254651U, (uint64_t)465981629225956U, (uint64_t)559733514964572U,
    (uint64_t)1279624874416974U, (uint64_t)2026642326892306U, (uint64_t)1425156829982409U,
    (uint64_t)2160936383793147U, (uint64_t)1061870624975247U, (uint64_t)2023497043036941U,
    (uint64_t)117942212883190U, (uint64_t)490339622800774U, (uint64_t)1729931303146295U,
    (uint64_t)422305932971074U, (uint64_t)529103152793096U, (uint64_t)1211973233775992U,
    (uint64_t)721364955929681U, (uint64_t)1497674430438813U, (uint64_t)342545521275073U,
    (uint64_t)2102107575279372U, (uint64_t)2108462244669966U, (uint64_t)1382582406064082U,
    (uint64_t)2206396818383323U, (uint64_t)2109093268641147U, (uint64_t)10809845110983U,
    (uint64_t)1605176920880099U, (uint64_t)744640650753946U, (uint64_t)1712758897518129U,
    (uint64_t)373410811281809U, (uint64_t)648838265800209U, (uint64_t)813058095530999U,
    (uint64_t)513987632620169U, (uint64_t)465516160703329U, (uint64_t)2136322186126330U,
    (uint64_t)1979645899422932U, (uint64_t)1197131006470786U, (uint64_t)1467836664863979U,
    (uint64_t)1340751381374628U, (uint64_t)1810066212667962U, (uint64_t)1009933588225499U,
    (uint64_t)1106129188080873U, (uint64_t)1388980405213901U, (uint64_t)533719246598044U,
    (uint64_t)1169435803073277U, (uint64_t)198920999285821U, (uint64_t)487492330629854U,
    (uint64_t)1807093008537778U, (uint64_t)1540899012923865U, (uint64_t)2075080271659867U,
    (uint64_t)1527990806921523U, (uint64_t)1323728742908002U, (uint64_t)1568595959608205U,
    (uint64_t)1388032187497212U, (uint64_t)2026968840050568U, (uint64_t)1396591153295755U,
    (uint64_t)820416950170901U, (uint64_t)520060313205582U, (uint64_t)2016404325094901U,
    (uint64_t)1584709677868520U, (uint64_t)272161374469956U, (uint64_t)1567188603996816U,
    (uint64_t)1986160530078221U, (uint64_t)553930264324589U, (uint64_t)1058426729027503U,
    (uint64_t)8762762886675U, (uint64_t)2216098143382988U, (uint64_t)1835145266889223U,
    (uint64_t)1712936431558441U, (uint64_t)1017009937844974U, (uint64_t)585361667812740U,
    (uint64_t)2114711541628181U, (uint64_t)2238729632971439U, (uint64_t)121257546253072U,
    (uint64_t)847154149018345U, (uint64_t)211972965476684U, (uint64_t)287499084460129U,
    (uint64_t)2098247259180197U, (uint64_t)839070411583329U, (uint64_t)339551619574372U,
    (uint64_t)1432951287640743U, (uint64_t)526481249498942U, (uint64_t)931991661905195U,
    (uint64_t)1884279965674487U, (uint64_t)200486405604411U, (uint64_t)364173020594788U,
    (uint64_t)518034455936955U, (uint64_t)1085564703965501U, (uint64_t)16030410467927U,
    (uint64_t)604865933167613U, (uint64_t)1695298441093964U, (uint64_t)498856548116159U,
    (uint64_t)2193030062787034U, (uint64_t)1706339802964179U, (uint64_t)1721199073493888U,
    (uint64_t)820740951039755U, (uint64_t)1216053436896834U, (uint64_t)23954895815139U,
    (uint64_t)1662515208920491U, (uint64_t)1705443427511899U, (uint64_t)1957928899570365U,
    (uint64_t)1189636258255725U, (uint64_t)1795695471103809U, (uint64_t)1691191297654118U,
    (uint64_t)282402585374360U, (uint64_t)460405330264832U, (uint64_t)63765529445733U,
    (uint64_t)469763447404473U, (uint64_t)733607089694996U, (uint64_t)685410420186959U,
    (uint64_t)1096682630419738U, (uint64_t)1162548510542362U, (uint64_t)1020949526456676U,
    (uint64_t)1211660396870573U, (uint64_t)613126398222696U, (uint64_t)1117829165843251U,
    (uint64_t)742432540886650U, (uint64_t)1483755088010658U, (uint64_t)942392007134474U,
    (uint64_t)1447834130944107U, (uint64_t)489368274863410U, (uint64_t)23192985544898U,
    (uint64_t)648442406146160U, (uint64_t)785438843373876U, (uint64_t)249464684645238U,
    (uint64_t)170494608205618U, (uint64_t)335112827260550U, (uint64_t)1462050123162735U,
    (uint64_t)1084803668439016U, (uint64_t)853459233600325U, (uint64_t)215777728187495U,
    (uint64_t)1965759433526974U, (uint64_t)1349482894446537U, (uint64_t)694163317612871U,
    (uint64_t)860536766165036U, (uint64_t)1178788094084321U, (uint64_t)1652739626626996U,
    (uint64_t)2115723946388185U, (uint64_t)1577204379094664U, (uint64_t)1083882859023240U,
    (uint64_t)1768759143381635U, (uint64_t)1737180992507258U, (uint64_t)246054513922239U,
    (uint64_t)577253134087234U, (uint64_t)356340280578042U, (uint64_t)1638917769925142U,
    (uint64_t)223550348130103U, (uint64_t)470592666638765U, (uint64_t)22663573966996U,
    (uint64_t)596552461152400U, (uint64_t)364143537069499U, (uint64_t)3942119457699U,
    (uint64_t)107951982889287U, (uint64_t)1843471406713209U, (uint64_t)1625773041610986U,
    (uint64_t)1466141092501702U, (uint64_t)1043024095021271U, (uint64_t)310429964047508U,
    (uint64_t)98559121500372U, (uint64_t)152746933782868U, (uint64_t)259407205078261U,
    (uint64_t)828123093322585U, (uint64_t)1576847274280091U, (uint64_t)1170871375757302U,
    (uint64_t)1588856194642775U, (uint64_t)984767822341977U, (uint64_t)1141497997993760U,
    (uint64_t)809325345150796U, (uint64_t)1879837728202511U, (uint64_t)201340910657893U,
    (uint64_t)1079157558888483U, (uint64_t)1052373448588065U, (uint64_t)1732036202501778U,
    (uint64_t)2105292670328445U, (uint64_t)679751387312402U, (uint64_t)1679682144926229U,
    (uint64_t)1695823455818780U, (uint64_t)498852317075849U, (uint64_t)1786555067788433U,
    (uint64_t)1670727545779425U, (uint64_t)117945875433544U, (uint64_t)407939139781844U,
    (uint64_t)854632120023778U, (uint64_t)1413383148360437U, (uint64_t)286030901733673U,
    (uint64_t)1207361858071196U, (uint64_t)461340408181417U, (uint64_t)1096919590360164U,
    (uint64_t)1837594897475685U, (uint64_t)533755561544165U, (uint64_t)1638688042247712U,
    (uint64_t)1431653684793005U, (uint64_t)1036458538873559U, (uint64_t)390822120341779U,
    (uint64_t)1920929837111618U, (uint64_t)543426740024168U, (uint64_t)645751357799929U,
    (uint64_t)2245025632994463U, (uint64_t)1550778638076452U, (uint64_t)223738153459949U,
    (uint64_t)1337209385492033U, (uint64_t)1276967236456531U, (uint64_t)1463815821063071U,
    (uint64_t)2070620870191473U, (uint64_t)1199170709413753U, (uint64_t)273230877394166U,
    (uint64_t)1873264887608046U, (uint64_t)890877152910775U, (uint64_t)983226445635730U,
    (uint64_t)44873798519521U, (uint64_t)697147127512130U, (uint64_t)961631038239304U,
    (uint64_t)709966160696826U, (uint64_t)1706677689540366U, (uint64_t)502782733796035U,
    (uint64_t)812545535346033U, (uint64_t)1693622521296452U, (uint64_t)1955813093002510U,
    (uint64_t)1259937612881362U, (uint64_t)1873032503803559U, (uint64_t)1140330566016428U,
    (uint64_t)1675726082440190U, (uint64_t)60029928909786U, (uint64_t)170335608866763U,
    (uint64_t)766444312315022U, (uint64_t)2025049511434113U, (uint64_t)2200845622430647U,
    (uint64_t)1201269851450408U, (uint64_t)590071752404907U, (uint64_t)1400995030286946U,
    (uint64_t)2152637413853822U, (uint64_t)2108495473841983U, (uint64_t)3855406710349U,
    (uint64_t)1726137673168580U, (uint64_t)51004317200100U, (uint64_t)1749082328586939U,
    (uint64_t)1704088976144558U, (uint64_t)1977318954775118U, (uint64_t)2062602253162400U,
    (uint64_t)948062503217479U, (uint64_t)361953965048030U, (uint64_t)1528264887238440U,
    (uint64_t)62582552172290U, (uint64_t)2241602163389280U, (uint64_t)156385388121765U,
    (uint64_t)2124100319761492U, (uint64_t)388928050571382U, (uint64_t)1556123596922727U,
    (uint64_t)979310669812384U, (uint64_t)113043855206104U, (uint64_t)2023223924825469U,
    (uint64_t)643651703263034U, (uint64_t)2234446903655540U, (uint64_t)1577241261424997U,
    (uint64_t)860253174523845U, (uint64_t)1691026473082448U, (uint64_t)1091672764933872U,
    (uint64_t)1957463109756365U, (uint64_t)530699502660193U, (uint64_t)349587141723569U,
    (uint64_t)674661681919563U, (uint64_t)1633727303856240U, (uint64_t)708909037922144U,
    (uint64_t)2160722508518119U, (uint64_t)1302188051602540U, (uint64_t)976114603845777U,
    (uint64_t)120004758721939U, (uint64_t)1681630708873780U, (uint64_t)622274095069244U,
    (uint64_t)1822346309016698U, (uint64_t)1100921177951904U, (uint64_t)2216952659181677U,
    (uint64_t)1844020550362490U, (uint64_t)1976451368365774U, (uint64_t)1321101422068822U,
    (uint64_t)1189859436282668U, (uint64_t)2008801879735257U, (uint64_t)2219413454333565U,
    (uint64_t)424288774231098U, (uint64_t)359793146977912U, (uint64_t)270293357948703U,
    (uint64_t)587226003677000U, (uint64_t)1482071926139945U, (uint64_t)1419630774650359U,
    (uint64_t)1104739070570175U, (uint64_t)1662129023224130U, (uint64_t)1609203612533411U,
    (uint64_t)1250932720691980U, (uint64_t)95215711818495U, (uint64_t)498746909028150U,
    (uint64_t)158151296991874U, (uint64_t)1201379988527734U, (uint64_t)561599945143989U,
    (uint64_t)2211577425617888U, (uint64_t)2166577612206324U, (uint64_t)1057590354233512U,
    (uint64_t)1968123280416769U, (uint64_t)1316586165401313U, (uint64_t)762728164447634U,
    (uint64_t)2045395244316047U, (uint64_t)1531796898725716U, (uint64_t)315385971670425U,
    (uint64_t)1109421039396756U, (uint64_t)2183635256408562U, (uint64_t)1896751252659461U,
    (uint64_t)840236037179080U, (uint64_t)796245792277211U, (uint64_t)508345890111193U,
    (uint64_t)1275386465287222U, (uint64_t)513560822858784U, (uint64_t)1784735733120313U,
    (uint64_t)1346467478899695U, (uint64_t)601125231208417U, (uint64_t)701076661112726U,
    (uint64_t)1841998436455089U, (uint64_t)1156768600940434U, (uint64_t)1967853462343221U,
    (uint64_t)2178318463061452U, (uint64_t)481885520752741U, (uint64_t)675262828640945U,
    (uint64_t)1033539418596582U, (uint64_t)1743329872635846U, (uint64_t)159322641251283U,
    (uint64_t)1573076470127113U, (uint64_t)954827619308195U, (uint64_t)778834750662635U,
    (uint64_t)619912782122617U, (uint64_t)515681498488209U, (uint64_t)1675866144246843U,
    (uint64_t)811716020969981U, (uint64_t)1125515272217398U, (uint64_t)1398917918287342U,
    (uint64_t)1301680949183175U, (uint64_t)726474739583734U, (uint64_t)587246193475200U,
    (uint64_t)1096581582611864U, (uint64_t)1469911826213486U, (uint64_t)1990099711206364U,
    (uint64_t)1256496099816508U, (uint64_t)2019924615195672U, (uint64_t)1251232456707555U,
    (uint64_t)2042971196009755U, (uint64_t)214061878479265U, (uint64_t)115385726395472U,
    (uint64_t)1677875239524132U, (uint64_t)756888883383540U, (uint64_t)1153862117756233U,
    (uint64_t)503391530851096U, (uint64_t)946070017477513U, (uint64_t)1878319040542579U,
    (uint64_t)1101349418586920U, (uint64_t)793245696431613U, (uint64_t)397920495357645U,
    (uint64_t)2174023872951112U, (uint64_t)1517867915189593U, (uint64_t)1829855041462995U,
    (uint64_t)1046709983503619U, (uint64_t)424081940711857U, (uint64_t)2112438073094647U,
    (uint64_t)1504338467349861U, (uint64_t)2244574127374532U, (uint64_t)2136937537441911U,
    (uint64_t)1741150838990304U, (uint64_t)25894628400571U, (uint64_t)512213526781178U,
    (uint64_t)1168384260796379U, (uint64_t)1424607682379833U, (uint64_t)938677789731564U,
    (uint64_t)872882241891896U, (uint64_t)1713199397007700U, (uint64_t)1410496326218359U,
    (uint64_t)854379752407031U, (uint64_t)465141611727634U, (uint64_t)315176937037857U,
    (uint64_t)1020115054571233U, (uint64_t)1856290111077229U, (uint64_t)2028366269898204U,
    (uint64_t)1432980880307543U, (uint64_t)469932710425448U, (uint64_t)581165267592247U,
    (uint64_t)496399148156603U, (uint64_t)2063435226705903U, (uint64_t)2116841086237705U,
    (uint64_t)498272567217048U, (uint64_t)1829438076967906U, (uint64_t)1573925801278491U,
    (uint64_t)460763576329867U, (uint64_t)1705264723728225U, (uint64_t)999514866082412U,
    (uint64_t)29635061779362U, (uint64_t)1884233592281020U, (uint64_t)1449755591461338U,
    (uint64_t)42579292783222U, (uint64_t)1869504355369200U, (uint64_t)495506004805251U,
    (uint64_t)264073104888427U, (uint64_t)2088880861028612U, (uint64_t)104646456386576U,
    (uint64_t)1258445191399967U, (uint64_t)1348736801545799U, (uint64_t)2068276361286613U,
    (uint64_t)884897216646374U, (uint64_t)922387476801376U, (uint64_t)1043886580402805U,
    (uint64_t)1240883498470831U, (uint64_t)1601554651937110U, (uint64_t)804382935289482U,
    (uint64_t)512379564477239U, (uint64_t)1466384519077032U, (uint64_t)1280698500238386U,
    (uint64_t)211303836685749U, (uint64_t)2081725624793803U, (uint64_t)545247644516879U,
    (uint64_t)215313359330384U, (uint64_t)286479751145614U, (uint64_t)2213650281751636U,
    (uint64_t)2164927945999874U, (uint64_t)2072162991540882U, (uint64_t)1443769115444779U,
    (uint64_t)1581473274363095U, (uint64_t)434633875922699U, (uint64_t)340456055781599U,
    (uint64_t)373043091080189U, (uint64_t)839476566531776U, (uint64_t)1856706858509978U,
    (uint64_t)931616224909153U, (uint64_t)1888181317414065U, (uint64_t)213654322650262U,
    (uint64_t)1161078103416244U, (uint64_t)1822042328851513U, (uint64_t)915817709028812U,
    (uint64_t)1828297056698188U, (uint64_t)1212017130909403U, (uint64_t)60258343247333U,
    (uint64_t)342085800008230U, (uint64_t)930240559508270U, (uint64_t)1549884999174952U,
    (uint64_t)809895264249462U, (uint64_t)184726257947682U, (uint64_t)1157065433504828U,
    (uint64_t)1209999630381477U, (uint64_t)999920399374391U, (uint64_t)1714770150788163U,
    (uint64_t)2026130985413228U, (uint64_t)506776632883140U, (uint64_t)1349042668246528U,
    (uint64_t)1937232292976967U, (uint64_t)942302637530730U, (uint64_t)160211904766226U,
    (uint64_t)1042724500438571U, (uint64_t)212454865139142U, (uint64_t)244104425172642U,
    (uint64_t)1376990622387496U, (uint64_t)76126752421227U, (uint64_t)1027540886376422U,
    (uint64_t)1912210655133026U, (uint64_t)13410411589575U, (uint64_t)1475856708587773U,
    (uint64_t)615563352691682U, (uint64_t)1446629324872644U, (uint64_t)1683670301784014U,
    (uint64_t)1049873327197127U, (uint64_t)1826401704084838U, (uint64_t)2032577048760775U,
    (uint64_t)1922203607878853U, (uint64_t)836708788764806U, (uint64_t)2193084654695012U,
    (uint64_t)1342923183256659U, (uint64_t)849356986294271U, (uint64_t)1228863973965618U,
    (uint64_t)94886161081867U, (uint64_t)1423288430204892U, (uint64_t)2016167528707016U,
    (uint64_t)1633187660972877U, (uint64_t)1550621242301752U, (uint64_t)340630244512994U,
    (uint64_t)2103577710806901U, (uint64_t)221625016538931U, (uint64_t)421544147350960U,
    (uint64_t)580428704555156U, (uint64_t)1479831381265617U, (uint64_t)518057926544698U,
    (uint64_t)955027348790630U, (uint64_t)1326749172561598U, (uint64_t)1118304625755967U,
    (uint64_t)1994005916095176U, (uint64_t)1799757332780663U, (uint64_t)751343129396941U,
    (uint64_t)1468672898746144U, (uint64_t)1451689964451386U, (uint64_t)755070293921171U,
    (uint64_t)904857405877052U, (uint64_t)1276087530766984U, (uint64_t)403986562858511U,
    (uint64_t)1530661255035337U, (uint64_t)1644972908910502U, (uint64_t)1370170080438957U,
    (uint64_t)139839536695744U, (uint64_t)909930462436512U, (uint64_t)1899999215356933U,
    (uint64_t)635992381064566U, (uint64_t)788740975837654U, (uint64_t)224241231493695U,
    (uint64_t)1267090030199302U, (uint64_t)998908061660139U, (uint64_t)1784537499699278U,
    (uint64_t)859195370018706U, (uint64_t)1953966091439379U, (uint64_t)2189271820076010U,
    (uint64_t)2039067059943978U, (uint64_t)1526694380855202U, (uint64_t)2040321513194941U,
    (uint64_t)329922071218689U, (uint64_t)1953032256401326U, (uint64_t)989631424403521U,
    (uint64_t)328825014934242U, (uint64_t)9407151397696U, (uint64_t)63551373671268U,
    (uint64_t)1624728632895792U, (uint64_t)1608324920739262U, (uint64_t)1178239350351945U,
    (uint64_t)1198077399579702U, (uint64_t)277620088676229U, (uint64_t)1775359437312528U,
    (uint64_t)1653558177737477U, (uint64_t)1652066043408850U, (uint64_t)1063359889686622U,
    (uint64_t)1975063804860653U
  };

/* SNIPPET_END: Hacl_Ed25519_PrecompTable_precomp_basepoint_table_w5 */

#if defined(__cplusplus)
}
#endif

#define __Hacl_Ed25519_PrecompTable_H_DEFINED
#endif

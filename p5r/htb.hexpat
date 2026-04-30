#pragma author oceanstuck, unknown

#pragma endian little
#include <atlus/p5r/common/bitflag.expat>

struct HtbHeader {
    be u32 magic, version, size, listOffset, entryCount;
    padding[12];
};

enum PromptKind : u16 {
    EXAMINE_FldCheckName0,
    GO_Blank,
    EXAMINE_FldCheckName1,
    EXAMINE_FldCheckName2,
    EXAMINE_FldCheckName3,
    EXAMINE_FldCheckName4,
    STEAL_FldCheckName,
    ACTION_FldActionName0,
    ACTION_FldActionName1,
    ACTION_FldActionName2,
    TALK_FldNpcName,
    GO_FldPlaceName,
    SHOP_FldCheckName,
    EXAMINE_FldKFECheckName
};

enum TriggerKind : u8 {
    Autohit,
    Hit = 2
};

struct HtbEntry {
    Bitflag enablingBitflags[3];
    Bitflag disablingBitflags[3];
    padding[1];
    TriggerKind triggerKind;
    u16 nameId, procedureId;
    PromptKind promptKind;
    u32 unused[7];
};

HtbHeader header @0x0;
HtbEntry entries[header.entryCount] @0x20;
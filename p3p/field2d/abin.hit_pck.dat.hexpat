#pragma author moddaman
#pragma endian little

// Pulling icon names from the init.bin/bgpanel/bgPanel.bin/icon_*.spr files,
// appending hex value in cases where two values share the same icon
enum icons : u8 {
    Move02_08 = 0x08, // Left and Right arrows above and below one another respectively
    Move02_18 = 0x18,
    Move03 = 0x28, // Door
    Save = 0x38,
    Exclamation = 0x48
};

struct fldObject {
    u16 ID [[color("00FFFF")]];
    u8 Field02 [[color("FFFF00")]];
    icons Icon [[color("FF7FFF")]];
    u16 Field04 [[color("FFFF00")]];
    u16 Field06 [[color("FF0000"), comment("Appears to always be 0xE803?")]];
    u32 ProcedureIndex [[color("00FF00"), comment("Index of Flowscript procedure to call when Object is interacted with.")]];
    u32 ShowOnFlag [[color("FFFF00"), comment("Shows if bitflag is enabled")]];
};

struct pckDAT {
    u32 TotalLength [[color("0000FF"), comment("Total length of all objects in bytes.")]];
    u32 ObjectCount [[color("0000FF")]];
    fldObject FieldObjects[ObjectCount] [[name("Field Objects")]];
    /*
        File may have extra bytes from here, but they're always just
        duplicated from the first X bytes of the file for padding
    */
};

pckDAT FILE @ 0 [[inline]];
#ifndef SRC_MEMORYFUNC_H_
#define SRC_MEMORYFUNC_H_


//global scroll registers
extern unsigned int hscroll_a[256];
extern unsigned int vscroll_a[64];
extern unsigned int hscroll_b[256];
extern unsigned int vscroll_b[64];



//basic memory write/read
void memWrite(unsigned int regNum, unsigned int addr, unsigned int data);
unsigned int memRead(unsigned int regNum, unsigned int addr);

//scroll register block copy
void scrollBlockCopy();

//tilemap functions
void fillTilemap(int pr, int color, int charcode, int tmsel);
void drawTilemap(int w, int h, int x, int y, int pr, int color, int charcode, int tmsel);

//tile block copy
void copyTiles(int charcode, const char data[], int size);
void copyTilesWithOffset(int charcode, const char data[], int size, int offset);

void copyPalette(int colorcode, const unsigned int data[]);

//sprites
void spriteAttrWrite(int pri, int size, int hflip, int vflip, int charcode, int palette, int xpos, int ypos, int denom);
void spriteXPosLSBWrite(int pri, int xpos);
void spriteYPosWrite(int pri, int ypos);
void spriteCodeLSBWrite(int pri, int code);
void spriteWriteText(char message[], int palette, int xpos, int ypos, int memoffset, int length);


#endif /* SRC_MEMORYFUNC_H_ */

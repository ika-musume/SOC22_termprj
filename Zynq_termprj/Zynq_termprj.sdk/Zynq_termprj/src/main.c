#include "stdio.h"
#include "xgpio.h"
#include "xparameters.h"
#include "bridgeio.h"
#include "rotaryio.h"
#include "xscugic.h"

#include "memoryfunc.h"
#include "graphics.h"
#include "game.h"


XScuGic INTCInst;
int framecntr = 0;
int seconds = 0;


void vblankInt(void *InstancePtr) {
    game();
}


//GIC IRQ Settings
void InitGIC_Interrupt() {
    XScuGic_Config *IntcConfig;

    IntcConfig = XScuGic_LookupConfig(XPAR_PS7_SCUGIC_0_DEVICE_ID);
    XScuGic_CfgInitialize(
        &INTCInst,
        IntcConfig,
        IntcConfig->CpuBaseAddress
    );

    //priority and trigger condition
    XScuGic_SetPriorityTriggerType(
        &INTCInst,
        XPAR_FABRIC_GFX_TOP_0_O_AXI_CPU_VBLANK_IRQ_INTR,
        0,
        3
    );

    XScuGic_Connect(
        &INTCInst,
        XPAR_FABRIC_GFX_TOP_0_O_AXI_CPU_VBLANK_IRQ_INTR,
        (Xil_ExceptionHandler)vblankInt,
        (void *)NULL
    );

    XScuGic_Enable(
        &INTCInst,
        XPAR_FABRIC_GFX_TOP_0_O_AXI_CPU_VBLANK_IRQ_INTR
    );
}

void InitCortex_Interrupt() {
    Xil_ExceptionRegisterHandler(
        XIL_EXCEPTION_ID_INT,
        (Xil_ExceptionHandler)XScuGic_InterruptHandler,
        &INTCInst
    );

    Xil_ExceptionEnable();
}





int main() {
    unsigned int i, j;

    //init charram
    for(i=0; i<0x7FFF; i++) {
        memWrite(3, i, 0x0000);
    }


    //init vram1+2
    for(i=0; i<0x800; i++) {
        memWrite(1, i, 0xE09C); //TMA, vram1
        memWrite(2, i, 0x0000); //TMA, vram2

        memWrite(1, i+0x800, 0x209C); //TMB, vram1
        memWrite(2, i+0x800, 0x0000); //TMB, vram2
    }


    //init scrollram
    for(i=0; i<0x800; i++) {
        memWrite(0, i, 0x0000);
    }


    //init objram
    for(i=0x00; i<0xF0; i++) {
        j = (239 - i) * 8;
        memWrite(4, j, i);
    }
    for(i=0xFF; i>=0xF0; i--) {
        j = i * 8;
        memWrite(4, j, i);
    }
    for(i=0; i<240; i++) {
        spriteAttrWrite(i, 4, 0, 0, 0, 0, 0, 0, 0x3FF);
    }

    

    //upload number
    for(i=0; i<10; i++) {
        copyTilesWithOffset(0x000 + i*2, text_num, 32, i*32);
    }

    //upload alphabet
    for(i=0; i<26; i++) {
    	copyTilesWithOffset(0x022 + i*2, text_eng, 32, i*32);
    }
    


    copyTiles(0x700, sun, sizeof(sun));
    copyPalette(20, sun_pal);
    drawTilemap(8, 8, 20, 8, 14, 20, 0x700, 0);

    //upload enemy sprites
    copyTiles(0x080, ene1_0, sizeof(ene1_0));
    copyTiles(0x084, ene1_1, sizeof(ene1_1));
    copyPalette(1, ene1_pal);

    copyTiles(0x088, ene2_0, sizeof(ene2_0));
    copyTiles(0x08C, ene2_1, sizeof(ene2_1));
    copyPalette(2, ene2_pal);

    copyTiles(0x090, ene3_0, sizeof(ene3_0));
    copyTiles(0x094, ene3_1, sizeof(ene3_1));
    copyPalette(3, ene3_pal);

    copyTiles(0x100, explosion0, sizeof(explosion0));
    copyTiles(0x104, explosion1, sizeof(explosion1));
    copyTiles(0x108, explosion2, sizeof(explosion2));
    copyTiles(0x10C, explosion3, sizeof(explosion3));
    copyTiles(0x110, explosion4, sizeof(explosion4));
    copyPalette(5, explosion_pal);

    copyTiles(0x098, missle, sizeof(missle));

    //upload ship sprites
    copyTiles(0x200, shipu, sizeof(shipu));
    copyTiles(0x204, shipd, sizeof(shipd));
    copyPalette(4, ship_pal);

    //upload title sprites
    copyTiles(0x400, title0, sizeof(title0));
    copyTiles(0x440, title1, sizeof(title1));
    copyTiles(0x480, title2, sizeof(title2));
    copyTiles(0x4C0, title3, sizeof(title3));
    copyPalette(8, title_pal);

    InitGIC_Interrupt();
    InitCortex_Interrupt();

    while(1) {

    }

    return 0;
}

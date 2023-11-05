#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "xgpio.h"
#include "xparameters.h"
#include "bridgeio.h"
#include "rotaryio.h"
#include "xscugic.h"
#include "stdint.h"

#include "memoryfunc.h"
#include "graphics.h"
#include "io.h"

#define OBJ_BOUNDARY_YMIN 24
#define OBJ_BOUNDARY_YMAX 233
#define ENEMY_ROW 3
#define MISSLE_SPEED 6

//0-15 = bullets
//16-47 = enemies
//48 49 = ship
//50-79 = text
//80 = title

//general purpose register
unsigned int i, j, k, t, u, v, w;

//frame counter
unsigned int frameCntr = 0;

//scene
int sceneState = 0;

//stage action
int actionState;
int actionCntr = 0x1FFF;

//ignore input
int inputInvalid;

//scroll
unsigned int scrollCntr;

//variable for dynamic palette
unsigned int paletteShiftCntr = 0;;
unsigned int paletteShiftTemp;

//dynamic sprite counter
unsigned int dynamicSpriteCntr = 0;

//enemy group X max
uint8_t enemyXMax = 0;

//SPRITE LIST
//valid/xpos/ypos/objcode/palette/denom
unsigned int enemyList[192]; //enemy list

unsigned int enemiesAlive = 0;

//valid/xpos/ypos
unsigned int bulletList[12] = {0}; //bullet list
unsigned int missleList[6] = {0}; //missle list

//enemy direction
unsigned int enemyDir = 0; //0 = right, 1 = left

//ship ypos
int shipYPos = 120;

unsigned int score = 0;





///////////////////////////////////////////////////////////
//////  TITLE SCREEN
////

void title() {
    //dynamic palette
    if((frameCntr & 0x3) == 0x3) {
        paletteShiftTemp = title_pal[5];
        for(i=4; i>0; i--) {
            title_pal[i+1] = title_pal[i];
        }
        title_pal[1] = paletteShiftTemp;

        copyPalette(8, title_pal);
    }

    frameCntr++;

    if(t == 63) t = 0;
    else t++;

    if(actionCntr <= 0x200) actionCntr = 0x200;
    else actionCntr = actionCntr - 64;
    w = actionCntr;

    spriteAttrWrite(80, 3, 0, 0, (0x400 | ((t & 0x18) << 3)), 8, 10 + (w >> 7), 60 - (w >> 9), (w >> 3));

    spriteWriteText("MMXXII  IKA-MUSUME", 2, 160, 190, 0, 18); //18 letters
    spriteWriteText("SOC DESIGN", 2, 170, 158, 18, 10); //10 letters
}



///////////////////////////////////////////////////////////
//////  GAME PREPARATION
////

void prepareGame() {
    //dynamic palette
    if((t & 0x3) == 0x3) {
        paletteShiftTemp = title_pal[5];
        for(i=4; i>0; i--) {
            title_pal[i+1] = title_pal[i];
        }
        title_pal[1] = paletteShiftTemp;

        copyPalette(8, title_pal);
    }

    //dynamic palette
    for(i=0; i<3; i++) {
        ship_pal[13 + i] = ship_fire_dynamic_pal[((t & 0xF) + i) & 0xF];
    }
    copyPalette(4, ship_pal);




    //sprite and palette update free-running counter
    if(t == 63) t = 0;
    else t++;

    //for enemy
    if(actionCntr <= 0x200) actionCntr = 0x200;
    else actionCntr = actionCntr - 64;
    k = actionCntr;
    //w = actionCntr; //value maintained, do not alter

    //get ready message
    if(actionCntr == 0x200) frameCntr++;
    else frameCntr = 0;


    //for title
    if((u & 0x1FF) == 0x100) u = u; //xpos 256
    else u--;

    //move title message
    spriteAttrWrite(80, 3, 0, 0, (0x400 | ((t & 0x18) << 3)), 8, u, 60 - (w >> 9), (w >> 3));

    //enemy sprites
    //k>>6 = 8, k>>4 = 32, k>>2 = 128

    //modify enemy attributes
    for(i=0; i<ENEMY_ROW; i++) {
        for(j=0; j<8; j++) {
            enemyList[i*48 + j*6 + 1] = 24*i + (k >> 4) - 16; //xpos
            enemyList[i*48 + j*6 + 2] = 24*j - (k >> 6) + 56; //ypos
            enemyList[i*48 + j*6 + 3] = (0x080 | ((i & 0x3) << 3) | ((t & 0x10) >> 2)); //objcode
            enemyList[i*48 + j*6 + 4] = i + 1; //palette
            enemyList[i*48 + j*6 + 5] = (k >> 2);
        }
    }

    //update enemy attributes
    for(i=0; i<ENEMY_ROW; i++) {
        for(j=0; j<8; j++) {
            spriteAttrWrite(8*i + j + 16, 7, 0, 0, 
                            enemyList[i*48 + j*6 + 3], //objcode
                            enemyList[i*48 + j*6 + 4], 
                            enemyList[i*48 + j*6 + 1], 
                            enemyList[i*48 + j*6 + 2], 
                            enemyList[i*48 + j*6 + 5]);
        }
    }

    //move ship
    if((u & 0x1FF) < 256) v = 242; //0~255
    else {
        if((u & 0xFF) <= 120) v = 120;
        else v = u;
    }

    spriteAttrWrite(48, 7, 0, 0, 0x200, 4, 222, v, 0x80); //shipu
    spriteAttrWrite(49, 7, 0, 0, 0x204, 4, 238, v, 0x80);

    return;
}



///////////////////////////////////////////////////////////
//////  MAIN GAME
////

void maingame() {
    //dynamic palette
    frameCntr++;

    for(i=0; i<3; i++) {
        ship_pal[13 + i] = ship_fire_dynamic_pal[((frameCntr & 0xF) + i) & 0xF];
    }
    copyPalette(4, ship_pal);



    //tilemap scroll
    for(i = 32 ; i < 232; i++) {
        hscroll_a[i] = (frameCntr&0x1FF) ^ 0x1FF;
    }
    scrollBlockCopy();



    //move ship
    shipYPos = shipYPos - getRotaryDelta();
    if(shipYPos > 220) shipYPos = 220;
    else if(shipYPos < 26) shipYPos = 26;
    spriteAttrWrite(48, 7, 0, 0, 0x200, 4, 222, shipYPos, 0x80);
    spriteAttrWrite(49, 7, 0, 0, 0x204, 4, 238, shipYPos, 0x80);




    //
    //  MISSLE LAUNCHER
    //

    //check fire button and create missle object
    i = missleList[0]*2 + missleList[3];

    if(i == 0) {
        //slot0 and 1 empty

        //place missle on slot 0
        if(psw()) {
            missleList[0] = 1;
            missleList[2] = shipYPos + 6;
            missleList[1] = 228;
        }
    }
    else if(i == 1) {
        //slot 0 empty

        //place missle on slot 0
        if(psw()) {
            missleList[0] = 1;
            missleList[2] = shipYPos + 6;
            missleList[1] = 228;
        }

        //move missle
        if((missleList[4] & 0x1FF) > 255 && (missleList[4] & 0x1FF) < 480) {
            missleList[3] = 0; //missle offscreen
        }
        missleList[5] = missleList[5];
        missleList[4] = missleList[4] - MISSLE_SPEED;
    }
    else if(i == 2) {
        //slot 1 empty

        //move missle
        if((missleList[1] & 0x1FF) > 255 && (missleList[1] & 0x1FF) < 480) {
            missleList[0] = 0; //missle offscreen
        }
        missleList[2] = missleList[2];
        missleList[1] = missleList[1] - MISSLE_SPEED;

        //place missle on slot 1
        if(psw()) {
            missleList[3] = 1;
            missleList[5] = shipYPos + 6;
            missleList[4] = 228;
        }
    }
    else {
        //slot full, ignore

        //move missle
        if((missleList[1] & 0x1FF) > 255 && (missleList[1] & 0x1FF) < 480) {
            missleList[0] = 0; //missle offscreen
        }
        missleList[2] = missleList[2];
        missleList[1] = missleList[1] - MISSLE_SPEED;

        //move missle
        if((missleList[4] & 0x1FF) > 255 && (missleList[4] & 0x1FF) < 480) {
            missleList[3] = 0; //missle offscreen
        }
        missleList[5] = missleList[5];
        missleList[4] = missleList[4] - MISSLE_SPEED;
    }

    //draw missle 0
    if(missleList[0] == 1) spriteAttrWrite(4, 5, 0, 0, 0x098, 4, missleList[1], missleList[2], 0x80);
    else spriteAttrWrite(4, 6, 0, 0, 0x07E, 4, 0, 0, 0x3F);
    
    //draw missle 1
    if(missleList[3] == 1) spriteAttrWrite(5, 5, 0, 0, 0x098, 4, missleList[4], missleList[5], 0x80);
    else spriteAttrWrite(5, 6, 0, 0, 0x07E, 4, 0, 0, 0x3F);








    //
    // ENEMY CONTROL/COLLISION DETECTION
    //

    /*
        missle hitbox: OBJY + 0, 1, 2, 3
                       OBJX + 0, 1, 2, 3, 4, 5

        enemy hitbox:  OBJY + 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
                       OBJX + 8, 9, 10, 11, 12, 13, 14, 15
    */

    //enemy offscreen collision
    enemiesAlive = 0;
    unsigned int enemyYMax = 0;
    unsigned int enemyYMin = 255;
    
    unsigned int enemyXPos, enemyYPos;
    unsigned int missleXPos, missleYPos;
    
    for(i=0; i<ENEMY_ROW; i++) {
        for(j=0; j<8; j++) {
            if(enemyList[i*48 + j*6] == 1) {
                enemiesAlive++;

                enemyYPos = enemyList[i*48 + j*6 + 2]; //get Ypos
                if(enemyYPos > enemyYMax) enemyYMax = enemyYPos + 16; //left end of vscreen
                if(enemyYPos < enemyYMin) enemyYMin = enemyYPos; //right end of vscreen

                enemyXPos = enemyList[i*48 + j*6 + 1]; //get Xpos
                if(enemyXPos > enemyXMax) enemyXMax = enemyXPos + 16; //bottom of vscreen

                
                //check missle->enemy collision
                for(k=0; k<2; k++) { //check twice for each missle
                    missleXPos = missleList[k*3 + 1];
                    missleYPos = missleList[k*3 + 2];

                    if(((enemyYPos+ 3 < missleYPos+3) && (enemyYPos+12 > missleYPos+3)) || 
                       ((enemyYPos+12 > missleYPos )  && (enemyYPos+ 3 < missleYPos  ))) { //y hit

                        if(((enemyXPos+ 8 < missleXPos+5) && (enemyXPos+15 > missleXPos+5)) ||
                           ((enemyXPos+15 > missleXPos  ) && (enemyXPos+ 8 < missleXPos  ))) { //x hit
                            enemyList[i*48 + j*6] = 128; //kill enemy(set as explosion state)
                            missleList[k*3    ] = 0; //kill missle
                            missleList[k*3 + 1] = 0;
                            missleList[k*3 + 2] = 0;

                            if(i == 0) score = score + 15;
                            else if(i == 1) score = score + 10;
                            else score = score + 5;
                        }
                    }
                }
            }
        }
    }

    //printf("enemy alive = %d\n", enemiesAlive);
    //printf("enemy ymax is %d, ymin is %d\n", enemyYMax, enemyYMin);

    //move enemy

    unsigned int moveOpFrequency, moveSpeed;
    moveOpFrequency = enemiesAlive;
    moveSpeed = 9 - enemiesAlive / 3;

    for(i=0; i<ENEMY_ROW; i++) {
        for(j=0; j<8; j++) {
            //move live enemies
            if(enemyList[i*48 + j*6] == 1) {
                if(actionCntr >= moveOpFrequency) {
                    //change direction to right
                    if(enemyYMax >= OBJ_BOUNDARY_YMAX && enemyYMin >= OBJ_BOUNDARY_YMIN) {
                        enemyDir = 0;

                        enemyList[i*48 + j*6 + 1] = enemyList[i*48 + j*6 + 1] + 4; //increase xpos
                        enemyList[i*48 + j*6 + 2] = enemyList[i*48 + j*6 + 2] - moveSpeed; //decrease ypos
                        spriteXPosLSBWrite(i*8 + j + 16, enemyList[i*48 + j*6 + 1]);
                        spriteYPosWrite(i*8 + j + 16, enemyList[i*48 + j*6 + 2]);
                    }

                    //change direciton to left
                    else if(enemyYMax <= OBJ_BOUNDARY_YMAX && enemyYMin <= OBJ_BOUNDARY_YMIN) {
                        enemyDir = 1;

                        enemyList[i*48 + j*6 + 1] = enemyList[i*48 + j*6 + 1] + 4; //increase xpos
                        enemyList[i*48 + j*6 + 2] = enemyList[i*48 + j*6 + 2] + moveSpeed; //increase ypos
                        spriteXPosLSBWrite(i*8 + j + 16, enemyList[i*48 + j*6 + 1]);
                        spriteYPosWrite(i*8 + j + 16, enemyList[i*48 + j*6 + 2]);
                    }

                    //move
                    else {
                        if(enemyDir == 0) { //right
                            enemyList[i*48 + j*6 + 2] = enemyList[i*48 + j*6 + 2] - moveSpeed; //decrease ypos
                            spriteYPosWrite(i*8 + j + 16, enemyList[i*48 + j*6 + 2]);
                        }
                        else { //left
                            enemyList[i*48 + j*6 + 2] = enemyList[i*48 + j*6 + 2] + moveSpeed; //increase ypos
                            spriteYPosWrite(i*8 + j + 16, enemyList[i*48 + j*6 + 2]);
                        }
                    }
                }
            }

            //remove killed enemies
            else if(enemyList[i*48 + j*6] > 127) {

                //if xpos<256
                if(enemyList[i*48 + j*6 + 1] < 256) {
                    //make explosion sprite code
                    int explosionObjCode = 0x100;
                    int explosionState = enemyList[i*48 + j*6];

                    if     (explosionState < 132) explosionObjCode = 0x100;
                    else if(explosionState < 140) explosionObjCode = 0x104;
                    else if(explosionState < 144) explosionObjCode = 0x108;
                    else if(explosionState < 148) explosionObjCode = 0x10C;
                    else if(explosionState < 152) explosionObjCode = 0x110;
                    else if(explosionState < 156) explosionObjCode = 0x10C;
                    else if(explosionState < 160) explosionObjCode = 0x108;
                    else if(explosionState < 164) explosionObjCode = 0x104;
                    else if(explosionState < 168) explosionObjCode = 0x100;
                    else if(explosionState < 172) explosionObjCode = 0x09C;

                    //increase xpos
                    enemyList[i*48 + j*6 + 1] = enemyList[i*48 + j*6 + 1] + 3;
                    spriteAttrWrite(i*8 + j + 16, 7, 0, 0, explosionObjCode, 5, enemyList[i*48 + j*6 + 1], enemyList[i*48 + j*6 + 2], 0x80);
                    
                    //increase exlosion state
                    if(explosionState < 170) enemyList[i*48 + j*6]++;
                    else enemyList[i*48 + j*6] = 0;
                }
                else {
                    enemyList[i*48 + j*6    ] = 0; //reset state
                    enemyList[i*48 + j*6 + 1] = 0; //reset xpos
                    enemyList[i*48 + j*6 + 2] = 0; //reset ypos

                    spriteAttrWrite(i*8 + j + 16, 4, 0, 0, 0x7FE, 5, enemyList[i*48 + j*6 + 1], enemyList[i*48 + j*6 + 2], 0x3FF);
                }
            }
        }
    }

    char scoreArr[4];
    scoreArr[0] = (score / 1000) + 0x30;
    scoreArr[1] = ((score % 1000) / 100) + 0x30;
    scoreArr[2] = ((score % 100) / 10) + 0x30;
    scoreArr[3] = (score % 10) + 0x30;

    spriteWriteText(scoreArr, 2, 0, 120, 8, 4);

    if(actionCntr >= enemiesAlive) actionCntr = 0;
    else actionCntr++;
}


///////////////////////////////////////////////////////////
//////  GAME OVER
////

void gameover() {
    frameCntr++;

}



///////////////////////////////////////////////////////////
//////  CASE
////

void game() {

    if(sceneState == 0) {
        title();

        i = psw();
        if(i == 1) {
            sceneState = 1; //change scene
            u = 10 + (w >> 7);
            actionCntr = 0x0FFF; //reset action counter

            //set all enemy as valid
            for(i=0; i<ENEMY_ROW; i++) {
                for(j=0; j<8; j++) {
                    enemyList[i*48 + j*6] = 1; //valid
                }
            }

            score = 0;

            spriteWriteText("1P SCORE          ", 2, 0, 200, 0, 18);
            spriteWriteText("0000", 2, 0, 120, 8, 4);
            spriteWriteText(" GET READY", 2, 160, 158, 18, 10);
        }

        return;
    }
    else if(sceneState == 1) {
        prepareGame();

        if(frameCntr == 120) {
            sceneState = 2; //change scene
            actionCntr = 0; //reset action counter
            scrollCntr = 0; //initialize scroll counter
            frameCntr = 0;
            shipYPos = 120; //reset ship Ypos
            getRotaryDelta(); //reset delta

            spriteAttrWrite(80, 4, 0, 0, 0x7FE, 3, 0, 0, 0x3FF); //erase title

            spriteWriteText("          ", 2, 160, 158, 18, 10);
        }
        return;
    }
    else if(sceneState == 2) {
        maingame();
        
        if(enemyXMax > 200 || enemiesAlive == 0) {
            sceneState = 3;
            actionCntr = 0x1FFF;
            enemyXMax = 0;
            frameCntr = 0;

            spriteWriteText(" GAME OVER", 2, 160, 158, 18, 10);
        }
        return;
    }
    else if(sceneState == 3) {
        gameover();

        if(frameCntr > 180) {
            sceneState = 0;

            for(i=0; i<192; i++) enemyList[i] = 0;
            for(i=0; i<12; i++) bulletList[i] = 0;
            for(i=0; i<6; i++) missleList[i] = 0;

            spriteWriteText("    ", 2, 0, 128, 8, 4); //erase text
            spriteWriteText("          ", 2, 160, 158, 18, 10);

            for(i=0; i<50; i++) {
                spriteAttrWrite(i, 4, 0, 0, 0, 0, 0, 0, 0x3FF); //remove sprites
            }
        }

        return;
    }
}
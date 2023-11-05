################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/game.c \
../src/graphics.c \
../src/io.c \
../src/main.c \
../src/memoryfunc.c 

OBJS += \
./src/game.o \
./src/graphics.o \
./src/io.o \
./src/main.o \
./src/memoryfunc.o 

C_DEPS += \
./src/game.d \
./src/graphics.d \
./src/io.d \
./src/main.d \
./src/memoryfunc.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../Zynq_termprj_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



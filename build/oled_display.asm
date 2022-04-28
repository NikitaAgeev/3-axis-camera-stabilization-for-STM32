
build/oled_display.elf:     file format elf32-littlearm

Sections:
Idx Name              Size      VMA       LMA       File off  Algn  Flags
  0 .isr_vector       000000c0  08000000  08000000  00010000  2**0  CONTENTS, ALLOC, LOAD, READONLY, DATA
  1 .text             0000098c  080000c0  080000c0  000100c0  2**2  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .rodata           00000004  08000a4c  08000a4c  00010a4c  2**2  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .init_array       00000008  08000a50  08000a50  00010a50  2**2  CONTENTS, ALLOC, LOAD, DATA
  4 .fini_array       00000004  08000a58  08000a58  00010a58  2**2  CONTENTS, ALLOC, LOAD, DATA
  5 .data             00000434  20000000  08000a5c  00020000  2**3  CONTENTS, ALLOC, LOAD, DATA
  6 .bss              00000020  20000434  08000e90  00020434  2**2  ALLOC
  7 ._user_heap_stack 00000604  20000454  08000e90  00020454  2**0  ALLOC
  8 .ARM.attributes   00000028  00000000  00000000  00020434  2**0  CONTENTS, READONLY
  9 .debug_info       00001390  00000000  00000000  0002045c  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 10 .debug_abbrev     000005a9  00000000  00000000  000217ec  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 11 .debug_loc        00000950  00000000  00000000  00021d95  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 12 .debug_aranges    000001e8  00000000  00000000  000226e5  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 13 .debug_ranges     00000198  00000000  00000000  000228cd  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 14 .debug_line       00000b45  00000000  00000000  00022a65  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 15 .debug_str        000006f6  00000000  00000000  000235aa  2**0  CONTENTS, READONLY, DEBUGGING, OCTETS
 16 .comment          00000049  00000000  00000000  00023ca0  2**0  CONTENTS, READONLY
 17 .debug_frame      00000790  00000000  00000000  00023cec  2**2  CONTENTS, READONLY, DEBUGGING, OCTETS

Disassembly of section .text:

080000c0 <__do_global_dtors_aux>:
 80000c0:	b510      	push	{r4, lr}
 80000c2:	4c06      	ldr	r4, [pc, #24]	; (80000dc <__do_global_dtors_aux+0x1c>)
 80000c4:	7823      	ldrb	r3, [r4, #0]
 80000c6:	2b00      	cmp	r3, #0
 80000c8:	d107      	bne.n	80000da <__do_global_dtors_aux+0x1a>
 80000ca:	4b05      	ldr	r3, [pc, #20]	; (80000e0 <__do_global_dtors_aux+0x20>)
 80000cc:	2b00      	cmp	r3, #0
 80000ce:	d002      	beq.n	80000d6 <__do_global_dtors_aux+0x16>
 80000d0:	4804      	ldr	r0, [pc, #16]	; (80000e4 <__do_global_dtors_aux+0x24>)
 80000d2:	e000      	b.n	80000d6 <__do_global_dtors_aux+0x16>
 80000d4:	bf00      	nop
 80000d6:	2301      	movs	r3, #1
 80000d8:	7023      	strb	r3, [r4, #0]
 80000da:	bd10      	pop	{r4, pc}
 80000dc:	20000434 	.word	0x20000434
 80000e0:	00000000 	.word	0x00000000
 80000e4:	08000a34 	.word	0x08000a34

080000e8 <frame_dummy>:
 80000e8:	4b04      	ldr	r3, [pc, #16]	; (80000fc <frame_dummy+0x14>)
 80000ea:	b510      	push	{r4, lr}
 80000ec:	2b00      	cmp	r3, #0
 80000ee:	d003      	beq.n	80000f8 <frame_dummy+0x10>
 80000f0:	4903      	ldr	r1, [pc, #12]	; (8000100 <frame_dummy+0x18>)
 80000f2:	4804      	ldr	r0, [pc, #16]	; (8000104 <frame_dummy+0x1c>)
 80000f4:	e000      	b.n	80000f8 <frame_dummy+0x10>
 80000f6:	bf00      	nop
 80000f8:	bd10      	pop	{r4, pc}
 80000fa:	46c0      	nop			; (mov r8, r8)
 80000fc:	00000000 	.word	0x00000000
 8000100:	20000438 	.word	0x20000438
 8000104:	08000a34 	.word	0x08000a34

08000108 <Reset_Handler>:
 8000108:	480d      	ldr	r0, [pc, #52]	; (8000140 <LoopForever+0x2>)
 800010a:	4685      	mov	sp, r0
 800010c:	480d      	ldr	r0, [pc, #52]	; (8000144 <LoopForever+0x6>)
 800010e:	490e      	ldr	r1, [pc, #56]	; (8000148 <LoopForever+0xa>)
 8000110:	4a0e      	ldr	r2, [pc, #56]	; (800014c <LoopForever+0xe>)
 8000112:	2300      	movs	r3, #0
 8000114:	e002      	b.n	800011c <LoopCopyDataInit>

08000116 <CopyDataInit>:
 8000116:	58d4      	ldr	r4, [r2, r3]
 8000118:	50c4      	str	r4, [r0, r3]
 800011a:	3304      	adds	r3, #4

0800011c <LoopCopyDataInit>:
 800011c:	18c4      	adds	r4, r0, r3
 800011e:	428c      	cmp	r4, r1
 8000120:	d3f9      	bcc.n	8000116 <CopyDataInit>
 8000122:	4a0b      	ldr	r2, [pc, #44]	; (8000150 <LoopForever+0x12>)
 8000124:	4c0b      	ldr	r4, [pc, #44]	; (8000154 <LoopForever+0x16>)
 8000126:	2300      	movs	r3, #0
 8000128:	e001      	b.n	800012e <LoopFillZerobss>

0800012a <FillZerobss>:
 800012a:	6013      	str	r3, [r2, #0]
 800012c:	3204      	adds	r2, #4

0800012e <LoopFillZerobss>:
 800012e:	42a2      	cmp	r2, r4
 8000130:	d3fb      	bcc.n	800012a <FillZerobss>
 8000132:	f000 f95d 	bl	80003f0 <SystemInit>
 8000136:	f000 fbd9 	bl	80008ec <__libc_init_array>
 800013a:	f000 f94d 	bl	80003d8 <main>

0800013e <LoopForever>:
 800013e:	e7fe      	b.n	800013e <LoopForever>
 8000140:	20002000 	.word	0x20002000
 8000144:	20000000 	.word	0x20000000
 8000148:	20000434 	.word	0x20000434
 800014c:	08000a5c 	.word	0x08000a5c
 8000150:	20000434 	.word	0x20000434
 8000154:	20000454 	.word	0x20000454

08000158 <ADC1_COMP_IRQHandler>:
 8000158:	e7fe      	b.n	8000158 <ADC1_COMP_IRQHandler>
	...

0800015c <LL_RCC_HSI_Enable>:
 800015c:	b580      	push	{r7, lr}
 800015e:	af00      	add	r7, sp, #0
 8000160:	4b04      	ldr	r3, [pc, #16]	; (8000174 <LL_RCC_HSI_Enable+0x18>)
 8000162:	681a      	ldr	r2, [r3, #0]
 8000164:	4b03      	ldr	r3, [pc, #12]	; (8000174 <LL_RCC_HSI_Enable+0x18>)
 8000166:	2101      	movs	r1, #1
 8000168:	430a      	orrs	r2, r1
 800016a:	601a      	str	r2, [r3, #0]
 800016c:	46c0      	nop			; (mov r8, r8)
 800016e:	46bd      	mov	sp, r7
 8000170:	bd80      	pop	{r7, pc}
 8000172:	46c0      	nop			; (mov r8, r8)
 8000174:	40021000 	.word	0x40021000

08000178 <LL_RCC_HSI_IsReady>:
 8000178:	b580      	push	{r7, lr}
 800017a:	af00      	add	r7, sp, #0
 800017c:	4b05      	ldr	r3, [pc, #20]	; (8000194 <LL_RCC_HSI_IsReady+0x1c>)
 800017e:	681b      	ldr	r3, [r3, #0]
 8000180:	2202      	movs	r2, #2
 8000182:	4013      	ands	r3, r2
 8000184:	3b02      	subs	r3, #2
 8000186:	425a      	negs	r2, r3
 8000188:	4153      	adcs	r3, r2
 800018a:	b2db      	uxtb	r3, r3
 800018c:	0018      	movs	r0, r3
 800018e:	46bd      	mov	sp, r7
 8000190:	bd80      	pop	{r7, pc}
 8000192:	46c0      	nop			; (mov r8, r8)
 8000194:	40021000 	.word	0x40021000

08000198 <LL_RCC_SetSysClkSource>:
 8000198:	b580      	push	{r7, lr}
 800019a:	b082      	sub	sp, #8
 800019c:	af00      	add	r7, sp, #0
 800019e:	6078      	str	r0, [r7, #4]
 80001a0:	4b06      	ldr	r3, [pc, #24]	; (80001bc <LL_RCC_SetSysClkSource+0x24>)
 80001a2:	685b      	ldr	r3, [r3, #4]
 80001a4:	2203      	movs	r2, #3
 80001a6:	4393      	bics	r3, r2
 80001a8:	0019      	movs	r1, r3
 80001aa:	4b04      	ldr	r3, [pc, #16]	; (80001bc <LL_RCC_SetSysClkSource+0x24>)
 80001ac:	687a      	ldr	r2, [r7, #4]
 80001ae:	430a      	orrs	r2, r1
 80001b0:	605a      	str	r2, [r3, #4]
 80001b2:	46c0      	nop			; (mov r8, r8)
 80001b4:	46bd      	mov	sp, r7
 80001b6:	b002      	add	sp, #8
 80001b8:	bd80      	pop	{r7, pc}
 80001ba:	46c0      	nop			; (mov r8, r8)
 80001bc:	40021000 	.word	0x40021000

080001c0 <LL_RCC_GetSysClkSource>:
 80001c0:	b580      	push	{r7, lr}
 80001c2:	af00      	add	r7, sp, #0
 80001c4:	4b03      	ldr	r3, [pc, #12]	; (80001d4 <LL_RCC_GetSysClkSource+0x14>)
 80001c6:	685b      	ldr	r3, [r3, #4]
 80001c8:	220c      	movs	r2, #12
 80001ca:	4013      	ands	r3, r2
 80001cc:	0018      	movs	r0, r3
 80001ce:	46bd      	mov	sp, r7
 80001d0:	bd80      	pop	{r7, pc}
 80001d2:	46c0      	nop			; (mov r8, r8)
 80001d4:	40021000 	.word	0x40021000

080001d8 <LL_RCC_SetAHBPrescaler>:
 80001d8:	b580      	push	{r7, lr}
 80001da:	b082      	sub	sp, #8
 80001dc:	af00      	add	r7, sp, #0
 80001de:	6078      	str	r0, [r7, #4]
 80001e0:	4b06      	ldr	r3, [pc, #24]	; (80001fc <LL_RCC_SetAHBPrescaler+0x24>)
 80001e2:	685b      	ldr	r3, [r3, #4]
 80001e4:	22f0      	movs	r2, #240	; 0xf0
 80001e6:	4393      	bics	r3, r2
 80001e8:	0019      	movs	r1, r3
 80001ea:	4b04      	ldr	r3, [pc, #16]	; (80001fc <LL_RCC_SetAHBPrescaler+0x24>)
 80001ec:	687a      	ldr	r2, [r7, #4]
 80001ee:	430a      	orrs	r2, r1
 80001f0:	605a      	str	r2, [r3, #4]
 80001f2:	46c0      	nop			; (mov r8, r8)
 80001f4:	46bd      	mov	sp, r7
 80001f6:	b002      	add	sp, #8
 80001f8:	bd80      	pop	{r7, pc}
 80001fa:	46c0      	nop			; (mov r8, r8)
 80001fc:	40021000 	.word	0x40021000

08000200 <LL_RCC_SetAPB1Prescaler>:
 8000200:	b580      	push	{r7, lr}
 8000202:	b082      	sub	sp, #8
 8000204:	af00      	add	r7, sp, #0
 8000206:	6078      	str	r0, [r7, #4]
 8000208:	4b06      	ldr	r3, [pc, #24]	; (8000224 <LL_RCC_SetAPB1Prescaler+0x24>)
 800020a:	685b      	ldr	r3, [r3, #4]
 800020c:	4a06      	ldr	r2, [pc, #24]	; (8000228 <LL_RCC_SetAPB1Prescaler+0x28>)
 800020e:	4013      	ands	r3, r2
 8000210:	0019      	movs	r1, r3
 8000212:	4b04      	ldr	r3, [pc, #16]	; (8000224 <LL_RCC_SetAPB1Prescaler+0x24>)
 8000214:	687a      	ldr	r2, [r7, #4]
 8000216:	430a      	orrs	r2, r1
 8000218:	605a      	str	r2, [r3, #4]
 800021a:	46c0      	nop			; (mov r8, r8)
 800021c:	46bd      	mov	sp, r7
 800021e:	b002      	add	sp, #8
 8000220:	bd80      	pop	{r7, pc}
 8000222:	46c0      	nop			; (mov r8, r8)
 8000224:	40021000 	.word	0x40021000
 8000228:	fffff8ff 	.word	0xfffff8ff

0800022c <LL_RCC_PLL_Enable>:
 800022c:	b580      	push	{r7, lr}
 800022e:	af00      	add	r7, sp, #0
 8000230:	4b04      	ldr	r3, [pc, #16]	; (8000244 <LL_RCC_PLL_Enable+0x18>)
 8000232:	681a      	ldr	r2, [r3, #0]
 8000234:	4b03      	ldr	r3, [pc, #12]	; (8000244 <LL_RCC_PLL_Enable+0x18>)
 8000236:	2180      	movs	r1, #128	; 0x80
 8000238:	0449      	lsls	r1, r1, #17
 800023a:	430a      	orrs	r2, r1
 800023c:	601a      	str	r2, [r3, #0]
 800023e:	46c0      	nop			; (mov r8, r8)
 8000240:	46bd      	mov	sp, r7
 8000242:	bd80      	pop	{r7, pc}
 8000244:	40021000 	.word	0x40021000

08000248 <LL_RCC_PLL_IsReady>:
 8000248:	b580      	push	{r7, lr}
 800024a:	af00      	add	r7, sp, #0
 800024c:	4b07      	ldr	r3, [pc, #28]	; (800026c <LL_RCC_PLL_IsReady+0x24>)
 800024e:	681a      	ldr	r2, [r3, #0]
 8000250:	2380      	movs	r3, #128	; 0x80
 8000252:	049b      	lsls	r3, r3, #18
 8000254:	4013      	ands	r3, r2
 8000256:	22fe      	movs	r2, #254	; 0xfe
 8000258:	0612      	lsls	r2, r2, #24
 800025a:	4694      	mov	ip, r2
 800025c:	4463      	add	r3, ip
 800025e:	425a      	negs	r2, r3
 8000260:	4153      	adcs	r3, r2
 8000262:	b2db      	uxtb	r3, r3
 8000264:	0018      	movs	r0, r3
 8000266:	46bd      	mov	sp, r7
 8000268:	bd80      	pop	{r7, pc}
 800026a:	46c0      	nop			; (mov r8, r8)
 800026c:	40021000 	.word	0x40021000

08000270 <LL_RCC_PLL_ConfigDomain_SYS>:
 8000270:	b580      	push	{r7, lr}
 8000272:	b082      	sub	sp, #8
 8000274:	af00      	add	r7, sp, #0
 8000276:	6078      	str	r0, [r7, #4]
 8000278:	6039      	str	r1, [r7, #0]
 800027a:	4b0e      	ldr	r3, [pc, #56]	; (80002b4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 800027c:	685b      	ldr	r3, [r3, #4]
 800027e:	4a0e      	ldr	r2, [pc, #56]	; (80002b8 <LL_RCC_PLL_ConfigDomain_SYS+0x48>)
 8000280:	4013      	ands	r3, r2
 8000282:	0019      	movs	r1, r3
 8000284:	687a      	ldr	r2, [r7, #4]
 8000286:	2380      	movs	r3, #128	; 0x80
 8000288:	025b      	lsls	r3, r3, #9
 800028a:	401a      	ands	r2, r3
 800028c:	683b      	ldr	r3, [r7, #0]
 800028e:	431a      	orrs	r2, r3
 8000290:	4b08      	ldr	r3, [pc, #32]	; (80002b4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 8000292:	430a      	orrs	r2, r1
 8000294:	605a      	str	r2, [r3, #4]
 8000296:	4b07      	ldr	r3, [pc, #28]	; (80002b4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 8000298:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 800029a:	220f      	movs	r2, #15
 800029c:	4393      	bics	r3, r2
 800029e:	0019      	movs	r1, r3
 80002a0:	687b      	ldr	r3, [r7, #4]
 80002a2:	220f      	movs	r2, #15
 80002a4:	401a      	ands	r2, r3
 80002a6:	4b03      	ldr	r3, [pc, #12]	; (80002b4 <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 80002a8:	430a      	orrs	r2, r1
 80002aa:	62da      	str	r2, [r3, #44]	; 0x2c
 80002ac:	46c0      	nop			; (mov r8, r8)
 80002ae:	46bd      	mov	sp, r7
 80002b0:	b002      	add	sp, #8
 80002b2:	bd80      	pop	{r7, pc}
 80002b4:	40021000 	.word	0x40021000
 80002b8:	ffc2ffff 	.word	0xffc2ffff

080002bc <LL_FLASH_SetLatency>:
 80002bc:	b580      	push	{r7, lr}
 80002be:	b082      	sub	sp, #8
 80002c0:	af00      	add	r7, sp, #0
 80002c2:	6078      	str	r0, [r7, #4]
 80002c4:	4b06      	ldr	r3, [pc, #24]	; (80002e0 <LL_FLASH_SetLatency+0x24>)
 80002c6:	681b      	ldr	r3, [r3, #0]
 80002c8:	2201      	movs	r2, #1
 80002ca:	4393      	bics	r3, r2
 80002cc:	0019      	movs	r1, r3
 80002ce:	4b04      	ldr	r3, [pc, #16]	; (80002e0 <LL_FLASH_SetLatency+0x24>)
 80002d0:	687a      	ldr	r2, [r7, #4]
 80002d2:	430a      	orrs	r2, r1
 80002d4:	601a      	str	r2, [r3, #0]
 80002d6:	46c0      	nop			; (mov r8, r8)
 80002d8:	46bd      	mov	sp, r7
 80002da:	b002      	add	sp, #8
 80002dc:	bd80      	pop	{r7, pc}
 80002de:	46c0      	nop			; (mov r8, r8)
 80002e0:	40022000 	.word	0x40022000

080002e4 <LL_AHB1_GRP1_EnableClock>:
 80002e4:	b580      	push	{r7, lr}
 80002e6:	b084      	sub	sp, #16
 80002e8:	af00      	add	r7, sp, #0
 80002ea:	6078      	str	r0, [r7, #4]
 80002ec:	4b07      	ldr	r3, [pc, #28]	; (800030c <LL_AHB1_GRP1_EnableClock+0x28>)
 80002ee:	6959      	ldr	r1, [r3, #20]
 80002f0:	4b06      	ldr	r3, [pc, #24]	; (800030c <LL_AHB1_GRP1_EnableClock+0x28>)
 80002f2:	687a      	ldr	r2, [r7, #4]
 80002f4:	430a      	orrs	r2, r1
 80002f6:	615a      	str	r2, [r3, #20]
 80002f8:	4b04      	ldr	r3, [pc, #16]	; (800030c <LL_AHB1_GRP1_EnableClock+0x28>)
 80002fa:	695b      	ldr	r3, [r3, #20]
 80002fc:	687a      	ldr	r2, [r7, #4]
 80002fe:	4013      	ands	r3, r2
 8000300:	60fb      	str	r3, [r7, #12]
 8000302:	68fb      	ldr	r3, [r7, #12]
 8000304:	46c0      	nop			; (mov r8, r8)
 8000306:	46bd      	mov	sp, r7
 8000308:	b004      	add	sp, #16
 800030a:	bd80      	pop	{r7, pc}
 800030c:	40021000 	.word	0x40021000

08000310 <LL_GPIO_SetPinMode>:
 8000310:	b580      	push	{r7, lr}
 8000312:	b084      	sub	sp, #16
 8000314:	af00      	add	r7, sp, #0
 8000316:	60f8      	str	r0, [r7, #12]
 8000318:	60b9      	str	r1, [r7, #8]
 800031a:	607a      	str	r2, [r7, #4]
 800031c:	68fb      	ldr	r3, [r7, #12]
 800031e:	6819      	ldr	r1, [r3, #0]
 8000320:	68bb      	ldr	r3, [r7, #8]
 8000322:	435b      	muls	r3, r3
 8000324:	001a      	movs	r2, r3
 8000326:	0013      	movs	r3, r2
 8000328:	005b      	lsls	r3, r3, #1
 800032a:	189b      	adds	r3, r3, r2
 800032c:	43db      	mvns	r3, r3
 800032e:	400b      	ands	r3, r1
 8000330:	001a      	movs	r2, r3
 8000332:	68bb      	ldr	r3, [r7, #8]
 8000334:	435b      	muls	r3, r3
 8000336:	6879      	ldr	r1, [r7, #4]
 8000338:	434b      	muls	r3, r1
 800033a:	431a      	orrs	r2, r3
 800033c:	68fb      	ldr	r3, [r7, #12]
 800033e:	601a      	str	r2, [r3, #0]
 8000340:	46c0      	nop			; (mov r8, r8)
 8000342:	46bd      	mov	sp, r7
 8000344:	b004      	add	sp, #16
 8000346:	bd80      	pop	{r7, pc}

08000348 <rcc_config>:
 8000348:	b580      	push	{r7, lr}
 800034a:	af00      	add	r7, sp, #0
 800034c:	2001      	movs	r0, #1
 800034e:	f7ff ffb5 	bl	80002bc <LL_FLASH_SetLatency>
 8000352:	f7ff ff03 	bl	800015c <LL_RCC_HSI_Enable>
 8000356:	46c0      	nop			; (mov r8, r8)
 8000358:	f7ff ff0e 	bl	8000178 <LL_RCC_HSI_IsReady>
 800035c:	0003      	movs	r3, r0
 800035e:	2b01      	cmp	r3, #1
 8000360:	d1fa      	bne.n	8000358 <rcc_config+0x10>
 8000362:	23a0      	movs	r3, #160	; 0xa0
 8000364:	039b      	lsls	r3, r3, #14
 8000366:	0019      	movs	r1, r3
 8000368:	2000      	movs	r0, #0
 800036a:	f7ff ff81 	bl	8000270 <LL_RCC_PLL_ConfigDomain_SYS>
 800036e:	f7ff ff5d 	bl	800022c <LL_RCC_PLL_Enable>
 8000372:	46c0      	nop			; (mov r8, r8)
 8000374:	f7ff ff68 	bl	8000248 <LL_RCC_PLL_IsReady>
 8000378:	0003      	movs	r3, r0
 800037a:	2b01      	cmp	r3, #1
 800037c:	d1fa      	bne.n	8000374 <rcc_config+0x2c>
 800037e:	2000      	movs	r0, #0
 8000380:	f7ff ff2a 	bl	80001d8 <LL_RCC_SetAHBPrescaler>
 8000384:	2002      	movs	r0, #2
 8000386:	f7ff ff07 	bl	8000198 <LL_RCC_SetSysClkSource>
 800038a:	46c0      	nop			; (mov r8, r8)
 800038c:	f7ff ff18 	bl	80001c0 <LL_RCC_GetSysClkSource>
 8000390:	0003      	movs	r3, r0
 8000392:	2b08      	cmp	r3, #8
 8000394:	d1fa      	bne.n	800038c <rcc_config+0x44>
 8000396:	2000      	movs	r0, #0
 8000398:	f7ff ff32 	bl	8000200 <LL_RCC_SetAPB1Prescaler>
 800039c:	4b02      	ldr	r3, [pc, #8]	; (80003a8 <rcc_config+0x60>)
 800039e:	4a03      	ldr	r2, [pc, #12]	; (80003ac <rcc_config+0x64>)
 80003a0:	601a      	str	r2, [r3, #0]
 80003a2:	46c0      	nop			; (mov r8, r8)
 80003a4:	46bd      	mov	sp, r7
 80003a6:	bd80      	pop	{r7, pc}
 80003a8:	20000000 	.word	0x20000000
 80003ac:	02dc6c00 	.word	0x02dc6c00

080003b0 <gpio_config>:
 80003b0:	b580      	push	{r7, lr}
 80003b2:	af00      	add	r7, sp, #0
 80003b4:	2380      	movs	r3, #128	; 0x80
 80003b6:	031b      	lsls	r3, r3, #12
 80003b8:	0018      	movs	r0, r3
 80003ba:	f7ff ff93 	bl	80002e4 <LL_AHB1_GRP1_EnableClock>
 80003be:	2380      	movs	r3, #128	; 0x80
 80003c0:	009b      	lsls	r3, r3, #2
 80003c2:	4804      	ldr	r0, [pc, #16]	; (80003d4 <gpio_config+0x24>)
 80003c4:	2201      	movs	r2, #1
 80003c6:	0019      	movs	r1, r3
 80003c8:	f7ff ffa2 	bl	8000310 <LL_GPIO_SetPinMode>
 80003cc:	46c0      	nop			; (mov r8, r8)
 80003ce:	46bd      	mov	sp, r7
 80003d0:	bd80      	pop	{r7, pc}
 80003d2:	46c0      	nop			; (mov r8, r8)
 80003d4:	48000800 	.word	0x48000800

080003d8 <main>:
 80003d8:	b580      	push	{r7, lr}
 80003da:	af00      	add	r7, sp, #0
 80003dc:	f7ff ffb4 	bl	8000348 <rcc_config>
 80003e0:	f7ff ffe6 	bl	80003b0 <gpio_config>
 80003e4:	f000 f970 	bl	80006c8 <I2C_config>
 80003e8:	f000 fa4c 	bl	8000884 <giro_config>
 80003ec:	e7fe      	b.n	80003ec <main+0x14>
	...

080003f0 <SystemInit>:
 80003f0:	b580      	push	{r7, lr}
 80003f2:	af00      	add	r7, sp, #0
 80003f4:	4b1a      	ldr	r3, [pc, #104]	; (8000460 <SystemInit+0x70>)
 80003f6:	681a      	ldr	r2, [r3, #0]
 80003f8:	4b19      	ldr	r3, [pc, #100]	; (8000460 <SystemInit+0x70>)
 80003fa:	2101      	movs	r1, #1
 80003fc:	430a      	orrs	r2, r1
 80003fe:	601a      	str	r2, [r3, #0]
 8000400:	4b17      	ldr	r3, [pc, #92]	; (8000460 <SystemInit+0x70>)
 8000402:	685a      	ldr	r2, [r3, #4]
 8000404:	4b16      	ldr	r3, [pc, #88]	; (8000460 <SystemInit+0x70>)
 8000406:	4917      	ldr	r1, [pc, #92]	; (8000464 <SystemInit+0x74>)
 8000408:	400a      	ands	r2, r1
 800040a:	605a      	str	r2, [r3, #4]
 800040c:	4b14      	ldr	r3, [pc, #80]	; (8000460 <SystemInit+0x70>)
 800040e:	681a      	ldr	r2, [r3, #0]
 8000410:	4b13      	ldr	r3, [pc, #76]	; (8000460 <SystemInit+0x70>)
 8000412:	4915      	ldr	r1, [pc, #84]	; (8000468 <SystemInit+0x78>)
 8000414:	400a      	ands	r2, r1
 8000416:	601a      	str	r2, [r3, #0]
 8000418:	4b11      	ldr	r3, [pc, #68]	; (8000460 <SystemInit+0x70>)
 800041a:	681a      	ldr	r2, [r3, #0]
 800041c:	4b10      	ldr	r3, [pc, #64]	; (8000460 <SystemInit+0x70>)
 800041e:	4913      	ldr	r1, [pc, #76]	; (800046c <SystemInit+0x7c>)
 8000420:	400a      	ands	r2, r1
 8000422:	601a      	str	r2, [r3, #0]
 8000424:	4b0e      	ldr	r3, [pc, #56]	; (8000460 <SystemInit+0x70>)
 8000426:	685a      	ldr	r2, [r3, #4]
 8000428:	4b0d      	ldr	r3, [pc, #52]	; (8000460 <SystemInit+0x70>)
 800042a:	4911      	ldr	r1, [pc, #68]	; (8000470 <SystemInit+0x80>)
 800042c:	400a      	ands	r2, r1
 800042e:	605a      	str	r2, [r3, #4]
 8000430:	4b0b      	ldr	r3, [pc, #44]	; (8000460 <SystemInit+0x70>)
 8000432:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8000434:	4b0a      	ldr	r3, [pc, #40]	; (8000460 <SystemInit+0x70>)
 8000436:	210f      	movs	r1, #15
 8000438:	438a      	bics	r2, r1
 800043a:	62da      	str	r2, [r3, #44]	; 0x2c
 800043c:	4b08      	ldr	r3, [pc, #32]	; (8000460 <SystemInit+0x70>)
 800043e:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000440:	4b07      	ldr	r3, [pc, #28]	; (8000460 <SystemInit+0x70>)
 8000442:	490c      	ldr	r1, [pc, #48]	; (8000474 <SystemInit+0x84>)
 8000444:	400a      	ands	r2, r1
 8000446:	631a      	str	r2, [r3, #48]	; 0x30
 8000448:	4b05      	ldr	r3, [pc, #20]	; (8000460 <SystemInit+0x70>)
 800044a:	6b5a      	ldr	r2, [r3, #52]	; 0x34
 800044c:	4b04      	ldr	r3, [pc, #16]	; (8000460 <SystemInit+0x70>)
 800044e:	2101      	movs	r1, #1
 8000450:	438a      	bics	r2, r1
 8000452:	635a      	str	r2, [r3, #52]	; 0x34
 8000454:	4b02      	ldr	r3, [pc, #8]	; (8000460 <SystemInit+0x70>)
 8000456:	2200      	movs	r2, #0
 8000458:	609a      	str	r2, [r3, #8]
 800045a:	46c0      	nop			; (mov r8, r8)
 800045c:	46bd      	mov	sp, r7
 800045e:	bd80      	pop	{r7, pc}
 8000460:	40021000 	.word	0x40021000
 8000464:	f8ffb80c 	.word	0xf8ffb80c
 8000468:	fef6ffff 	.word	0xfef6ffff
 800046c:	fffbffff 	.word	0xfffbffff
 8000470:	ffc0ffff 	.word	0xffc0ffff
 8000474:	fffffeac 	.word	0xfffffeac

08000478 <LL_AHB1_GRP1_EnableClock>:
 8000478:	b580      	push	{r7, lr}
 800047a:	b084      	sub	sp, #16
 800047c:	af00      	add	r7, sp, #0
 800047e:	6078      	str	r0, [r7, #4]
 8000480:	4b07      	ldr	r3, [pc, #28]	; (80004a0 <LL_AHB1_GRP1_EnableClock+0x28>)
 8000482:	6959      	ldr	r1, [r3, #20]
 8000484:	4b06      	ldr	r3, [pc, #24]	; (80004a0 <LL_AHB1_GRP1_EnableClock+0x28>)
 8000486:	687a      	ldr	r2, [r7, #4]
 8000488:	430a      	orrs	r2, r1
 800048a:	615a      	str	r2, [r3, #20]
 800048c:	4b04      	ldr	r3, [pc, #16]	; (80004a0 <LL_AHB1_GRP1_EnableClock+0x28>)
 800048e:	695b      	ldr	r3, [r3, #20]
 8000490:	687a      	ldr	r2, [r7, #4]
 8000492:	4013      	ands	r3, r2
 8000494:	60fb      	str	r3, [r7, #12]
 8000496:	68fb      	ldr	r3, [r7, #12]
 8000498:	46c0      	nop			; (mov r8, r8)
 800049a:	46bd      	mov	sp, r7
 800049c:	b004      	add	sp, #16
 800049e:	bd80      	pop	{r7, pc}
 80004a0:	40021000 	.word	0x40021000

080004a4 <LL_APB1_GRP1_EnableClock>:
 80004a4:	b580      	push	{r7, lr}
 80004a6:	b084      	sub	sp, #16
 80004a8:	af00      	add	r7, sp, #0
 80004aa:	6078      	str	r0, [r7, #4]
 80004ac:	4b07      	ldr	r3, [pc, #28]	; (80004cc <LL_APB1_GRP1_EnableClock+0x28>)
 80004ae:	69d9      	ldr	r1, [r3, #28]
 80004b0:	4b06      	ldr	r3, [pc, #24]	; (80004cc <LL_APB1_GRP1_EnableClock+0x28>)
 80004b2:	687a      	ldr	r2, [r7, #4]
 80004b4:	430a      	orrs	r2, r1
 80004b6:	61da      	str	r2, [r3, #28]
 80004b8:	4b04      	ldr	r3, [pc, #16]	; (80004cc <LL_APB1_GRP1_EnableClock+0x28>)
 80004ba:	69db      	ldr	r3, [r3, #28]
 80004bc:	687a      	ldr	r2, [r7, #4]
 80004be:	4013      	ands	r3, r2
 80004c0:	60fb      	str	r3, [r7, #12]
 80004c2:	68fb      	ldr	r3, [r7, #12]
 80004c4:	46c0      	nop			; (mov r8, r8)
 80004c6:	46bd      	mov	sp, r7
 80004c8:	b004      	add	sp, #16
 80004ca:	bd80      	pop	{r7, pc}
 80004cc:	40021000 	.word	0x40021000

080004d0 <LL_GPIO_SetPinMode>:
 80004d0:	b580      	push	{r7, lr}
 80004d2:	b084      	sub	sp, #16
 80004d4:	af00      	add	r7, sp, #0
 80004d6:	60f8      	str	r0, [r7, #12]
 80004d8:	60b9      	str	r1, [r7, #8]
 80004da:	607a      	str	r2, [r7, #4]
 80004dc:	68fb      	ldr	r3, [r7, #12]
 80004de:	6819      	ldr	r1, [r3, #0]
 80004e0:	68bb      	ldr	r3, [r7, #8]
 80004e2:	435b      	muls	r3, r3
 80004e4:	001a      	movs	r2, r3
 80004e6:	0013      	movs	r3, r2
 80004e8:	005b      	lsls	r3, r3, #1
 80004ea:	189b      	adds	r3, r3, r2
 80004ec:	43db      	mvns	r3, r3
 80004ee:	400b      	ands	r3, r1
 80004f0:	001a      	movs	r2, r3
 80004f2:	68bb      	ldr	r3, [r7, #8]
 80004f4:	435b      	muls	r3, r3
 80004f6:	6879      	ldr	r1, [r7, #4]
 80004f8:	434b      	muls	r3, r1
 80004fa:	431a      	orrs	r2, r3
 80004fc:	68fb      	ldr	r3, [r7, #12]
 80004fe:	601a      	str	r2, [r3, #0]
 8000500:	46c0      	nop			; (mov r8, r8)
 8000502:	46bd      	mov	sp, r7
 8000504:	b004      	add	sp, #16
 8000506:	bd80      	pop	{r7, pc}

08000508 <LL_GPIO_SetPinOutputType>:
 8000508:	b580      	push	{r7, lr}
 800050a:	b084      	sub	sp, #16
 800050c:	af00      	add	r7, sp, #0
 800050e:	60f8      	str	r0, [r7, #12]
 8000510:	60b9      	str	r1, [r7, #8]
 8000512:	607a      	str	r2, [r7, #4]
 8000514:	68fb      	ldr	r3, [r7, #12]
 8000516:	685b      	ldr	r3, [r3, #4]
 8000518:	68ba      	ldr	r2, [r7, #8]
 800051a:	43d2      	mvns	r2, r2
 800051c:	401a      	ands	r2, r3
 800051e:	68bb      	ldr	r3, [r7, #8]
 8000520:	6879      	ldr	r1, [r7, #4]
 8000522:	434b      	muls	r3, r1
 8000524:	431a      	orrs	r2, r3
 8000526:	68fb      	ldr	r3, [r7, #12]
 8000528:	605a      	str	r2, [r3, #4]
 800052a:	46c0      	nop			; (mov r8, r8)
 800052c:	46bd      	mov	sp, r7
 800052e:	b004      	add	sp, #16
 8000530:	bd80      	pop	{r7, pc}

08000532 <LL_GPIO_SetPinSpeed>:
 8000532:	b580      	push	{r7, lr}
 8000534:	b084      	sub	sp, #16
 8000536:	af00      	add	r7, sp, #0
 8000538:	60f8      	str	r0, [r7, #12]
 800053a:	60b9      	str	r1, [r7, #8]
 800053c:	607a      	str	r2, [r7, #4]
 800053e:	68fb      	ldr	r3, [r7, #12]
 8000540:	6899      	ldr	r1, [r3, #8]
 8000542:	68bb      	ldr	r3, [r7, #8]
 8000544:	435b      	muls	r3, r3
 8000546:	001a      	movs	r2, r3
 8000548:	0013      	movs	r3, r2
 800054a:	005b      	lsls	r3, r3, #1
 800054c:	189b      	adds	r3, r3, r2
 800054e:	43db      	mvns	r3, r3
 8000550:	400b      	ands	r3, r1
 8000552:	001a      	movs	r2, r3
 8000554:	68bb      	ldr	r3, [r7, #8]
 8000556:	435b      	muls	r3, r3
 8000558:	6879      	ldr	r1, [r7, #4]
 800055a:	434b      	muls	r3, r1
 800055c:	431a      	orrs	r2, r3
 800055e:	68fb      	ldr	r3, [r7, #12]
 8000560:	609a      	str	r2, [r3, #8]
 8000562:	46c0      	nop			; (mov r8, r8)
 8000564:	46bd      	mov	sp, r7
 8000566:	b004      	add	sp, #16
 8000568:	bd80      	pop	{r7, pc}

0800056a <LL_GPIO_SetAFPin_0_7>:
 800056a:	b580      	push	{r7, lr}
 800056c:	b084      	sub	sp, #16
 800056e:	af00      	add	r7, sp, #0
 8000570:	60f8      	str	r0, [r7, #12]
 8000572:	60b9      	str	r1, [r7, #8]
 8000574:	607a      	str	r2, [r7, #4]
 8000576:	68fb      	ldr	r3, [r7, #12]
 8000578:	6a19      	ldr	r1, [r3, #32]
 800057a:	68bb      	ldr	r3, [r7, #8]
 800057c:	435b      	muls	r3, r3
 800057e:	68ba      	ldr	r2, [r7, #8]
 8000580:	4353      	muls	r3, r2
 8000582:	68ba      	ldr	r2, [r7, #8]
 8000584:	435a      	muls	r2, r3
 8000586:	0013      	movs	r3, r2
 8000588:	011b      	lsls	r3, r3, #4
 800058a:	1a9b      	subs	r3, r3, r2
 800058c:	43db      	mvns	r3, r3
 800058e:	400b      	ands	r3, r1
 8000590:	001a      	movs	r2, r3
 8000592:	68bb      	ldr	r3, [r7, #8]
 8000594:	435b      	muls	r3, r3
 8000596:	68b9      	ldr	r1, [r7, #8]
 8000598:	434b      	muls	r3, r1
 800059a:	68b9      	ldr	r1, [r7, #8]
 800059c:	434b      	muls	r3, r1
 800059e:	6879      	ldr	r1, [r7, #4]
 80005a0:	434b      	muls	r3, r1
 80005a2:	431a      	orrs	r2, r3
 80005a4:	68fb      	ldr	r3, [r7, #12]
 80005a6:	621a      	str	r2, [r3, #32]
 80005a8:	46c0      	nop			; (mov r8, r8)
 80005aa:	46bd      	mov	sp, r7
 80005ac:	b004      	add	sp, #16
 80005ae:	bd80      	pop	{r7, pc}

080005b0 <LL_RCC_SetI2CClockSource>:
 80005b0:	b580      	push	{r7, lr}
 80005b2:	b082      	sub	sp, #8
 80005b4:	af00      	add	r7, sp, #0
 80005b6:	6078      	str	r0, [r7, #4]
 80005b8:	4b06      	ldr	r3, [pc, #24]	; (80005d4 <LL_RCC_SetI2CClockSource+0x24>)
 80005ba:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 80005bc:	2210      	movs	r2, #16
 80005be:	4393      	bics	r3, r2
 80005c0:	0019      	movs	r1, r3
 80005c2:	4b04      	ldr	r3, [pc, #16]	; (80005d4 <LL_RCC_SetI2CClockSource+0x24>)
 80005c4:	687a      	ldr	r2, [r7, #4]
 80005c6:	430a      	orrs	r2, r1
 80005c8:	631a      	str	r2, [r3, #48]	; 0x30
 80005ca:	46c0      	nop			; (mov r8, r8)
 80005cc:	46bd      	mov	sp, r7
 80005ce:	b002      	add	sp, #8
 80005d0:	bd80      	pop	{r7, pc}
 80005d2:	46c0      	nop			; (mov r8, r8)
 80005d4:	40021000 	.word	0x40021000

080005d8 <LL_I2C_Enable>:
 80005d8:	b580      	push	{r7, lr}
 80005da:	b082      	sub	sp, #8
 80005dc:	af00      	add	r7, sp, #0
 80005de:	6078      	str	r0, [r7, #4]
 80005e0:	687b      	ldr	r3, [r7, #4]
 80005e2:	681b      	ldr	r3, [r3, #0]
 80005e4:	2201      	movs	r2, #1
 80005e6:	431a      	orrs	r2, r3
 80005e8:	687b      	ldr	r3, [r7, #4]
 80005ea:	601a      	str	r2, [r3, #0]
 80005ec:	46c0      	nop			; (mov r8, r8)
 80005ee:	46bd      	mov	sp, r7
 80005f0:	b002      	add	sp, #8
 80005f2:	bd80      	pop	{r7, pc}

080005f4 <LL_I2C_Disable>:
 80005f4:	b580      	push	{r7, lr}
 80005f6:	b082      	sub	sp, #8
 80005f8:	af00      	add	r7, sp, #0
 80005fa:	6078      	str	r0, [r7, #4]
 80005fc:	687b      	ldr	r3, [r7, #4]
 80005fe:	681b      	ldr	r3, [r3, #0]
 8000600:	2201      	movs	r2, #1
 8000602:	4393      	bics	r3, r2
 8000604:	001a      	movs	r2, r3
 8000606:	687b      	ldr	r3, [r7, #4]
 8000608:	601a      	str	r2, [r3, #0]
 800060a:	46c0      	nop			; (mov r8, r8)
 800060c:	46bd      	mov	sp, r7
 800060e:	b002      	add	sp, #8
 8000610:	bd80      	pop	{r7, pc}
	...

08000614 <LL_I2C_SetDigitalFilter>:
 8000614:	b580      	push	{r7, lr}
 8000616:	b082      	sub	sp, #8
 8000618:	af00      	add	r7, sp, #0
 800061a:	6078      	str	r0, [r7, #4]
 800061c:	6039      	str	r1, [r7, #0]
 800061e:	687b      	ldr	r3, [r7, #4]
 8000620:	681b      	ldr	r3, [r3, #0]
 8000622:	4a05      	ldr	r2, [pc, #20]	; (8000638 <LL_I2C_SetDigitalFilter+0x24>)
 8000624:	401a      	ands	r2, r3
 8000626:	683b      	ldr	r3, [r7, #0]
 8000628:	021b      	lsls	r3, r3, #8
 800062a:	431a      	orrs	r2, r3
 800062c:	687b      	ldr	r3, [r7, #4]
 800062e:	601a      	str	r2, [r3, #0]
 8000630:	46c0      	nop			; (mov r8, r8)
 8000632:	46bd      	mov	sp, r7
 8000634:	b002      	add	sp, #8
 8000636:	bd80      	pop	{r7, pc}
 8000638:	fffff0ff 	.word	0xfffff0ff

0800063c <LL_I2C_DisableAnalogFilter>:
 800063c:	b580      	push	{r7, lr}
 800063e:	b082      	sub	sp, #8
 8000640:	af00      	add	r7, sp, #0
 8000642:	6078      	str	r0, [r7, #4]
 8000644:	687b      	ldr	r3, [r7, #4]
 8000646:	681b      	ldr	r3, [r3, #0]
 8000648:	2280      	movs	r2, #128	; 0x80
 800064a:	0152      	lsls	r2, r2, #5
 800064c:	431a      	orrs	r2, r3
 800064e:	687b      	ldr	r3, [r7, #4]
 8000650:	601a      	str	r2, [r3, #0]
 8000652:	46c0      	nop			; (mov r8, r8)
 8000654:	46bd      	mov	sp, r7
 8000656:	b002      	add	sp, #8
 8000658:	bd80      	pop	{r7, pc}

0800065a <LL_I2C_DisableClockStretching>:
 800065a:	b580      	push	{r7, lr}
 800065c:	b082      	sub	sp, #8
 800065e:	af00      	add	r7, sp, #0
 8000660:	6078      	str	r0, [r7, #4]
 8000662:	687b      	ldr	r3, [r7, #4]
 8000664:	681b      	ldr	r3, [r3, #0]
 8000666:	2280      	movs	r2, #128	; 0x80
 8000668:	0292      	lsls	r2, r2, #10
 800066a:	431a      	orrs	r2, r3
 800066c:	687b      	ldr	r3, [r7, #4]
 800066e:	601a      	str	r2, [r3, #0]
 8000670:	46c0      	nop			; (mov r8, r8)
 8000672:	46bd      	mov	sp, r7
 8000674:	b002      	add	sp, #8
 8000676:	bd80      	pop	{r7, pc}

08000678 <LL_I2C_SetMasterAddressingMode>:
 8000678:	b580      	push	{r7, lr}
 800067a:	b082      	sub	sp, #8
 800067c:	af00      	add	r7, sp, #0
 800067e:	6078      	str	r0, [r7, #4]
 8000680:	6039      	str	r1, [r7, #0]
 8000682:	687b      	ldr	r3, [r7, #4]
 8000684:	685b      	ldr	r3, [r3, #4]
 8000686:	4a05      	ldr	r2, [pc, #20]	; (800069c <LL_I2C_SetMasterAddressingMode+0x24>)
 8000688:	401a      	ands	r2, r3
 800068a:	683b      	ldr	r3, [r7, #0]
 800068c:	431a      	orrs	r2, r3
 800068e:	687b      	ldr	r3, [r7, #4]
 8000690:	605a      	str	r2, [r3, #4]
 8000692:	46c0      	nop			; (mov r8, r8)
 8000694:	46bd      	mov	sp, r7
 8000696:	b002      	add	sp, #8
 8000698:	bd80      	pop	{r7, pc}
 800069a:	46c0      	nop			; (mov r8, r8)
 800069c:	fffff7ff 	.word	0xfffff7ff

080006a0 <LL_I2C_SetMode>:
 80006a0:	b580      	push	{r7, lr}
 80006a2:	b082      	sub	sp, #8
 80006a4:	af00      	add	r7, sp, #0
 80006a6:	6078      	str	r0, [r7, #4]
 80006a8:	6039      	str	r1, [r7, #0]
 80006aa:	687b      	ldr	r3, [r7, #4]
 80006ac:	681b      	ldr	r3, [r3, #0]
 80006ae:	4a05      	ldr	r2, [pc, #20]	; (80006c4 <LL_I2C_SetMode+0x24>)
 80006b0:	401a      	ands	r2, r3
 80006b2:	683b      	ldr	r3, [r7, #0]
 80006b4:	431a      	orrs	r2, r3
 80006b6:	687b      	ldr	r3, [r7, #4]
 80006b8:	601a      	str	r2, [r3, #0]
 80006ba:	46c0      	nop			; (mov r8, r8)
 80006bc:	46bd      	mov	sp, r7
 80006be:	b002      	add	sp, #8
 80006c0:	bd80      	pop	{r7, pc}
 80006c2:	46c0      	nop			; (mov r8, r8)
 80006c4:	ffcfffff 	.word	0xffcfffff

080006c8 <I2C_config>:
 80006c8:	b580      	push	{r7, lr}
 80006ca:	af00      	add	r7, sp, #0
 80006cc:	2380      	movs	r3, #128	; 0x80
 80006ce:	02db      	lsls	r3, r3, #11
 80006d0:	0018      	movs	r0, r3
 80006d2:	f7ff fed1 	bl	8000478 <LL_AHB1_GRP1_EnableClock>
 80006d6:	4b2d      	ldr	r3, [pc, #180]	; (800078c <I2C_config+0xc4>)
 80006d8:	2202      	movs	r2, #2
 80006da:	2140      	movs	r1, #64	; 0x40
 80006dc:	0018      	movs	r0, r3
 80006de:	f7ff fef7 	bl	80004d0 <LL_GPIO_SetPinMode>
 80006e2:	4b2a      	ldr	r3, [pc, #168]	; (800078c <I2C_config+0xc4>)
 80006e4:	2201      	movs	r2, #1
 80006e6:	2140      	movs	r1, #64	; 0x40
 80006e8:	0018      	movs	r0, r3
 80006ea:	f7ff ff0d 	bl	8000508 <LL_GPIO_SetPinOutputType>
 80006ee:	4b27      	ldr	r3, [pc, #156]	; (800078c <I2C_config+0xc4>)
 80006f0:	2201      	movs	r2, #1
 80006f2:	2140      	movs	r1, #64	; 0x40
 80006f4:	0018      	movs	r0, r3
 80006f6:	f7ff ff38 	bl	800056a <LL_GPIO_SetAFPin_0_7>
 80006fa:	4b24      	ldr	r3, [pc, #144]	; (800078c <I2C_config+0xc4>)
 80006fc:	2203      	movs	r2, #3
 80006fe:	2140      	movs	r1, #64	; 0x40
 8000700:	0018      	movs	r0, r3
 8000702:	f7ff ff16 	bl	8000532 <LL_GPIO_SetPinSpeed>
 8000706:	4b21      	ldr	r3, [pc, #132]	; (800078c <I2C_config+0xc4>)
 8000708:	2202      	movs	r2, #2
 800070a:	2180      	movs	r1, #128	; 0x80
 800070c:	0018      	movs	r0, r3
 800070e:	f7ff fedf 	bl	80004d0 <LL_GPIO_SetPinMode>
 8000712:	4b1e      	ldr	r3, [pc, #120]	; (800078c <I2C_config+0xc4>)
 8000714:	2201      	movs	r2, #1
 8000716:	2180      	movs	r1, #128	; 0x80
 8000718:	0018      	movs	r0, r3
 800071a:	f7ff fef5 	bl	8000508 <LL_GPIO_SetPinOutputType>
 800071e:	4b1b      	ldr	r3, [pc, #108]	; (800078c <I2C_config+0xc4>)
 8000720:	2201      	movs	r2, #1
 8000722:	2180      	movs	r1, #128	; 0x80
 8000724:	0018      	movs	r0, r3
 8000726:	f7ff ff20 	bl	800056a <LL_GPIO_SetAFPin_0_7>
 800072a:	4b18      	ldr	r3, [pc, #96]	; (800078c <I2C_config+0xc4>)
 800072c:	2203      	movs	r2, #3
 800072e:	2180      	movs	r1, #128	; 0x80
 8000730:	0018      	movs	r0, r3
 8000732:	f7ff fefe 	bl	8000532 <LL_GPIO_SetPinSpeed>
 8000736:	2010      	movs	r0, #16
 8000738:	f7ff ff3a 	bl	80005b0 <LL_RCC_SetI2CClockSource>
 800073c:	4b14      	ldr	r3, [pc, #80]	; (8000790 <I2C_config+0xc8>)
 800073e:	0018      	movs	r0, r3
 8000740:	f7ff ff58 	bl	80005f4 <LL_I2C_Disable>
 8000744:	2380      	movs	r3, #128	; 0x80
 8000746:	039b      	lsls	r3, r3, #14
 8000748:	0018      	movs	r0, r3
 800074a:	f7ff feab 	bl	80004a4 <LL_APB1_GRP1_EnableClock>
 800074e:	4b10      	ldr	r3, [pc, #64]	; (8000790 <I2C_config+0xc8>)
 8000750:	0018      	movs	r0, r3
 8000752:	f7ff ff73 	bl	800063c <LL_I2C_DisableAnalogFilter>
 8000756:	4b0e      	ldr	r3, [pc, #56]	; (8000790 <I2C_config+0xc8>)
 8000758:	2101      	movs	r1, #1
 800075a:	0018      	movs	r0, r3
 800075c:	f7ff ff5a 	bl	8000614 <LL_I2C_SetDigitalFilter>
 8000760:	4b0b      	ldr	r3, [pc, #44]	; (8000790 <I2C_config+0xc8>)
 8000762:	0018      	movs	r0, r3
 8000764:	f7ff ff79 	bl	800065a <LL_I2C_DisableClockStretching>
 8000768:	4b09      	ldr	r3, [pc, #36]	; (8000790 <I2C_config+0xc8>)
 800076a:	2100      	movs	r1, #0
 800076c:	0018      	movs	r0, r3
 800076e:	f7ff ff83 	bl	8000678 <LL_I2C_SetMasterAddressingMode>
 8000772:	4b07      	ldr	r3, [pc, #28]	; (8000790 <I2C_config+0xc8>)
 8000774:	2100      	movs	r1, #0
 8000776:	0018      	movs	r0, r3
 8000778:	f7ff ff92 	bl	80006a0 <LL_I2C_SetMode>
 800077c:	4b04      	ldr	r3, [pc, #16]	; (8000790 <I2C_config+0xc8>)
 800077e:	0018      	movs	r0, r3
 8000780:	f7ff ff2a 	bl	80005d8 <LL_I2C_Enable>
 8000784:	46c0      	nop			; (mov r8, r8)
 8000786:	46bd      	mov	sp, r7
 8000788:	bd80      	pop	{r7, pc}
 800078a:	46c0      	nop			; (mov r8, r8)
 800078c:	48000400 	.word	0x48000400
 8000790:	40005400 	.word	0x40005400

08000794 <LL_GPIO_TogglePin>:
 8000794:	b580      	push	{r7, lr}
 8000796:	b082      	sub	sp, #8
 8000798:	af00      	add	r7, sp, #0
 800079a:	6078      	str	r0, [r7, #4]
 800079c:	6039      	str	r1, [r7, #0]
 800079e:	687b      	ldr	r3, [r7, #4]
 80007a0:	695a      	ldr	r2, [r3, #20]
 80007a2:	683b      	ldr	r3, [r7, #0]
 80007a4:	405a      	eors	r2, r3
 80007a6:	687b      	ldr	r3, [r7, #4]
 80007a8:	615a      	str	r2, [r3, #20]
 80007aa:	46c0      	nop			; (mov r8, r8)
 80007ac:	46bd      	mov	sp, r7
 80007ae:	b002      	add	sp, #8
 80007b0:	bd80      	pop	{r7, pc}

080007b2 <LL_I2C_IsActiveFlag_TXIS>:
 80007b2:	b580      	push	{r7, lr}
 80007b4:	b082      	sub	sp, #8
 80007b6:	af00      	add	r7, sp, #0
 80007b8:	6078      	str	r0, [r7, #4]
 80007ba:	687b      	ldr	r3, [r7, #4]
 80007bc:	699b      	ldr	r3, [r3, #24]
 80007be:	2202      	movs	r2, #2
 80007c0:	4013      	ands	r3, r2
 80007c2:	3b02      	subs	r3, #2
 80007c4:	425a      	negs	r2, r3
 80007c6:	4153      	adcs	r3, r2
 80007c8:	b2db      	uxtb	r3, r3
 80007ca:	0018      	movs	r0, r3
 80007cc:	46bd      	mov	sp, r7
 80007ce:	b002      	add	sp, #8
 80007d0:	bd80      	pop	{r7, pc}

080007d2 <LL_I2C_IsActiveFlag_TC>:
 80007d2:	b580      	push	{r7, lr}
 80007d4:	b082      	sub	sp, #8
 80007d6:	af00      	add	r7, sp, #0
 80007d8:	6078      	str	r0, [r7, #4]
 80007da:	687b      	ldr	r3, [r7, #4]
 80007dc:	699b      	ldr	r3, [r3, #24]
 80007de:	2240      	movs	r2, #64	; 0x40
 80007e0:	4013      	ands	r3, r2
 80007e2:	3b40      	subs	r3, #64	; 0x40
 80007e4:	425a      	negs	r2, r3
 80007e6:	4153      	adcs	r3, r2
 80007e8:	b2db      	uxtb	r3, r3
 80007ea:	0018      	movs	r0, r3
 80007ec:	46bd      	mov	sp, r7
 80007ee:	b002      	add	sp, #8
 80007f0:	bd80      	pop	{r7, pc}
	...

080007f4 <LL_I2C_HandleTransfer>:
 80007f4:	b580      	push	{r7, lr}
 80007f6:	b084      	sub	sp, #16
 80007f8:	af00      	add	r7, sp, #0
 80007fa:	60f8      	str	r0, [r7, #12]
 80007fc:	60b9      	str	r1, [r7, #8]
 80007fe:	607a      	str	r2, [r7, #4]
 8000800:	603b      	str	r3, [r7, #0]
 8000802:	68fb      	ldr	r3, [r7, #12]
 8000804:	685b      	ldr	r3, [r3, #4]
 8000806:	4a09      	ldr	r2, [pc, #36]	; (800082c <LL_I2C_HandleTransfer+0x38>)
 8000808:	401a      	ands	r2, r3
 800080a:	68b9      	ldr	r1, [r7, #8]
 800080c:	687b      	ldr	r3, [r7, #4]
 800080e:	4319      	orrs	r1, r3
 8000810:	683b      	ldr	r3, [r7, #0]
 8000812:	041b      	lsls	r3, r3, #16
 8000814:	4319      	orrs	r1, r3
 8000816:	69bb      	ldr	r3, [r7, #24]
 8000818:	4319      	orrs	r1, r3
 800081a:	69fb      	ldr	r3, [r7, #28]
 800081c:	430b      	orrs	r3, r1
 800081e:	431a      	orrs	r2, r3
 8000820:	68fb      	ldr	r3, [r7, #12]
 8000822:	605a      	str	r2, [r3, #4]
 8000824:	46c0      	nop			; (mov r8, r8)
 8000826:	46bd      	mov	sp, r7
 8000828:	b004      	add	sp, #16
 800082a:	bd80      	pop	{r7, pc}
 800082c:	fc008000 	.word	0xfc008000

08000830 <giro_send_reg>:
 8000830:	b580      	push	{r7, lr}
 8000832:	b084      	sub	sp, #16
 8000834:	af02      	add	r7, sp, #8
 8000836:	0002      	movs	r2, r0
 8000838:	1dfb      	adds	r3, r7, #7
 800083a:	701a      	strb	r2, [r3, #0]
 800083c:	1dbb      	adds	r3, r7, #6
 800083e:	1c0a      	adds	r2, r1, #0
 8000840:	701a      	strb	r2, [r3, #0]
 8000842:	480f      	ldr	r0, [pc, #60]	; (8000880 <giro_send_reg+0x50>)
 8000844:	2380      	movs	r3, #128	; 0x80
 8000846:	019b      	lsls	r3, r3, #6
 8000848:	9301      	str	r3, [sp, #4]
 800084a:	2380      	movs	r3, #128	; 0x80
 800084c:	049b      	lsls	r3, r3, #18
 800084e:	9300      	str	r3, [sp, #0]
 8000850:	2300      	movs	r3, #0
 8000852:	2200      	movs	r2, #0
 8000854:	2168      	movs	r1, #104	; 0x68
 8000856:	f7ff ffcd 	bl	80007f4 <LL_I2C_HandleTransfer>
 800085a:	46c0      	nop			; (mov r8, r8)
 800085c:	4b08      	ldr	r3, [pc, #32]	; (8000880 <giro_send_reg+0x50>)
 800085e:	0018      	movs	r0, r3
 8000860:	f7ff ffa7 	bl	80007b2 <LL_I2C_IsActiveFlag_TXIS>
 8000864:	1e03      	subs	r3, r0, #0
 8000866:	d0f9      	beq.n	800085c <giro_send_reg+0x2c>
 8000868:	46c0      	nop			; (mov r8, r8)
 800086a:	4b05      	ldr	r3, [pc, #20]	; (8000880 <giro_send_reg+0x50>)
 800086c:	0018      	movs	r0, r3
 800086e:	f7ff ffb0 	bl	80007d2 <LL_I2C_IsActiveFlag_TC>
 8000872:	1e03      	subs	r3, r0, #0
 8000874:	d1f9      	bne.n	800086a <giro_send_reg+0x3a>
 8000876:	2300      	movs	r3, #0
 8000878:	0018      	movs	r0, r3
 800087a:	46bd      	mov	sp, r7
 800087c:	b002      	add	sp, #8
 800087e:	bd80      	pop	{r7, pc}
 8000880:	40005400 	.word	0x40005400

08000884 <giro_config>:
 8000884:	b580      	push	{r7, lr}
 8000886:	af00      	add	r7, sp, #0
 8000888:	2180      	movs	r1, #128	; 0x80
 800088a:	206b      	movs	r0, #107	; 0x6b
 800088c:	f7ff ffd0 	bl	8000830 <giro_send_reg>
 8000890:	2380      	movs	r3, #128	; 0x80
 8000892:	009b      	lsls	r3, r3, #2
 8000894:	4a0b      	ldr	r2, [pc, #44]	; (80008c4 <giro_config+0x40>)
 8000896:	0019      	movs	r1, r3
 8000898:	0010      	movs	r0, r2
 800089a:	f7ff ff7b 	bl	8000794 <LL_GPIO_TogglePin>
 800089e:	2101      	movs	r1, #1
 80008a0:	206b      	movs	r0, #107	; 0x6b
 80008a2:	f7ff ffc5 	bl	8000830 <giro_send_reg>
 80008a6:	2107      	movs	r1, #7
 80008a8:	2019      	movs	r0, #25
 80008aa:	f7ff ffc1 	bl	8000830 <giro_send_reg>
 80008ae:	2100      	movs	r1, #0
 80008b0:	201b      	movs	r0, #27
 80008b2:	f7ff ffbd 	bl	8000830 <giro_send_reg>
 80008b6:	2100      	movs	r1, #0
 80008b8:	201c      	movs	r0, #28
 80008ba:	f7ff ffb9 	bl	8000830 <giro_send_reg>
 80008be:	46c0      	nop			; (mov r8, r8)
 80008c0:	46bd      	mov	sp, r7
 80008c2:	bd80      	pop	{r7, pc}
 80008c4:	48000800 	.word	0x48000800

080008c8 <NMI_Handler>:
 80008c8:	b580      	push	{r7, lr}
 80008ca:	af00      	add	r7, sp, #0
 80008cc:	46c0      	nop			; (mov r8, r8)
 80008ce:	46bd      	mov	sp, r7
 80008d0:	bd80      	pop	{r7, pc}

080008d2 <HardFault_Handler>:
 80008d2:	b580      	push	{r7, lr}
 80008d4:	af00      	add	r7, sp, #0
 80008d6:	e7fe      	b.n	80008d6 <HardFault_Handler+0x4>

080008d8 <SVC_Handler>:
 80008d8:	b580      	push	{r7, lr}
 80008da:	af00      	add	r7, sp, #0
 80008dc:	46c0      	nop			; (mov r8, r8)
 80008de:	46bd      	mov	sp, r7
 80008e0:	bd80      	pop	{r7, pc}

080008e2 <PendSV_Handler>:
 80008e2:	b580      	push	{r7, lr}
 80008e4:	af00      	add	r7, sp, #0
 80008e6:	46c0      	nop			; (mov r8, r8)
 80008e8:	46bd      	mov	sp, r7
 80008ea:	bd80      	pop	{r7, pc}

080008ec <__libc_init_array>:
 80008ec:	b570      	push	{r4, r5, r6, lr}
 80008ee:	4d0c      	ldr	r5, [pc, #48]	; (8000920 <__libc_init_array+0x34>)
 80008f0:	4e0c      	ldr	r6, [pc, #48]	; (8000924 <__libc_init_array+0x38>)
 80008f2:	1b76      	subs	r6, r6, r5
 80008f4:	10b6      	asrs	r6, r6, #2
 80008f6:	d005      	beq.n	8000904 <__libc_init_array+0x18>
 80008f8:	2400      	movs	r4, #0
 80008fa:	cd08      	ldmia	r5!, {r3}
 80008fc:	3401      	adds	r4, #1
 80008fe:	4798      	blx	r3
 8000900:	42a6      	cmp	r6, r4
 8000902:	d1fa      	bne.n	80008fa <__libc_init_array+0xe>
 8000904:	f000 f896 	bl	8000a34 <_init>
 8000908:	4d07      	ldr	r5, [pc, #28]	; (8000928 <__libc_init_array+0x3c>)
 800090a:	4e08      	ldr	r6, [pc, #32]	; (800092c <__libc_init_array+0x40>)
 800090c:	1b76      	subs	r6, r6, r5
 800090e:	10b6      	asrs	r6, r6, #2
 8000910:	d005      	beq.n	800091e <__libc_init_array+0x32>
 8000912:	2400      	movs	r4, #0
 8000914:	cd08      	ldmia	r5!, {r3}
 8000916:	3401      	adds	r4, #1
 8000918:	4798      	blx	r3
 800091a:	42a6      	cmp	r6, r4
 800091c:	d1fa      	bne.n	8000914 <__libc_init_array+0x28>
 800091e:	bd70      	pop	{r4, r5, r6, pc}
 8000920:	08000a50 	.word	0x08000a50
 8000924:	08000a50 	.word	0x08000a50
 8000928:	08000a50 	.word	0x08000a50
 800092c:	08000a58 	.word	0x08000a58

08000930 <register_fini>:
 8000930:	4b03      	ldr	r3, [pc, #12]	; (8000940 <register_fini+0x10>)
 8000932:	b510      	push	{r4, lr}
 8000934:	2b00      	cmp	r3, #0
 8000936:	d002      	beq.n	800093e <register_fini+0xe>
 8000938:	4802      	ldr	r0, [pc, #8]	; (8000944 <register_fini+0x14>)
 800093a:	f000 f805 	bl	8000948 <atexit>
 800093e:	bd10      	pop	{r4, pc}
 8000940:	00000000 	.word	0x00000000
 8000944:	08000959 	.word	0x08000959

08000948 <atexit>:
 8000948:	b510      	push	{r4, lr}
 800094a:	0001      	movs	r1, r0
 800094c:	2300      	movs	r3, #0
 800094e:	2200      	movs	r2, #0
 8000950:	2000      	movs	r0, #0
 8000952:	f000 f819 	bl	8000988 <__register_exitproc>
 8000956:	bd10      	pop	{r4, pc}

08000958 <__libc_fini_array>:
 8000958:	b570      	push	{r4, r5, r6, lr}
 800095a:	4d07      	ldr	r5, [pc, #28]	; (8000978 <__libc_fini_array+0x20>)
 800095c:	4c07      	ldr	r4, [pc, #28]	; (800097c <__libc_fini_array+0x24>)
 800095e:	1b64      	subs	r4, r4, r5
 8000960:	10a4      	asrs	r4, r4, #2
 8000962:	d005      	beq.n	8000970 <__libc_fini_array+0x18>
 8000964:	3c01      	subs	r4, #1
 8000966:	00a3      	lsls	r3, r4, #2
 8000968:	58eb      	ldr	r3, [r5, r3]
 800096a:	4798      	blx	r3
 800096c:	2c00      	cmp	r4, #0
 800096e:	d1f9      	bne.n	8000964 <__libc_fini_array+0xc>
 8000970:	f000 f866 	bl	8000a40 <_fini>
 8000974:	bd70      	pop	{r4, r5, r6, pc}
 8000976:	46c0      	nop			; (mov r8, r8)
 8000978:	08000a58 	.word	0x08000a58
 800097c:	08000a5c 	.word	0x08000a5c

08000980 <__retarget_lock_acquire_recursive>:
 8000980:	4770      	bx	lr
 8000982:	46c0      	nop			; (mov r8, r8)

08000984 <__retarget_lock_release_recursive>:
 8000984:	4770      	bx	lr
 8000986:	46c0      	nop			; (mov r8, r8)

08000988 <__register_exitproc>:
 8000988:	b5f0      	push	{r4, r5, r6, r7, lr}
 800098a:	46d6      	mov	lr, sl
 800098c:	464f      	mov	r7, r9
 800098e:	4646      	mov	r6, r8
 8000990:	b5c0      	push	{r6, r7, lr}
 8000992:	4f26      	ldr	r7, [pc, #152]	; (8000a2c <__register_exitproc+0xa4>)
 8000994:	b082      	sub	sp, #8
 8000996:	0006      	movs	r6, r0
 8000998:	6838      	ldr	r0, [r7, #0]
 800099a:	4692      	mov	sl, r2
 800099c:	4698      	mov	r8, r3
 800099e:	4689      	mov	r9, r1
 80009a0:	f7ff ffee 	bl	8000980 <__retarget_lock_acquire_recursive>
 80009a4:	4b22      	ldr	r3, [pc, #136]	; (8000a30 <__register_exitproc+0xa8>)
 80009a6:	681b      	ldr	r3, [r3, #0]
 80009a8:	9301      	str	r3, [sp, #4]
 80009aa:	23a4      	movs	r3, #164	; 0xa4
 80009ac:	9a01      	ldr	r2, [sp, #4]
 80009ae:	005b      	lsls	r3, r3, #1
 80009b0:	58d5      	ldr	r5, [r2, r3]
 80009b2:	2d00      	cmp	r5, #0
 80009b4:	d02e      	beq.n	8000a14 <__register_exitproc+0x8c>
 80009b6:	686c      	ldr	r4, [r5, #4]
 80009b8:	2c1f      	cmp	r4, #31
 80009ba:	dc30      	bgt.n	8000a1e <__register_exitproc+0x96>
 80009bc:	2e00      	cmp	r6, #0
 80009be:	d10f      	bne.n	80009e0 <__register_exitproc+0x58>
 80009c0:	1c63      	adds	r3, r4, #1
 80009c2:	606b      	str	r3, [r5, #4]
 80009c4:	464b      	mov	r3, r9
 80009c6:	3402      	adds	r4, #2
 80009c8:	00a4      	lsls	r4, r4, #2
 80009ca:	6838      	ldr	r0, [r7, #0]
 80009cc:	5163      	str	r3, [r4, r5]
 80009ce:	f7ff ffd9 	bl	8000984 <__retarget_lock_release_recursive>
 80009d2:	2000      	movs	r0, #0
 80009d4:	b002      	add	sp, #8
 80009d6:	bce0      	pop	{r5, r6, r7}
 80009d8:	46ba      	mov	sl, r7
 80009da:	46b1      	mov	r9, r6
 80009dc:	46a8      	mov	r8, r5
 80009de:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80009e0:	2288      	movs	r2, #136	; 0x88
 80009e2:	4651      	mov	r1, sl
 80009e4:	0028      	movs	r0, r5
 80009e6:	00a3      	lsls	r3, r4, #2
 80009e8:	18eb      	adds	r3, r5, r3
 80009ea:	5099      	str	r1, [r3, r2]
 80009ec:	3a87      	subs	r2, #135	; 0x87
 80009ee:	40a2      	lsls	r2, r4
 80009f0:	3089      	adds	r0, #137	; 0x89
 80009f2:	30ff      	adds	r0, #255	; 0xff
 80009f4:	6801      	ldr	r1, [r0, #0]
 80009f6:	4311      	orrs	r1, r2
 80009f8:	6001      	str	r1, [r0, #0]
 80009fa:	2184      	movs	r1, #132	; 0x84
 80009fc:	4640      	mov	r0, r8
 80009fe:	0049      	lsls	r1, r1, #1
 8000a00:	5058      	str	r0, [r3, r1]
 8000a02:	2e02      	cmp	r6, #2
 8000a04:	d1dc      	bne.n	80009c0 <__register_exitproc+0x38>
 8000a06:	002b      	movs	r3, r5
 8000a08:	338d      	adds	r3, #141	; 0x8d
 8000a0a:	33ff      	adds	r3, #255	; 0xff
 8000a0c:	6819      	ldr	r1, [r3, #0]
 8000a0e:	430a      	orrs	r2, r1
 8000a10:	601a      	str	r2, [r3, #0]
 8000a12:	e7d5      	b.n	80009c0 <__register_exitproc+0x38>
 8000a14:	0015      	movs	r5, r2
 8000a16:	354d      	adds	r5, #77	; 0x4d
 8000a18:	35ff      	adds	r5, #255	; 0xff
 8000a1a:	50d5      	str	r5, [r2, r3]
 8000a1c:	e7cb      	b.n	80009b6 <__register_exitproc+0x2e>
 8000a1e:	6838      	ldr	r0, [r7, #0]
 8000a20:	f7ff ffb0 	bl	8000984 <__retarget_lock_release_recursive>
 8000a24:	2001      	movs	r0, #1
 8000a26:	4240      	negs	r0, r0
 8000a28:	e7d4      	b.n	80009d4 <__register_exitproc+0x4c>
 8000a2a:	46c0      	nop			; (mov r8, r8)
 8000a2c:	20000430 	.word	0x20000430
 8000a30:	08000a4c 	.word	0x08000a4c

08000a34 <_init>:
 8000a34:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000a36:	46c0      	nop			; (mov r8, r8)
 8000a38:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8000a3a:	bc08      	pop	{r3}
 8000a3c:	469e      	mov	lr, r3
 8000a3e:	4770      	bx	lr

08000a40 <_fini>:
 8000a40:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000a42:	46c0      	nop			; (mov r8, r8)
 8000a44:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8000a46:	bc08      	pop	{r3}
 8000a48:	469e      	mov	lr, r3
 8000a4a:	4770      	bx	lr

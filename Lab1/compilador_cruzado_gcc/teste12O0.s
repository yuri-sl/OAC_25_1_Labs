.data
.LC0:
	.word   0
	.word   1074790400

S0: .string "\n de instruções: "
S1: .string "\ntempo de execução(s): "
S2: .string "resultado: "

.text
li a0, 100000000

csrr s1,3074   # le o num instr atual
csrr s0,time   # le o time atual

jal F6

csrr t0,time   # le o time atual
csrr t1,3074   # le o num instr atual
sub s0,t0,s0   # calcula o tempo de execução Texec em ms
sub s1,t1,s1   # calcula o número de instruções I executadas

mv t0, a0

la a0, S2
li a7, 4
ecall

mv a0, t0
li a7, 1
ecall			# print(resultado) 

la a0, S1
li a7, 4
ecall

mv a0, s0
li a7, 1
ecall			# print(texec)

la a0, S0
li a7, 4
ecall

mv a0, s1
li a7, 1
ecall			# print(instrucoes) 

li a7, 10
ecall

F1:				# 4*x
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        slli    a5,a5,2
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra

F2:				# x << 2
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        slli    a5,a5,2
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
F3:				# x+x+x+x
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        slli    a5,a5,2
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
F4:				# 3*x + x
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        slli    a5,a5,2
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
F5:				# 2*x + 2*x 
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        slli    a5,a5,2
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
F6:				# pow(2,2)*x
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        fcvt.d.w        fa4,a5
        lui     a5,%hi(.LC0)
        fld     fa5,%lo(.LC0)(a5)
        fmul.d  fa5,fa4,fa5
        fcvt.w.d a5,fa5,rtz
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra

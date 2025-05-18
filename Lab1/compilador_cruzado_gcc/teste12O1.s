.data
S0: .string "\n de instruções: "
S1: .string "\ntempo de execução(s): "
S2: .string "resultado: "
.LC0:
        .word   0
        .word   1074790400
.text
li a0, 100000000

csrr s1,3074   # le o num instr atual
csrr s0,time   # le o time atual

jal F5

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

F1:
        slli    a0,a0,2
        ret
F2:
        slli    a0,a0,2
        ret
F3:
        slli    a0,a0,2
        ret
F4:
        slli    a0,a0,2
        ret
F5:
        slli    a0,a0,2
        ret
F6:
        fcvt.d.w        fa5,a0
        lui     a5,%hi(.LC0)
        fld     fa4,%lo(.LC0)(a5)
        fmul.d  fa5,fa5,fa4
        fcvt.w.d a0,fa5,rtz
        ret

# close interruption
addi $k0,$zero,1
mtc0 $k0,$2 

addi $gp,$zero,0x800
add $fp,$gp,$sp

# store EPC
mfc0 $k0,$1
sw $k0,($fp)
addi $fp,$fp,-4
addi $sp,$sp,-4

# protect environment
sw $a0,($fp)
addi $sp,$sp,-4
addi $fp,$fp,-4
sw $v0,($fp)
addi $sp,$sp,-4
addi $fp,$fp,-4
sw $t0,($fp)
addi $sp,$sp,-4
addi $fp,$fp,-4
sw $t1,($fp)
addi $sp,$sp,-4
addi $fp,$fp,-4

# store cause
addi $t1,$zero,-20
beq $sp,$t1,init
sw $t0,($fp)
addi $fp,$fp,-4
addi $sp,$sp,-4
bne $t1,$zero,open
init:
addi $t1,$zero,0
sw $t1,($fp)
addi $fp,$fp,-4
addi $sp,$sp,-4


open:
# open interruptions
addi $k0,$zero,0
mtc0 $k0,$2


# program
mfc0 $t0,$3  # get cause number
addi $v0,$zero,1
addi $t1,$zero,8
add $a0,$zero,$t0
loop:
syscall
sll $a0,$a0,4
sub $t1,$t1,$v0
bne $t1,$zero,loop

# close interruption
addi $k0,$zero,1
mtc0 $k0,$2 

# retrive cause
addi $fp,$fp,4
addi $sp,$sp,4
lw $k0,($fp)
mtc0 $k0,$3

# retrive environment
addi $fp,$fp,4
addi $sp,$sp,4
lw $t1,($fp)
addi $fp,$fp,4
addi $sp,$sp,4
lw $t0,($fp)
addi $fp,$fp,4
addi $sp,$sp,4
lw $v0,($fp)
addi $fp,$fp,4
addi $sp,$sp,4
lw $a0,($fp)

# retrive EPC
addi $fp,$fp,4
addi $sp,$sp,4
lw $k0,($fp)
mtc0 $k0,$1

# open interruptions
addi $k0,$zero,0
mtc0 $k0,$2 

eret


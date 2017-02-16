# close interruption
addi $k0,$zero,1
mtc0 $k0,$2 

# store EPC
mfc0 $k0,$1
sw $k0,($sp)
addi $sp,$sp,-4

# 


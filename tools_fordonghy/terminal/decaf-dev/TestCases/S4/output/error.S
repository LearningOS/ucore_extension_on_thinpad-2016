          .text                         
          .globl main                   

          .data                         
          .align 2                      
_Main:                                  # virtual table
          .word 0                       # parent
          .word _STRING0                # class name



          .text                         
_Main_New:                              # function entry
          sw $fp, 0($sp)                
          sw $ra, -4($sp)               
          move $fp, $sp                 
          addiu $sp, $sp, -16           
_L14:                                   
          li    $t0, 4                  
          sw    $t0, 4($sp)             
          jal   _Alloc                  
          nop                           
          move  $t0, $v0                
          la    $t1, _Main              
          sw    $t1, 0($t0)             
          move  $v0, $t0                
          move  $sp, $fp                
          lw    $ra, -4($fp)            
          lw    $fp, 0($fp)             
          jr    $ra                     
          nop                           

main:                                   # function entry
          sw $fp, 0($sp)                
          sw $ra, -4($sp)               
          move $fp, $sp                 
          addiu $sp, $sp, -28           
_L15:                                   
          li    $t0, 1                  
          move  $t1, $t0                
          li    $t0, 2                  
          neg   $t2, $t0                
          move  $t0, $t2                
          sw    $t1, -8($fp)            
          sw    $t0, -12($fp)           
_L16:                                   
          lw    $t2, -12($fp)           
          sw    $t2, 4($sp)             
          lw    $t1, -8($fp)            
          sw    $t1, 8($sp)             
          jal   _Div                    
          nop                           
          move  $t0, $v0                
          move  $t1, $t0                
          sw    $t1, 4($sp)             
          jal   _PrintInt               
          nop                           
          li    $t0, 1                  
          move  $t1, $t0                
          li    $t0, 2                  
          move  $t2, $t0                
          sw    $t1, -8($fp)            
          sw    $t2, -12($fp)           
_L17:                                   
          lw    $t0, -12($fp)           
          sw    $t0, 4($sp)             
          lw    $t0, -8($fp)            
          sw    $t0, 8($sp)             
          jal   _Div                    
          nop                           
          move  $t0, $v0                
          move  $t1, $t0                
          sw    $t1, 4($sp)             
          jal   _PrintInt               
          nop                           
          li    $v0, 0                  
          move  $sp, $fp                
          lw    $ra, -4($fp)            
          lw    $fp, 0($fp)             
          jr    $ra                     
          nop                           




          .data                         
_STRING0:
          .asciiz "Main"                

.MODEL SMALL
.STACk 100 

.DATA
array2 DB 255 DUP("$")
array1 DB 255 DUP("$")
.CODE

MAIN PROC
    mov ax, @data 
    mov ds,ax
    
    mov si,offset array2
    mov bx,offset array1
    
    
    xor cx,cx 
    input:
        mov ah,1
        int 21h
        
        cmp al,0dh
        jz next_line:
        
        call chk_digit
        call chk_capital_letter
        call chk_small_letter
        
        jmp input 
        

             
  next_line:
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h            
  output_from_array:
        lea DX,array2 
        mov AH,09h 
        int 21H
        
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h 
        
        lea DX,array1 
        mov AH,09h 
        int 21H
        
         
                                   
end_:    
    mov ah,4ch
    int 21h

MAIN ENDP

chk_digit proc
  cmp al,'0'
  jge l_e_nine
  ret
  
  l_e_nine:
    cmp al,'9'
    jle to_array1
    ret
  to_array1:
    mov ptr[bx],al
    inc bx
    ret    
chk_digit endp

chk_small_letter proc
  cmp al,'a'
  jge l_e_z
  ret
  
  l_e_z:
    cmp al,'z'
    jle to_array2
    ret
  to_array2:
    sub al,32
    mov array2[si],al
    inc si
    ret    
chk_small_letter endp

chk_capital_letter proc
  cmp al,'A'
  jge l_e_zz
  ret
  
  l_e_zz:
    cmp al,'Z'
    jle to_array2_2
    ret
  to_array2_2: 
    add al,32
    mov array2[si],al
    inc si
    ret    
chk_capital_letter endp

END MAIN

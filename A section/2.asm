.MODEL SMALL
.STACk 100 

.DATA
invalid_string db "Invalid input. ","$"
input_string db "Input a hex digit (decimal output will be in next line): ","$"
string db "Do agin? ","$"
.CODE


MAIN PROC
    mov ax, @data 
    mov ds,ax

    input:
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h
        
       lea DX,input_string 
        mov AH,09h 
        int 21H
        
        mov ah,1
        int 21h         
  next_line:
        mov bx,ax
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h
        mov ax,bx
                    
  check_l_e_nine:
        cmp al,'9'
        jle check_g_e_zero
        jmp check_l_e_E  
  check_g_e_zero:
        cmp al,'0'
        jge output1
        jmp invalid
        
  check_l_e_E:
        cmp al,'E'
        jle check_g_e_AA        
        cmp al,'e'
        jle check_g_e_a
        jmp invalid
          
  check_g_e_a:
        cmp al,'a'
        jge output2
        jmp invalid
  check_g_e_AA:
        cmp al,'A'
        jge output2
        jmp invalid
  output1:
        mov dl,al
        mov ah,2
        int 21h
        jmp next_
  output2:

        cmp al,'a'
        je output_10
        cmp al,'A'
        je output_10
        
        cmp al,'b'
        je output_11
        cmp al,'B'
        je output_11
        
        cmp al,'c'
        je output_12
        cmp al,'C'
        je output_12
        
        cmp al,'d'
        je output_13
        cmp al,'D'
        je output_13
        
        cmp al,'e'
        je output_14
        cmp al,'E'
        je output_14
        
  output_10:
        mov dl,'1'
        mov ah,2       
        int 21h
        mov dl,'0'
        mov ah,2       
        int 21h
        jmp next_
  output_11:
        mov dl,'1'
        mov ah,2       
        int 21h
        mov dl,'1'
        mov ah,2       
        int 21h
        jmp next_
  output_12:
        mov dl,'1'
        mov ah,2       
        int 21h
        mov dl,'2'
        mov ah,2       
        int 21h
        jmp next_
  output_13:
       mov dl,'1'
        mov ah,2       
        int 21h
        mov dl,'3'
        mov ah,2       
        int 21h
        jmp next_
  output_14:
        mov dl,'1'
        mov ah,2       
        int 21h
        mov dl,'4'
        mov ah,2       
        int 21h
        jmp next_      
  invalid:
        lea DX,invalid_string 
        mov AH,09h 
        int 21H    
        jmp input
                                   
  next_:
        mov bx,ax
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h
        mov ax,bx
        
        lea DX,string 
        mov AH,09h 
        int 21H
         
        mov ah,1
        int 21h
        cmp al,'y'
        je input
        cmp al,'Y'
        je input                                  
  end_:    
    mov ah,4ch
    int 21h

MAIN ENDP

END MAIN

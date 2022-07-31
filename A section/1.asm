.MODEL SMALL
.STACk 100 

.DATA
array DB 255 DUP("$")
.CODE

MAIN PROC
    mov ax, @data 
    mov ds,ax
    
    mov si,offset array

    input:
        mov ah,1
        int 21h
        
        cmp al,0dh
        jz next_line:
        
        mov array[si],al
        inc si
        jmp input
         
  next_line:
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h            
  output_from_array:
        lea DX,array 
        mov AH,09h 
        int 21H 
                        
  end_:    
    mov ah,4ch
    int 21h

MAIN ENDP

END MAIN
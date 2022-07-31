.MODEL SMALL
.STACk 100 

.DATA
input_string db "Input(must be 8bit): ","$"
complemented_string db "Complemented String: ","$"
count_set_bit db "SetBit Count: ","$"
reversed_string db "Reverse String: ","$"

.CODE


MAIN PROC
    mov ax, @data 
    mov ds,ax
    
    lea DX,input_string 
    mov AH,09h 
    int 21H
    
    xor cx,cx
    xor bx,bx
    
    input:
        mov ah,1
        int 21h
        
        cmp al,0dh
        je complement
        
        and al,0fh
        shl bx,1
        or bl,al
        jmp input
    
    complement:
        not bx            
        call complement_proc    

    count:
        call count_proc
    reverse:
        call reverse_proc
                                                       
    end_:    
        mov ah,4ch
        int 21h

MAIN ENDP
complement_proc proc
    push ax
    push bx
    push cx
    push dx
    
    mov cx,8
    mov ax,0
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    lea DX,complemented_string 
    mov AH,09h 
    int 21H
    
    output:
        shl bl,1
        jc one
        
        mov ah,2
        mov dl,'0'
        int 21h
        loop output
        jmp ret_
    one:
        mov ah,2
        mov dl,'1'
        int 21h
        loop output
    ret_:
        pop dx
        pop cx
        pop bx
        pop ax
        ret    
                    
complement_proc endp 

count_proc proc
    push ax
    push bx
    push cx
    push dx
    
    
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    lea DX,count_set_bit 
    mov AH,09h 
    int 21H
    
    mov cx,0
    
    loop_:
        shl bl,1
        jc increment
        cmp bl,0 
        je output1
        jmp loop_
    increment:
        inc cx
        cmp bl,0
        je output1
        jmp loop_
    output1:
        mov dx,cx
        add dx,48
        mov ah,2
        int 21h        
    
    
    

    ret_1:
        pop dx
        pop cx
        pop bx
        pop ax
        ret    
                    
count_proc endp 

reverse_proc proc
    push ax
    push bx
    push cx
    push dx
    
    mov cx,8
    mov ax,0
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    lea DX,reversed_string 
    mov AH,09h 
    int 21H
    
    outputr:
        shr bl,1
        jc oner
        
        mov ah,2
        mov dl,'0'
        int 21h
        loop outputr
        jmp ret_r
    oner:
        mov ah,2
        mov dl,'1'
        int 21h
        loop outputr
    ret_r:
        pop dx
        pop cx
        pop bx
        pop ax
        ret    
                    
reverse_proc endp

END MAIN

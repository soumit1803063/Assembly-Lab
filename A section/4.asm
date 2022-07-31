.MODEL SMALL
.STACk 100 

.DATA
array DB 255 DUP("$")
.CODE

MAIN PROC
    mov ax, @data 
    mov ds,ax
    
    mov si,offset array
    
    xor cx,cx 
    xor bx,bx
    input:
        mov ah,1
        int 21h
        
        cmp al,0dh
        jz reverse2:
        
        cmp al,' '
        jz reverse1:
        
        push ax
        inc cx
        
        jmp input 
        
   reverse1:
        pop ax
        call next_vowel
        call capitalize
        mov array[si],al
        inc si
        loop reverse1
        
        mov al,' '
        mov array[si],al
        inc si
        xor bx,bx
        jmp input
        
  reverse2:    
        pop ax
        call capitalize
        mov array[si],al
        inc si
        loop reverse2
        
        mov al,' '
        mov array[si],al
        inc si
             
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

next_vowel proc
    cmp bx,0
    je chk_vwl
    ret
    chk_vwl:
        cmp al,'a'
        je e
        cmp al,'e'
        je i
        cmp al,'i'
        je o
        cmp al,'o'
        je u
        cmp al,'u'
        je a
    a:
        mov al,'a'
        ret
    e:
        mov al,'e'
        ret
    i:
        mov al,'i'
        ret        
    o:
        mov al,'o'
        ret    
    u:
        mov al,'u'
        ret    
next_vowel endp

capitalize proc
    cmp bx,0
    je cap
    ret
    cap:
        sub al,32
        mov bx,1
        ret
    
capitalize endp    
END MAIN

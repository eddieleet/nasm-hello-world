global _start

section .data
  msg db "Hello , world eddie ",0x0a
  len equ $ - msg


section .text 
_start:
   mov eax, 4; sys_write system call
   mov ebx, 1 ;stdout file descriptor
   mov  ecx, msg ;bytes to write
   mov edx, len ;number of bytes to write
   int 0x80 ;perform sytem call 
   mov eax, 1 ;sys_exit system call
   mov ebx, 0 ;exit status is 0
   int 0x80


   ;;JUMP

   je a,B ; jump if equal
   jne a,b ; jump if not equal
   jg A,B ; jump if greater
   jge A,B ; jump if greater or equal
   jl A,B ; jump if less
   jle A,B ;jump if less of equal


   global _start

   section .text
   _start:
     mov ecx , 101 ;set ecx to 101
     mov ebx , 42 ;exit status is 42
     mov eax , 1 ; sys_exit system call 
     cmp ecx, 100 ;compare ecx to 100
     jl skip ;jump if less than 
     mov ebx, 13 ;exit status is 13
skip:
  int 0x80


  ; BUILDING A LOPE

  global _start 

  section .text
  _start:
     mov ebx , 1 ;start ebx at 1
     mov ecx ,4 ;number of iterations
label:
add ebx, ebx ;ebx += ebx
dec ecx ;ecx -= 1
cmp ecx, 0 ;compare ecx with 0
jg label ; jump to label if greater
mov eax, 1 ;sys_exit system call
int 0x80


;;MEMORY ACCESS
;and stack creation 

global _start
section .data
  addr db " yellow "

section .text
 _start:
 mov [addr], byte 'H'
 mov [addr+5],byte '!'
    mov eax, 4 ;sys_write system call
    mov ebx,1 ;stdout file descriptor
    mov ecx, addr ;bytes to write 
    mov edx,6 ;number of bytes to write
    int 0x80 ; perform system call 
    mov eax , 1 ;sys_exit system call
    mov ebx, 0 ;exit status is 0
    int 0x80


;; DATA TYPES 
 section . data              
 ;db is 1 byte
 name1 db "string"
 name2 db 0xff
 name3 db 100
 
 ;dw is 2 bytes
 name4 dw 1000

 ;dd is 4 bytes
 name5 dd 100000

 ;;STACK 
 ;LIFO  data structure
 ;ls an array
 ;stack pointer(register)
 ;random access


 global _start 
 _start:
   sub esp, 4
   mov [esp],byte 'H'
   mov [esp+1],byte 'e'
   mov [esp+2],byte 'y'
   mov [esp+3],byte '!'
   mov eax,4 ;sys_write system call 
   mov ebx,1 ;stdout file descriptor
   mov ecx,esp ;pointer to bytes to write
   int 0x80 ;perform system call 
   mov eax, 1 ;sys_exit system call 
   mov ebx,0 ;exit status is 0
   int 0x80 
section .text
    global main

write_digit:
    push rbp
    mov rbp, rsp
    ; Erreur ici : on oublie add rdi, 48
    push rdi            
    mov rsi, rsp        
    mov rax, 1          
    mov rdi, 1          
    mov rdx, 1          
    syscall
    pop rdi             
    mov rsp, rbp
    pop rbp
    ret

main:
    mov rdi, 9
    call write_digit
    mov rax, 60
    xor rdi, rdi
    syscall
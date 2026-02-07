section .text
    global main

write_digit:
    push rbp
    mov rbp, rsp
    add rdi, 48
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

write_number:
    push rbp
    mov rbp, rsp
    mov rax, rdi
    mov rcx, 0
.loop:
    mov rbx, 10
    div rbx             
    push rdx
    inc rcx
    cmp rax, 0
    jne .loop
.print:
    pop rdi
    push rcx
    call write_digit
    pop rcx
    loop .print
    mov rsp, rbp
    pop rbp
    ret

main:
    mov rdi, 123
    call write_number
    mov rax, 60
    xor rdi, rdi
    syscall
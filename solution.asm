section .text
    global main

write_digit:
    push rbp
    mov rbp, rsp
    add rdi, 0x30
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
.split:
    xor rdx, rdx
    mov rbx, 10
    div rbx
    push rdx
    inc rcx
    test rax, rax
    jnz .split
.display:
    pop rdi
    push rcx
    call write_digit
    pop rcx
    loop .display
    mov rsp, rbp
    pop rbp
    ret

main:
    mov rdi, 12345
    call write_number
    mov rax, 60
    xor rdi, rdi
    syscall
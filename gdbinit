# /usr/include/sys/syscall.h
# /usr/include/asm/unistd_64.h
catch syscall 60
catch syscall 231

set print array on
set print array-indexes on
set print pretty on
set history filename ~/.gdb_history
set history save
set disassembly-flavor intel

tui enable
tui new-layout 1 {-horizontal src 2 {regs 1 asm 1} 1} 1 status 0 cmd 1
tui new-layout 2 regs 1 asm 1 status 0 cmd 1
layout 1

#!/usr/bin/env ruby

def remove_asm(path)
  content = File.open path do |file|
    content = file.read
    content.gsub /^\s+#\s+(#{opcodes.join '|'}).*\n/, ''
  end
  path = File.join 'doc', path
  File.open path, 'w' do |file|
    file.write content
  end
end

def opcodes
  ["push", "pop",
   "mov", "movsx", "lea", "cdq",
   "and", "xor",
   "add", "sub", "imul", "idiv", "neg", "sete",
   "shr", "sar", "shl",
   "cmp", "test",
   "jg", "jge", "jl", "jle", "je", "jnz", "jpe", "jpo", "jmp",
   "call", "retn",
   "fld", "fldz", "fild", "fxch", "fst", "fstp",
   "fcom", "fcomp", "fstsw",
   "fadd", "fsubr", "fmul", "fmulp", "fchs"]
end

remove_asm ARGV[0]

#!/usr/bin/env ruby


#get file if given, otherwise run repl
#pseudocode, not yet implemented obv

include "lib/Machine.rb"
include "lib/Lexer.rb"
include "lib/Parser.rb"

machine = Machine.new #state controlled by language
lexer = Lexer.new #lexer for language
parser = Parser.new #parser that maps tokens to syntax tree
opts = getopts "fh"
file = argv.shift
if file.empty? 
	#repl 
	line = ""
	ast = AST.new
	while line != eof 
		print ("-" * ast.last.depth) +  ">"
		line = gets
		tokens = lexer.tokenize(line
		instruction = parser.parse(tokens)
		ast.push(instruction)
		if instruction.depth > 0  #ended inside a block
			continue #restart loop
		end
		ast.map { |instruction|
			machine.interpret(instruction)
		}
	end
else 
	fObj = File.new file
	code = fObj.readAsString
	tokens = lexer.tokenize line
	ast = parser.parse(tokens)
	ast.map { |instruction|
		machine.interpret(instruction)
		}
end


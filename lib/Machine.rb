require_relative "machine/Frame.rb" #frame datatype
require_relative "machine/State.rb" #key->value state store

class Machine
	attr_reader :state


	class Def
		def run(args) 

		end
	end
	class Dec
		def run(args) 

		end
	end
	class Inc
		def run(args)

		end
	end
	class And
		def run(args) 

		end
	end
	class Or
		def run(args) 

		end
	end
	class Xor
		def run(args) 

		end
	end
	class Cmp
		def run(args) 

		end
	end
	class Jmp
		def run(args) 

		end
	end
	class Add
		def run(args) 

		end
	end
	def initialize
		@state = State.new #current state
		@frames = [] #execution frame (operation, argumets)
		@instructions = { #:op => arguments
			:def => Def, #define variable
			:inc => Inc, #increment variable
			:dec => Dec, #decrement variable
			:and => And, #and 
			:or  => Or, #or 
			:xor => Xor, #xor
			:cmp => Cmp, #compare two variables
			:jmp => Jmp, #jump to a given frame
			:add => Add, #add

			}	
	end

	def interpret(instruction)
		symbol = instruction.symref
		args = instruction.args
		instRef = @instructions[symbol].new @state
		frame = Frame.new instRef, args #create new frame
		result = frame.evaluate #run frame
		@frames.push [frame,result]
	end
end

class Frame 
	def initialize(instruction,arguments)
		@instRef = instruction
		@args = arguments
	end

	def evaluate
		@instruction.run(@args)
	end
end

		

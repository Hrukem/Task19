defmodule Input_output do
@moduledoc false

	def i_o() do
		num = IO.gets("Input number: ")
		send(:cnt, num)
		receive do
			res -> 
							IO.puts("Result is #{res}")
		end
		i_o()
	end
end

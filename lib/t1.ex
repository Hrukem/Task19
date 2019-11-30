defmodule T1 do
@moduledoc false

	def i_o() do
		num = IO.gets("Input number: ")
		send(:cnt, num)
		receive do
			result -> 
							IO.puts("Result is #{result}")
		end
		i_o()
	end
end

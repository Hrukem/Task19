defmodule Count do

	def count() do
		if Process.whereis(:iod) == nil do
			Process.register(self(), :cnt)
			pid = spawn_link(Input_output, :i_o, [])
			Process.register(pid, :iod)
		else
			receive do
				msg -> 
									str = String.trim(msg)
									num = String.to_integer(str)
									res = 100 / num
									send(:iod, res)
			end
		end
		count()
	end
end

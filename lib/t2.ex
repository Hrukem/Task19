defmodule T2 do

	def count() do
		if Process.whereis(:iod) == nil do
			Process.register(self(), :cnt)
			pid = spawn_link(T1, :i_o, [])
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

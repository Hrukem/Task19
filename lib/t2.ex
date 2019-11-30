defmodule T2 do

	def count() do
		if Process.whereis(:iod) == nil do
			Process.register(self(), :cnt)
			pid = spawn_link(T1, :i_o, [])
			Process.register(pid, :iod)
		else
			receive do
				num -> 
									num = String.trim(num)
									num = String.to_integer(num)
									num = 100 / num
									send(:iod, num)
			end
		end
		count()
	end
end

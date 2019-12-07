defmodule Super_visor do

	def start do
		children = 
		[
			%{
				id: Count,
				start: {Count, :count, []}
			}
		]

		Supervisor.start_link(children, strategy: :one_for_one)
		IO.puts("Start after fall")
		start()
	end
end

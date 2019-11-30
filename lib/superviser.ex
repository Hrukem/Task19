defmodule Superviser do
	def start do
		children = 
		[
			%{
				id: T2,
				start: {T2, :count, []}
			}
		]

		Supervisor.start_link(children, strategy: :one_for_one)
		IO.puts("Start after fall")
		start()
	end
end

defmodule Main_supervisor do
@moduledoc false

	def start do
		children = 
		[
			%{
				id: Super_visor,
				start: {Super_visor, :start, []}
			}
		]

		Supervisor.start_link(children, strategy: :one_for_one)
	end
end

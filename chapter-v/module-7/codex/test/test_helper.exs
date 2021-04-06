ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Codex.Repo, :manual)

Mox.defmock(Codex.Github.ClientMock, for: Codex.Github.Behaviour)

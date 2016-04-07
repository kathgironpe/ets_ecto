defmodule Article do
  use Ecto.Schema

  schema "articles" do
    field :title, :string
  end
end

defmodule ETS.EctoTest do
  use ExUnit.Case
  import Ecto.Query

  setup do
    ETS.Ecto.Worker.clear()
    :ok
  end

  test "all" do
    q = from(a in Article)
    assert [] = TestRepo.all(q)

    TestRepo.insert!(%Article{title: "Title 1"})
    assert [%Article{title: "Title 1"}] = TestRepo.all(q)
  end

  test "all with selected fields" do
    TestRepo.insert!(%Article{title: "Title 1"})
    TestRepo.insert!(%Article{title: "Title 2"})

    q = from(a in Article, select: a.title)
    assert TestRepo.all(q) |> Enum.sort() == ["Title 1", "Title 2"]
  end
end

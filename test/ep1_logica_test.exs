defmodule Ep1LogicaTest do
  use ExUnit.Case
  doctest Ep1Logica

  test "Grafo com um nó" do
    assert Ep1Logica.execute([{0, []}]) == [{0, 0}]
  end

  test "Grafo linear" do
    assert Ep1Logica.execute([{0, [1]}, {1, [2]}, {2, []}]) == [{0, 0}, {0, 1}, {0, 2}, {1, 1}, {1, 2}, {2, 2}]
  end

  test "Grafo com laços" do
    assert Ep1Logica.execute([{0,[1, 2, 3]}, {1, [2]}, {2, [3]}, {3, []}]) == [{0, 0}, {0, 1}, {0, 2}, {0, 3}, {1, 1}, {1, 2}, {1, 3}, {2, 2}, {2, 3}, {3, 3}]
  end
end

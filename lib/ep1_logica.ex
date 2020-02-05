defmodule Ep1Logica do
  def generate_paths(nodes) do
    Enum.map(nodes, fn({node, _}) ->
      visit(node, nodes, [])
    end)
  end

  defp visit(node, nodes, visited) do
    {_, child_nodes} = Enum.at(nodes, node)
    Enum.reduce(child_nodes, visited ++ [node], fn(n, acc) ->
      visit_recur(n, nodes, acc)
    end)
  end

  defp visit_recur(node, nodes, visited) do
    case Enum.member?(visited, node) do
      true  -> visited
      false -> visit(node, nodes, visited)
    end
  end

  def create_pairs([root | nodes]) do
    create_pairs(root, nodes, [{root,root}])
  end
  defp create_pairs(root, [current | nodes], pairs) do
    create_pairs(root, nodes, pairs ++ [{root, current}])
  end
  defp create_pairs(_, [], pairs) do
    pairs
  end

  def execute(graph) do
    graph
    |> Ep1Logica.generate_paths
    |> Enum.map(fn(path)-> Ep1Logica.create_pairs(path) end)
    |> Enum.reduce(fn(pairs, acc) -> acc ++ pairs end)
  end
end

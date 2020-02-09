defmodule Ep1Logica do
  @type graph_node :: {integer, [integer, ...]}
  @type graph :: [graph_node, ...]
  @type path  :: [integer, ...]

  # Recebe um grafo e retorna todos os caminhos atingíveis a partir de todos os nós
  def generate_paths(graph) do
    Enum.map(graph, fn {node_number, _} ->
      visit(node_number, graph, [])
    end)
  end

  # Visita todos os nós filhos do nó sendo analisado de forma recursiva 
  defp visit(node_number, graph, visited) do
    {_, child_nodes} = Enum.at(graph, node_number)

    Enum.reduce(child_nodes, visited ++ [node_number], fn n, acc ->
      case Enum.member?(acc, n) do
        true -> acc
        false -> visit(n, graph, acc)
      end
    end)
  end

  # Gera os pares ordenados a partir das listas de nós visitados para cada um dos nós do grafo
  def create_pairs([root | nodes]) do
    create_pairs(root, nodes, [{root, root}])
  end

  defp create_pairs(root, [current | nodes], pairs) do
    create_pairs(root, nodes, pairs ++ [{root, current}])
  end

  defp create_pairs(_, [], pairs) do
    pairs
  end

  # Executa o algoritmo retornando o fecho transitivo-reflexivo da relação binária representada pelo grafo unidirecional
  def execute(graph) do
    graph
    |> Ep1Logica.generate_paths()
    |> Enum.map(fn path -> Ep1Logica.create_pairs(path) end)
    |> Enum.reduce(fn pairs, acc -> acc ++ pairs end)
  end
end

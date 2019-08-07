defmodule Super do
  @moduledoc """
  Documentation for Super.
  """

  @doc """
  1) Всех учеников у кого имя заканчивается на "a " поместить в класс "A" остальных в "B"
  Выходные данные
  Map вида %{"class_a": [], "class_b":[]}
  2) Всех девочек в класс A, мальчиков в класс B
  Выходные данные
  Map вида %{"class_a": [], "class_b":[]}
  3) Используя результат из 2 пункта, каждой третьей девочке присвоить что она любит алгебру, остальным геометрию
  Выходные данные
  Map вида %{"lesya": "algerba",...}

  list = [
      {:alica, "female"}, {:makar, "male"},
      {:kostya, "male"}, {:zhenya, "male"},
      {:sasha, "female"}, {:anton, "male"},
      {:larisa, "female"}, {:slava, "male"},
      {:olga, "female"}, {:vika, "female"},
      {:kseniya, "female"}
  ]

  ## Examples

  iex> Super.sort_by_letter(list)
  %{ class_a: [
        kseniya: "female",
        vika: "female",
        olga: "female",
        slava: "male",
        larisa: "female",
        sasha: "female",
        zhenya: "male",
        kostya: "male",
        alica: "female"
     ],
     class_b: [anton: "male", makar: "male"]
  }

  iex> Super.sort_by_sex(list)
  %{
    class_a: [
      alica: "female",
      sasha: "female",
      larisa: "female",
      olga: "female",
      vika: "female",
      kseniya: "female"
    ],
    class_b: [
      makar: "male",
      kostya: "male",
      zhenya: "male",
      anton: "male",
      slava: "male"
    ]
  }
  iex> Super.courses_for_girls(list)
  1
  {:alica, "female"}
  2
  {:sasha, "female"}
  0
  {:larisa, "female"}
  1
  {:olga, "female"}
  2
  {:vika, "female"}
  0
  {:kseniya, "female"}
  %{
    alica: "геометрия",
    kseniya: "алгебра",
    larisa: "алгебра",
    olga: "геометрия",
    sasha: "геометрия",
    vika: "геометрия"
  }

  """

  def sort_by_letter(list) do
      List.foldr(list, %{:class_a => [], :class_b => []}, fn item,
      map -> if String.ends_with?(Atom.to_string(elem(item, 0)), "a"),
      do: %{:class_a => map[:class_a] ++ [item], :class_b => map[:class_b]},
      else: %{:class_a => map[:class_a], :class_b => map[:class_b] ++ [item]} end)
  end

  def sort_by_sex(list) do
      %{
        :class_a => Enum.filter(list, fn {_, v} -> v == "female" end),
        :class_b => list -- Enum.filter(list, fn {_, v} -> v == "female" end)
      }
  end

  def courses_for_girls(list) do
      List.foldl(Enum.with_index(sort_by_sex(list).class_a), %{ }, fn {k, v}, map ->
        IO.inspect(rem(v + 1, 3))
        IO.inspect(k)
         if rem(v + 1, 3) === 0 do
           Map.put(map, elem(k, 0), "алгебра")
         else
           Map.put(map, elem(k, 0), "геометрия")
         end
      end)

  end

end

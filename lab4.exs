defmodule Lab4 do

  def interpolationSearch(_target, {}) do #Основная функция
    return = "Massiv pust"
  end
  def interpolationSearch(target, list) do #Основная функция
    if checkInput(list, tuple_size(list), 0, true) do
      unsortedList = Tuple.to_list(list)
      sortedList = sort(unsortedList)
      IO.puts "Otsortirovanniy massiv"
      sortedTuple = List.to_tuple(sortedList)
      IO.inspect sortedTuple
      startIndex = 0
      lastIndex = tuple_size(list)-1
      IO.puts "Index iskomogo elementa:"
      interpolationSearch(target, sortedTuple, startIndex, lastIndex)
    else
      return = "Nekorrektniy vvod"
    end

  end



  def interpolationSearch(target, list, startIndex, lastIndex) do #Функция поиска
    if (elem(list, startIndex) == elem(list, lastIndex)) do
      if (elem(list, startIndex) == target) do
        return = startIndex

      else
        return = -1
      end
    else
      if ((startIndex <= lastIndex) && (target >= elem(list, startIndex)) && (target <= elem(list, lastIndex))) do
        pos = startIndex + (div((lastIndex - startIndex), (elem(list, lastIndex) - elem(list, startIndex))) * (target - elem(list, startIndex)))
        if (elem(list, pos)==target) do
          return = pos
          #IO.inspect pos

        else
          if (elem(list, pos) < target) do
            startIndex = pos + 1
            interpolationSearch(target, list, startIndex, lastIndex)
          else
            lastIndex = pos - 1
            interpolationSearch(target, list, startIndex, lastIndex)
          end

        end

      else
        return =-1
      end
    end
  end

  def checkInput(tuple, size, index, isNum) do #Функция проверки правильности ввода
    if (index < size) do
       if is_number(elem(tuple, index)) do
         checkInput(tuple, size, index + 1, true)
       else
         false
       end
    else
      isNum
    end
  end

  def sort(list) when is_list(list) do #Функция сортировки
    make_pass(do_sort(list, []), list)
  end

  def make_pass(bubbled_list, old_list) when bubbled_list != old_list do
    do_sort(bubbled_list, []) |> make_pass(bubbled_list)
  end
  def make_pass(bubbled_list, old_list) when bubbled_list == old_list do
    bubbled_list
  end

  def do_sort(_list = [], _acc) do
    []
  end
  def do_sort([first|[]], acc) do
    acc ++ [first]
  end
  def do_sort([first|[second|tail]], acc) do
    [new_first, new_second] = swap(first, second)
    do_sort([new_second|tail], acc ++ [new_first])
  end

  defp swap(e1, e2) do
    if e1 <= e2 do [e1, e2] else [e2, e1] end
  end

end
#IO.inspect Lab4.interpolationSearch(17, {1, 70, 7, 9, 9, 11, 13, 17, 17, 21, 24, 32, 36, 44, 45, 54, 55, 63, 66, 4})
#IO.inspect Lab4.interpolationSearch(1, {1, 70, 7, 9, 9, 11, 13, 17, 17, 21, 24, 32, 36, 44, 45, 54, 55, 63, 66, 4})
#IO.inspect Lab4.interpolationSearch(70, {1, 70, 7, 9, 9, 11, 13, 17, 17, 21, 24, 32, 36, 44, 45, 54, 55, 63, 66, 4})
#IO.inspect Lab4.interpolationSearch(10, {1, 70, 7, 9, 9, 11, 13, 17, 17, 21, 24, 32, 36, 44, 45, 54, 55, 63, 66, 4})
#IO.inspect Lab4.interpolationSearch(10, {})
#IO.inspect Lab4.interpolationSearch(10, {10})
IO.inspect Lab4.interpolationSearch(10, {10,"slovo",12})

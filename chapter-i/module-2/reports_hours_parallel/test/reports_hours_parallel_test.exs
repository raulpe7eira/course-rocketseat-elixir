defmodule ReportsHoursParallelTest do
  use ExUnit.Case

  describe "build/1" do
    test "when a file list is provided, builds the report" do
      file_names = ["part_test.csv", "part_test.csv"]

      response = ReportsHoursParallel.build(file_names)

      expected_response =
        {:ok,
         %{
           all_hours: %{
             "Cleiton" => 36,
             "Daniele" => 28,
             "Danilo" => 2,
             "Diego" => 20,
             "Giuliano" => 22,
             "Jakeliny" => 28,
             "Joseph" => 28,
             "Mayk" => 36,
             "Rafael" => 14
           },
           hours_per_month: %{
             "Cleiton" => %{
               "janeiro" => 0,
               "fevereiro" => 0,
               "março" => 0,
               "abril" => 0,
               "maio" => 0,
               "junho" => 6,
               "julho" => 14,
               "agosto" => 0,
               "setembro" => 0,
               "outubro" => 16,
               "novembro" => 0,
               "dezembro" => 0
             },
             "Daniele" => %{
               "janeiro" => 0,
               "fevereiro" => 0,
               "março" => 0,
               "abril" => 0,
               "maio" => 16,
               "junho" => 2,
               "julho" => 0,
               "agosto" => 0,
               "setembro" => 0,
               "outubro" => 0,
               "novembro" => 0,
               "dezembro" => 10
             },
             "Danilo" => %{
               "janeiro" => 0,
               "fevereiro" => 0,
               "março" => 0,
               "abril" => 2,
               "maio" => 0,
               "junho" => 0,
               "julho" => 0,
               "agosto" => 0,
               "setembro" => 0,
               "outubro" => 0,
               "novembro" => 0,
               "dezembro" => 0
             },
             "Diego" => %{
               "janeiro" => 0,
               "fevereiro" => 0,
               "março" => 0,
               "abril" => 8,
               "maio" => 2,
               "junho" => 0,
               "julho" => 0,
               "agosto" => 8,
               "setembro" => 0,
               "outubro" => 0,
               "novembro" => 0,
               "dezembro" => 2
             },
             "Giuliano" => %{
               "janeiro" => 0,
               "fevereiro" => 12,
               "março" => 0,
               "abril" => 2,
               "maio" => 8,
               "junho" => 0,
               "julho" => 0,
               "agosto" => 0,
               "setembro" => 0,
               "outubro" => 0,
               "novembro" => 0,
               "dezembro" => 0
             },
             "Jakeliny" => %{
               "janeiro" => 0,
               "fevereiro" => 0,
               "março" => 28,
               "abril" => 0,
               "maio" => 0,
               "junho" => 0,
               "julho" => 0,
               "agosto" => 0,
               "setembro" => 0,
               "outubro" => 0,
               "novembro" => 0,
               "dezembro" => 0
             },
             "Joseph" => %{
               "janeiro" => 0,
               "fevereiro" => 0,
               "março" => 0,
               "abril" => 8,
               "maio" => 0,
               "junho" => 0,
               "julho" => 0,
               "agosto" => 0,
               "setembro" => 6,
               "outubro" => 0,
               "novembro" => 10,
               "dezembro" => 4
             },
             "Mayk" => %{
               "janeiro" => 0,
               "fevereiro" => 0,
               "março" => 0,
               "abril" => 0,
               "maio" => 0,
               "junho" => 6,
               "julho" => 14,
               "agosto" => 0,
               "setembro" => 14,
               "outubro" => 0,
               "novembro" => 0,
               "dezembro" => 2
             },
             "Rafael" => %{
               "janeiro" => 0,
               "fevereiro" => 0,
               "março" => 0,
               "abril" => 0,
               "maio" => 0,
               "junho" => 0,
               "julho" => 0,
               "agosto" => 14,
               "setembro" => 0,
               "outubro" => 0,
               "novembro" => 0,
               "dezembro" => 0
             }
           },
           hours_per_year: %{
             "Cleiton" => %{2016 => 6, 2017 => 0, 2018 => 14, 2019 => 0, 2020 => 16},
             "Daniele" => %{2016 => 20, 2017 => 6, 2018 => 0, 2019 => 0, 2020 => 2},
             "Danilo" => %{2016 => 0, 2017 => 0, 2018 => 2, 2019 => 0, 2020 => 0},
             "Diego" => %{2016 => 0, 2017 => 16, 2018 => 2, 2019 => 2, 2020 => 0},
             "Giuliano" => %{2016 => 0, 2017 => 0, 2018 => 0, 2019 => 12, 2020 => 10},
             "Jakeliny" => %{2016 => 16, 2017 => 0, 2018 => 0, 2019 => 12, 2020 => 0},
             "Joseph" => %{2016 => 0, 2017 => 0, 2018 => 0, 2019 => 6, 2020 => 22},
             "Mayk" => %{2016 => 14, 2017 => 16, 2018 => 0, 2019 => 6, 2020 => 0},
             "Rafael" => %{2016 => 0, 2017 => 14, 2018 => 0, 2019 => 0, 2020 => 0}
           }
         }}

      assert response == expected_response
    end

    test "when a file list is not provided, returns an error" do
      file_names = "file-not-provided"

      response = ReportsHoursParallel.build(file_names)

      expected_response = {:error, "Please provide a list of strings"}

      assert response == expected_response
    end
  end
end

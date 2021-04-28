defmodule ReportsHoursTest do
  use ExUnit.Case

  describe "build/1" do
    test "builds the report" do
      file_name = "gen_report_test.csv"

      response = ReportsHours.build(file_name)

      expected_response = %{
        all_hours: %{
          "Cleiton" => 18,
          "Daniele" => 14,
          "Danilo" => 1,
          "Diego" => 10,
          "Giuliano" => 11,
          "Jakeliny" => 14,
          "Joseph" => 14,
          "Mayk" => 18,
          "Rafael" => 7
        },
        hours_per_month: %{
          "Cleiton" => %{
            "janeiro" => 0,
            "fevereiro" => 0,
            "março" => 0,
            "abril" => 0,
            "maio" => 0,
            "junho" => 3,
            "julho" => 7,
            "agosto" => 0,
            "setembro" => 0,
            "outubro" => 8,
            "novembro" => 0,
            "dezembro" => 0
          },
          "Daniele" => %{
            "janeiro" => 0,
            "fevereiro" => 0,
            "março" => 0,
            "abril" => 0,
            "maio" => 8,
            "junho" => 1,
            "julho" => 0,
            "agosto" => 0,
            "setembro" => 0,
            "outubro" => 0,
            "novembro" => 0,
            "dezembro" => 5
          },
          "Danilo" => %{
            "janeiro" => 0,
            "fevereiro" => 0,
            "março" => 0,
            "abril" => 1,
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
            "abril" => 4,
            "maio" => 1,
            "junho" => 0,
            "julho" => 0,
            "agosto" => 4,
            "setembro" => 0,
            "outubro" => 0,
            "novembro" => 0,
            "dezembro" => 1
          },
          "Giuliano" => %{
            "janeiro" => 0,
            "fevereiro" => 6,
            "março" => 0,
            "abril" => 1,
            "maio" => 4,
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
            "março" => 14,
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
            "abril" => 4,
            "maio" => 0,
            "junho" => 0,
            "julho" => 0,
            "agosto" => 0,
            "setembro" => 3,
            "outubro" => 0,
            "novembro" => 5,
            "dezembro" => 2
          },
          "Mayk" => %{
            "janeiro" => 0,
            "fevereiro" => 0,
            "março" => 0,
            "abril" => 0,
            "maio" => 0,
            "junho" => 3,
            "julho" => 7,
            "agosto" => 0,
            "setembro" => 7,
            "outubro" => 0,
            "novembro" => 0,
            "dezembro" => 1
          },
          "Rafael" => %{
            "janeiro" => 0,
            "fevereiro" => 0,
            "março" => 0,
            "abril" => 0,
            "maio" => 0,
            "junho" => 0,
            "julho" => 0,
            "agosto" => 7,
            "setembro" => 0,
            "outubro" => 0,
            "novembro" => 0,
            "dezembro" => 0
          }
        },
        hours_per_year: %{
          "Cleiton" => %{2016 => 3, 2017 => 0, 2018 => 7, 2019 => 0, 2020 => 8},
          "Daniele" => %{2016 => 10, 2017 => 3, 2018 => 0, 2019 => 0, 2020 => 1},
          "Danilo" => %{2016 => 0, 2017 => 0, 2018 => 1, 2019 => 0, 2020 => 0},
          "Diego" => %{2016 => 0, 2017 => 8, 2018 => 1, 2019 => 1, 2020 => 0},
          "Giuliano" => %{2016 => 0, 2017 => 0, 2018 => 0, 2019 => 6, 2020 => 5},
          "Jakeliny" => %{2016 => 8, 2017 => 0, 2018 => 0, 2019 => 6, 2020 => 0},
          "Joseph" => %{2016 => 0, 2017 => 0, 2018 => 0, 2019 => 3, 2020 => 11},
          "Mayk" => %{2016 => 7, 2017 => 8, 2018 => 0, 2019 => 3, 2020 => 0},
          "Rafael" => %{2016 => 0, 2017 => 7, 2018 => 0, 2019 => 0, 2020 => 0}
        }
      }

      assert response == expected_response
    end
  end
end

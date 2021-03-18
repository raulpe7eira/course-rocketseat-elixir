defmodule Flightex.Bookings.ReportTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Report

  describe "call/3" do
    setup do
      BookingAgent.start_link(%{})

      :booking
      |> build()
      |> BookingAgent.save()

      :booking
      |> build()
      |> BookingAgent.save()

      :ok
    end

    test "when all params are valid, generates the report file" do
      message_response =
        Report.call(
          "2021-03-17T11:00:00.000Z",
          "2021-03-17T11:00:00.000Z",
          "report_test.csv"
        )

      expected_message_response = {:ok, "Report generated successfully"}

      assert message_response == expected_message_response

      content_file_created = File.read!("report_test.csv")

      expected_content_file_created =
        "1234,Rio de Janeiro,São Paulo,2021-03-17 11:00:00.000\n" <>
          "1234,Rio de Janeiro,São Paulo,2021-03-17 11:00:00.000\n"

      assert content_file_created == expected_content_file_created
    end

    test "when there is no from date, returns an error" do
      response =
        Report.call(
          nil,
          "2021-03-17T11:00:00.000Z",
          "report_test.csv"
        )

      expected_response = {:error, "Invalid from date or to date"}

      assert response == expected_response
    end

    test "when there is an invalid from date, returns an error" do
      response =
        Report.call(
          "2021-03-17T1100:00.000Z",
          "2021-03-17T11:00:00.000Z",
          "report_test.csv"
        )

      expected_response = {:error, "Invalid from date or to date"}

      assert response == expected_response
    end

    test "when there is no to date, returns an error" do
      response =
        Report.call(
          "2021-03-17T11:00:00.000Z",
          nil,
          "report_test.csv"
        )

      expected_response = {:error, "Invalid from date or to date"}

      assert response == expected_response
    end

    test "when there is an invalid to date, returns an error" do
      response =
        Report.call(
          "2021-03-17T11:00:00.000Z",
          "2021-03-17T1100:00.000Z",
          "report_test.csv"
        )

      expected_response = {:error, "Invalid from date or to date"}

      assert response == expected_response
    end

    test "when there is an invalid filename, returns an error" do
      response =
        Report.call(
          "2021-03-17T11:00:00.000Z",
          "2021-03-17T11:00:00.000Z",
          "./non-path/report_test.csv"
        )

      expected_response = {:error, "Report generated with failure"}

      assert response == expected_response
    end

    test "when there is no filename, generates the report file default" do
      message_response =
        Report.call(
          "2021-03-17T11:00:00.000Z",
          "2021-03-17T11:00:00.000Z"
        )

      expected_message_response = {:ok, "Report generated successfully"}

      assert message_response == expected_message_response

      content_file_created = File.read!("report.csv")

      expected_content_file_created =
        "1234,Rio de Janeiro,São Paulo,2021-03-17 11:00:00.000\n" <>
          "1234,Rio de Janeiro,São Paulo,2021-03-17 11:00:00.000\n"

      assert content_file_created == expected_content_file_created
    end
  end
end

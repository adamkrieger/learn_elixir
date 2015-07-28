defmodule TpsProcessor do
  @moduledoc """
  iex> TpsProcessor.process([%{:id => 1, :hasCover => false}, %{:id => 2, :hasCover => true}, %{:id => 3, :hasCover => false}, %{:id => 4, :hasCover => true}])
  Excellent work! Ref: 2
  Excellent work! Ref: 4
  Did you get that memo? Ref: 1
  Did you get that memo? Ref: 3
  :ok
  """

  def process(tpsReports) do
    covered_uncovered = tpsReports
    |> Enum.sort(&(_sort_covered_reports(&1, &2)))
    |> Enum.split_while(&(&1.hasCover))

    elem(covered_uncovered, 0)
    |> Enum.each(&(_tps_report_filer(&1)))

    elem(covered_uncovered, 1)
    |> Enum.each(&(_cover_sheet_reminder(&1)))
  end

  defp _sort_covered_reports(%{:hasCover => false}, %{:hasCover => true}) do
    false
  end
  defp _sort_covered_reports(%{}, %{}) do
    true
  end

  defp _cover_sheet_reminder(tpsReport) do
    IO.puts "Did you get that memo? Ref: #{tpsReport.id}"
  end

  defp _tps_report_filer(tpsReport) do
    IO.puts "Excellent work! Ref: #{tpsReport.id}"
  end
end

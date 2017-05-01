defmodule Blog.PageView do
  use Blog.Web, :view


  def short(str, len \\ 10) do
    str
      |> Cmark.to_html
      |> HtmlSanitizeEx.strip_tags
      |> String.split(" ")
      |> Enum.slice(0..len)
      |> Enum.join(" ")
  end
end

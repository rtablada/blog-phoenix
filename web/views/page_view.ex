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

  def gravatar(post) do
    post.user.email
    |> Exgravatar.gravatar_url
  end

  def author_name(post) do
    user = post.user

    "#{user.first_name} #{user.last_name}"
  end

end

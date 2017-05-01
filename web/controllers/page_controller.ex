defmodule Blog.PageController do
  use Blog.Web, :controller
  alias Blog.Repo
  alias Blog.Post

  def index(conn, _params) do
    posts = Post
      |> where([p], p.active == true)
      |> where([p], p.publish_date < datetime_add(^Ecto.DateTime.utc, 0, "month"))
      |> order_by(desc: :publish_date)
      |> Repo.paginate(page: 1, page_size: 10)

    render conn, "index.html",
      posts: posts.entries,
      page_number: posts.page_number,
      page_size: posts.page_size,
      total_pages: posts.total_pages,
      total_entries: posts.total_entries
  end
end

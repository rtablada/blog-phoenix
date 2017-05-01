defmodule Blog.Api.PostView do
  use Blog.Web, :view

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, Blog.Api.PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, Blog.Api.PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{
      id: post.id,
      title: post.title,
      slug: post.slug,
      content: post.content,
      image: post.image,
      type: post.type,
      publish_date: post.publish_date,
      active: post.active,
    }
  end
end

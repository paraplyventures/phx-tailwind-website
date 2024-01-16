defmodule PhxtesterWeb.PageController do
  use PhxtesterWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def blog(conn, _params) do
    render(conn, page_title: "Blog", posts: Phxtester.Blog.all_posts())
  end

  def show_blog_post(conn, %{"id" => id}) do
    render(conn, "show_blog_post.html", post: Phxtester.Blog.get_post_by_id!(id))
  end

  def terms(conn, _params) do
    render(conn, :terms)
  end

  def privacy(conn, _params) do
    render(conn, :privacy)
  end
end

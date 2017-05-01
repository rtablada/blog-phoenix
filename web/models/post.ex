defmodule Blog.Post do
  use Blog.Web, :model

  schema "posts" do
    field :title, :string
    field :slug, :string
    field :content, :string
    field :image, :string
    field :type, :string
    field :publish_date, Ecto.DateTime
    field :active, :boolean, default: false
    belongs_to :user, Blog.User

    timestamps([
      inserted_at: :created_at
    ])
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :slug, :content, :image, :type, :publish_date, :active])
    |> validate_required([:title, :slug, :content, :image, :type, :publish_date, :active])
  end
end

defmodule SimpleScrapper do
  @smoothies_url "https://www.allrecipes.com/recipes/138/drinks/smoothies/?internalSource=hubcard&referringContentType=Search&clickId=cardslot%201"

  def get_smoothie_url do
    case HTTPoison.get(@smoothies_url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        urls =
          body
          |> Floki.find("a.fixed-recipe-card__title-link")
          |> Floki.attribute("href")

        {:ok, urls}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts("Not found :(")

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end

  def get_smoothies_html_body({_, urls}) do
    urls
    |> Enum.map(fn url -> Task.async(HTTPoison, :get, [url]) end)
    |> Enum.map(&Task.await/1)
    |> Enum.map(fn {_, result} -> result.body end)
  end

  def get_smoothie_ingredients(body) do
    body
    |> Floki.attribute("label", "title")
    |> Floki.text(sep: "+")
    |> String.split("+")
  end

  def get_smoothie_name(body) do
    body
    |> Floki.find("h1#recipe-main-content")
    |> Floki.text()
  end

  def get_smoothie_directions(body) do
    body
    |> Floki.find("span.recipe-directions__list--item")
    |> Floki.text(sep: "=>")
    |> String.split("=>")
  end

  def build_smoothie_recipe(body) do
    recipe = %{
      name: get_smoothie_name(body),
      ingredients: get_smoothie_ingredients(body),
      directions: get_smoothie_directions(body)
    }

    {:ok, recipe}
  end

  def get_smoothie_recipes do
    smoothies =
      get_smoothie_url()
      |> get_smoothies_html_body()
      |> Enum.map(fn body -> Task.async(SimpleScrapper, :build_smoothie_recipe, [body]) end)
      |> Enum.map(&Task.await/1)
      |> Enum.map(fn {_, recipe} -> recipe end)

    {:ok, smoothies}
  end

end

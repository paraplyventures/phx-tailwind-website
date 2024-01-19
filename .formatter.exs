[
  import_deps: [:phoenix],
  plugins: [Phoenix.LiveView.HTMLFormatter],
  inputs: [
    "*.{heex,ex,exs}",
    "priv/repo/**/*.exs",
    "{config,lib,test}/**/*.{heex,ex,exs}"
  ]
]

let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.router [

    Dream.get "/status" (fun _ ->
        Dream.html (Printf.sprintf "Running..."));

    Dream.get "/version" (fun _ ->
      Dream.html (Version.render ()));

    Dream.get "/accounts" (fun _ ->
        Dream.html (Printf.sprintf "Running..."));

    Dream.get "/" (fun _ ->
      Dream.html (Printf.sprintf "Welcome."));

  ]

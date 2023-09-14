let loader _root path _request =
  match Assets.read path with
  | None -> Dream.empty `Not_Found
  | Some asset -> Dream.respond asset

let () =
  Dream.run ~error_handler:(Dream.error_template Error.custom_error_template)
  @@ Dream.logger
  @@ Dream.router [

    Dream.get "/assets/**" @@ Dream.static ~loader "";

    Dream.get "/status" (fun _ ->
        Dream.html (Printf.sprintf "Running..."));

    Dream.get "/version" (fun _ ->
      Dream.html (Base.render "Version" (Version.render ())));

    Dream.get "/account" (fun _ ->
        Dream.html (Base.render "Account" (Account.render ())));

    Dream.get "/" (fun _ ->
      Dream.html (Printf.sprintf "Welcome."));

  ]

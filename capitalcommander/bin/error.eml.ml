let custom_error_template _error debug_info suggested_response =
  let status = Dream.status suggested_response in
  let code = Dream.status_to_int status
  and reason = Dream.status_to_string status in

  Dream.set_header suggested_response "Content-Type" Dream.text_html;
  Dream.set_body suggested_response begin
    <!DOCTYPE html>
    <html lang="en">
        <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="assets/css/pure-min.css" />
        <link rel="stylesheet" href="assets/css/fontawesome/css/fontawesome.min.css" />
        <link rel="stylesheet" href="assets/css/fontawesome/css/solid.min.css" />
        <link rel="stylesheet" href="assets/css/custom_style.css" />
        <link rel="icon" type="image/png" href="assets/favicon.png" />
        <title>Error</title>
        </head>
        <body>
        <div id="main">
            <h1><%i code %> <%s reason %></h1>
            <pre><%s debug_info %></pre>
        </div>
        </body>
    </html>
    <html>
  end;
  Lwt.return suggested_response
